---
description: Refactor Go code to use Generics where appropriate to reduce duplication and improve type safety.
---

# Generics Refactoring Skill

## Scenarios
1. **Duplicate Collection Logic**: When multiple functions perform the same operation on different types of slices or maps.
2. **Type Assertion Overload**: When `interface{}` (or `any`) is used with frequent type assertions.
3. **Container Implementation**: When implementing data structures like stacks, queues, or caches.

## Instructions
1. **Identify Candidates**: Look for functions like `func SumInts(s []int) int` and `func SumFloats(s []float64) float64`.
2. **Define Type Parameters**: Use square brackets `[T constraints.Ordered]` (or similar) to define the type parameters.
3. **Update Signature**: Replace specific types with the type parameter.
4. **Leverage Stdlib**: Check if `golang.org/x/exp/slices` or the built-in `slices` package already provides the functionality.
5. **Verify**: Ensure the refactored code maintains the same behavior and performance.

## Examples
### Type-Safe Error Extraction (Go 1.26)
```go
// Before: Manual variable declaration and type assertion
var pathErr *os.PathError
if errors.As(err, &pathErr) {
    fmt.Println(pathErr.Path)
}

// After: Direct extraction with generics
if pathErr, ok := errors.AsType[*os.PathError](err); ok {
    fmt.Println(pathErr.Path)
}
```

### Generic Collection Filter
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
