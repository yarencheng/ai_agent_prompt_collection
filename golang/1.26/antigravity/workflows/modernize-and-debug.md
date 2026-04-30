---
description: Workflow for modernizing Go codebases and debugging goroutine leaks using Go 1.26 features.
---

# Modernize and Debug Workflow

## Step 1: Modernize Codebase
1. Run `go fix` to apply standard modernizers.
2. Use `//go:fix inline` to migrate deprecated internal APIs to new counterparts.
3. Verify changes using `go vet`.

## Step 2: Analyze Goroutine Leaks
1. Build the application with `GOEXPERIMENT=goroutineleakprofile`.
2. Enable the leak profile in code:
   ```go
   import _ "net/http/pprof"
   ```
3. Access the leak profile at `/debug/pprof/goroutineleak`.
4. Identify goroutines blocked on unreachable concurrency primitives.
## Step 3: Manage Test Artifacts
1. Identify tests that generate side-effect files (logs, dumps).
2. Refactor to use `t.ArtifactDir()` for consistent storage.
3. Run tests with `go test -artifacts -outputdir=./out` to collect results.
