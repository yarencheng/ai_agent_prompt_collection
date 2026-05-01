# Generics Examples

## Recursive Type Parameters (1.26)
```go
type Node[N Node[N]] interface {
    Children() []N
}

func DepthFirstSearch[N Node[N]](root N, visit func(N)) {
    visit(root)
    for _, child := range root.Children() {
        DepthFirstSearch(child, visit)
    }
}
```

## Type-Safe Errors (1.26)
```go
if pathErr, ok := errors.AsType[*os.PathError](err); ok {
    // pathErr is already typed as *os.PathError
    fmt.Println(pathErr.Path)
}
```
