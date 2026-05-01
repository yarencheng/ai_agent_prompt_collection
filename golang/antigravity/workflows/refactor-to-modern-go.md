---
description: Modernize a Go codebase to Go 1.27+ features and best practices.
---

# Modern Go Refactor Workflow

## Prerequisites
* Go 1.27+ installed.
* Clean git state.

## Steps
1. **Toolchain Update**:
   * Set `go 1.27` in `go.mod`.
   * Run `go mod tidy`.

2. **Standard Library Migration (1.27)**:
   * Replace 3-party UUID libraries with the built-in `uuid` package.
   * Simplify string/slice logic using `CutLast`.

3. **Error Handling & Generics (1.18-1.26)**:
   * Refactor `errors.As` to `errors.AsType[T](err)`.
   * Consolidate duplicate collection logic using generics.

4. **Iterators & Collections (1.23+)**:
   * Replace complex loops with `for-range` over functions.
   * Use `slices.All`, `maps.Keys` for idiomatic traversal.

5. **Logging & Observability**:
   * Migrate legacy logs to `log/slog`.
   * Ensure `context.Context` is propagated for trace ID support.

6. **Network & Routing (1.22+)**:
   * Update `net/http.ServeMux` to use method prefixes and wildcards.

7. **Verification & Testing (1.27)**:
   * Run `go test -race ./...`.
   * Leverage `testing/synctest` for deterministic concurrency checks.
   * Ensure `stdversion` vet check passes.

8. **Standardization**:
   * Run `go fmt ./...`.
   * Verify all new code adheres to the 'engineer vibe' (pragmatic, high-signal).
