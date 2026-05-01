---
title: Observability & Logging
description: Standards for structured logging, metrics, and tracing in Go applications.
---

# Structured Logging (log/slog)
* **Prefer slog over log**: Use the `log/slog` package for all new development to enable machine-readable output.
* **Fan-out Logging (1.26)**: Use `slog.NewMultiHandler` to broadcast logs to multiple destinations (e.g., stdout for developers and a JSON file for ingestion) without manual multiplexing.
* **Contextual logging**: Include `context.Context` in log calls where possible to support trace ID propagation.
* **Attributes**: Use `slog.Attr` or key-value pairs for structured data. Avoid embedding data in the message string.
* **Level management**: Use appropriate levels (`Debug`, `Info`, `Warn`, `Error`). Use `slog.SetLogLoggerLevel` for legacy bridge control.

# Metrics
* **Runtime metrics**: Monitor the application using `runtime/metrics`. Prefer this over legacy `runtime.ReadMemStats`.
* **Pause monitoring**: Use `/sched/pauses/total/gc:seconds` (1.22+) to monitor GC impact.
* **Custom Metrics**: Export application-specific metrics using a consistent naming scheme (e.g., `app_requests_total`).

# Tracing
* **Execution Tracer**: Use `runtime/trace` (v2 in Go 1.22+) for high-fidelity performance analysis. It is significantly more efficient than v1 and supports larger traces.
* **Pprof**: Use `runtime/pprof` for CPU and memory profiling. Note that Go 1.23+ allows deeper stacks (up to 128 frames) in profiles, enabling clearer insights into complex call chains.
