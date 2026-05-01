---
title: Modern Go (1.18+)
description: Best practices for using modern Go features like Generics, Iterators, and the enhanced standard library.
---

# Generics (Go 1.18+)
* **Use for data structures**: Generics are ideal for implementing reusable containers (linked lists, trees, caches).
* **Utility functions**: Use generics for operations on slices and maps to avoid duplication (see `slices` and `maps` packages).
* **Avoid over-engineering**: Do not use generics unless they significantly reduce duplication or improve type safety.

# Iterators (Go 1.23+)
* **Range over functions**: Use the `iter` package to define custom iterators that can be used with `for-range`.
* **Standard sequences**: Prefer `slices.All`, `slices.Values`, `maps.Keys`, and `maps.Values` for iterating over collections.
* **Functional style**: Leverage `slices.Collect` and `slices.Sorted` for concise data processing.

# Standard Library Enhancements
* **Slices & Maps**: Use `slices` and `maps` packages instead of manual loops for searching, sorting, and cloning.
* **Cmp package**: Use `cmp.Compare` and `cmp.Less` for standardized comparisons.
* **Unique package**: Use `unique.Make` for interning/canonicalizing values to save memory on repetitive data.
* **HTTP Routing**: Use wildcards `{id}` and method prefixes (e.g., `GET /user/{id}`) in `net/http.ServeMux`.

# Performance
* **Profile-Guided Optimization (PGO)**: Use PGO to improve performance of hot code paths.
* **Allocation headers**: Be aware of 1.22+ runtime changes to memory alignment and metadata placement.
