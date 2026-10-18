from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parents[1]
SRC_DIR = PROJECT_ROOT / "src"
if str(SRC_DIR) not in sys.path:
    sys.path.insert(0, str(SRC_DIR))

from e3p_studio.gcode_split import GcodeSplitConfig, analyze_gcode_bounds, split_gcode_for_mold_halves


SAMPLE_GCODE = """;FLAVOR:Marlin
G90
M82
G92 E0
;LAYER:-1
G0 X0 Y0 Z0.2
G1 X20 Y0 E2
;LAYER:0
G0 X0 Y10 Z0.4
G1 X20 Y10 E4
G0 X0 Y12
G1 X8 Y12 E5
G1 X12 Y12 E6
G1 X20 Y12 E7
M104 S0
"""


MULTI_LAYER_SAMPLE_GCODE = """;FLAVOR:Marlin
G90
M82
G92 E0
;LAYER:0
G0 X0 Y10 Z0.4
G1 X20 Y10 E4
;LAYER:1
G0 X0 Y10 Z0.6
G1 X20 Y10 E8
;LAYER:2
G0 X0 Y10 Z0.8
G1 X20 Y10 E12
;LAYER:3
G0 X0 Y10 Z1.0
G1 X20 Y10 E16
M104 S0
"""


TAPERED_MULTI_LAYER_SAMPLE_GCODE = """;FLAVOR:Marlin
G90
M82
G92 E0
;LAYER:0
G0 X0 Y10 Z0.4
G1 X20 Y10 E4
;LAYER:1
G0 X2 Y10 Z0.6
G1 X18 Y10 E8
;LAYER:2
G0 X4 Y10 Z0.8
G1 X16 Y10 E12
;LAYER:3
G0 X6 Y10 Z1.0
G1 X14 Y10 E16
M104 S0
"""


