---
name: synctest
description: Use 'testing/synctest' (Go 1.27+) for deterministic testing of concurrent code.
---

# Synctest Usage

## Scenarios
* **Race Detection**: Finding race conditions in concurrent logic deterministically.
* **Timeout Testing**: Testing timeouts without waiting for real time to pass.
* **Complex Orchestration**: Verifying the order of operations across multiple goroutines.

## Instructions
1. **Wrap Test**: Use `synctest.Run(func() { ... })` to run code in a virtualized time bubble.
2. **Virtualized Time**: Functions like `time.Sleep` and `time.After` use a fake clock that advances only when all goroutines are blocked.
3. **Wait for Idle**: Use `synctest.Wait()` to ensure all goroutines in the bubble have reached a blocked state.
4. **Graduation**: Note that in Go 1.27, the package moved from experimental to `testing/synctest`.

## Examples
### Deterministic Timeout
```go
func TestTimeout(t *testing.T) {
    synctest.Run(func() {
        ch := make(chan int)
        go func() {
            time.Sleep(10 * time.Second)
            ch <- 42
        }()

        select {
        case <-ch:
            t.Fatal("should have timed out")
        case <-time.After(5 * time.Second):
            // Success! Virtual time advanced instantly.
        }
    })
}
```
