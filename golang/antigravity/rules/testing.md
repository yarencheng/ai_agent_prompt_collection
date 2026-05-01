---
title: Modern Testing
description: High-signal testing strategies using modern Go features.
trigger: always_on
---

# Deterministic Concurrency (1.27)
* **Synctest**: Use `testing/synctest` for testing concurrent code. It provides a synthetic clock and deterministic scheduling.
* **Synctest Sleep**: Use `synctest.Sleep` to combine `time.Sleep` with scheduler waiting, ensuring tests are fast and reliable.

# Test Structure & Lifecycle
* **Subtests**: Use `t.Run` for table-driven tests.
* **Cleanup**: Prefer `t.Cleanup()` over `defer` for resource management.
* **Artifacts (1.26)**: Use `t.ArtifactDir()` to store test logs, dumps, or screenshots.
* **Helpers**: Use `t.Helper()` to maintain relevant stack traces.

# Advanced Testing
* **Fuzzing**: Use `f.Fuzz` for randomized edge-case detection.
* **Filesystem**: Use `fstest.MapFS` and `testing/fstest.TestFS` (1.23) for FS-related tests.
* **Crypto (1.26)**: Use `testing/cryptotest` to verify cryptographic implementations.

# Best Practices
* **Avoid Mocks**: Use real implementations or high-fidelity fakes (e.g., `httptest`).
* **External Tests**: Use `package name_test` to test the public API.
* **Race Detector**: Always run with `-race`.
* **Standard Versioning**: Ensure `go test` passes the `stdversion` check.
