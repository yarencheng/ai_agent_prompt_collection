---
name: weak-pointers
description: Use the 'weak' package (Go 1.24+) for memory-efficient caches.
---

# Weak Pointers

## Scenarios
* **Caches**: Building caches that don't prevent GC from reclaiming entries.
* **Canonicalization**: Managing unique instances of objects without leaking memory.
* **Associated Data**: Attaching metadata to objects without keeping them alive.

## Instructions
1. **Create Pointer**: Use `weak.Make(obj)` to get a `weak.Pointer[T]`.
2. **Retrieve Value**: Use `wp.Strong()` to get a strong pointer. If it's `nil`, the object has been collected.
3. **Combine with Cleanup**: Use `runtime.AddCleanup` to perform actions when the object is collected.

## Examples
### Weak Cache
```go
type Cache struct {
    mu    sync.Mutex
    items map[string]weak.Pointer[Data]
}

func (c *Cache) Get(key string) *Data {
    c.mu.Lock()
    defer c.mu.Unlock()
    
    if wp, ok := c.items[key]; ok {
        if d := wp.Strong(); d != nil {
            return d
        }
    }
    return nil
}
```
