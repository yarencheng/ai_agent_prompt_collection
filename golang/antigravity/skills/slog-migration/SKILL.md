---
name: slog-migration
description: Migrate from 'log' or 'logrus' to structured 'log/slog'.
---

# slog Migration

## Scenarios
* **Legacy Modernization**: Converting `log.Printf` to `slog.Info`.
* **Adding Structure**: Moving from string-heavy logs to key-value pairs.
* **Observability**: Integrating logs with tracing via `context.Context`.

## Instructions
1. **Initialize**: Use `slog.New`. For multiple destinations (1.26), use `slog.NewMultiHandler`.
2. **Refactor Call Sites**:
    * `log.Printf(msg, args...)` -> `slog.Info(msg, "key", val)`.
3. **Propagate Context**: Always use `Logger.InfoContext(ctx, ...)` to preserve trace IDs.
4. **Levels**: Map legacy levels correctly (e.g., `WarnLevel` -> `slog.LevelWarn`).

## Examples
### Before
```go
log.Printf("ERROR: failed to process request for user %s: %v", userID, err)
```

### After
```go
// Direct, structured, and context-aware
slog.ErrorContext(ctx, "failed to process request",
    "user_id", userID,
    "error", err,
)
```

## Scripts
* `scan-log-calls.sh`: Searches for standard library log calls that should be migrated to `slog`.
