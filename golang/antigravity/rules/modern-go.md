---
title: Modern Go (1.18+)
description: Best practices for using modern Go features like Generics, Iterators, and the enhanced standard library.
---

# Generics (Go 1.18+)
* **Use for data structures**: Generics are ideal for implementing reusable containers (linked lists, trees, caches).
* **Utility functions**: Use generics for operations on slices and maps to avoid duplication (see `slices` and `maps` packages).
* **Error unwrapping (1.26)**: Use `errors.AsType[TargetError](err)` for type-safe error extraction without manual variable declaration.
* **Avoid over-engineering**: Do not use generics unless they significantly reduce duplication or improve type safety.

# Iterators (Go 1.23+)
* **Range over functions**: Use the `iter` package to define custom iterators that can be used with `for-range`.
* **Standard sequences**: Prefer `slices.All`, `slices.Values`, `maps.Keys`, and `maps.Values` for iterating over collections.
* **Reflection Iterators (1.26)**: Use `reflect.Value.Fields()`, `reflect.Value.Methods()`, `reflect.Type.Ins()`, and `reflect.Type.Outs()` to iterate over struct fields, methods, and function parameters.
* **Functional style**: Leverage `slices.Collect` and `slices.Sorted` for concise data processing.

# Standard Library Enhancements
* **Slices & Maps**: Use `slices` and `maps` packages instead of manual loops for searching, sorting, and cloning.
* **Cmp package**: Use `cmp.Compare` and `cmp.Less` for standardized comparisons.
* **Unique package**: Use `unique.Make` for interning/canonicalizing values to save memory on repetitive data.
* **HTTP Routing**: Use wildcards `{id}` and method prefixes (e.g., `GET /user/{id}`) in `net/http.ServeMux`.
* **Buffer Inspection (1.26)**: Use `bytes.Buffer.Peek(n)` to look ahead in a buffer without consuming data.

# Performance
* **Profile-Guided Optimization (PGO)**: Use PGO to improve performance of hot code paths.
* **Allocation headers**: Be aware of 1.22+ runtime changes to memory alignment and metadata placement.
