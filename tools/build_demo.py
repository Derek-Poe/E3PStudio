"""Generate deterministic synthetic G-code, replay evidence and offline visuals."""
from __future__ import annotations

import argparse
import hashlib
import json
import math
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))
from e3p_studio.gcode_split import GcodeSplitConfig, split_gcode_for_mold_halves
from e3p_studio.inspection import replay, serialize, summarize


def synthetic_toolpath() -> str:
    lines = [";SYNTHETIC OFFLINE GEOMETRY FIXTURE - not a printer-ready job", "G21", "G90", "M82", "G92 E0",
             ";LAYER:-1", "G0 X18 Y18 Z0.2 F6000"]
    extrusion = 0.0
    point = (18.0, 18.0)

    def print_to(x, y):
        nonlocal extrusion, point
        extrusion += math.dist(point, (x, y)) * 0.04
        lines.append(f"G1 X{x:g} Y{y:g} E{extrusion:.5f} F1200")
        point = (x, y)

    for destination in [(62, 18), (62, 42), (18, 42), (18, 18)]:
        print_to(*destination)
    for layer in range(6):
        left, right = 20 + layer * 1.5, 60 - layer * 1.5
        lines.extend([f";LAYER:{layer}", f"G0 X{left:g} Y20 Z{0.4 + layer * 0.2:.1f} F6000"])
        point = (left, 20)
        for destination in [(right, 20), (right, 40), (left, 40), (left, 20)]:
            print_to(*destination)
        for row, y in enumerate(range(22, 40, 2)):
            start, end = (left, right) if row % 2 == 0 else (right, left)
            lines.append(f"G0 X{start:g} Y{y:g} F6000")
            point = (start, y)
            print_to(end, y)
    lines.extend(["M400", ";END SYNTHETIC FIXTURE"])
    return "\n".join(lines) + "\n"


def svg_preview(data: dict) -> str:
    parts = ['<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="400" viewBox="0 0 1200 400" role="img" aria-labelledby="title desc">',
             '<title id="title">Synthetic toolpath before and after a four millimetre split</title>',
             '<desc id="desc">Layer zero: original geometry, separated halves, and generated hardware pads. Exact generated XY segments, not a physical print.</desc>',
             '<rect width="1200" height="400" rx="16" fill="#0b1220"/>']
    for panel, (name, label) in enumerate([("input", "01 / ORIGINAL"), ("split", "02 / 4 mm GAP"), ("pads", "03 / HARDWARE PADS")]):
        origin = panel * 400
        parts.append(f'<text x="{origin + 24}" y="36" fill="#e2e8f0" font-family="sans-serif" font-size="16">{label}</text>')
        for x in ([40] if name == "input" else [38, 42]):
            sx = origin + 24 + (x - 8) * 5.5
            parts.append(f'<line x1="{sx}" y1="62" x2="{sx}" y2="340" stroke="#64748b" stroke-dasharray="4 5"/>')
        for segment in data["paths"][name]:
            if segment["layer"] != 0 or not segment["printing"]:
                continue
            x0, y0, _ = segment["start"]
            x1, y1, _ = segment["end"]
            feature = any(word in segment["comment"] for word in ("wire loop", "outside peg", "frame loop", "frame peg", "hardware pad"))
            color = "#c084fc" if feature else ("#60a5fa" if (x0 + x1) / 2 < 40 else "#fbbf24")
            parts.append(f'<path d="M {origin + 24 + (x0 - 8) * 5.5:.3f} {330 - (y0 - 8) * 6:.3f} L {origin + 24 + (x1 - 8) * 5.5:.3f} {330 - (y1 - 8) * 6:.3f}" fill="none" stroke="{color}" stroke-width="1.4"/>')
        parts.append(f'<text x="{origin + 24}" y="378" fill="#94a3b8" font-family="sans-serif" font-size="13">Layer 0 · synthetic geometry · millimetres</text>')
    parts.append('</svg>')
    return "\n".join(parts) + "\n"


