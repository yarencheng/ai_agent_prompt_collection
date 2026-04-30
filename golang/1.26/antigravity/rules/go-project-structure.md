---
description: Rule for standard Go 1.26 project structure and dependency management.
trigger: always_on
---

# Go Project Structure (1.26+)

Follow these standards for managing Go projects and dependencies.

## 1. Use the `tool` Directive for Executable Dependencies
Stop using `tools.go` with blank imports. Use the `tool` directive in `go.mod`.

**Preferred:**
```bash
go get -tool github.com/golangci/golangci-lint/cmd/golangci-lint
```
This adds a `tool` line to `go.mod`. You can then run it with `go tool golangci-lint`.

## 2. Go Version in `go.mod`
- `go mod init` defaults to `1.(N-1).0` to encourage compatibility.
- If you need 1.26 features, explicitly upgrade: `go get go@1.26`.

## 3. Directory Ignoring
Use the `ignore` directive in `go.mod` to exclude specific directories from package matching (e.g., large data directories or vendored assets that aren't Go code).

```go
ignore "assets/large_data"
```

## 4. JSON Output for CI/CD
Use `-json` flags for tools in CI/CD pipelines for better integration.
- `go build -json`
- `go test -json` (includes build output in JSON)
