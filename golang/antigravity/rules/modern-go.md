---
title: Modern Go (1.27+)
description: Leveraging the latest features in the Go toolchain and standard library.
trigger: always_on
---

# Standard Library Additions
* **UUID (1.27)**: Use the built-in `uuid` package for generating and parsing UUIDs.
* **CutLast (1.27)**: Use `bytes.CutLast` and `strings.CutLast` to simplify slicing around the last occurrence of a separator.
* **Slices & Maps**: Prefer `slices` and `maps` packages over manual loops. Use `slices.Collect` and `slices.Sorted`.
* **IO Performance (1.26)**: `io.ReadAll` is now significantly faster and more memory-efficient.
* **Unique (1.22)**: Use `unique.Make` for interning values to reduce memory pressure.

# Language & Runtime
* **Generics**: Use recursive type parameters (1.26) for constraints that refer to the type being defined.
* **Iterators (1.23)**: Use `for-range` over functions. Leverage `reflect.Value.Fields()` (1.26) for efficient struct iteration.
* **Error Extraction (1.26)**: Use `errors.AsType[T](err)` for type-safe unwrapping.
* **Green Tea GC (1.26)**: Benefit from reduced GC overhead (10-40%) automatically; monitor performance with standard tools.
* **PGO**: Use Profile-Guided Optimization for performance-critical applications.

# Network & IO
* **HTTP Routing**: Use wildcards `{id}` and method prefixes in `net/http.ServeMux`.
* **Automatic Draining (1.27)**: HTTP/1 `Response.Body` now auto-drains on close.
* **HTTP/2 Priority (1.27)**: RFC 9218 priority signals are supported by default.
* **Buffer Inspection (1.26)**: Use `bytes.Buffer.Peek(n)` for lookahead without consumption.
