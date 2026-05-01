---
name: iterators
description: Refactor Go loops to use modern Iterators (Go 1.23+) for cleaner and more composable code.
---

# Iterator Refactoring Skill

## Scenarios
1. **Manual Collection Traversal**: When manually managing indices or keys in complex loops.
2. **Custom Sequence Generation**: When generating a sequence of values (e.g., Fibonacci, database cursor).
3. **Filtering/Mapping**: When chaining operations on collections.

## Instructions
1. **Define Iterator**: Create a function that returns `iter.Seq[T]` or `iter.Seq2[K, V]`.
2. **Implement Yield**: Use the `yield` function to return values to the caller.
3. **Handle Termination**: Respect the `bool` return value of `yield` to stop early if the caller breaks the loop.
4. **Use Stdlib Utilities**: Use `slices.All`, `maps.Keys`, etc., for standard collections.
5. **Chain Operations**: Use `slices.Collect`, `slices.Sorted` to process iterator results.

## Examples
### Before (Manual Iterator)
```go
type MySeq struct { ... }
func (s *MySeq) Next() (Value, bool) { ... }

seq := &MySeq{}
for {
    v, ok := seq.Next()
    if !ok { break }
    fmt.Println(v)
}
```

### After (Go 1.23 Iterators)
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

### Reflection Iterators (Go 1.26)
```go
// Efficiently iterate over struct fields without manual index loops
val := reflect.ValueOf(myStruct)
for field, fieldVal := range val.Fields() {
    fmt.Printf("%s: %v\n", field.Name, fieldVal)
}
```
