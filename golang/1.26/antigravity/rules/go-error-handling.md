---
description: Rule for idiomatic error handling in Go (sentinel errors, custom types, panics).
trigger: always_on
---

# Go Error Handling Vibe

Follow these rules for robust error handling.

## 1. Sentinel Errors vs. Custom Error Types
- **Sentinel Errors**: Use for simple state comparisons where you only care *what* went wrong (e.g., `io.EOF`, `sql.ErrNoRows`). Define them as `var ErrName = errors.New("...")`.
- **Custom Error Types**: Use when you need to provide the caller with additional context or structured data (e.g., `*os.PathError`, HTTP status codes).

## 2. Wrapping Errors
Always add context to errors as they propagate up the call stack. Use `%w` to wrap the underlying error.
```go
if err != nil {
    return fmt.Errorf("failed to load configuration: %w", err)
}
```

## 3. Inspecting Errors
Never use `==` or strings.Contains to check errors. 
- Use `errors.Is(err, ErrSentinel)` to check for sentinel errors.
- Use `errors.As(err, &target)` or Go 1.26 `errors.AsType(err)` to extract custom error types.

## 4. Don't Just Log and Return
When handling an error, either:
1. Log it and handle it (e.g., return a default value, or a 500 HTTP response).
2. Wrap it and return it for the caller to handle.
**Do not do both.** Logging and returning causes duplicate log entries for the same error.

## 5. Panic is for Unrecoverable Programmer Errors
Do not use `panic` for normal error handling (like bad user input). Use `panic` only for truly unrecoverable states (e.g., failed to load a hardcoded regex, nil pointer dereference). Recovering from panics should generally only happen at the highest level of an application (e.g., HTTP middleware) to prevent the entire process from crashing.
