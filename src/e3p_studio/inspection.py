"""Independent replay of the documented absolute, linear G-code subset.

This checks generated geometry, not printer execution or physical clearances.
It deliberately does not use the splitter's parser or motion-state helpers.
"""
from __future__ import annotations

import math
from dataclasses import asdict, dataclass


@dataclass(frozen=True)
class Segment:
    layer: int | None
    start: tuple[float, float, float]
    end: tuple[float, float, float]
    extrusion: float
    feed: float | None
    comment: str

    @property
    def printing(self) -> bool:
        return self.extrusion > 1e-8 and math.dist(self.start[:2], self.end[:2]) > 1e-8


def replay(text: str) -> list[Segment]:
    position = [0.0, 0.0, 0.0]
    extrusion = 0.0
    feed = None
    layer = None
    result = []
    for raw in text.splitlines():
        if raw.strip().startswith(";LAYER:"):
            layer = int(raw.strip().partition(":")[2])
        command, _, comment = raw.partition(";")
        words = command.split()
        if not words:
            continue
        code = words[0].upper()
        if code in {"G91", "M83", "G2", "G3", "G20"}:
            raise ValueError("Inspection only supports absolute linear millimetre moves.")
        if code not in {"G0", "G00", "G1", "G01", "G92"}:
            continue
        params = {word[0].upper(): float(word[1:]) for word in words[1:]}
        if code == "G92":
            if set(params) - {"E"}:
                raise ValueError("Inspection supports G92 E only.")
            extrusion = params.get("E", extrusion)
            continue
        next_position = [params.get(axis, value) for axis, value in zip("XYZ", position)]
        next_extrusion = params.get("E", extrusion)
        feed = params.get("F", feed)
        result.append(Segment(layer, tuple(position), tuple(next_position),
                              next_extrusion - extrusion, feed, comment.strip()))
        position, extrusion = next_position, next_extrusion
    return result


def summarize(segments: list[Segment], *, axis: str, cut: float, gap: float,
              split_start_layer: int = 0) -> dict:
    index = "xy".index(axis)
    active = [s for s in segments if s.printing and s.layer is not None and s.layer >= split_start_layer]
    low, high = cut - gap / 2, cut + gap / 2
    violations = []
    for offset, segment in enumerate(active):
        start, end = sorted((segment.start[index], segment.end[index]))
        if end > low + 0.001 and start < high - 0.001:
            violations.append(offset)
    return {
        "printing_segments": len(active),
        "xy_length_mm": round(sum(math.dist(s.start[:2], s.end[:2]) for s in active), 6),
        "extrusion_mm": round(sum(s.extrusion for s in active), 6),
        "gap_violations": len(violations),
        "gap_violation_segments": violations,
    }


def serialize(segments: list[Segment]) -> list[dict]:
    return [{**asdict(segment), "printing": segment.printing} for segment in segments]
