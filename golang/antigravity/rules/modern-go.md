---
title: Modern Go (1.27+)
description: Leveraging the latest features in the Go toolchain and standard library.
trigger: always_on
---

# Standard Library Additions
* **UUID (1.27)**: Use the built-in `uuid` package for generating and parsing UUIDs.
* **Crypto Migrations (1.24/1.26)**: Use built-in `crypto/hkdf`, `crypto/pbkdf2`, `crypto/sha3`, and `crypto/hpke` (1.26).
* **CutLast (1.27)**: Use `bytes.CutLast` and `strings.CutLast` to simplify slicing around the last occurrence of a separator.
* **FS Isolation (1.24)**: Use `os.Root` to perform filesystem operations within a specific directory.
* **Slices & Maps**: Prefer `slices` and `maps` packages over manual loops. Use `slices.Collect` and `slices.Sorted`.
* **IO Performance (1.26)**: `io.ReadAll` is now significantly faster and more memory-efficient.
* **Unique & Weak (1.22-1.24)**: Use `unique.Make` for interning values. Use the `weak` package for memory-efficient caches and canonicalization.

# Language & Runtime
* **Generics**: Use recursive type parameters (1.26) for constraints that refer to the type being defined.
* **Iterators (1.23)**: Use `for-range` over functions. Leverage `reflect.Value.Fields()` (1.26) for efficient struct iteration.
* **Error Extraction (1.26)**: Use `errors.AsType[T](err)` for type-safe unwrapping.
* **Green Tea GC (1.26)**: Benefit from reduced GC overhead (10-40%) automatically.
* **GOMAXPROCS (1.25)**: Runtime is now container-aware by default. No need for `automaxprocs`.

# Network & IO
* **HTTP Routing**: Use wildcards `{id}` and method prefixes in `net/http.ServeMux`.
* **Automatic Draining (1.27)**: HTTP/1 `Response.Body` now auto-drains on close.
* **HTTP/2 Priority (1.27)**: RFC 9218 priority signals are supported by default.
* **JSON v2 (1.25)**: Experiment with `GOEXPERIMENT=jsonv2` for significantly faster decoding.
* **Buffer Inspection (1.26)**: Use `bytes.Buffer.Peek(n)` for lookahead without consumption.

# Toolchain & Config
* **Module Ignoring (1.25)**: Use the `ignore` directive in `go.mod` to exclude specific directories from package patterns (e.g., `./...`).
* **WaitGroup.Go (1.25)**: Use `sync.WaitGroup.Go(f)` for cleaner goroutine lifecycle management.
* **Tool Directive (1.24)**: Manage build tools within `go.mod` using `tool` and `go tool`.
