---
name: iterators
description: Refactor loops to use modern Iterators (Go 1.23+) for composability.
---

# Iterator Refactoring

## Scenarios
* **Manual Traversal**: Managing indices/keys in complex loops.
* **Sequence Generation**: Fibonacci, database cursors, stream processing.
* **Functional Pipelines**: Chaining filtering/mapping operations.

## Instructions
1. **Define Seq**: Return `iter.Seq[T]` or `iter.Seq2[K, V]`.
2. **Implement Yield**: Use the `yield` function; return immediately if it returns `false`.
3. **Use Stdlib Utilities**: Prefer `slices.All`, `maps.Keys` for standard collections.
4. **Reflect (1.26)**: Use `reflect.Value.Fields()` for struct iteration without index loops.

## Examples
### Custom Iterator (1.23)
```go
func (s *MySeq) All() iter.Seq[Value] {
    return func(yield func(Value) bool) {
        for {
            v, ok := s.Next()
            if !ok || !yield(v) { return }
        }
    }
}

for v := range seq.All() {
    fmt.Println(v)
}
```

### Reflection Iteration (1.26)
```go
val := reflect.ValueOf(myStruct)
for field, fieldVal := range val.Fields() {
    fmt.Printf("%s: %v\n", field.Name, fieldVal)
}
```
