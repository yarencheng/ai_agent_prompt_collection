---
description: Comprehensive workflow for upgrading, modernizing, and debugging Go 1.26 applications.
---

# Go 1.26 Upgrade and Debug Workflow

## Phase 1: Upgrade and Modernize
1. **Update Toolchain**: Update `go.mod` to `go 1.26`.
   ```bash
   go get go@1.26
   go mod tidy
   ```
2. **Run Modernizers**: Use the revamped `go fix` to apply standard Go 1.26 idioms.
   ```bash
   go fix ./...
   ```
3. **Manual Refactoring**:
   - **Adopt Iterators**: Convert custom collection traversal to use `iter.Seq` or `iter.Seq2`.
   - **Adopt Generics**: Replace manual `for` loops with `slices.Contains`, `slices.Sort`, or `maps.Keys`.
   - **Error Handling**: Replace `errors.As` with `errors.AsType`.
   - **Concurrency**: Update `sync.WaitGroup` patterns to use `wg.Go()`.
   - **JSON**: Update JSON tags to use `omitzero` for zero-value omission.
   - **Cleanups**: Migrate `runtime.SetFinalizer` to `runtime.AddCleanup`.


## Phase 2: Debugging and Profiling
1. **Goroutine Leak Analysis**:
   - Build with `GOEXPERIMENT=goroutineleakprofile`.
   - Use `/debug/pprof/goroutineleak` to find permanently blocked goroutines.
2. **Execution Tracing**:
   - Use `runtime/trace.FlightRecorder` for lightweight continuous tracing.
   - Snapshot traces on errors or performance dips using `FlightRecorder.WriteTo`.
3. **Garbage Collection**:
   - Verify performance with the new **Green Tea GC**.
   - If issues arise, test with `GOEXPERIMENT=nogreenteagc`.

## Phase 3: Testing Infrastructure
1. **Concurrency Testing**: Refactor flaky concurrent tests to use `testing/synctest` bubbles and virtual time.
2. **Artifact Management**: Ensure all test-generated files (logs, traces) are written to `t.ArtifactDir()`.
3. **Benchmark Modernization**: Migrate `b.N` loops to `b.Loop()` to improve accuracy and inlining.
   ```bash
   go test -bench . -artifacts -outputdir=./test-results
   ```
