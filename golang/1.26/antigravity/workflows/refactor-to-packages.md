---
description: Workflow for refactoring a monolithic Go application into domain-driven packages.
---

# Refactor to Packages

Follow these steps to safely refactor a large Go codebase into smaller, cohesive packages.

## 1. Identify Domains
Review the `main.go` or monolithic package. Identify distinct functional domains (e.g., `user`, `order`, `billing`, `database`).

## 2. Create Internal Directories
Create directories for the new packages inside `internal/`. Do not put them in `pkg/` unless you specifically want other modules to import them.
```bash
mkdir -p internal/user internal/order
```

## 3. Extract Types and Interfaces
Move domain-specific structs and interfaces to their respective directories.
- Avoid creating a `types` or `models` package that holds *all* structs. This leads to anemic models and import cycles. Structs should live with the logic that operates on them.

## 4. Invert Dependencies (Dependency Injection)
If the `user` package needs to talk to the database, do not import the `database` package directly into `user`. Instead, define an interface in `user` that describes what it needs.

```go
// internal/user/service.go
package user

type UserRepository interface {
    FindByID(id string) (*User, error)
}

type Service struct {
    repo UserRepository
}
```

## 5. Wire Dependencies in `main.go`
The `main` package is responsible for importing concrete implementations and injecting them into the services.

```go
// cmd/app/main.go
repo := database.NewPostgresRepo(conn)
userService := user.NewService(repo)
```

## 6. Fix Imports and Test
Run `go mod tidy` and `go test ./...` to ensure everything is wired correctly and no cyclic dependencies were introduced.
