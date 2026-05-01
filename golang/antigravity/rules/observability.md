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
* **Execution Tracer (v2)**: Use `runtime/trace` (1.22+) for low-overhead performance analysis.
* **Goroutine Leak Profile (1.26)**: Use `runtime/pprof`'s `goroutineleak` profile (experimental) to detect permanently blocked goroutines.
* **Goroutine Labels (1.27)**: Tracebacks for Go 1.27+ modules automatically include `runtime/pprof` goroutine labels.
* **Deep Stacks (1.23)**: `pprof` now supports up to 128 frames for clearer call-chain visibility.

# Metrics & Monitoring
* **Runtime Metrics**: Use `runtime/metrics` instead of `ReadMemStats`.
* **GC Monitoring**: Monitor `/sched/pauses/total/gc:seconds` for garbage collection impact.
* **Custom Metrics**: Export application-specific metrics with consistent, machine-readable names.
