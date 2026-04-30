---
description: Rule for using modern Go testing features (virtual time, artifact management, fuzzing, setenv).
trigger: always_on
---

# Go Testing Best Practices (1.14 - 1.26)

Leverage the latest testing infrastructure for robust and maintainable tests.

## 1. Test Environment with `t.Setenv()` (Go 1.17+)
Avoid manual `os.Setenv` and `os.Unsetenv`. `t.Setenv` safely manages environment variables for tests and restores them automatically.
```go
func TestConfig(t *testing.T) {
    t.Setenv("PORT", "8080")
    // Test logic...
}
```

## 2. Helper Functions with `t.Helper()`
Always call `t.Helper()` at the start of custom assertion or setup functions to ensure test failures report the file/line of the *caller*, not the helper function itself.
```go
func assertEqual(t *testing.T, got, want int) {
    t.Helper()
    if got != want {
        t.Errorf("got %d, want %d", got, want)
    }
}
```

## 3. Resource Cleanup with `t.Cleanup()` (Go 1.14+)
Use `t.Cleanup` instead of `defer` to ensure resources are cleaned up even if subtests fail or the test aborts.
```go
func TestDB(t *testing.T) {
    db := setupDB()
    t.Cleanup(func() { db.Close() })
}
```

## 4. Native Fuzzing (Go 1.18+)
Use built-in fuzzing to find edge cases.
```go
func FuzzReverse(f *testing.F) {
    f.Add("hello")
    f.Fuzz(func(t *testing.T, a string) { ... })
}
```

## 5. Concurrent Tests with `testing/synctest` (Go 1.24+)
Use "bubbles" and virtual time to test concurrency without flakiness.
```go
synctest.Test(func() {
    ch := make(chan bool)
    go func() { time.Sleep(10 * time.Second); ch <- true }()
    // Virtual time skips sleep instantly
})
```

## 6. Temporary Directory Changes with `t.Chdir()` (Go 1.24+)
Use `t.Chdir()` for thread-safe working directory changes.

## 7. Cleanup with `t.Context()` (Go 1.24+)
Pass `t.Context()` to long-running operations or servers started in tests.

## 8. Manage Test Artifacts with `t.ArtifactDir()` (Go 1.26+)
Use `t.ArtifactDir()` to get a managed directory for test logs or dumps.
```go
logFile := filepath.Join(t.ArtifactDir(), "test.log")
```

## 9. Use `b.Loop()` for Benchmarks (Go 1.26+)
Prefer `b.Loop()` over `for i := 0; i < b.N; i++` to handle setup/cleanup better and prevent compiler over-optimization.