class GcodeSplitTests(unittest.TestCase):
    def test_analyze_gcode_bounds_uses_layer_zero_and_above(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            gcode_path = Path(temp_dir) / "sample.gcode"
            gcode_path.write_text(SAMPLE_GCODE, encoding="utf-8")

            report = analyze_gcode_bounds(gcode_path, split_start_layer=0)

        self.assertEqual(report["bounds"]["x"]["min"], 0.0)
        self.assertEqual(report["bounds"]["x"]["max"], 20.0)
        self.assertEqual(report["bounds"]["x"]["center"], 10.0)
        self.assertEqual(report["bounds"]["y"]["min"], 10.0)
        self.assertEqual(report["bounds"]["y"]["max"], 12.0)
        self.assertEqual(report["layer_min"], 0)
        self.assertEqual(report["layer_max"], 0)

    def test_split_keeps_raft_intact_and_separates_layer_zero(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            gcode_path = Path(temp_dir) / "sample.gcode"
            out_path = Path(temp_dir) / "sample_split.gcode"
            gcode_path.write_text(SAMPLE_GCODE, encoding="utf-8")

            report = split_gcode_for_mold_halves(
                gcode_path=gcode_path,
                out_path=out_path,
                cfg=GcodeSplitConfig(axis="x", gap_mm=2.0, split_start_layer=0),
            )
            text = out_path.read_text(encoding="utf-8")

        self.assertEqual(report["coordinate_mm"], 10.0)
        self.assertIn(";LAYER:-1\nG0 X0 Y0 Z0.2\nG1 X20 Y0 E2", text)
        self.assertIn(";LAYER:0", text)
        self.assertIn("G1 E1.2 F1800 ;split retract", text)
        self.assertIn("G0 Z0.8 F1200 ;split z-hop", text)
        self.assertIn("G0 X-1 Y10 ;split gap travel", text)
        self.assertIn("G0 Z0.4 F1200 ;split z-drop", text)
        self.assertIn("G1 E2 F1800 ;split prime", text)
        self.assertIn("G1 X9 Y10 E3", text)
        self.assertIn("G1 E2.2 F1800 ;split retract", text)
        self.assertIn("G0 Z1 F1200 ;split z-hop", text)
        self.assertIn("G0 X11 Y10 ;split gap travel", text)
        self.assertIn("G0 Z0.4 F1200 ;split z-drop", text)
        self.assertIn("G1 E3 F1800 ;split prime", text)
        self.assertIn("G1 X21 Y10 E4 ;split half B", text)
        self.assertIn("G1 X7 Y12 E5", text)
        self.assertIn("G1 X9 Y12 E5.5", text)
        self.assertIn("G0 X11 Y12 ;split gap travel", text)
        self.assertIn("G1 X13 Y12 E6 ;split half B", text)
        self.assertIn("G1 X21 Y12 E7", text)
        self.assertGreaterEqual(report["stats"]["split_moves"], 2)
        self.assertGreaterEqual(report["stats"]["cross_gap_transfers"], 2)

    def test_split_gap_is_clamped_to_two_millimeters(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            gcode_path = Path(temp_dir) / "sample.gcode"
            out_path = Path(temp_dir) / "sample_split.gcode"
            gcode_path.write_text(SAMPLE_GCODE, encoding="utf-8")

            report = split_gcode_for_mold_halves(
                gcode_path=gcode_path,
                out_path=out_path,
                cfg=GcodeSplitConfig(axis="x", gap_mm=1.0, split_start_layer=0),
            )

        self.assertEqual(report["gap_mm"], 2.0)

    def test_split_can_add_wire_loops_on_the_outside(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            gcode_path = Path(temp_dir) / "sample.gcode"
            out_path = Path(temp_dir) / "sample_split_loops.gcode"
            gcode_path.write_text(SAMPLE_GCODE, encoding="utf-8")

            report = split_gcode_for_mold_halves(
                gcode_path=gcode_path,
                out_path=out_path,
                cfg=GcodeSplitConfig(
                    axis="x",
                    gap_mm=2.0,
                    split_start_layer=0,
                    wire_loops=True,
                    wire_loop_width_mm=3.0,
                    wire_loop_depth_mm=3.0,
                    wire_loop_neck_mm=1.0,
                ),
            )
            text = out_path.read_text(encoding="utf-8")

        self.assertIn(";wire loop travel", text)
        self.assertIn(";wire loop", text)
        self.assertIn(";outside peg", text)
        self.assertIn(";wire loop return", text)
        self.assertIn(";wire loop restore E", text)
        self.assertGreaterEqual(report["stats"]["wire_loops_added"], 1)
        self.assertGreaterEqual(report["stats"]["outside_pegs_added"], 1)
        self.assertGreaterEqual(report["stats"]["wire_loop_pairs"], 1)
        self.assertGreaterEqual(report["stats"]["wire_loop_layers"], 1)

    def test_split_can_add_compact_hardware_pads(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            gcode_path = Path(temp_dir) / "sample.gcode"
            out_path = Path(temp_dir) / "sample_split_frames.gcode"
            gcode_path.write_text(MULTI_LAYER_SAMPLE_GCODE, encoding="utf-8")

            report = split_gcode_for_mold_halves(
                gcode_path=gcode_path,
                out_path=out_path,
                cfg=GcodeSplitConfig(
                    axis="x",
                    gap_mm=2.0,
                    split_start_layer=0,
                    outside_frame=True,
                    outside_frame_clearance_mm=2.0,
                    outside_frame_thickness_mm=0.9,
                    outside_frame_band_layers=1,
                ),
            )
            text = out_path.read_text(encoding="utf-8")

        self.assertIn(";hardware pad travel", text)
        self.assertIn(";hardware pad", text)
        self.assertIn(";frame loop", text)
        self.assertIn(";frame peg", text)
        self.assertIn(";hardware pad return", text)
        self.assertIn(";hardware pad restore E", text)
        self.assertEqual(report["stats"]["outside_frame_layers"], 2)
        self.assertEqual(report["stats"]["outside_frames_added"], 8)
        self.assertEqual(report["stats"]["outside_frame_paths"], 8)

    def test_compact_hardware_pads_follow_tapered_layers(self) -> None:
        with tempfile.TemporaryDirectory() as temp_dir:
            gcode_path = Path(temp_dir) / "sample_tapered.gcode"
            out_path = Path(temp_dir) / "sample_tapered_split_frames.gcode"
            gcode_path.write_text(TAPERED_MULTI_LAYER_SAMPLE_GCODE, encoding="utf-8")

            split_gcode_for_mold_halves(
                gcode_path=gcode_path,
                out_path=out_path,
                cfg=GcodeSplitConfig(
                    axis="x",
                    gap_mm=2.0,
                    split_start_layer=0,
                    outside_frame=True,
                    outside_frame_clearance_mm=2.0,
                    outside_frame_thickness_mm=0.9,
                    outside_frame_band_layers=1,
                    outside_joiner_count=1,
                    wire_loop_width_mm=3.0,
                    wire_loop_depth_mm=3.0,
                    wire_loop_neck_mm=1.0,
                ),
            )
            text = out_path.read_text(encoding="utf-8")

        self.assertIn("G0 X-1 Y7 F1800 ;hardware pad travel", text)
        self.assertIn("G0 X5 Y7 F1800 ;hardware pad travel", text)


if __name__ == "__main__":
    unittest.main()
