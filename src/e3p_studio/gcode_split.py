from __future__ import annotations

import argparse
import json
import math
import re
from dataclasses import dataclass, replace
from pathlib import Path
from typing import Any

from .validation import validate_config, validate_input


EPSILON = 1e-9
LAYER_RE = re.compile(r"^;LAYER:(-?\d+)\s*$")


@dataclass(slots=True)
class GcodeSplitConfig:
    axis: str = "x"
    coordinate_mm: float | None = None
    gap_mm: float = 2.0
    split_start_layer: int = 0
    retract_mm: float = 0.8
    retract_feed_mm_min: float = 1800.0
    prime_feed_mm_min: float = 1800.0
    z_hop_mm: float = 0.6
    z_hop_feed_mm_min: float = 1200.0
    wire_loops: bool = False
    wire_loop_width_mm: float = 4.0
    wire_loop_depth_mm: float = 4.0
    wire_loop_neck_mm: float = 1.2
    outside_joiner_count: int = 2
    outside_frame: bool = False
    outside_frame_clearance_mm: float = 2.0
    outside_frame_thickness_mm: float = 0.9
    outside_frame_band_layers: int = 12


@dataclass(slots=True)
class MotionState:
    x: float = 0.0
    y: float = 0.0
    z: float = 0.0
    e: float = 0.0
    f: float | None = None
    absolute_axes: bool = True
    absolute_extrusion: bool = True


def _trim_float(value: float, digits: int) -> str:
    text = f"{float(value):.{digits}f}".rstrip("0").rstrip(".")
    if text in {"", "-0"}:
        return "0"
    return text


def _format_param(letter: str, value: float) -> str:
    if letter == "E":
        return f"{letter}{_trim_float(value, 5)}"
    if letter == "F":
        if abs(float(value) - round(float(value))) < 1e-6:
            return f"{letter}{int(round(float(value)))}"
        return f"{letter}{_trim_float(value, 3)}"
    return f"{letter}{_trim_float(value, 3)}"


def _split_comment(line: str) -> tuple[str, str]:
    command, _, comment = str(line).partition(";")
    return command.strip(), comment


def _parse_params(command_text: str) -> tuple[str | None, dict[str, float]]:
    if not command_text:
        return None, {}
    parts = command_text.split()
    if not parts:
        return None, {}
    code = parts[0].upper()
    params: dict[str, float] = {}
    for token in parts[1:]:
        if len(token) < 2:
            continue
        letter = token[0].upper()
        if not letter.isalpha():
            continue
        try:
            params[letter] = float(token[1:])
        except ValueError:
            continue
    return code, params


def _line_with_comment(command_text: str, comment: str) -> str:
    command_text = str(command_text or "").rstrip()
    comment = str(comment or "")
    if comment:
        if command_text:
            return f"{command_text} ;{comment}"
        return f";{comment}"
    return command_text


def _build_move(code: str, *, x: float | None = None, y: float | None = None, z: float | None = None, e: float | None = None, f: float | None = None, comment: str = "") -> str:
    parts = [str(code or "G1").upper()]
    if x is not None:
        parts.append(_format_param("X", x))
    if y is not None:
        parts.append(_format_param("Y", y))
    if z is not None:
        parts.append(_format_param("Z", z))
    if e is not None:
        parts.append(_format_param("E", e))
    if f is not None:
        parts.append(_format_param("F", f))
    return _line_with_comment(" ".join(parts), comment)


def _layer_number(line: str) -> int | None:
    match = LAYER_RE.match(str(line).strip())
    if not match:
        return None
    return int(match.group(1))


def _advance_motion(state: MotionState, params: dict[str, float]) -> MotionState:
    next_state = MotionState(
        x=state.x,
        y=state.y,
        z=state.z,
        e=state.e,
        f=state.f,
        absolute_axes=state.absolute_axes,
        absolute_extrusion=state.absolute_extrusion,
    )
    if "X" in params:
        next_state.x = float(params["X"]) if state.absolute_axes else state.x + float(params["X"])
    if "Y" in params:
        next_state.y = float(params["Y"]) if state.absolute_axes else state.y + float(params["Y"])
    if "Z" in params:
        next_state.z = float(params["Z"]) if state.absolute_axes else state.z + float(params["Z"])
    if "E" in params:
        next_state.e = float(params["E"]) if state.absolute_extrusion else state.e + float(params["E"])
    if "F" in params:
        next_state.f = float(params["F"])
    return next_state


def _distance_2d(x0: float, y0: float, x1: float, y1: float) -> float:
    return math.hypot(float(x1) - float(x0), float(y1) - float(y0))


def _move_has_xy_motion(start: MotionState, end: MotionState) -> bool:
    return _distance_2d(start.x, start.y, end.x, end.y) > EPSILON


def _is_positive_extrusion(start: MotionState, end: MotionState, params: dict[str, float]) -> bool:
    return "E" in params and (end.e - start.e) > EPSILON


def _side_of(value: float, cut: float) -> int:
    if value < cut - EPSILON:
        return -1
    if value > cut + EPSILON:
        return 1
    return 0


def _transform_xy(x: float, y: float, *, axis: str, side: int, gap_half: float) -> tuple[float, float]:
    if side == 0:
        return float(x), float(y)
    if axis == "x":
        return float(x) + (gap_half * float(side)), float(y)
    return float(x), float(y) + (gap_half * float(side))


def _split_intersection(start: MotionState, end: MotionState, *, axis: str, cut: float) -> tuple[float, float] | None:
    c0 = start.x if axis == "x" else start.y
    c1 = end.x if axis == "x" else end.y
    delta = float(c1) - float(c0)
    if abs(delta) <= EPSILON:
        return None
    t = (float(cut) - float(c0)) / delta
    if t <= EPSILON or t >= 1.0 - EPSILON:
        return None
    hit_x = float(start.x) + (float(end.x) - float(start.x)) * t
    hit_y = float(start.y) + (float(end.y) - float(start.y)) * t
    return hit_x, hit_y


def _segment_end_line(code: str, *, end_x: float, end_y: float, end_z: float | None, end_e: float | None, feedrate: float | None, comment: str = "") -> str:
    return _build_move(code, x=end_x, y=end_y, z=end_z, e=end_e, f=feedrate, comment=comment)


def _emit_safe_transfer(
    *,
    current_z: float,
    current_e: float,
    absolute_extrusion: bool,
    target_x: float,
    target_y: float,
    target_z: float,
    travel_feed: float | None,
    cfg: GcodeSplitConfig,
    travel_comment: str = "split gap travel",
) -> list[str]:
    out: list[str] = []
    retract_mm = max(0.0, float(cfg.retract_mm))
    z_hop_mm = max(0.0, float(cfg.z_hop_mm))
    retract_feed = max(1.0, float(cfg.retract_feed_mm_min))
    prime_feed = max(1.0, float(cfg.prime_feed_mm_min))
    z_hop_feed = max(1.0, float(cfg.z_hop_feed_mm_min))

    if retract_mm > EPSILON:
        retract_e = float(current_e) - retract_mm if absolute_extrusion else -retract_mm
        out.append(_build_move("G1", e=retract_e, f=retract_feed, comment="split retract"))

    if z_hop_mm > EPSILON:
        out.append(_build_move("G0", z=float(current_z) + z_hop_mm, f=z_hop_feed, comment="split z-hop"))
        out.append(_build_move("G0", x=target_x, y=target_y, f=travel_feed, comment=travel_comment))
        out.append(_build_move("G0", z=target_z, f=z_hop_feed, comment="split z-drop"))
    else:
        out.append(_build_move("G0", x=target_x, y=target_y, z=target_z, f=travel_feed, comment=travel_comment))

    if retract_mm > EPSILON:
        prime_e = float(current_e) if absolute_extrusion else retract_mm
        out.append(_build_move("G1", e=prime_e, f=prime_feed, comment="split prime"))
    if travel_feed is not None:
        out.append(_build_move("G1", f=travel_feed, comment="split restore feed"))
    return out


