---
description: Rule for structured logging (slog) and telemetry (1.21 - 1.23).
trigger: always_on
---

# Go Observability (slog & Telemetry)

Follow these standards for logging and telemetry in modern Go applications.

## 1. Use `log/slog` for Structured Logging (Go 1.21+)
Stop using `fmt.Printf` or basic `log` for production applications. Use `slog` for machine-readable logs.

**Preferred:**
```go
import "log/slog"

slog.Info("user logged in", 
    "user_id", user.ID, 
    "ip_address", r.RemoteAddr)
```

**Avoid:**
```go
log.Printf("user logged in: %d from %s", user.ID, r.RemoteAddr)
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

```go
handler := slog.NewMultiHandler(
    slog.NewJSONHandler(os.Stdout, nil),
    slog.NewTextHandler(logFile, nil),
)
logger := slog.New(handler)
```

## 4. Go Telemetry (Go 1.23+)
Be aware of Go telemetry for toolchain statistics.
- Use `go telemetry on` to opt-in.
- Use `go telemetry local` to inspect collected data.
