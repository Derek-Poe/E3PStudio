# Source and maintenance scope

The original implementation was part of a larger E3P Studio print-preparation workspace. This package retains the `src/e3p_studio/gcode_split.py` module and the six tests in `tests/test_gcode_split.py`; that test file is unchanged. The original splitter passed those six tests before packaging.

The extraction adds a strict input contract, independent output replay, deterministic synthetic geometry, a local viewer, package metadata, documentation and CI. Maintenance changes are documented in the main README and covered by regression tests. The preserved geometry includes segment intersections and translated halves, outside loop/peg joiners, and compact pads that follow tapered layer bounds.

The broader workspace's CAD conversion, Cura integrations, Blender scripts, HTTP application and hardware adapters are not included. This package does not select among the workspace's alternative Blender mold generators or claim to reproduce the entire CAD-to-print pipeline. No upstream JavaScript libraries, CAD assets, model downloads, executables or device configuration files were copied.

Python's standard library supplies the runtime facilities. Build and CI tools retain their own licenses and are not vendored into the source. The included original code and new maintenance work are distributed under the repository's MIT license. Synthetic fixtures, SVG and viewer are generated from this repository's code; no real part, customer job or physical print is represented by the example.

Original-source hashes and exact private workspace locations are retained in a separate local audit. Public provenance intentionally uses repository-relative names. Neither a Git history for the original mixed workspace nor physical manufacturing results are asserted by this extraction.
