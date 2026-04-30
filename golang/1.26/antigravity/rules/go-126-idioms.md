---
description: Rule for using modern Go 1.26 idioms and language features.
trigger: always_on
---

# Go 1.26 Idioms

Follow these idioms to leverage the latest Go 1.26 language features and standard library improvements.

## 1. Use `new(expr)` for Pointer Initialization
Instead of creating a temporary variable and taking its address, use the enhanced `new` function to initialize pointers with values.

**Preferred:**
```go
person := Person{
    Age: new(25),
    City: new("New York"),
}
```

**Avoid (unless on older Go versions):**
```go
age := 25
city := "New York"
person := Person{
    Age: &age,
    City: &city,
}
```

## 2. Leverage Generic Self-Referencing Constraints
Use self-referencing type parameters for cleaner interface definitions.

```go
type Comparable[T Comparable[T]] interface {
    Compare(T) int
}
```

## 3. Prefer `errors.AsType` over `errors.As`
Use the type-safe generic version for error unwrapping.

**Preferred:**
```go
if pathErr, ok := errors.AsType[*os.PathError](err); ok {
    fmt.Println(pathErr.Path)
}
```

**Avoid:**
```go
var pathErr *os.PathError
if errors.As(err, &pathErr) {
    fmt.Println(pathErr.Path)
}
```

## 4. Use `sync.WaitGroup.Go` for Concurrent Tasks
Simplify goroutine management and counting.

**Preferred:**
```go
var wg sync.WaitGroup
for _, job := range jobs {
    wg.Go(func() {
        process(job)
    })
}
wg.Wait()
```

## 5. Use `omitzero` in JSON Tags
Prefer `omitzero` over `omitempty` when you want to omit the zero value of a type (especially for `time.Time`).

```go
type Event struct {
    Timestamp time.Time `json:"timestamp,omitzero"`
}
```