def _point_axis(point: tuple[float, float], axis: str) -> float:
    return float(point[0] if axis == "x" else point[1])


def _point_perpendicular(point: tuple[float, float], axis: str) -> float:
    return float(point[1] if axis == "x" else point[0])


def _point_near_axis(point: tuple[float, float], *, axis: str, coordinate: float, tolerance: float = 0.002) -> bool:
    return abs(_point_axis(point, axis) - float(coordinate)) <= float(tolerance)


def _append_candidate(points: list[tuple[float, float]], point: tuple[float, float]) -> None:
    rounded = (round(float(point[0]), 3), round(float(point[1]), 3))
    if rounded not in {(round(existing[0], 3), round(existing[1], 3)) for existing in points}:
        points.append((float(point[0]), float(point[1])))


def _append_candidate_with_seen(
    points: list[tuple[float, float]],
    seen: set[tuple[float, float]],
    point: tuple[float, float],
) -> None:
    rounded = (round(float(point[0]), 3), round(float(point[1]), 3))
    if rounded in seen:
        return
    seen.add(rounded)
    points.append((float(point[0]), float(point[1])))


def _line_count_for_band(thickness_mm: float, preferred_spacing_mm: float = 0.45) -> int:
    return max(1, int(math.ceil(max(float(thickness_mm), preferred_spacing_mm) / preferred_spacing_mm)))


def _band_offsets(clearance_mm: float, thickness_mm: float, preferred_spacing_mm: float = 0.45) -> list[float]:
    count = _line_count_for_band(thickness_mm, preferred_spacing_mm)
    step = max(preferred_spacing_mm * 0.5, float(thickness_mm) / float(count))
    return [float(clearance_mm) + (step * (index + 0.5)) for index in range(count)]


def _split_half_bounds(
    *,
    axis: str,
    cut: float,
    gap_half: float,
    x_min: float,
    x_max: float,
    y_min: float,
    y_max: float,
) -> tuple[dict[str, float], dict[str, float]]:
    if axis == "x":
        negative = {
            "x_min": float(x_min) - float(gap_half),
            "x_max": float(cut) - float(gap_half),
            "y_min": float(y_min),
            "y_max": float(y_max),
        }
        positive = {
            "x_min": float(cut) + float(gap_half),
            "x_max": float(x_max) + float(gap_half),
            "y_min": float(y_min),
            "y_max": float(y_max),
        }
        return negative, positive

    negative = {
        "x_min": float(x_min),
        "x_max": float(x_max),
        "y_min": float(y_min) - float(gap_half),
        "y_max": float(cut) - float(gap_half),
    }
    positive = {
        "x_min": float(x_min),
        "x_max": float(x_max),
        "y_min": float(cut) + float(gap_half),
        "y_max": float(y_max) + float(gap_half),
    }
    return negative, positive


def _hardware_pad_path_points(
    *,
    anchor: tuple[float, float],
    axis: str,
    side_sign: int,
    cfg: GcodeSplitConfig,
) -> list[tuple[float, float]]:
    span = max(6.0, float(cfg.wire_loop_width_mm) + (2.0 * max(0.4, float(cfg.wire_loop_neck_mm))))
    depth = max(2.0, float(cfg.outside_frame_clearance_mm) + float(cfg.wire_loop_depth_mm))
    line_spacing = max(0.4, float(cfg.outside_frame_thickness_mm) * 0.5)
    anchor_x = float(anchor[0])
    anchor_y = float(anchor[1])

    if axis == "x":
        body_x = anchor_x
        outer_x = body_x + (float(side_sign) * depth)
        y0 = anchor_y - (span * 0.5)
        y1 = anchor_y + (span * 0.5)
        scan_values = [y0]
        cursor = y0 + line_spacing
        while cursor < y1 - EPSILON:
            scan_values.append(cursor)
            cursor += line_spacing
        if scan_values[-1] < y1 - EPSILON:
            scan_values.append(y1)

        near_x = body_x
        far_x = outer_x
        points = [(near_x, scan_values[0])]
        current_x = near_x
        for index, scan_y in enumerate(scan_values):
            if index > 0:
                points.append((current_x, scan_y))
            row_end_x = far_x if current_x == near_x else near_x
            points.append((row_end_x, scan_y))
            current_x = row_end_x
        return points

    body_y = anchor_y
    outer_y = body_y + (float(side_sign) * depth)
    x0 = anchor_x - (span * 0.5)
    x1 = anchor_x + (span * 0.5)
    scan_values = [x0]
    cursor = x0 + line_spacing
    while cursor < x1 - EPSILON:
        scan_values.append(cursor)
        cursor += line_spacing
    if scan_values[-1] < x1 - EPSILON:
        scan_values.append(x1)

    near_y = body_y
    far_y = outer_y
    points = [(scan_values[0], near_y)]
    current_y = near_y
    for index, scan_x in enumerate(scan_values):
        if index > 0:
            points.append((scan_x, current_y))
        row_end_y = far_y if current_y == near_y else near_y
        points.append((scan_x, row_end_y))
        current_y = row_end_y
    return points


def _hardware_outer_anchor(
    *,
    anchor: tuple[float, float],
    axis: str,
    side_sign: int,
    cfg: GcodeSplitConfig,
) -> tuple[float, float]:
    depth = max(2.0, float(cfg.outside_frame_clearance_mm) + float(cfg.wire_loop_depth_mm))
    if axis == "x":
        return float(anchor[0]) + (float(side_sign) * depth), float(anchor[1])
    return float(anchor[0]), float(anchor[1]) + (float(side_sign) * depth)


def _select_outer_anchor_near_target(
    *,
    points: list[tuple[float, float]],
    target: float,
    axis: str,
    side_sign: int,
    used_perpendiculars: list[float],
    min_spacing: float,
    max_offset: float,
) -> tuple[float, float] | None:
    available = [
        point
        for point in points
        if all(abs(_point_perpendicular(point, axis) - used) >= min_spacing for used in used_perpendiculars)
    ]
    if not available:
        available = points
    if not available:
        return None
    near = [
        point
        for point in available
        if abs(_point_perpendicular(point, axis) - target) <= max_offset
    ]
    candidates = near or available
    if side_sign < 0:
        return min(candidates, key=lambda point: (_point_axis(point, axis), abs(_point_perpendicular(point, axis) - target)))
    return min(candidates, key=lambda point: (-_point_axis(point, axis), abs(_point_perpendicular(point, axis) - target)))


def _outside_loop_path_points(
    *,
    anchor: tuple[float, float],
    axis: str,
    side_sign: int,
    cfg: GcodeSplitConfig,
) -> list[tuple[float, float]]:
    span = max(1.5, float(cfg.wire_loop_width_mm))
    depth = max(1.5, float(cfg.wire_loop_depth_mm))
    anchor_x = float(anchor[0])
    anchor_y = float(anchor[1])

    if axis == "x":
        y0 = anchor_y - (span * 0.5)
        y1 = anchor_y + (span * 0.5)
        x0 = anchor_x
        x1 = anchor_x + (side_sign * depth)
        return [(x0, y0), (x1, y0), (x1, y1), (x0, y1), (x0, y0)]

    x0 = anchor_x - (span * 0.5)
    x1 = anchor_x + (span * 0.5)
    y0 = anchor_y
    y1 = anchor_y + (side_sign * depth)
    return [(x0, y0), (x0, y1), (x1, y1), (x1, y0), (x0, y0)]


