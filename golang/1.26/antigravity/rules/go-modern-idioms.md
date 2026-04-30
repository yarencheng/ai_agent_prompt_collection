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

// Reflect Iterators (Go 1.26)
for i, f, v := range reflect.TypeFor[MyStruct]().Fields() {
    fmt.Printf("Field %d: %s\n", i, f.Name)
}
```

## 2. Embedding Static Assets (Go 1.16+)
Use the `embed` package to include files in your binary.

```go
//go:embed static/*
var staticFiles embed.FS
```

## 3. I/O Modernization (Go 1.16+)
**Avoid `io/ioutil`**. Use the `io` and `os` packages directly.

| Deprecated | Replacement |
| :--- | :--- |
| `ioutil.ReadAll` | `io.ReadAll` |
| `ioutil.ReadFile` | `os.ReadFile` |
| `ioutil.WriteFile` | `os.WriteFile` |
| `ioutil.TempDir` | `os.MkdirTemp` |

## 4. Error Wrapping and Inspection (Go 1.13+)
Use `%w` for wrapping and `errors.Is`/`errors.As` for inspection. Use `errors.AsType` (Go 1.26) for type-safe inspection.

```go
// Wrapping
return fmt.Errorf("loading config: %w", err)

// Inspection (Go 1.26 Preferred)
if pathErr, ok := errors.AsType[*os.PathError](err); ok {
    // ...
}

// Multi-Error (Go 1.20)
err := errors.Join(err1, err2)
```

## 5. Generic Slices and Maps (Go 1.21+)
Use the `slices` and `maps` packages for common operations.

```go
import "slices"
slices.Sort(mySlice)
```

## 6. Built-in `min`, `max`, and `clear` (Go 1.21+)
```go
lowest := min(a, b, c)
clear(myMap)
```

## 7. Pointer Initialization with `new(expr)` (Go 1.26+)
```go
person := Person{ Age: new(25) }
```

## 8. Numeric Literals (Go 1.13+)
Use underscores for readability in large numbers.

```go
const Billion = 1_000_000_000
const Binary = 0b1010_0101
```

## 9. Improved JSON Tags (Go 1.24+)
Use `omitzero` to omit zero-valued fields.

```go
type Event struct {
    Timestamp time.Time `json:"timestamp,omitzero"`
}
```


