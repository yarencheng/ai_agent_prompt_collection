# Modernizer Examples

## Example 1: Updating to `any`
**Before:**
```go
func PrintAll(items []interface{}) {
    for _, item := range items {
        fmt.Println(item)
    }
}
```

**After (using go-modernizer):**
```go
func PrintAll[T any](items []T) {
    for _, item := range items {
        fmt.Println(item)
    }
}
```

## Example 2: Loop Scoping (Go 1.22)
**Before:**
```go
for _, val := range items {
    val := val // explicit shadow
    go func() {
        process(val)
    }()
}
```

**After (using go-modernizer):**
```go
for _, val := range items {
    go func() {
        process(val)
    }()
}
```