def _outside_peg_path_points(
    *,
    anchor: tuple[float, float],
    axis: str,
    side_sign: int,
    cfg: GcodeSplitConfig,
) -> list[tuple[float, float]]:
    span = max(1.2, float(cfg.wire_loop_width_mm) - max(0.4, float(cfg.wire_loop_neck_mm)))
    depth = max(1.0, float(cfg.wire_loop_depth_mm) - max(0.4, float(cfg.wire_loop_neck_mm)))
    line_spacing = 0.45
    anchor_x = float(anchor[0])
    anchor_y = float(anchor[1])

    points: list[tuple[float, float]] = []
    if axis == "x":
        y0 = anchor_y - (span * 0.5)
        y1 = anchor_y + (span * 0.5)
        x0 = anchor_x
        x1 = anchor_x + (side_sign * depth)
        scan_values = [y0]
        cursor = y0 + line_spacing
        while cursor < y1 - EPSILON:
            scan_values.append(cursor)
            cursor += line_spacing
        if scan_values[-1] < y1 - EPSILON:
            scan_values.append(y1)
        moving_out = True
        for value in scan_values:
            points.append((x0, value))
            points.append((x1 if moving_out else x0, value))
            points.append((x0 if moving_out else x1, value))
            moving_out = not moving_out
        return points

    x0 = anchor_x - (span * 0.5)
    x1 = anchor_x + (span * 0.5)
    y0 = anchor_y
    y1 = anchor_y + (side_sign * depth)
    scan_values = [x0]
    cursor = x0 + line_spacing
    while cursor < x1 - EPSILON:
        scan_values.append(cursor)
        cursor += line_spacing
    if scan_values[-1] < x1 - EPSILON:
        scan_values.append(x1)
    moving_out = True
    for value in scan_values:
        points.append((value, y0))
        points.append((value, y1 if moving_out else y0))
        points.append((value, y0 if moving_out else y1))
        moving_out = not moving_out
    return points


def _emit_feature_pass(
    *,
    start_x: float,
    start_y: float,
    current_e: float,
    absolute_extrusion: bool,
    path_points: list[tuple[float, float]],
    e_per_mm: float,
    feedrate: float,
    comment: str,
) -> tuple[list[str], float, float, float]:
    out: list[str] = []
    x = float(start_x)
    y = float(start_y)
    e = float(current_e)
    for point_x, point_y in path_points:
        distance = _distance_2d(x, y, point_x, point_y)
        if distance <= EPSILON:
            continue
        delta_e = distance * e_per_mm
        emit_e = delta_e
        if absolute_extrusion:
            e += delta_e
            emit_e = e
        out.append(_build_move("G1", x=point_x, y=point_y, e=emit_e, f=feedrate, comment=comment))
        x = float(point_x)
        y = float(point_y)
    return out, x, y, e


def _emit_outside_frames_for_layer(
    *,
    layer_number: int,
    axis: str,
    restore_state: MotionState,
    negative_points: list[tuple[float, float]],
    positive_points: list[tuple[float, float]],
    e_per_mm: float,
    cfg: GcodeSplitConfig,
    station_targets: list[float],
) -> tuple[list[str], dict[str, int]]:
    stats = {
        "outside_frame_layers": 0,
        "outside_frame_paths": 0,
        "outside_frames_added": 0,
        "outside_frame_loop_tabs": 0,
        "outside_frame_peg_tabs": 0,
    }
    if not cfg.outside_frame or layer_number < int(cfg.split_start_layer):
        return [], stats
    if e_per_mm <= EPSILON:
        return [], stats
    if not negative_points or not positive_points:
        return [], stats

    min_spacing = max(float(cfg.wire_loop_width_mm) * 0.9, 1.2)
    max_offset = max(float(cfg.wire_loop_width_mm) * 1.6, 4.0)
    negative_used: list[float] = []
    positive_used: list[float] = []
    stations: list[tuple[int, tuple[float, float], tuple[float, float]]] = []
    for target in station_targets:
        negative_anchor = _select_outer_anchor_near_target(
            points=negative_points,
            target=target,
            axis=axis,
            side_sign=-1,
            used_perpendiculars=negative_used,
            min_spacing=min_spacing,
            max_offset=max_offset,
        )
        positive_anchor = _select_outer_anchor_near_target(
            points=positive_points,
            target=target,
            axis=axis,
            side_sign=1,
            used_perpendiculars=positive_used,
            min_spacing=min_spacing,
            max_offset=max_offset,
        )
        if negative_anchor is None or positive_anchor is None:
            continue
        stations.append((len(stations), negative_anchor, positive_anchor))
        negative_used.append(_point_perpendicular(negative_anchor, axis))
        positive_used.append(_point_perpendicular(positive_anchor, axis))
    if not stations:
        return [], stats

    lines: list[str] = []
    if not restore_state.absolute_axes:
        lines.append(_line_with_comment("G90", "outside frame abs axes"))

    current_x = float(restore_state.x)
    current_y = float(restore_state.y)
    current_e = float(restore_state.e)
    current_z = float(restore_state.z)
    travel_feed = restore_state.f if restore_state.f is not None else 7200.0
    print_feed = restore_state.f if restore_state.f is not None else 1800.0

    for station_index, negative_anchor, positive_anchor in stations:
        negative_feature = "loop" if station_index % 2 == 0 else "peg"
        positive_feature = "peg" if negative_feature == "loop" else "loop"
        for anchor, side_sign, feature_kind in (
            (negative_anchor, -1, negative_feature),
            (positive_anchor, 1, positive_feature),
        ):
            pad_points = _hardware_pad_path_points(
                anchor=anchor,
                axis=axis,
                side_sign=side_sign,
                cfg=cfg,
            )
            if not pad_points:
                continue
            entry_x, entry_y = pad_points[0]
            lines.extend(
                _emit_safe_transfer(
                    current_z=current_z,
                    current_e=current_e,
                    absolute_extrusion=restore_state.absolute_extrusion,
                    target_x=entry_x,
                    target_y=entry_y,
                    target_z=current_z,
                    travel_feed=travel_feed,
                    cfg=cfg,
                    travel_comment="hardware pad travel",
                )
            )
            current_x = entry_x
            current_y = entry_y
            pass_lines, current_x, current_y, current_e = _emit_feature_pass(
                start_x=current_x,
                start_y=current_y,
                current_e=current_e,
                absolute_extrusion=restore_state.absolute_extrusion,
                path_points=pad_points[1:],
                e_per_mm=e_per_mm,
                feedrate=print_feed,
                comment="hardware pad",
            )
            lines.extend(pass_lines)
            stats["outside_frame_paths"] += 1
            anchor_x, anchor_y = _hardware_outer_anchor(
                anchor=anchor,
                axis=axis,
                side_sign=side_sign,
                cfg=cfg,
            )
            lines.extend(
                _emit_safe_transfer(
                    current_z=current_z,
                    current_e=current_e,
                    absolute_extrusion=restore_state.absolute_extrusion,
                    target_x=anchor_x,
                    target_y=anchor_y,
                    target_z=current_z,
                    travel_feed=travel_feed,
                    cfg=cfg,
                    travel_comment="hardware joiner travel",
                )
            )
            current_x = anchor_x
            current_y = anchor_y
            feature_points = (
                _outside_loop_path_points(anchor=(anchor_x, anchor_y), axis=axis, side_sign=side_sign, cfg=cfg)
                if feature_kind == "loop"
                else _outside_peg_path_points(anchor=(anchor_x, anchor_y), axis=axis, side_sign=side_sign, cfg=cfg)
            )
            feature_lines, current_x, current_y, current_e = _emit_feature_pass(
                start_x=current_x,
                start_y=current_y,
                current_e=current_e,
                absolute_extrusion=restore_state.absolute_extrusion,
                path_points=feature_points,
                e_per_mm=e_per_mm,
                feedrate=print_feed,
                comment="frame loop" if feature_kind == "loop" else "frame peg",
            )
            lines.extend(feature_lines)
            if feature_kind == "loop":
                stats["outside_frame_loop_tabs"] += 1
            else:
                stats["outside_frame_peg_tabs"] += 1
        stats["outside_frames_added"] += 2

    lines.extend(
        _emit_safe_transfer(
            current_z=current_z,
            current_e=current_e,
            absolute_extrusion=restore_state.absolute_extrusion,
            target_x=float(restore_state.x),
            target_y=float(restore_state.y),
            target_z=current_z,
            travel_feed=travel_feed,
            cfg=cfg,
            travel_comment="hardware pad return",
        )
    )
    if restore_state.absolute_extrusion:
        lines.append(_build_move("G92", e=restore_state.e, comment="hardware pad restore E"))
    if not restore_state.absolute_axes:
        lines.append(_line_with_comment("G91", "hardware pad restore axes"))
    stats["outside_frame_layers"] = 1
    return lines, stats


