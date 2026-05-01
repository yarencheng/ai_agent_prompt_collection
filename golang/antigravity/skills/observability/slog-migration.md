---
description: Assist in migrating Go applications from standard 'log' or 'logrus' to structured 'log/slog'.
---

# slog Migration Skill

## Scenarios
1. **Modernizing Legacy Logs**: Converting `log.Printf` to `slog.Info`.
2. **Adding Structure**: Moving from string-formatted logs to key-value pairs.
3. **Observability Integration**: Connecting logs to tracing via context.

## Instructions
1. **Initialize Logger**: Set up a global or local `slog.Logger`.
    * For single output: `slog.New(slog.NewJSONHandler(os.Stdout, nil))`.
    * For multiple outputs (1.26): `slog.New(slog.NewMultiHandler(consoleHandler, fileHandler))`.
2. **Replace Call Sites**:
    * `log.Print(msg)` -> `slog.Info(msg)`
    * `log.Printf(msg, args...)` -> `slog.Info(fmt.Sprintf(msg, args...))` (or better, use attributes).
3. **Extract Attributes**: Identify data embedded in strings and move them to attributes.
    * `log.Printf("user %d logged in", id)` -> `slog.Info("user login", "id", id)`
4. **Propagate Context**: Use `Logger.InfoContext(ctx, msg, ...)` to include trace IDs.
5. **Handle Levels**: Map legacy levels (e.g., Logrus `WarnLevel`) to `slog.LevelWarn`.

## Examples
### Before
```go
log.Printf("ERROR: failed to process request for user %s: %v", userID, err)
```

### After
```go
slog.ErrorContext(ctx, "failed to process request",
    "user_id", userID,
    "error", err,
)
```
