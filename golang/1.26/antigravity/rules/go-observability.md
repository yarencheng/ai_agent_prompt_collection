---
description: Rule for structured logging (slog), telemetry, profiling (pprof), and metrics (1.16 - 1.26).
trigger: always_on
---

# Go Observability (slog, Telemetry, pprof, metrics)

Follow these standards for logging, metrics, and profiling in modern Go applications.

## 1. Use `log/slog` for Structured Logging (Go 1.21+)
Stop using `fmt.Printf` or basic `log` for production applications. Use `slog` for machine-readable logs.

**Preferred:**
```go
import "log/slog"

slog.Info("user logged in", 
    "user_id", user.ID, 
    "ip_address", r.RemoteAddr)
```

## 2. Leverage `slog.Group` for Nested Data
Group related attributes to keep logs organized.
```go
slog.Info("finished request",
    slog.Group("http",
        "method", r.Method,
        "status", 200,
        "duration", time.Since(start)))
```

## 3. Multiple Handlers with `NewMultiHandler` (Go 1.26+)
Use `NewMultiHandler` to broadcast logs to multiple destinations (e.g., stdout and a file).

## 4. Profiling with `net/http/pprof`
For long-running services, always expose the `pprof` endpoints securely (e.g., on an internal port or behind auth).
```go
import _ "net/http/pprof"

go func() {
    // Expose pprof on an internal, diagnostic port
    log.Println(http.ListenAndServe("localhost:6060", nil))
}()
```

## 5. Runtime Metrics (Go 1.16+)
Use `runtime/metrics` for high-performance, low-overhead extraction of internal runtime metrics instead of parsing `runtime.ReadMemStats`.

## 6. Go Telemetry (Go 1.23+)
Be aware of Go telemetry for toolchain statistics.
- Use `go telemetry on` to opt-in.
- Use `go telemetry local` to inspect collected data.
