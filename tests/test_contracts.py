from __future__ import annotations

import contextlib
import io
import math
import os
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))
from e3p_studio.gcode_split import GcodeSplitConfig, main, split_gcode_for_mold_halves
from e3p_studio.inspection import replay, summarize

HEADER = "G21\nG90\nM82\nG92 E0\nG0 X0 Y0 Z0.2 F6000\n;LAYER:0\n"
LINE = "G1 X20 Y0 E2 F1200\n"


class SplitterContractTests(unittest.TestCase):
    def transform(self, text, **options):
        with tempfile.TemporaryDirectory() as directory:
            source = Path(directory) / "input.gcode"
            output = Path(directory) / "output.gcode"
            source.write_text(text, encoding="utf-8")
            report = split_gcode_for_mold_halves(gcode_path=source, out_path=output,
                                               cfg=GcodeSplitConfig(**options))
            result = output.read_text(encoding="utf-8")
            self.assertEqual(source.read_text(encoding="utf-8"), text)
        return result, report

    def test_rejects_unsupported_modes_motion_and_malformed_words(self):
        invalid = ["G91", "M83", "G20", "G2 X20 Y0 I10 J0 E2", "G28",
                   "G92 X10", "G1 Xnan E2", "G1 X1e999 E2", "G1 X2 X3 E2",
                   "G1 Xbad E2", "G1X20Y0E2", "G1 X20 E2 Q1", "G1 X20 E2 F0"]
        for command in invalid:
            with self.subTest(command=command), tempfile.TemporaryDirectory() as directory:
                source, output = Path(directory) / "in.gcode", Path(directory) / "out.gcode"
                text = HEADER + command + "\n" + LINE
                source.write_text(text, encoding="utf-8")
                with self.assertRaises(ValueError):
                    split_gcode_for_mold_halves(gcode_path=source, out_path=output)
                self.assertFalse(output.exists())
                self.assertEqual(source.read_text(encoding="utf-8"), text)

    def test_rejects_unknown_initial_position_and_nonplanar_or_combined_retract(self):
        for text in ["G90\nM82\n;LAYER:0\n" + LINE,
                     HEADER + "G1 X20 Y0 Z1 E2\n",
                     HEADER + LINE + "G1 X0 Y0 E1\n",
                     HEADER.replace("M82\n", "") + LINE,
                     HEADER.replace("G90\n", "") + LINE]:
            with self.subTest(text=text), self.assertRaises(ValueError):
                self.transform(text)

    def test_rejects_invalid_config_and_external_cut(self):
        for options in [{"gap_mm": math.nan}, {"coordinate_mm": math.inf},
                        {"wire_loop_width_mm": -1}, {"retract_feed_mm_min": 0},
                        {"outside_joiner_count": 0}, {"outside_frame_band_layers": 1.5},
                        {"coordinate_mm": 20}, {"coordinate_mm": -1}]:
            with self.subTest(options=options), self.assertRaises(ValueError):
                self.transform(HEADER + LINE, **options)

    def test_preserves_input_when_output_or_report_aliases_it(self):
        with tempfile.TemporaryDirectory() as directory:
            source, output = Path(directory) / "in.gcode", Path(directory) / "out.gcode"
            original = HEADER + LINE
            source.write_text(original, encoding="utf-8")
            with self.assertRaises(ValueError):
                split_gcode_for_mold_halves(gcode_path=source, out_path=source)
            for report in [source, output]:
                with contextlib.redirect_stderr(io.StringIO()), self.assertRaises(SystemExit):
                    main([str(source), "--output", str(output), "--report-json", str(report)])
                self.assertFalse(output.exists())
            self.assertEqual(source.read_text(encoding="utf-8"), original)

    def test_restores_print_feed_after_gap_and_alignment_transfers(self):
        output, _ = self.transform(HEADER + LINE + "G1 X0 Y0 E4\n")
        printing = [segment for segment in replay(output) if segment.printing]
        self.assertTrue(printing)
        self.assertTrue(all(segment.feed == 1200 for segment in printing))
        self.assertAlmostEqual(sum(segment.extrusion for segment in printing), 4)

    def test_hardlink_output_and_report_aliases_are_rejected(self):
        with tempfile.TemporaryDirectory() as directory:
            source = Path(directory) / "input.gcode"
            alias = Path(directory) / "alias.gcode"
            output = Path(directory) / "output.gcode"
            source.write_text(HEADER + LINE, encoding="utf-8")
            try:
                os.link(source, alias)
            except OSError as error:
                self.skipTest(f"Hard links unavailable: {error}")
            before = source.read_bytes()
            with self.assertRaises(ValueError):
                split_gcode_for_mold_halves(gcode_path=source, out_path=alias)
            with contextlib.redirect_stderr(io.StringIO()), self.assertRaises(SystemExit):
                main([str(source), "--output", str(output), "--report-json", str(alias)])
            self.assertFalse(output.exists())
            self.assertEqual(source.read_bytes(), before)
            output.write_text("existing output", encoding="utf-8")
            alias.unlink()
            os.link(output, alias)
            with contextlib.redirect_stderr(io.StringIO()), self.assertRaises(SystemExit):
                main([str(source), "--output", str(output), "--report-json", str(alias)])
            self.assertEqual(output.read_text(encoding="utf-8"), "existing output")
            self.assertEqual(source.read_bytes(), before)

    def test_cut_endpoint_switch_inserts_nonextruding_transfer(self):
        output, report = self.transform(HEADER + "G1 X10 Y0 E1 F1200\nG1 X20 Y0 E2\n")
        segments = replay(output)
        self.assertEqual(summarize(segments, axis="x", cut=10, gap=2)["gap_violations"], 0)
        self.assertAlmostEqual(sum(s.extrusion for s in segments if s.printing), 2)
        self.assertGreaterEqual(report["stats"]["start_alignment_transfers"], 1)

    def test_dropped_cut_plane_move_does_not_defer_its_extrusion(self):
        text = HEADER + "G1 X10 Y0 E1 F1200\nG1 X10 Y10 E2\nG1 X20 Y10 E3\n"
        output, report = self.transform(text)
        segments = replay(output)
        self.assertEqual(report["stats"]["plane_moves_dropped"], 1)
        self.assertAlmostEqual(sum(s.extrusion for s in segments if s.printing), 2)
        self.assertEqual(summarize(segments, axis="x", cut=10, gap=2)["gap_violations"], 0)

    def test_shutdown_suffix_stays_after_generated_features(self):
        output, _ = self.transform(HEADER + LINE + "M400\nM104 S0\n;end\n", wire_loops=True)
        lines = output.splitlines()
        self.assertEqual(lines[-3:], ["M400", "M104 S0", ";end"])
        self.assertTrue(any("wire loop" in line for line in lines[:-3]))

    def test_linear_extrusion_and_geometry_are_preserved_across_resets(self):
        text = HEADER + LINE + "G92 E0\nG1 E-0.5 F1800\nG1 E0 F1800\nG1 X0 Y0 E2 F900\n"
        output, _ = self.transform(text)
        segments = replay(output)
        printing = [segment for segment in segments if segment.printing]
        self.assertAlmostEqual(sum(segment.extrusion for segment in printing), 4)
        self.assertAlmostEqual(sum(math.dist(segment.start[:2], segment.end[:2]) for segment in printing), 40)
        self.assertEqual(summarize(segments, axis="x", cut=10, gap=2)["gap_violations"], 0)

    def test_y_axis_and_both_crossing_directions_preserve_deposition(self):
        text = HEADER + "G1 X0 Y20 E2 F1200\nG1 X0 Y0 E4\n"
        output, _ = self.transform(text, axis="y", gap_mm=4)
        segments = replay(output)
        self.assertEqual(summarize(segments, axis="y", cut=10, gap=4)["gap_violations"], 0)
        self.assertAlmostEqual(sum(s.extrusion for s in segments if s.printing), 4)

    def test_invalid_utf8_is_rejected_without_output(self):
        with tempfile.TemporaryDirectory() as directory:
            source, output = Path(directory) / "in.gcode", Path(directory) / "out.gcode"
            source.write_bytes((HEADER + LINE).encode() + b";\xff")
            with self.assertRaises(UnicodeDecodeError):
                split_gcode_for_mold_halves(gcode_path=source, out_path=output)
            self.assertFalse(output.exists())

    def test_redundant_xy_on_stationary_prime_or_z_move_keeps_translation(self):
        text = HEADER + LINE + "G1 X20 Y0 E2.1 F900 ;stationary prime\nG0 X20 Y0 Z0.4 F6000 ;vertical move\nG1 X0 Y0 E4.1 F1200\n"
        output, _ = self.transform(text)
        segments = replay(output)
        prime = next(s for s in segments if s.comment == "stationary prime")
        vertical = next(s for s in segments if s.comment == "vertical move")
        self.assertEqual(prime.start[:2], (21, 0))
        self.assertEqual(prime.end[:2], prime.start[:2])
        self.assertAlmostEqual(prime.extrusion, 0.1)
        self.assertEqual(vertical.start[:2], vertical.end[:2])
        self.assertEqual(vertical.end, (21, 0, 0.4))
        self.assertAlmostEqual(sum(s.extrusion for s in segments if s.printing), 4)
        self.assertEqual(summarize(segments, axis="x", cut=10, gap=2)["gap_violations"], 0)

    def test_features_precede_mixed_shutdown_parking_footer(self):
        for feature in ["wire_loops", "outside_frame"]:
            with self.subTest(feature=feature):
                text = HEADER + LINE + "M104 S0\nG0 Z10 F6000\nG0 X0 Y0\nM84\n"
                output, _ = self.transform(text, **{feature: True})
                features = [s for s in replay(output) if s.printing and s.comment in {"wire loop", "outside peg", "hardware pad", "frame loop", "frame peg"}]
                self.assertTrue(features)
                self.assertTrue(all(s.start[2] == 0.2 and s.end[2] == 0.2 for s in features))
                after_shutdown = output.split("M104 S0\n", 1)[1]
                self.assertNotIn("wire loop", after_shutdown)
                self.assertNotIn("hardware pad", after_shutdown)
                self.assertTrue(output.rstrip().endswith("M84"))

    def test_features_use_deposition_z_before_next_layer_travel(self):
        text = HEADER + LINE + "G0 Z0.4 F6000\n;LAYER:1\nG1 X0 Y0 E4 F1200\n"
        for feature in ["wire_loops", "outside_frame"]:
            with self.subTest(feature=feature):
                output, _ = self.transform(text, **{feature: True})
                features = [s for s in replay(output) if s.printing and s.comment in {"wire loop", "outside peg", "hardware pad", "frame loop", "frame peg"}]
                self.assertEqual({s.layer for s in features}, {0, 1})
                self.assertTrue(all(s.start[2] == (0.2 if s.layer == 0 else 0.4) and s.end[2] == s.start[2] for s in features))


if __name__ == "__main__":
    unittest.main()
