---
description: Rule for using modern Go idioms and language features (1.18 - 1.26).
trigger: always_on
---

# Modern Go Idioms (1.18 - 1.26)

Follow these idioms to leverage the latest Go language features and standard library improvements.

## 1. Iterators (Go 1.23+)
Use the `iter` package and "range-over-func" for custom iterations.

**Preferred:**
```go
func All[T any](s []T) iter.Seq2[int, T] {
    return func(yield func(int, T) bool) {
        for i, v := range s {
            if !yield(i, v) {
                return
            }
        }
    }
}

for i, v := All(mySlice) {
    // ...
}
```

## 2. Generic Slices and Maps (Go 1.21+)
Stop writing manual loops for common collection operations. Use the `slices` and `maps` packages.

**Preferred:**
```go
import "slices"

if slices.Contains(mySlice, "target") {
    slices.Sort(mySlice)
}
```

## 3. Built-in `min`, `max`, and `clear` (Go 1.21+)
Use the built-in functions instead of manual comparisons or looping to zero out collections.

```go
lowest := min(a, b, c)
clear(myMap)   // Deletes all elements
clear(mySlice) // Zeroes all elements, keeps length
```

## 4. Pointer Initialization with `new(expr)` (Go 1.26+)
Initialize pointers with values directly in expressions.

**Preferred:**
```go
person := Person{
    Age: new(25),
    City: new("New York"),
}
```

## 5. Generic Self-Referencing Constraints (Go 1.26+)
Use self-referencing type parameters for cleaner interface definitions.

```go
type Comparable[T Comparable[T]] interface {
    Compare(T) int
}
```

## 6. Type-Safe Error Handling (Go 1.26+)
Prefer `errors.AsType` over the pointer-based `errors.As`.

**Preferred:**
```go
if pathErr, ok := errors.AsType[*os.PathError](err); ok {
    fmt.Println(pathErr.Path)
}
```

## 7. Multi-Error Joining (Go 1.20+)
Use `errors.Join` to wrap multiple errors.

```go
err := errors.Join(err1, err2, err3)
```

## 8. Improved JSON Tags (Go 1.24+)
Use `omitzero` to omit zero-valued fields (cleaner than `omitempty` for types like `time.Time`).

```go
type Event struct {
    Timestamp time.Time `json:"timestamp,omitzero"`
}
```

## 9. Concurrent Task Management (Go 1.25+)
Use `sync.WaitGroup.Go` for simpler goroutine management.

```go
var wg sync.WaitGroup
for _, job := range jobs {
    wg.Go(func() { process(job) })
}
wg.Wait()
```

