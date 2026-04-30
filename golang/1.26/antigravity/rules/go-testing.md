---
description: Rule for using modern Go testing features (virtual time, artifact management, fuzzing).
trigger: always_on
---

# Go Testing Best Practices (1.18 - 1.26)

Leverage the latest testing infrastructure for more robust and maintainable tests.

## 1. Native Fuzzing (Go 1.18+)
Use the built-in fuzzing support to find edge cases.

```go
func FuzzReverse(f *testing.F) {
    f.Add("hello")
    f.Fuzz(func(t *testing.T, a string) {
        rev := Reverse(a)
        doubleRev := Reverse(rev)
        if a != doubleRev {
            t.Errorf("Before: %q, After: %q", a, doubleRev)
        }
    })
}
```

## 2. Resource Cleanup with `t.Cleanup()` (Go 1.14+)
Use `t.Cleanup` instead of `defer` in the main test function body to ensure resources are cleaned up even if the test fails or subtests fail.

```go
func TestDB(t *testing.T) {
    db := setupDB()
    t.Cleanup(func() { db.Close() })
}
```

## 3. Manage Test Artifacts with `t.ArtifactDir()` (Go 1.26+)
Avoid manual file management for test logs or dumps. Use `t.ArtifactDir()` to get a dedicated, managed directory.

```go
func TestLogging(t *testing.T) {
    dir := t.ArtifactDir()
    logFile := filepath.Join(dir, "test.log")
    // write to logFile
}
```

## 4. Use `testing/synctest` for Concurrent Tests (Go 1.24+)
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

## 5. Use `b.Loop()` for Benchmarks (Go 1.26+)
Prefer `b.Loop()` over `for i := 0; i < b.N; i++`. It handles setup/cleanup better and prevents compiler over-optimization.

```go
func BenchmarkProcess(b *testing.B) {
    data := setup()
    for b.Loop() {
        process(data)
    }
}
```

## 6. Cleanup with `t.Context()` (Go 1.24+)
Pass `t.Context()` to long-running operations or servers started in tests to ensure they are cleaned up promptly.

```go
func TestServer(t *testing.T) {
    srv := startServer(t.Context())
    // ...
}
```

## 7. Temporary Directory Changes with `t.Chdir()` (Go 1.24+)
Use `t.Chdir()` for thread-safe working directory changes during tests.

```go
func TestConfig(t *testing.T) {
    t.Chdir("testdata")
    // ...
}
```

