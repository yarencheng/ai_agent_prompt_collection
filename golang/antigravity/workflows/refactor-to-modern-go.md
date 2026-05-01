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

2. **Automated Modernization (1.26)**:
   * Run `go fix` with modernizers to automate common idiom updates (e.g., `errors.AsType`, `slog`, `new(expr)`).

3. **Standard Library Migration (1.27)**:
   * Replace 3-party UUID libraries with the built-in `uuid` package.
   * Simplify string/slice logic using `CutLast`.
   * Sandbox sensitive filesystem logic using `os.Root` (1.24).

4. **Resource Management & GC (1.24-1.26)**:
   * Replace `runtime.SetFinalizer` with `runtime.AddCleanup`.
   * Use `weak` pointers for memory-efficient caches.
   * Benefit from Green Tea GC (1.26) by removing manual GC tuning hacks.

5. **Error Handling & Generics (1.18-1.26)**:
   * Refactor `errors.As` to `errors.AsType[T](err)`.
   * Consolidate duplicate collection logic using generics and recursive type parameters.

6. **Iterators & Collections (1.23+)**:
   * Replace complex loops with `for-range` over functions.
   * Use `slices.All`, `maps.Keys` for idiomatic traversal.

7. **Logging & Observability**:
   * Migrate legacy logs to `log/slog`. Use `NewMultiHandler` (1.26) for broadcasting.
   * Ensure `context.Context` is propagated for trace ID support.

8. **Verification & Testing (1.27)**:
   * Run `go test -race ./...`.
   * Leverage `testing/synctest` for deterministic concurrency checks.
   * Ensure `stdversion` vet check passes (enforced by `go test` in 1.27).

9. **Standardization**:
   * Run `go fmt ./...`.
   * Verify all new code adheres to the 'engineer vibe' (pragmatic, high-signal).
