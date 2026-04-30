---
description: Rule for idiomatic Go concurrency, Goroutines, Channels, and data race prevention.
trigger: always_on
---

# Go Concurrency Vibe

Follow these rules for robust, idiomatic concurrency in Go.

## 1. Don't Communicate by Sharing Memory; Share Memory by Communicating
Prefer channels to pass ownership of data between goroutines rather than using a web of `sync.Mutex` locks over shared state. 

## 2. Never Start a Goroutine Without Knowing How It Will Stop
Leaking goroutines is a primary cause of memory leaks in Go. Ensure every goroutine has a clear exit condition.
- Use `context.Context` to propagate cancellation signals.
- Use `sync.WaitGroup` to wait for a group of goroutines to finish.
- Use `golang.org/x/sync/errgroup` when you need both waiting and error propagation.

**Preferred:**
```go
g, ctx := errgroup.WithContext(ctx)
for _, item := range items {
    g.Go(func() error {
        return process(ctx, item)
    })
}
if err := g.Wait(); err != nil {
    return err
}
```

## 3. Always Run the Race Detector
During development and testing, always run `go test -race` and `go run -race`. Assume any data race is a critical bug.

## 4. Channels vs. Mutexes
- **Use Channels** when passing ownership of data, distributing units of work, or communicating asynchronous results.
- **Use Mutexes** for protecting shared internal state in caches, simple structs, or isolated counters.

## 5. Context Usage
- Always pass `context.Context` as the *first* parameter to functions that do I/O or long-running work.
- Name the parameter `ctx`.
- Do not store contexts inside structs.