def _apply_outside_frames_to_split_output(
    lines: list[str],
    *,
    axis: str,
    cut: float,
    cfg: GcodeSplitConfig,
    perpendicular_min: float,
    perpendicular_max: float,
) -> tuple[list[str], dict[str, int]]:
    if not cfg.outside_frame:
        return lines, {"outside_frame_layers": 0, "outside_frame_paths": 0, "outside_frames_added": 0, "outside_frame_loop_tabs": 0, "outside_frame_peg_tabs": 0}

    output_lines: list[str] = []
    layer_lines: list[str] = []
    current_layer: int | None = None
    state = MotionState()
    last_print_state: MotionState | None = None
    last_print_index = 0
    negative_points: list[tuple[float, float]] = []
    positive_points: list[tuple[float, float]] = []
    negative_seen: set[tuple[float, float]] = set()
    positive_seen: set[tuple[float, float]] = set()
    layer_e_total = 0.0
    layer_length_total = 0.0
    global_stats = {"outside_frame_layers": 0, "outside_frame_paths": 0, "outside_frames_added": 0, "outside_frame_loop_tabs": 0, "outside_frame_peg_tabs": 0}
    desired_count = max(1, int(cfg.outside_joiner_count))
    band_layers = max(1, int(cfg.outside_frame_band_layers))
    station_targets = [
        float(perpendicular_min + ((index + 1) / float(desired_count + 1)) * (perpendicular_max - perpendicular_min))
        for index in range(desired_count)
    ]
    active_layers = sorted(
        {
            layer
            for layer in (_layer_number(line) for line in lines)
            if layer is not None and int(layer) >= int(cfg.split_start_layer)
        }
    )
    if len(active_layers) <= band_layers * 2:
        eligible_layers = set(active_layers)
    else:
        eligible_layers = set(active_layers[:band_layers] + active_layers[-band_layers:])

    def flush_layer() -> None:
        nonlocal last_print_state, last_print_index
        nonlocal layer_lines, negative_points, positive_points, negative_seen, positive_seen, layer_e_total, layer_length_total
        if current_layer is None or last_print_state is None:
            output_lines.extend(layer_lines)
        else:
            output_lines.extend(layer_lines[:last_print_index])
            if int(current_layer) in eligible_layers:
                e_per_mm = (layer_e_total / layer_length_total) if layer_length_total > EPSILON else 0.0
                frame_lines, frame_stats = _emit_outside_frames_for_layer(
                    layer_number=int(current_layer),
                    axis=axis,
                    restore_state=last_print_state,
                    negative_points=negative_points,
                    positive_points=positive_points,
                    e_per_mm=e_per_mm,
                    cfg=cfg,
                    station_targets=station_targets,
                )
                output_lines.extend(frame_lines)
                for key in global_stats:
                    global_stats[key] += int(frame_stats[key])
            output_lines.extend(layer_lines[last_print_index:])
        last_print_state = None
        last_print_index = 0
        layer_lines = []
        negative_points = []
        positive_points = []
        negative_seen = set()
        positive_seen = set()
        layer_e_total = 0.0
        layer_length_total = 0.0

    for line in lines:
        layer = _layer_number(line)
        if layer is not None:
            flush_layer()
            current_layer = layer
            layer_lines = [line]
            continue

        layer_lines.append(line)
        command_text, _comment = _split_comment(line)
        code, params = _parse_params(command_text)
        if code is None:
            continue
        if code == "G90":
            state.absolute_axes = True
            continue
        if code == "G91":
            state.absolute_axes = False
            continue
        if code == "M82":
            state.absolute_extrusion = True
            continue
        if code == "M83":
            state.absolute_extrusion = False
            continue
        if code == "G92":
            if "X" in params:
                state.x = float(params["X"])
            if "Y" in params:
                state.y = float(params["Y"])
            if "Z" in params:
                state.z = float(params["Z"])
            if "E" in params:
                state.e = float(params["E"])
            if "F" in params:
                state.f = float(params["F"])
            continue
        if code not in {"G0", "G00", "G1", "G01"}:
            continue

        start = MotionState(
            x=state.x,
            y=state.y,
            z=state.z,
            e=state.e,
            f=state.f,
            absolute_axes=state.absolute_axes,
            absolute_extrusion=state.absolute_extrusion,
        )
        end = _advance_motion(state, params)
        state = end

        if not _move_has_xy_motion(start, end):
            continue
        if not _is_positive_extrusion(start, end, params):
            continue

        last_print_state = replace(end)
        last_print_index = len(layer_lines)
        segment_length = _distance_2d(start.x, start.y, end.x, end.y)
        if segment_length > EPSILON:
            layer_length_total += segment_length
            layer_e_total += max(0.0, float(end.e) - float(start.e))

        for point in ((start.x, start.y), (end.x, end.y)):
            side = _side_of(_point_axis(point, axis), cut)
            if side < 0:
                _append_candidate_with_seen(negative_points, negative_seen, point)
            elif side > 0:
                _append_candidate_with_seen(positive_points, positive_seen, point)

    flush_layer()
    return output_lines, global_stats


def _select_anchor_near_target(
    *,
    points: list[tuple[float, float]],
    target: float,
    axis: str,
    used_perpendiculars: list[float],
    min_spacing: float,
) -> tuple[float, float] | None:
    available = [
        point
        for point in points
        if all(abs(_point_perpendicular(point, axis) - used) >= min_spacing for used in used_perpendiculars)
    ]
    if not available:
        available = points
    if not available:
        return None
    return min(available, key=lambda point: abs(_point_perpendicular(point, axis) - target))


