---
title: Observability & Logging
description: Pragmatic standards for structured logging and high-fidelity tracing.
trigger: always_on
---

# Structured Logging (slog)
* **Standardize on slog**: Use `log/slog` for all structured logging.
* **Multi-Handler (1.26)**: Use `slog.NewMultiHandler` to broadcast logs to multiple destinations.
* **Contextual Logs**: Always use `InfoContext`, `ErrorContext`, etc., to propagate trace IDs.

# High-Fidelity Tracing
* **Execution Tracer (v2)**: Use `runtime/trace` (1.22+) for performance analysis. Use `trace.FlightRecorder` (1.25) for continuous in-memory recording.
* **Goroutine Leak Profile (1.26)**: Use `runtime/pprof`'s `goroutineleak` profile to detect permanently blocked goroutines.
* **Goroutine Labels (1.27)**: Tracebacks for Go 1.27+ modules automatically include `runtime/pprof` goroutine labels.
* **Deep Stacks (1.23)**: `pprof` now supports up to 128 frames for clearer call-chain visibility.

# Metrics & Monitoring
* **Runtime Metrics**: Use `runtime/metrics` instead of `ReadMemStats`. Monitor `/sched/goroutines` and `/sched/threads`.
* **GOMAXPROCS (1.25)**: Monitor `/sched/gomaxprocs` to see how the runtime adapts to container CPU limits automatically.
* **GC Monitoring**: Monitor `/sched/pauses/total/gc:seconds`. Leverage Green Tea GC (1.26) for reduced overhead.
* **Resource Cleanup (1.24)**: Monitor `AddCleanup` execution to ensure timely resource reclamation.

# Security
* **Secret Erasure (1.26)**: Use `runtime/secret` to securely erase cryptographic temporaries (keys, nonces) from registers and stack.
* **FS Sandboxing (1.24)**: Use `os.Root` for all high-risk filesystem operations.