def generate(destination: Path) -> dict:
    destination.mkdir(parents=True, exist_ok=True)
    source = destination / "synthetic.gcode"
    source_text = synthetic_toolpath()
    source.write_text(source_text, encoding="utf-8", newline="\n")
    source_segments = replay(source_text)
    active_source = [s for s in source_segments if s.printing and s.layer is not None and s.layer >= 0]
    source_e = sum(s.extrusion for s in active_source)
    source_length = sum(math.dist(s.start[:2], s.end[:2]) for s in active_source)
    data = {"fixture": "six tapered rectangular layers with nine raster paths per layer and one unchanged raft outline",
            "axis": "x", "cut_mm": 40, "gap_mm": 4,
            "paths": {"input": serialize(source_segments)}, "variants": {}}
    for name, options in [("split", {}), ("joiners", {"wire_loops": True}),
                          ("pads", {"outside_frame": True, "outside_frame_band_layers": 2})]:
        target = destination / f"{name}.gcode"
        report = split_gcode_for_mold_halves(gcode_path=source, out_path=target,
                                           cfg=GcodeSplitConfig(gap_mm=4, outside_joiner_count=2, **options))
        output = target.read_text(encoding="utf-8")
        segments = replay(output)
        checked = summarize(segments, axis="x", cut=40, gap=4)
        if checked["gap_violations"]:
            raise RuntimeError(f"Unexpected extrusion in {name} gap")
        # Compare the intact raft text, not just aggregate statistics.
        raft = lambda text: text.split(";LAYER:-1\n", 1)[1].split(";LAYER:0\n", 1)[0]
        if raft(source_text) != raft(output):
            raise RuntimeError("Raft was changed")
        if name == "split":
            if abs(checked["extrusion_mm"] - source_e) > 1e-5 or abs(checked["xy_length_mm"] - source_length) > 1e-5:
                raise RuntimeError("Base split changed extrusion or XY length")
            if any(s.feed != 1200 for s in segments if s.printing and s.layer is not None and s.layer >= 0):
                raise RuntimeError("Base split changed print feed")
        data["paths"][name] = serialize(segments)
        data["variants"][name] = {"config": {"gap_mm": 4, "outside_joiner_count": 2, **options},
                                  "transform": {key: value for key, value in report.items() if key not in {"input_path", "output_path"}},
                                  "inspection": checked, "raft_text_unchanged": True,
                                  "output_sha256": hashlib.sha256(target.read_bytes()).hexdigest()}
    data["source"] = {"printing_segments": len(active_source), "xy_length_mm": round(source_length, 6),
                      "extrusion_mm": round(source_e, 6), "input_sha256": hashlib.sha256(source.read_bytes()).hexdigest()}
    summary = {key: value for key, value in data.items() if key != "paths"}
    (destination / "metrics.json").write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8", newline="\n")
    (destination / "preview.svg").write_text(svg_preview(data), encoding="utf-8", newline="\n")
    template = (ROOT / "tools/viewer.html").read_text(encoding="utf-8")
    serialized = json.dumps(data, separators=(",", ":"), sort_keys=True).replace("<", "\\u003c")
    (destination / "index.html").write_text(template.replace("__DEMO_DATA__", serialized), encoding="utf-8", newline="\n")
    return summary


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=ROOT / "demo")
    parser.add_argument("--check", action="store_true", help="Regenerate in a temporary directory and compare all committed demo bytes.")
    args = parser.parse_args()
    if args.check:
        with tempfile.TemporaryDirectory() as directory:
            temporary = Path(directory)
            generate(temporary)
            expected = {path.name: path.read_bytes() for path in temporary.iterdir()}
            actual = {path.name: path.read_bytes() for path in args.output.iterdir()}
            if actual != expected:
                raise SystemExit("Demo differs from regeneration; run python tools/build_demo.py.")
        print("All seven demo artifacts reproduced byte-for-byte; geometry checks passed.")
    else:
        summary = generate(args.output)
        print(json.dumps({"source": summary["source"], "variants": {name: value["inspection"] for name, value in summary["variants"].items()}}, indent=2))


if __name__ == "__main__":
    main()