def _outside_station_pairs(
    *,
    negative_points: list[tuple[float, float]],
    positive_points: list[tuple[float, float]],
    axis: str,
    cfg: GcodeSplitConfig,
    station_targets: list[float],
) -> list[tuple[int, tuple[float, float], tuple[float, float]]]:
    if not negative_points or not positive_points:
        return []

    negative_sorted = sorted(negative_points, key=lambda point: _point_perpendicular(point, axis))
    positive_sorted = sorted(positive_points, key=lambda point: _point_perpendicular(point, axis))
    desired_count = max(1, int(cfg.outside_joiner_count))
    min_spacing = max(float(cfg.wire_loop_width_mm) * 0.9, 1.2)
    max_offset = max(float(cfg.wire_loop_width_mm) * 1.4, 3.0)
    negative_used: list[float] = []
    positive_used: list[float] = []
    pairs: list[tuple[int, tuple[float, float], tuple[float, float]]] = []

    for index, target in enumerate(station_targets[:desired_count]):
        negative_anchor = _select_anchor_near_target(
            points=negative_sorted,
            target=target,
            axis=axis,
            used_perpendiculars=negative_used,
            min_spacing=min_spacing,
        )
        positive_anchor = _select_anchor_near_target(
            points=positive_sorted,
            target=target,
            axis=axis,
            used_perpendiculars=positive_used,
            min_spacing=min_spacing,
        )
        if negative_anchor is None or positive_anchor is None:
            continue
        if abs(_point_perpendicular(negative_anchor, axis) - target) > max_offset:
            continue
        if abs(_point_perpendicular(positive_anchor, axis) - target) > max_offset:
            continue
        station_value = (_point_perpendicular(negative_anchor, axis) + _point_perpendicular(positive_anchor, axis)) * 0.5
        if pairs:
            previous_value = (_point_perpendicular(pairs[-1][1], axis) + _point_perpendicular(pairs[-1][2], axis)) * 0.5
            if abs(station_value - previous_value) < min_spacing:
                continue
        pairs.append((len(pairs), negative_anchor, positive_anchor))
        negative_used.append(_point_perpendicular(negative_anchor, axis))
        positive_used.append(_point_perpendicular(positive_anchor, axis))

    if not pairs:
        return [(0, negative_sorted[len(negative_sorted) // 2], positive_sorted[len(positive_sorted) // 2])]
    return pairs


def _emit_wire_loops_for_layer(
    *,
    layer_number: int,
    axis: str,
    restore_state: MotionState,
    negative_points: list[tuple[float, float]],
    positive_points: list[tuple[float, float]],
    e_per_mm: float,
    cfg: GcodeSplitConfig,
    station_targets: list[float],
) -> tuple[list[str], dict[str, int]]:
    stats = {
        "wire_loop_layers": 0,
        "wire_loop_pairs": 0,
        "wire_loops_added": 0,
        "outside_pegs_added": 0,
    }
    if not cfg.wire_loops or layer_number < int(cfg.split_start_layer):
        return [], stats
    if e_per_mm <= EPSILON:
        return [], stats

    pairs = _outside_station_pairs(
        negative_points=negative_points,
        positive_points=positive_points,
        axis=axis,
        cfg=cfg,
        station_targets=station_targets,
    )
    if not pairs:
        return [], stats

    lines: list[str] = []
    if not restore_state.absolute_axes:
        lines.append(_line_with_comment("G90", "wire loop abs axes"))

    current_x = float(restore_state.x)
    current_y = float(restore_state.y)
    current_e = float(restore_state.e)
    current_z = float(restore_state.z)
    travel_feed = restore_state.f if restore_state.f is not None else 7200.0
    print_feed = restore_state.f if restore_state.f is not None else 1800.0

    for station_index, negative_anchor, positive_anchor in pairs:
        negative_feature = "loop" if station_index % 2 == 0 else "peg"
        positive_feature = "peg" if negative_feature == "loop" else "loop"
        for anchor, side_sign, feature_kind in (
            (negative_anchor, -1, negative_feature),
            (positive_anchor, 1, positive_feature),
        ):
            lines.extend(
                _emit_safe_transfer(
                    current_z=current_z,
                    current_e=current_e,
                    absolute_extrusion=restore_state.absolute_extrusion,
                    target_x=float(anchor[0]),
                    target_y=float(anchor[1]),
                    target_z=current_z,
                    travel_feed=travel_feed,
                    cfg=cfg,
                    travel_comment="wire loop travel",
                )
            )
            current_x = float(anchor[0])
            current_y = float(anchor[1])
            path_points = (
                _outside_loop_path_points(anchor=anchor, axis=axis, side_sign=side_sign, cfg=cfg)
                if feature_kind == "loop"
                else _outside_peg_path_points(anchor=anchor, axis=axis, side_sign=side_sign, cfg=cfg)
            )
            pass_lines, current_x, current_y, current_e = _emit_feature_pass(
                start_x=current_x,
                start_y=current_y,
                current_e=current_e,
                absolute_extrusion=restore_state.absolute_extrusion,
                path_points=path_points,
                e_per_mm=e_per_mm,
                feedrate=print_feed,
                comment="wire loop" if feature_kind == "loop" else "outside peg",
            )
            lines.extend(pass_lines)
            if feature_kind == "loop":
                stats["wire_loops_added"] += 1
            else:
                stats["outside_pegs_added"] += 1
        stats["wire_loop_pairs"] += 1

    lines.extend(
        _emit_safe_transfer(
            current_z=current_z,
            current_e=current_e,
            absolute_extrusion=restore_state.absolute_extrusion,
            target_x=float(restore_state.x),
            target_y=float(restore_state.y),
            target_z=current_z,
            travel_feed=travel_feed,
            cfg=cfg,
            travel_comment="wire loop return",
        )
    )
    if restore_state.absolute_extrusion:
        lines.append(_build_move("G92", e=restore_state.e, comment="wire loop restore E"))
    if not restore_state.absolute_axes:
        lines.append(_line_with_comment("G91", "wire loop restore axes"))
    stats["wire_loop_layers"] = 1
    return lines, stats


def _apply_wire_loops_to_split_output(
    lines: list[str],
    *,
    axis: str,
    cut: float,
    gap_half: float,
    cfg: GcodeSplitConfig,
    perpendicular_min: float,
    perpendicular_max: float,
) -> tuple[list[str], dict[str, int]]:
    if not cfg.wire_loops:
        return lines, {"wire_loop_layers": 0, "wire_loop_pairs": 0, "wire_loops_added": 0, "outside_pegs_added": 0}

    negative_wall = float(cut) - float(gap_half)
    positive_wall = float(cut) + float(gap_half)
    output_lines: list[str] = []
    layer_lines: list[str] = []
    current_layer: int | None = None
    state = MotionState()
    last_print_state: MotionState | None = None
    last_print_index = 0
    negative_points: list[tuple[float, float]] = []
    positive_points: list[tuple[float, float]] = []
    layer_e_total = 0.0
    layer_length_total = 0.0
    global_stats = {"wire_loop_layers": 0, "wire_loop_pairs": 0, "wire_loops_added": 0, "outside_pegs_added": 0}
    desired_count = max(1, int(cfg.outside_joiner_count))
    if desired_count == 1:
        station_targets = [float(perpendicular_min + ((perpendicular_max - perpendicular_min) * 0.5))]
    else:
        station_targets = [
            float(perpendicular_min + ((index + 1) / float(desired_count + 1)) * (perpendicular_max - perpendicular_min))
            for index in range(desired_count)
        ]

    def flush_layer() -> None:
        nonlocal last_print_state, last_print_index
        nonlocal layer_lines, negative_points, positive_points, layer_e_total, layer_length_total
        if current_layer is None or last_print_state is None:
            output_lines.extend(layer_lines)
        else:
            output_lines.extend(layer_lines[:last_print_index])
            e_per_mm = (layer_e_total / layer_length_total) if layer_length_total > EPSILON else 0.0
            loop_lines, loop_stats = _emit_wire_loops_for_layer(
                layer_number=int(current_layer),
                axis=axis,
                restore_state=last_print_state,
                negative_points=negative_points,
                positive_points=positive_points,
                e_per_mm=e_per_mm,
                cfg=cfg,
                station_targets=station_targets,
            )
            output_lines.extend(loop_lines)
            for key in global_stats:
                global_stats[key] += int(loop_stats[key])
            output_lines.extend(layer_lines[last_print_index:])
        last_print_state = None
        last_print_index = 0
        layer_lines = []
        negative_points = []
        positive_points = []
        layer_e_total = 0.0
        layer_length_total = 0.0

    for line in lines:
        layer = _layer_number(line)
        if layer is not None:
            flush_layer()
            current_layer = layer
            layer_lines = [line]
            continue

        layer_lines.append(line)
        command_text, _comment = _split_comment(line)
        code, params = _parse_params(command_text)
        if code is None:
            continue
        if code == "G90":
            state.absolute_axes = True
            continue
        if code == "G91":
            state.absolute_axes = False
            continue
        if code == "M82":
            state.absolute_extrusion = True
            continue
        if code == "M83":
            state.absolute_extrusion = False
            continue
        if code == "G92":
            if "X" in params:
                state.x = float(params["X"])
            if "Y" in params:
                state.y = float(params["Y"])
            if "Z" in params:
                state.z = float(params["Z"])
            if "E" in params:
                state.e = float(params["E"])
            if "F" in params:
                state.f = float(params["F"])
            continue
        if code not in {"G0", "G00", "G1", "G01"}:
            continue

        start = MotionState(
            x=state.x,
            y=state.y,
            z=state.z,
            e=state.e,
            f=state.f,
            absolute_axes=state.absolute_axes,
            absolute_extrusion=state.absolute_extrusion,
        )
        end = _advance_motion(state, params)
        state = end

        if not _move_has_xy_motion(start, end):
            continue
        if not _is_positive_extrusion(start, end, params):
            continue

        last_print_state = replace(end)
        last_print_index = len(layer_lines)
        segment_length = _distance_2d(start.x, start.y, end.x, end.y)
        if segment_length > EPSILON:
            layer_length_total += segment_length
            layer_e_total += max(0.0, float(end.e) - float(start.e))

        for point in ((start.x, start.y), (end.x, end.y)):
            if _point_near_axis(point, axis=axis, coordinate=negative_wall):
                _append_candidate(negative_points, point)
            if _point_near_axis(point, axis=axis, coordinate=positive_wall):
                _append_candidate(positive_points, point)

    flush_layer()
    return output_lines, global_stats


def analyze_gcode_bounds(gcode_path: Path, *, split_start_layer: int = 0) -> dict[str, Any]:
    path = Path(gcode_path)
    lines = path.read_text(encoding="utf-8").splitlines()

    validate_input(lines, split_start_layer=split_start_layer)
    state = MotionState()
    current_layer: int | None = None
    min_x = math.inf
    max_x = -math.inf
    min_y = math.inf
    max_y = -math.inf
    segment_count = 0
    layer_hits: set[int] = set()

    for line in lines:
        layer = _layer_number(line)
        if layer is not None:
            current_layer = layer

        command_text, _comment = _split_comment(line)
        code, params = _parse_params(command_text)
        if code == "G90":
            state.absolute_axes = True
            continue
        if code == "G91":
            state.absolute_axes = False
            continue
        if code == "M82":
            state.absolute_extrusion = True
            continue
        if code == "M83":
            state.absolute_extrusion = False
            continue
        if code == "G92":
            if "X" in params:
                state.x = float(params["X"])
            if "Y" in params:
                state.y = float(params["Y"])
            if "Z" in params:
                state.z = float(params["Z"])
            if "E" in params:
                state.e = float(params["E"])
            if "F" in params:
                state.f = float(params["F"])
            continue
        if code not in {"G0", "G00", "G1", "G01"}:
            continue

        start = MotionState(
            x=state.x,
            y=state.y,
            z=state.z,
            e=state.e,
            f=state.f,
            absolute_axes=state.absolute_axes,
            absolute_extrusion=state.absolute_extrusion,
        )
        end = _advance_motion(state, params)
        state = end

        if current_layer is None or current_layer < int(split_start_layer):
            continue
        if not _move_has_xy_motion(start, end):
            continue
        if not _is_positive_extrusion(start, end, params):
            continue

        min_x = min(min_x, float(start.x), float(end.x))
        max_x = max(max_x, float(start.x), float(end.x))
        min_y = min(min_y, float(start.y), float(end.y))
        max_y = max(max_y, float(start.y), float(end.y))
        segment_count += 1
        layer_hits.add(int(current_layer))

    if segment_count == 0:
        raise RuntimeError(f"No positive-extrusion XY moves were found at layer {split_start_layer} or above in {path}.")

    return {
        "bounds": {
            "x": {"min": float(min_x), "max": float(max_x), "span": float(max_x - min_x), "center": float((min_x + max_x) * 0.5)},
            "y": {"min": float(min_y), "max": float(max_y), "span": float(max_y - min_y), "center": float((min_y + max_y) * 0.5)},
        },
        "split_start_layer": int(split_start_layer),
        "segment_count": int(segment_count),
        "layer_count": int(len(layer_hits)),
        "layer_min": min(layer_hits),
        "layer_max": max(layer_hits),
    }


def _default_output_path(source: Path, axis: str) -> Path:
    return source.with_name(f"{source.stem}_split_{axis}.gcode")


def _paths_alias(first: Path, second: Path) -> bool:
    return first.resolve() == second.resolve() or (
        first.exists() and second.exists() and first.samefile(second)
    )


def _sanitize_axis(axis: str) -> str:
    text = str(axis or "").strip().lower()
    if text not in {"x", "y"}:
        raise RuntimeError("Split axis must be 'x' or 'y'.")
    return text


def split_gcode_for_mold_halves(*, gcode_path: Path, out_path: Path | None = None, cfg: GcodeSplitConfig | None = None) -> dict[str, Any]:
    source = Path(gcode_path)
    config = cfg or GcodeSplitConfig()
    validate_config(config)
    axis = _sanitize_axis(config.axis)
    gap_mm = max(2.0, float(config.gap_mm))
    gap_half = gap_mm * 0.5
    bounds = analyze_gcode_bounds(source, split_start_layer=config.split_start_layer)
    cut = float(config.coordinate_mm if config.coordinate_mm is not None else bounds["bounds"][axis]["center"])
    target = Path(out_path) if out_path is not None else _default_output_path(source, axis)
    if _paths_alias(source, target):
        raise ValueError("Output must be different from the input file.")
    if not bounds["bounds"][axis]["min"] < cut < bounds["bounds"][axis]["max"]:
        raise ValueError("The cut must lie strictly inside the extrusion bounds.")
    lines = source.read_text(encoding="utf-8").splitlines()
    state = MotionState()
    current_layer: int | None = None
    output_lines: list[str] = [
        ";E3P_GCODE_SPLIT: mold half separation applied after slicing",
        f";E3P_GCODE_SPLIT_AXIS: {axis.upper()}",
        f";E3P_GCODE_SPLIT_COORD_MM: {_trim_float(cut, 4)}",
        f";E3P_GCODE_SPLIT_GAP_MM: {_trim_float(gap_mm, 4)}",
        f";E3P_GCODE_SPLIT_START_LAYER: {int(config.split_start_layer)}",
    ]
    stats = {
        "lines_rewritten": 0,
        "split_moves": 0,
        "travel_moves_shifted": 0,
        "extrusion_moves_shifted": 0,
        "plane_moves_dropped": 0,
        "cross_gap_transfers": 0,
        "start_alignment_transfers": 0,
    }

    output_state = MotionState()

    def emit_line(line: str) -> None:
        nonlocal output_state
        output_lines.append(line)
        code, params = _parse_params(_split_comment(line)[0])
        if code in {"G0", "G00", "G1", "G01"}:
            output_state = _advance_motion(output_state, params)
        elif code == "G92":
            for letter in ("X", "Y", "Z", "E"):
                if letter in params:
                    setattr(output_state, letter.lower(), params[letter])

    def emit_lines(lines: list[str]) -> None:
        for emitted in lines:
            emit_line(emitted)

    for line in lines:
        layer = _layer_number(line)
        if layer is not None:
            current_layer = layer
            emit_line(line)
            continue

        command_text, comment = _split_comment(line)
        code, params = _parse_params(command_text)

        if code is None:
            emit_line(line)
            continue

        if code == "G90":
            state.absolute_axes = True
            emit_line(line)
            continue
        if code == "G91":
            state.absolute_axes = False
            emit_line(line)
            continue
        if code == "M82":
            state.absolute_extrusion = True
            emit_line(line)
            continue
        if code == "M83":
            state.absolute_extrusion = False
            emit_line(line)
            continue
        if code == "G92":
            if "X" in params:
                state.x = float(params["X"])
            if "Y" in params:
                state.y = float(params["Y"])
            if "Z" in params:
                state.z = float(params["Z"])
            if "E" in params:
                state.e = float(params["E"])
            if "F" in params:
                state.f = float(params["F"])
            emit_line(line)
            continue
        if code not in {"G0", "G00", "G1", "G01"}:
            emit_line(line)
            continue

        start = MotionState(
            x=state.x,
            y=state.y,
            z=state.z,
            e=state.e,
            f=state.f,
            absolute_axes=state.absolute_axes,
            absolute_extrusion=state.absolute_extrusion,
        )
        end = _advance_motion(state, params)
        state = end

        active = current_layer is not None and current_layer >= int(config.split_start_layer)
        if not active:
            emit_line(line)
            continue
        if not _move_has_xy_motion(start, end):
            if "X" in params or "Y" in params:
                # Repeated input coordinates are a no-op in input space, but
                # would undo the translated output position if emitted raw.
                emit_line(_build_move(code, z=end.z if "Z" in params else None,
                                      e=end.e if "E" in params else None,
                                      f=end.f if "F" in params else None, comment=comment))
            else:
                emit_line(line)
            continue

        end_side = _side_of(end.x if axis == "x" else end.y, cut)
        start_coord = start.x if axis == "x" else start.y
        end_coord = end.x if axis == "x" else end.y
        start_side = _side_of(start_coord, cut)
        end_side = _side_of(end_coord, cut)
        if start_side == 0 and end_side != 0:
            start_side = end_side
        if end_side == 0 and start_side != 0:
            end_side = start_side

        if not _is_positive_extrusion(start, end, params):
            if start_side != 0 and end_side != 0 and start_side != end_side:
                transformed_x, transformed_y = _transform_xy(end.x, end.y, axis=axis, side=end_side, gap_half=gap_half)
                emit_lines(
                    _emit_safe_transfer(
                        current_z=start.z,
                        current_e=start.e,
                        absolute_extrusion=start.absolute_extrusion,
                        target_x=transformed_x,
                        target_y=transformed_y,
                        target_z=end.z if "Z" in params else start.z,
                        travel_feed=end.f if "F" in params else start.f,
                        cfg=config,
                        travel_comment="split gap travel",
                    )
                )
                stats["lines_rewritten"] += 1
                stats["travel_moves_shifted"] += 1
                stats["cross_gap_transfers"] += 1
                continue

            transformed_x, transformed_y = _transform_xy(end.x, end.y, axis=axis, side=end_side, gap_half=gap_half)
            rewritten = _segment_end_line(
                "G0" if code in {"G0", "G00"} else "G1",
                end_x=transformed_x if "X" in params or "Y" in params else end.x,
                end_y=transformed_y if "X" in params or "Y" in params else end.y,
                end_z=end.z if "Z" in params else None,
                end_e=end.e if "E" in params else None,
                feedrate=end.f if "F" in params else None,
                comment=comment,
            )
            emit_line(rewritten)
            stats["lines_rewritten"] += 1
            stats["travel_moves_shifted"] += 1
            continue

        finish_side = _side_of(end_coord, cut)

        if start_side == 0 and finish_side != 0:
            start_side = finish_side
        if finish_side == 0 and start_side != 0:
            finish_side = start_side

        line_length = _distance_2d(start.x, start.y, end.x, end.y)
        if abs(start_coord - cut) <= EPSILON and abs(end_coord - cut) <= EPSILON:
            stats["lines_rewritten"] += 1
            stats["plane_moves_dropped"] += 1
            emit_line(_build_move("G92", e=end.e, comment="dropped plane move: preserve E coordinate"))
            continue

        # An endpoint on the cut can change halves on the next move; align the
        # emitted position without extruding across the new gap. This also
        # handles a first active-layer extrusion with no preceding travel.
        wanted_x, wanted_y = _transform_xy(start.x, start.y, axis=axis, side=start_side, gap_half=gap_half)
        if _distance_2d(output_state.x, output_state.y, wanted_x, wanted_y) > 0.000501:
            emit_lines(_emit_safe_transfer(
                current_z=output_state.z, current_e=output_state.e,
                absolute_extrusion=True, target_x=wanted_x, target_y=wanted_y,
                target_z=start.z, travel_feed=end.f, cfg=config,
                travel_comment="split start alignment",
            ))
            stats["start_alignment_transfers"] += 1

        if start_side == finish_side and start_side != 0:
            transformed_x, transformed_y = _transform_xy(end.x, end.y, axis=axis, side=start_side, gap_half=gap_half)
            rewritten = _segment_end_line(
                "G1",
                end_x=transformed_x,
                end_y=transformed_y,
                end_z=end.z if "Z" in params else None,
                end_e=end.e,
                feedrate=end.f if "F" in params else None,
                comment=comment,
            )
            emit_line(rewritten)
            stats["lines_rewritten"] += 1
            stats["extrusion_moves_shifted"] += 1
            continue

        hit = _split_intersection(start, end, axis=axis, cut=cut)
        if hit is None or line_length <= EPSILON:
            side = finish_side if finish_side != 0 else start_side
            if side == 0:
                stats["lines_rewritten"] += 1
                stats["plane_moves_dropped"] += 1
                continue
            transformed_x, transformed_y = _transform_xy(end.x, end.y, axis=axis, side=side, gap_half=gap_half)
            rewritten = _segment_end_line(
                "G1",
                end_x=transformed_x,
                end_y=transformed_y,
                end_z=end.z if "Z" in params else None,
                end_e=end.e,
                feedrate=end.f if "F" in params else None,
                comment=comment,
            )
            emit_line(rewritten)
            stats["lines_rewritten"] += 1
            stats["extrusion_moves_shifted"] += 1
            continue

        hit_x, hit_y = hit
        first_length = _distance_2d(start.x, start.y, hit_x, hit_y)
        second_length = _distance_2d(hit_x, hit_y, end.x, end.y)
        total_e = float(end.e) - float(start.e)
        if first_length <= EPSILON or second_length <= EPSILON:
            side = finish_side if second_length > first_length else start_side
            transformed_x, transformed_y = _transform_xy(end.x, end.y, axis=axis, side=side, gap_half=gap_half)
            rewritten = _segment_end_line(
                "G1",
                end_x=transformed_x,
                end_y=transformed_y,
                end_z=end.z if "Z" in params else start.z,
                end_e=end.e,
                feedrate=end.f if "F" in params else None,
                comment=comment,
            )
            emit_line(rewritten)
            stats["lines_rewritten"] += 1
            stats["extrusion_moves_shifted"] += 1
            continue

        first_delta_e = total_e * (first_length / line_length)
        first_end_e = float(start.e) + first_delta_e
        second_end_e = float(end.e)

        first_end_x, first_end_y = _transform_xy(hit_x, hit_y, axis=axis, side=start_side, gap_half=gap_half)
        second_start_x, second_start_y = _transform_xy(hit_x, hit_y, axis=axis, side=finish_side, gap_half=gap_half)
        second_end_x, second_end_y = _transform_xy(end.x, end.y, axis=axis, side=finish_side, gap_half=gap_half)

        emit_line(
            _segment_end_line(
                "G1",
                end_x=first_end_x,
                end_y=first_end_y,
                end_z=end.z if "Z" in params else None,
                end_e=first_end_e,
                feedrate=end.f if "F" in params else None,
                comment="split half A" if not comment else comment,
            )
        )
        emit_lines(
            _emit_safe_transfer(
                current_z=end.z if "Z" in params else start.z,
                current_e=first_end_e,
                absolute_extrusion=start.absolute_extrusion,
                target_x=second_start_x,
                target_y=second_start_y,
                target_z=end.z if "Z" in params else start.z,
                travel_feed=end.f if "F" in params else start.f,
                cfg=config,
                travel_comment="split gap travel",
            )
        )
        emit_line(
            _segment_end_line(
                "G1",
                end_x=second_end_x,
                end_y=second_end_y,
                end_z=end.z if "Z" in params else None,
                end_e=second_end_e,
                feedrate=end.f if "F" in params else None,
                comment="split half B",
            )
        )
        stats["lines_rewritten"] += 1
        stats["split_moves"] += 1
        stats["cross_gap_transfers"] += 1

    perpendicular_axis = "y" if axis == "x" else "x"
    output_lines, loop_stats = _apply_wire_loops_to_split_output(
        output_lines,
        axis=axis,
        cut=cut,
        gap_half=gap_half,
        cfg=config,
        perpendicular_min=float(bounds["bounds"][perpendicular_axis]["min"]),
        perpendicular_max=float(bounds["bounds"][perpendicular_axis]["max"]),
    )
    for key, value in loop_stats.items():
        stats[key] = int(value)

    output_lines, frame_stats = _apply_outside_frames_to_split_output(
        output_lines,
        axis=axis,
        cut=cut,
        cfg=config,
        perpendicular_min=float(bounds["bounds"][perpendicular_axis]["min"]),
        perpendicular_max=float(bounds["bounds"][perpendicular_axis]["max"]),
    )
    for key, value in frame_stats.items():
        stats[key] = int(value)

    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text("\n".join(output_lines) + "\n", encoding="utf-8")
    report = {
        "input_path": str(source),
        "output_path": str(target),
        "axis": axis,
        "coordinate_mm": float(cut),
        "gap_mm": float(gap_mm),
        "split_start_layer": int(config.split_start_layer),
        "analysis": bounds,
        "stats": stats,
    }
    return report


def _default_report_path(output_path: Path) -> Path:
    return output_path.with_suffix(".json")


def build_arg_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Split a sliced G-code mold job into two separated halves while optionally keeping raft layers intact."
    )
    parser.add_argument("input_gcode", help="Path to the sliced G-code file to split.")
    parser.add_argument("-o", "--output", help="Path for the combined split output G-code.")
    parser.add_argument("--axis", choices=("x", "y"), default="x", help="Axis to split across. Default: x.")
    parser.add_argument("--coordinate-mm", type=float, default=None, help="Explicit split coordinate. Defaults to the midpoint of the detected bounds on the chosen axis.")
    parser.add_argument("--gap-mm", type=float, default=2.0, help="Separation gap between halves. Values below 2.0 mm retain the historical 2.0 mm minimum; this does not validate physical clearances.")
    parser.add_argument("--split-start-layer", type=int, default=0, help="Start splitting at this Cura layer number. Default: 0, which keeps raft/support below layer 0 intact.")
    parser.add_argument("--wire-loops", action="store_true", help="Add aligned outside joiners: alternating hollow loop tabs and solid peg tabs along the split plane.")
    parser.add_argument("--wire-loop-width-mm", type=float, default=4.0, help="Joiner span measured along the split plane. Default: 4.0 mm.")
    parser.add_argument("--wire-loop-depth-mm", type=float, default=4.0, help="Joiner depth measured away from the split plane. Default: 4.0 mm.")
    parser.add_argument("--wire-loop-neck-mm", type=float, default=1.2, help="Inset used to keep the solid peg narrower than the matching loop tab. Default: 1.2 mm.")
    parser.add_argument("--outside-joiner-count", type=int, default=2, help="How many aligned outside joiner stations to try per layer. Default: 2.")
    parser.add_argument("--outside-frame", action="store_true", help="Add small fixed hardware pads at the joiner stations instead of a full body frame.")
    parser.add_argument("--outside-frame-clearance-mm", type=float, default=2.0, help="How far the hardware pad extends out from the body. Default: 2.0 mm.")
    parser.add_argument("--outside-frame-thickness-mm", type=float, default=0.9, help="Raster spacing used to fill each hardware pad. Default: 0.9 mm.")
    parser.add_argument("--outside-frame-band-layers", type=int, default=12, help="How many layers near the bottom and top should receive the hardware pads. Default: 12.")
    parser.add_argument("--report-json", help="Optional path to write a JSON report. Defaults to the output name with .json.")
    return parser


def main(argv: list[str] | None = None) -> int:
    parser = build_arg_parser()
    args = parser.parse_args(argv)

    source = Path(args.input_gcode)
    output = Path(args.output) if args.output else _default_output_path(source, str(args.axis))
    report_path = Path(args.report_json) if args.report_json else _default_report_path(output)
    if _paths_alias(report_path, source) or _paths_alias(report_path, output):
        parser.error("Report path must differ from input and output paths.")

    report = split_gcode_for_mold_halves(
        gcode_path=source,
        out_path=output,
        cfg=GcodeSplitConfig(
            axis=str(args.axis),
            coordinate_mm=args.coordinate_mm,
            gap_mm=float(args.gap_mm),
            split_start_layer=int(args.split_start_layer),
            wire_loops=bool(args.wire_loops),
            wire_loop_width_mm=float(args.wire_loop_width_mm),
            wire_loop_depth_mm=float(args.wire_loop_depth_mm),
            wire_loop_neck_mm=float(args.wire_loop_neck_mm),
            outside_joiner_count=int(args.outside_joiner_count),
            outside_frame=bool(args.outside_frame),
            outside_frame_clearance_mm=float(args.outside_frame_clearance_mm),
            outside_frame_thickness_mm=float(args.outside_frame_thickness_mm),
            outside_frame_band_layers=int(args.outside_frame_band_layers),
        ),
    )
    report_path.parent.mkdir(parents=True, exist_ok=True)
    report_path.write_text(json.dumps(report, indent=2), encoding="utf-8")

    bounds = report["analysis"]["bounds"][report["axis"]]
    print(f"Split axis:      {str(report['axis']).upper()}")
    print(f"Split coordinate:{_trim_float(report['coordinate_mm'], 4)} mm")
    print(f"Gap:             {_trim_float(report['gap_mm'], 4)} mm")
    print(f"Start layer:     {report['split_start_layer']}")
    print(f"Bounds ({str(report['axis']).upper()}): {_trim_float(bounds['min'], 4)} .. {_trim_float(bounds['max'], 4)} mm")
    if report["stats"].get("wire_loops_added") or report["stats"].get("outside_pegs_added"):
        print(
            "Outside joiners: "
            f"{report['stats'].get('wire_loops_added', 0)} loop tabs, "
            f"{report['stats'].get('outside_pegs_added', 0)} peg tabs across "
            f"{report['stats'].get('wire_loop_layers', 0)} layers"
        )
    if report["stats"].get("outside_frame_paths"):
        print(
            "Hardware pads:   "
            f"{report['stats'].get('outside_frames_added', 0)} pads across "
            f"{report['stats'].get('outside_frame_layers', 0)} layers "
            f"using {report['stats'].get('outside_frame_paths', 0)} pad paths"
        )
    print(f"Output G-code:   {output}")
    print(f"JSON report:     {report_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
