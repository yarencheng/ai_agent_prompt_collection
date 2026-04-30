# Go Modernizer Skill

Expert at migrating Go codebases to the latest idioms and APIs using `go fix` and manual refactoring.

## Purpose
Use this skill when you need to:
- Upgrade a Go project to 1.26+.
- Migrate deprecated APIs (e.g., `SetFinalizer` -> `AddCleanup`, `errors.As` -> `errors.AsType`).
- Automate migrations using `//go:fix inline`.

## Best Practices
1. **Always use `go fix` first**: It now contains "modernizers" that handle dozens of standard migrations.
2. **Use `//go:fix inline` for internal migrations**: When deprecating your own APIs, use the inliner to help users migrate.
3. **Verify with `go vet`**: Ensure that modernizations don't introduce subtle bugs (e.g., `copylock` issues).
4. **Check `go mod tidy`**: Ensure dependencies are up to date after upgrading the `go` version in `go.mod`.

## Commands
- `go fix ./...`: Apply all standard modernizers.
- `go fix -m [modernizer-name] ./...`: Apply a specific modernizer.
- `go mod init`: Note that it now defaults to `1.(N-1).0`. Use `go get go@1.26` to force the latest.
