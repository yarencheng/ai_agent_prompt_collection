---
title: Idiomatic Go
description: Core principles and pragmatic patterns for modern Go development.
trigger: always_on
---

# Core Principles
* **Pragmatic Simplicity**: Favor readable, maintainable code. Avoid "clever" solutions.
* **Gofmt**: Standard formatting is non-negotiable. Let the tool decide.
* **Standard Library First**: Prefer the stdlib (e.g., `uuid`, `crypto/hpke`) over external dependencies.
* **Executable Dependencies (1.24)**: Use the `tool` directive in `go.mod` to track build tools. Run them with `go tool <tool>`.

# Correctness & Safety
* **Modernizers (1.26)**: Use `go fix` with modernizers to automate idiom updates. Treat `go vet` and lint warnings as errors.
* **Version Safety (1.27)**: `go test` enforces `stdversion`. Ensure `go` directive in `go.mod` matches the symbols used.
* **Strong Typing**: Minimize `any`. Use generics for type-safe containers and utilities.
* **UUID (1.27)**: Use the built-in `uuid` package for generating and parsing UUIDs. Avoid external dependencies like `google/uuid`.

# Ergonomics
* **Pointer Initialization (1.26)**: Use `new(expression)` (e.g., `new(42)`) to initialize pointers to optional fields or literals in a single step.
* **JSON (1.24)**: Use `omitzero` struct tags to omit zero-valued fields (including `time.Time`) cleanly.
* **Guard Clauses**: Return early to minimize nesting.
* **Wrapping**: Use `%w` with `fmt.Errorf` for context. Prefer `errors.AsType[T](err)` (1.26+) for extraction.

# Concurrency & Context
* **Share by Communicating**: Use channels for orchestration, mutexes for state.
* **Context Propagation**: Always pass `context.Context`. Use `signal.NotifyContext` (1.26) with `context.CancelCauseFunc` to capture signal details.
* **Cleanups (1.24)**: Prefer `runtime.AddCleanup` over `SetFinalizer` for more reliable resource management.
* **Synctest (1.27)**: Use `testing/synctest` for deterministic testing of concurrent logic.

# Naming
* **Concise & Contextual**: Short names for short scopes, descriptive for long.
* **Interface Naming**: Usually end in `-er`.
* **Exporting**: PascalCase for exported, camelCase for internal.
