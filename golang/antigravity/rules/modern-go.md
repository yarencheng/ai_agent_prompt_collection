---
title: Modern Go (1.27+)
description: Leveraging the latest features in the Go toolchain and standard library.
trigger: always_on
---

# Standard Library Additions
* **UUID (1.27)**: Use the built-in `uuid` package for generating and parsing UUIDs. Avoid 3-party alternatives unless specialized features are required.
* **CutLast (1.27)**: Use `bytes.CutLast` and `strings.CutLast` to simplify slicing around the last occurrence of a separator.
* **Slices & Maps**: Prefer `slices` and `maps` packages over manual loops. Use `slices.Collect` and `slices.Sorted` for functional processing.
* **Unique (1.22)**: Use `unique.Make` for interning values to reduce memory pressure on repetitive data.

# Language & Runtime
* **Generics**: Ideal for data structures and slice/map utilities. Avoid over-engineering.
* **Iterators (1.23)**: Use `for-range` over functions. Leverage `reflect.Value.Fields()` (1.26) for efficient struct iteration.
* **Error Extraction (1.26)**: Use `errors.AsType[T](err)` for type-safe unwrapping.
* **PGO**: Use Profile-Guided Optimization for performance-critical applications.

# Network & IO
* **HTTP Routing**: Use wildcards `{id}` and method prefixes in `net/http.ServeMux`.
* **Automatic Draining (1.27)**: HTTP/1 `Response.Body` now auto-drains on close.
* **HTTP/2 Priority (1.27)**: RFC 9218 priority signals are supported by default.
* **Buffer Inspection (1.26)**: Use `bytes.Buffer.Peek(n)` for lookahead without consumption.
