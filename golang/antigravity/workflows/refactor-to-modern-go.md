---
description: Comprehensive workflow to modernize a Go codebase to use the latest language features and best practices.
---

# Modern Go Refactor Workflow

## Prerequisites
* Go 1.26 or newer installed.
* Understanding of the existing codebase.
* Backup or clean git state.

## Steps
1. **Update go.mod**:
   * Set `go 1.26` (or the desired version) in `go.mod`.
   * Run `go mod tidy`.

2. **Modernize Error Handling (1.26)**:
   * Identify `errors.As` calls with manual pointer declarations.
   * Refactor to use `errors.AsType[T](err)` for cleaner, type-safe extraction.

3. **Run Vet & Lint**:
   * Run `go vet ./...` to catch common issues and new version warnings.
   * Use `golangci-lint` with modern linters enabled.

4. **Modernize Loops & Iterators**:
   * Identify complex manual loops.
   * Apply `@[/refactor/iterators]` skill to use `for-range` over functions.
   * Use `slices.All`, `maps.Keys` etc. where appropriate.

5. **Apply Generics**:
   * Identify duplicate code across different types.
   * Apply `@[/refactor/generics]` skill to consolidate logic.

6. **Update Logging**:
   * Identify legacy logging calls (`log`, `logrus`, `zap`).
   * Apply `@[/observability/slog-migration]` skill to migrate to `log/slog`.

7. **Refactor HTTP Routing (if applicable)**:
   * Update `net/http.ServeMux` patterns to use wildcards and methods.

8. **Verify & Test**:
   * Run all tests: `go test -race ./...`.
   * Run fuzz tests for critical components.
   * Verify observability output (logs, traces).

9. **Standardize**:
   * Run `go fmt ./...`.
   * Ensure all new files follow the project's style guide.
