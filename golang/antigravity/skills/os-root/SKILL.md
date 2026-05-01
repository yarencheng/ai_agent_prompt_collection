---
name: os-root
description: Use 'os.Root' (Go 1.24+) for directory-limited filesystem access.
---

# os.Root Usage

## Scenarios
* **Sandboxing**: Restricting file access to a specific directory.
* **Security**: Preventing path traversal attacks (e.g., `../../etc/passwd`).
* **Concurrency**: Safe parallel access to subdirectories.

## Instructions
1. **Open Root**: Use `os.OpenRoot(dir)` to get an `*os.Root`.
2. **Perform Operations**: Use methods like `Open`, `Create`, `Mkdir`, `Stat` on the `*os.Root` instance.
3. **Handle Symlinks**: `os.Root` automatically prevents following symlinks that point outside the root.
4. **Sub-Roots**: Use `root.OpenRoot(subdir)` to further restrict access.

## Examples
### Safe File Creation
```go
root, err := os.OpenRoot("/tmp/sandbox")
if err != nil {
    log.Fatal(err)
}
defer root.Close()

// This will fail if "name" attempts to escape the root
f, err := root.Create("user_data.txt")
if err != nil {
    log.Fatal(err)
}
f.Write([]byte("secure data"))
f.Close()
```
