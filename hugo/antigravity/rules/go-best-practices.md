---
trigger: always_on
---

# Hugo Go Best Practices

Follow these guidelines when contributing to the Hugo Go codebase:

## General Principles
* **Brevity**: Be concise in code, comments, and commit messages.
* **Expertise**: Assume maintainers are Go experts; don't explain the obvious.
* **Self-Explanatory**: Use descriptive variable and function names. Use short names only when context is clear.
* **Encapsulation**: Never export symbols that are not needed outside of the package.
* **Statelessness**: Avoid global state at almost all costs.

## Coding Patterns
* **Helper Functions**: Look for existing helper functions before creating new ones.
* **Debug Printing**: Use `hdebug.Printf` for temporary debug printing (must be removed before CI).
* **No CGO**: Do not accept new features requiring CGO (exception: LibSASS).

## Testing
* **Matchers**: Use `qt` (quicktest) matchers instead of raw `if`/`t.Fatal` checks.
* **Naming**: Use the issue ID as a suffix (e.g., `TestFeatureIssue1234`). No underscores in function names.
* **Specifications**: Use the latest Hugo specifications for layouts (e.g., `layouts/page.html`).
