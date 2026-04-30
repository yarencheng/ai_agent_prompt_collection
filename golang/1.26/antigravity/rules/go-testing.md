---
description: Rule for using modern Go testing features (virtual time, artifact management).
trigger: always_on
---

# Go Testing Best Practices (1.26+)

Leverage the latest testing infrastructure for more robust and maintainable tests.

## 1. Manage Test Artifacts with `t.ArtifactDir()`
Avoid manual file management for test logs or dumps. Use `t.ArtifactDir()` to get a dedicated, managed directory.

```go
func TestLogging(t *testing.T) {
    dir := t.ArtifactDir()
    logFile := filepath.Join(dir, "test.log")
    // write to logFile
}
```

## 2. Use `testing/synctest` for Concurrent Tests
Use "bubbles" and virtual time to test concurrency without flakiness.

```go
func TestTimeout(t *testing.T) {
    synctest.Test(func() {
        ch := make(chan bool)
        go func() {
            time.Sleep(10 * time.Second)
            ch <- true
        }()
        
        select {
        case <-ch:
            t.Error("should have timed out")
        case <-time.After(5 * time.Second):
            // Success: the clock moved forward instantly
        }
    })
}
```

## 3. Use `b.Loop()` for Benchmarks
Prefer `b.Loop()` over `for i := 0; i < b.N; i++`. It handles setup/cleanup better and prevents compiler over-optimization.

```go
func BenchmarkProcess(b *testing.B) {
    data := setup()
    for b.Loop() {
        process(data)
    }
}
```

## 4. Cleanup with `t.Context()`
Pass `t.Context()` to long-running operations or servers started in tests to ensure they are cleaned up promptly.

```go
func TestServer(t *testing.T) {
    srv := startServer(t.Context())
    // ...
}
```

## 5. Temporary Directory Changes with `t.Chdir()`
Use `t.Chdir()` for thread-safe working directory changes during tests.

```go
func TestConfig(t *testing.T) {
    t.Chdir("testdata")
    // ...
}
```
