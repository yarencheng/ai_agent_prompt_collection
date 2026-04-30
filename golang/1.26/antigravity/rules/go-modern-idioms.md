---
description: Rule for using modern Go idioms and language features (1.13 - 1.26).
trigger: always_on
---

# Modern Go Idioms (1.13 - 1.26)

Follow these idioms to leverage the latest Go language features and standard library improvements.

## 1. Iterators (Go 1.23+)
Use the `iter` package and "range-over-func" for custom iterations. Use the new `reflect` iterators (Go 1.26) for dynamic type inspection.

**Preferred:**
```go
// Custom Iterator
func All[T any](s []T) iter.Seq2[int, T] {
    return func(yield func(int, T) bool) {
        for i, v := range s {
            if !yield(i, v) { return }
        }
    }
}
```

## 2. Generics (Go 1.18+)
Use type parameters for utility functions and data structures that work across multiple types.
- **Use `any` instead of `interface{}`**: It is cleaner and more idiomatic.
- **Use the `comparable` constraint** for map keys or equality checks.

```go
func Filter[T any](slice []T, predicate func(T) bool) []T {
    var result []T
    for _, v := range slice {
        if predicate(v) {
            result = append(result, v)
        }
    }
    return result
}
```

## 3. Generic Slices and Maps (Go 1.21+)
Use the `slices` and `maps` packages for common operations (sort, compact, clone, delete, etc.).

```go
slices.Sort(mySlice)
slices.Contains(mySlice, "value")
```

## 4. Enhanced Loop Scoping & Integer Range (Go 1.22+)
- **Loop Scoping**: `for` loop variables are now scoped per iteration. You no longer need to explicitly shadow loop variables before passing them to a goroutine or taking their address.
- **Integer Range**: Loop over integers directly.

```go
for i := range 10 {
    go func() {
        fmt.Println(i) // Safe! Will print 0-9 safely due to Go 1.22 scoping.
    }()
}
```

## 5. Enhanced Routing with `http.ServeMux` (Go 1.22+)
Use method and path patterns directly in standard library multiplexers.

```go
mux := http.NewServeMux()
mux.HandleFunc("GET /path/{id}", handleGet)
mux.HandleFunc("POST /path/", handlePost)
```

## 6. Context Additions (Go 1.21+)
- **`context.WithoutCancel`**: Use when a context is needed for values/tracing, but the cancellation of the parent context should be ignored (e.g., kicking off a background cleanup task during an HTTP request).
- **`context.AfterFunc`**: Schedule a function to run after the context is done.
- **`context.Cause`**: Retrieve the specific error that caused the cancellation.

## 7. String and Byte Utilities (Go 1.18+)
Use `strings.Cut` and `bytes.Cut` to split a string by the first instance of a separator, replacing many usages of `strings.Index` or `strings.Split`.

```go
before, after, found := strings.Cut("user:pass", ":")
```

## 8. Built-in `min`, `max`, and `clear` (Go 1.21+)
```go
lowest := min(a, b, c)
clear(myMap) // Removes all entries
```

## 9. Error Wrapping and Inspection (Go 1.13+, 1.20+, 1.26+)
Use `%w` for wrapping and `errors.Is`/`errors.As` for inspection.
- **Go 1.20**: Use `errors.Join(err1, err2)` to return multiple errors.
- **Go 1.26**: Use `errors.AsType` for type-safe inspection.

```go
if pathErr, ok := errors.AsType[*os.PathError](err); ok { ... }
```

## 10. `math/rand/v2` (Go 1.22+)
Use the new `math/rand/v2` package which provides a modern interface, better PRNGs (ChaCha8, PCG), and removes the global hidden state.

## 11. Improved JSON Tags (Go 1.24+)
Use `omitzero` to omit zero-valued fields.
```go
type Event struct {
    Timestamp time.Time `json:"timestamp,omitzero"`
}
```
