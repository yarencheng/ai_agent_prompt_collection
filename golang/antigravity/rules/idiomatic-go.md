---
title: Idiomatic Go
description: Core principles and idiomatic patterns for writing clear, maintainable Go code.
trigger: always_on
---

# Core Principles
* **Simplicity**: Favor simple, readable code over clever or complex solutions.
* **Clarity**: Code should be self-documenting. Use descriptive names for variables with long scopes and concise names for short-lived ones.
* **Gofmt**: Always adhere to standard formatting. Never argue about style; let the tool decide.

# Correctness First
* **Zero Trust Variables**: Always initialize variables and check for zero values where appropriate.
* **Static Analysis**: Treat `go vet` and lint warnings as errors. Use `golangci-lint` with strict settings (e.g., `revive`, `govet`, `staticcheck`).
* **Type Safety**: Avoid `any` or `interface{}` unless implementing generic containers or interfaces. Use strong typing to catch errors at compile time.

# Error Handling
* **Errors are values**: Handle errors explicitly.
* **Return early**: Use "guard clauses" to handle errors and edge cases at the top of functions to reduce nesting.
* **Wrap errors**: Use `%w` with `fmt.Errorf` to provide context while preserving the original error for `errors.Is` and `errors.As`.

# Concurrency
* **CSP Pattern**: "Do not communicate by sharing memory; instead, share memory by communicating."
* **Channels vs Mutexes**: Use channels for orchestration/data flow and mutexes for state protection.
* **Context**: Always propagate `context.Context` to handle cancellation, timeouts, and request-scoped values.

# Naming Conventions
* **Packages**: Short, lowercase, single-word names (e.g., `net/http`, `encoding/json`). Avoid `util` or `common`.
* **Interfaces**: Usually end in `-er` (e.g., `Reader`, `Writer`, `Stringer`).
* **Contextual Clarity**: Naming should reflect the lifetime and scope. `i` is fine for a 3-line loop; `reconciliationInterval` is required for a configuration field.
* **Exported names**: PascalCase for exported, camelCase for unexported.
