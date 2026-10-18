"""Deterministic regression coverage for output-state and feed restoration fixes."""
import math
import random
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))
from e3p_studio.gcode_split import GcodeSplitConfig, split_gcode_for_mold_halves
from e3p_studio.inspection import replay, summarize


class GeometryCases(unittest.TestCase):
    def test_eighty_linear_paths_preserve_deposition_and_keep_gap_empty(self):
        with tempfile.TemporaryDirectory() as directory:
            source, output = Path(directory) / "source.gcode", Path(directory) / "output.gcode"
            for axis in "xy":
                for seed in range(40):
                    with self.subTest(axis=axis, seed=seed):
                        randomizer = random.Random(seed)
                        coordinates = [-10, -5, -1, 1, 5, 10]
                        x, y, extrusion = -10, -10, 0
                        lines = ["G21", "G90", "M82", "G92 E0", "G0 X-10 Y-10 Z0.2 F6000", ";LAYER:0"]
                        for index in range(30):
                            nx, ny = (10, 10) if index == 0 else (randomizer.choice(coordinates), randomizer.choice(coordinates))
                            if (nx, ny) == (x, y):
                                nx = -nx
                            if index % 7 == 6:
                                lines.append(f"G0 X{nx} Y{ny} F6000")
                            else:
                                extrusion += math.hypot(nx - x, ny - y) / 10
                                lines.append(f"G1 X{nx} Y{ny} E{extrusion:.8f} F1200")
                            x, y = nx, ny
                        original = "\n".join(lines) + "\n"
                        source.write_text(original, encoding="utf-8")
                        before = [segment for segment in replay(original) if segment.printing]
                        split_gcode_for_mold_halves(gcode_path=source, out_path=output,
                                                   cfg=GcodeSplitConfig(axis=axis, coordinate_mm=0, gap_mm=2))
                        after = replay(output.read_text(encoding="utf-8"))
                        printed = [segment for segment in after if segment.printing]
                        self.assertEqual(source.read_text(encoding="utf-8"), original)
                        self.assertEqual(summarize(after, axis=axis, cut=0, gap=2)["gap_violations"], 0)
                        self.assertAlmostEqual(sum(s.extrusion for s in before), sum(s.extrusion for s in printed), delta=0.001)
                        self.assertAlmostEqual(sum(math.dist(s.start, s.end) for s in before),
                                               sum(math.dist(s.start, s.end) for s in printed), delta=0.05)
                        self.assertTrue(all(segment.feed == 1200 for segment in printed))
