---
description: Workflow for scaffolding a new idiomatic Go web service using standard library (Go 1.22+).
---

# Bootstrap Go Web Service

Follow these steps to scaffold a modern Go web service.

## 1. Initialize Module and Workspaces
```bash
go mod init github.com/user/project
go work init .
```

## 2. Scaffold Directory Structure
Create the standard Go directory layout.
```bash
mkdir -p cmd/api internal/handlers internal/middleware internal/models pkg
```

## 3. Create Main Application Entrypoint
Create `cmd/api/main.go`. Set up dependency injection, context cancellation, and gracefull shutdown.
```go
package main

import (
    "context"
    "log/slog"
    "net/http"
    "os"
    "os/signal"
    "time"
)

func main() {
    ctx, cancel := signal.NotifyContext(context.Background(), os.Interrupt)
    defer cancel()

    mux := http.NewServeMux()
    // Register routes...

    srv := &http.Server{
        Addr:    ":8080",
        Handler: mux,
    }

    go func() {
        slog.Info("Starting server on :8080")
        if err := srv.ListenAndServe(); err != nil && err != http.ErrServerClosed {
            slog.Error("server error", "err", err)
            os.Exit(1)
        }
    }()

    <-ctx.Done()
    slog.Info("Shutting down gracefully...")
    
    shutdownCtx, cancelShutdown := context.WithTimeout(context.Background(), 5*time.Second)
    defer cancelShutdown()
    srv.Shutdown(shutdownCtx)
}
```

## 4. Setup Routing (Go 1.22+)
Use the enhanced `http.ServeMux` to define RESTful endpoints in `internal/handlers`.
```go
func RegisterRoutes(mux *http.ServeMux) {
    mux.HandleFunc("GET /users/{id}", handleGetUser)
    mux.HandleFunc("POST /users", handleCreateUser)
}
```

## 5. Implement Structured Logging
Ensure `slog` is configured globally or passed via dependency injection for all HTTP requests.

## 6. Run the Server
```bash
go run ./cmd/api
```
