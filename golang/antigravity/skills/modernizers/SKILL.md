---
name: modernizers
description: Use 'go fix' with modernizers (Go 1.26+) to automate idiom updates.
---

# Go Modernizers

## Scenarios
* **Legacy Codebases**: Updating old code to use new standard library features.
* **API Migrations**: Automating the replacement of deprecated functions with their modern equivalents.
* **Standardization**: Ensuring consistent use of modern idioms like `errors.AsType`.

## Instructions
1. **Identify Fixers**: Run `go fix -list` to see available modernizers.
2. **Preview Changes**: Use `go fix -diff ./...` to see proposed changes without applying them.
3. **Apply Fixes**: Run `go fix ./...` to update the source code.
4. **Custom Fixers**: Use `//go:fix inline` to automate your own API migrations.

## Examples
### Automating slog Migration
Modernizers can automatically convert `log.Printf` to `slog` where appropriate.

### Generic Error Extraction
Automatically replaces `errors.As(err, &target)` with `target, ok := errors.AsType[T](err)`.

## Scripts
* `list-modernizers.sh`: Lists all available modernizers for the current Go version.
