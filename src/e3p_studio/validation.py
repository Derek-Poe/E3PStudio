"""Explicit input contract for the linear, absolute-coordinate splitter."""
from __future__ import annotations

import math
import re
from dataclasses import fields

NUMBER = r"[-+]?(?:\d+(?:\.\d*)?|\.\d+)(?:[eE][-+]?\d+)?"
PARAMETER = re.compile(rf"([A-Za-z])({NUMBER})\Z")
LAYER = re.compile(r";LAYER:(-?\d+)\s*\Z")
MOTION = {"G0", "G00", "G1", "G01"}
PARAMETERS = {
    **{code: set("XYZEF") for code in MOTION},
    "G90": set(), "G21": set(), "M82": set(), "G92": {"E"},
    "G4": set("PS"), "M104": set("ST"), "M109": set("SRT"),
    "M140": {"S"}, "M190": set("SR"), "M106": set("SP"),
    "M107": {"P"}, "M84": {"S"}, "M400": set(),
}


def validate_config(config) -> None:
    for field in fields(config):
        name, value = field.name, getattr(config, field.name)
        if name in {"axis", "wire_loops", "outside_frame"} or value is None:
            continue
        if not isinstance(value, (int, float)) or isinstance(value, bool) or not math.isfinite(value):
            raise ValueError(f"{name} must be finite.")
        if name in {"split_start_layer", "outside_joiner_count", "outside_frame_band_layers"}:
            if not isinstance(value, int):
                raise ValueError(f"{name} must be an integer.")
            if name != "split_start_layer" and value < 1:
                raise ValueError(f"{name} must be positive.")
        elif name != "coordinate_mm" and value < 0:
            raise ValueError(f"{name} must be nonnegative.")
        if "feed_mm_min" in name and value <= 0:
            raise ValueError(f"{name} must be positive.")
    if not isinstance(config.wire_loops, bool) or not isinstance(config.outside_frame, bool):
        raise ValueError("Feature flags must be booleans.")


def validate_input(lines: list[str], *, split_start_layer: int = 0) -> None:
    """Reject unsupported modal/ambiguous motion before creating output files.

    Millimetres are assumed when G21 is omitted. Input needs G90 and M82,
    explicit initial XYZ, whitespace-delimited numeric words and Cura layers.
    """
    absolute_axes = absolute_e = False
    known_axes: set[str] = set()
    position = {"X": 0.0, "Y": 0.0, "Z": 0.0, "E": 0.0}
    layer = None
    for number, line in enumerate(lines, 1):
        stripped = line.strip()
        if stripped.startswith(";LAYER:"):
            match = LAYER.fullmatch(stripped)
            if not match:
                raise ValueError(f"Line {number}: invalid layer marker.")
            layer = int(match[1])
        words = line.split(";", 1)[0].split()
        if not words:
            continue
        code = words[0].upper()
        if code not in PARAMETERS:
            raise ValueError(f"Line {number}: unsupported command {code}; use linear millimetre G90/M82 input.")
        params: dict[str, float] = {}
        for word in words[1:]:
            match = PARAMETER.fullmatch(word)
            if not match:
                raise ValueError(f"Line {number}: invalid numeric word.")
            key, raw = match[1].upper(), match[2]
            value = float(raw)
            if key not in PARAMETERS[code] or key in params or not math.isfinite(value):
                raise ValueError(f"Line {number}: unsupported, repeated or nonfinite parameter {key}.")
            params[key] = value
        if "F" in params and params["F"] <= 0:
            raise ValueError(f"Line {number}: feed rate must be positive.")
        if code == "G90":
            absolute_axes = True
        elif code == "M82":
            absolute_e = True
        elif code == "G92":
            if not absolute_e:
                raise ValueError(f"Line {number}: M82 is required before extrusion coordinates.")
            position.update(params)
        elif code in MOTION:
            if not absolute_axes or ("E" in params and not absolute_e):
                raise ValueError(f"Line {number}: declare G90 and M82 before motion/extrusion.")
            end = {**position, **{key: value for key, value in params.items() if key in position}}
            delta_e = end["E"] - position["E"]
            xy = end["X"] != position["X"] or end["Y"] != position["Y"]
            active = layer is not None and layer >= split_start_layer
            if delta_e > 0 and not {"X", "Y", "Z"}.issubset(known_axes):
                raise ValueError(f"Line {number}: establish XYZ before extrusion.")
            if active and xy and delta_e < 0:
                raise ValueError(f"Line {number}: combined XY retraction is unsupported; retract separately.")
            if active and xy and delta_e > 0 and end["Z"] != position["Z"]:
                raise ValueError(f"Line {number}: nonplanar extrusion is unsupported.")
            known_axes.update(set(params) & {"X", "Y", "Z"})
            position = end
