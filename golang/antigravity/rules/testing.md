---
title: Modern Testing
description: Best practices for testing Go code using modern features and patterns.
---

# Test Structure
* **Subtests**: Use `t.Run` to organize related test cases (table-driven tests).
* **Helper functions**: Use `t.Helper()` in utility functions to keep stack traces relevant.
* **Cleanup**: Use `t.Cleanup()` instead of `defer` for resource management in tests.

# Advanced Testing
* **Fuzzing (1.18+)**: Use `f.Fuzz` to find edge cases and security vulnerabilities with randomized input.
* **Fstest (1.16+)**: Use `fstest.MapFS` for testing code that interacts with the filesystem.
* **Structured Errors (1.23+)**: Use `testing/fstest.TestFS` to inspect multiple errors returned from FS tests.

# Best Practices
* **Avoid Mocks**: Prefer using real implementations or fakes (e.g., `httptest.NewServer`).
* **Test Packages**: Use `package name_test` to ensure you are testing the exported API.
* **Race Detection**: Always run tests with the `-race` flag.
