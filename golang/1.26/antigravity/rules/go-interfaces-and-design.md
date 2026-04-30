---
description: Rule for Go interface design, structs, and dependency injection.
trigger: always_on
---

# Go Interfaces and Design Vibe

Follow these core philosophies for designing Go packages and APIs.

## 1. Accept Interfaces, Return Structs
This is the golden rule of Go design.
- Functions should accept the smallest possible interface that satisfies their needs (e.g., `io.Reader` instead of `*os.File`).
- Functions should return concrete struct types, not interfaces. Let the caller define the interface if they need to mock or abstract it.

**Avoid:**
```go
func NewServer() ServerInterface { ... } // Bad
```

**Preferred:**
```go
func NewServer() *Server { ... } // Good
```

## 2. Define Interfaces Where They Are Used
Do not define an interface in the package that implements it. Define the interface in the package that *consumes* it. This naturally leads to smaller, more focused interfaces.

## 3. Embedding and Composition
Prefer composition over inheritance (which Go does not support).
Embed structs to promote methods or fields, but do so carefully. Avoid embedding when you only want to reuse code internally; embed when you want to expose the embedded type's API as your own.

## 4. Keep the Happy Path Left
Reduce nesting. Handle errors immediately and return early. The "happy path" (successful execution) should continue down the left margin of the function without being indented.

**Avoid:**
```go
if err == nil {
    // 50 lines of code
} else {
    return err
}
```

**Preferred:**
```go
if err != nil {
    return err
}
// 50 lines of code (happy path)
```
