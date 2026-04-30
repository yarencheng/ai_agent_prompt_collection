---
description: Rule for standard Go 1.26 project structure, workspaces, and dependency management.
trigger: always_on
---

# Go Project Structure (1.18 - 1.26+)

Follow these standards for managing Go projects and dependencies.

## 1. Go Workspaces (Go 1.18+)
Use `go.work` for multi-module local development to avoid `replace` directives in `go.mod`.
```bash
go work init ./module1 ./module2
```

## 2. Toolchain Management (Go 1.21+)
Use the `toolchain` directive in `go.mod` to specify the exact toolchain required, independent of the language version (`go` directive).
```go
go 1.26
toolchain go1.26.1
```

## 3. The `tool` Directive for Executable Dependencies (Go 1.26+)
Stop using `tools.go` with blank imports. Use the `tool` directive in `go.mod`.
```bash
go get -tool github.com/golangci/golangci-lint/cmd/golangci-lint
```
Run it with `go tool golangci-lint`.

## 4. Go Version in `go.mod`
- `go mod init` defaults to `1.(N-1).0` to encourage compatibility.
- Explicitly upgrade: `go get go@1.26`.

## 5. Directory Ignoring
Use the `ignore` directive in `go.mod` (Go 1.24+) to exclude specific directories from package matching.
```go
ignore "assets/large_data"
```

## 6. Project Layout Standards
- **`cmd/`**: Main applications. Directory names should match the executable name.
- **`internal/`**: Private application and library code. The Go compiler enforces that code here cannot be imported by external modules.
- **`pkg/`**: Public library code meant for external consumption (use sparingly, prefer standard paths).
- **`testdata/`**: Files used only in tests.
- **Static Assets**: Store assets to be embedded via `go:embed` in a `static/` or `assets/` directory.

## 7. JSON Output for CI/CD
Use `-json` flags for tools in CI/CD pipelines.
- `go build -json`
- `go test -json`
