---
name: generics
description: Refactor to type-safe, generic Go code to eliminate duplication.
---

# Generics Refactoring

## Scenarios
* **Collection Logic**: Multiple implementations for different slice/map types.
* **Type Assertions**: Frequent use of `any` with manual assertions.
* **Reusable Containers**: Implementing stacks, queues, caches.

## Instructions
1. **Identify Redundancy**: Look for functions like `SumInts`, `SumFloats`.
2. **Define Constraints**: Use `[T constraints.Ordered]` or `[T any]`.
3. **Consolidate**: Replace type-specific logic with a single generic implementation.
4. **Leverage Stdlib**: Use `slices` and `maps` packages where possible.

## Examples
### Type-Safe Error Extraction (1.26)
```go
// Direct extraction without manual pointer declaration
if pathErr, ok := errors.AsType[*os.PathError](err); ok {
    fmt.Println(pathErr.Path)
}
```

### Generic Filter
```go
func Filter[T any](s []T, f func(T) bool) []T {
    var res []T
    for _, v := range s {
        if f(v) {
            res = append(res, v)
        }
    }
    return res
}
```
