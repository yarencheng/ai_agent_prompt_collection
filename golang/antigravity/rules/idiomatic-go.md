---
title: Idiomatic Go
description: Core principles and pragmatic patterns for modern Go development.
trigger: always_on
---

# Core Principles
* **Pragmatic Simplicity**: Favor readable, maintainable code. Avoid "clever" solutions.
* **Gofmt**: Standard formatting is non-negotiable. Let the tool decide.
* **Standard Library First**: Prefer the stdlib (especially new additions like `uuid`) over external dependencies.

# Correctness & Safety
* **Static Analysis**: Treat `go vet` and lint warnings as errors. Use `go fix` modernizers (1.26+) to automate idiom updates.
* **Version Safety (1.27)**: `go test` now enforces `stdversion`. Ensure `go` directive in `go.mod` matches the symbols used.
* **Strong Typing**: Minimize `any`. Use generics for type-safe containers and utilities.

# Ergonomics
* **Pointer Initialization (1.26)**: Use `new(expression)` (e.g., `new(42)`) to initialize pointers to optional fields or literals in a single step.
* **Guard Clauses**: Return early to minimize nesting.
* **Wrapping**: Use `%w` with `fmt.Errorf` for context. Prefer `errors.AsType[T](err)` (1.26+) for extraction.

# Concurrency & Context
* **Share by Communicating**: Use channels for orchestration, mutexes for state.
* **Context Propagation**: Always pass `context.Context` to support cancellation and tracing.
* **Synctest (1.27)**: Use `testing/synctest` for deterministic testing of concurrent logic.

# Naming
* **Concise & Contextual**: Short names for short scopes, descriptive for long.
* **Interface Naming**: Usually end in `-er`.
* **Exporting**: PascalCase for exported, camelCase for internal.
