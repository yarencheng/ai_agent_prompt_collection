---
trigger: always_on
---
# Go 1.26 Toolchain Conventions

## `go fix` Modernizers
Use `go fix` as the primary tool for updating code bases to the latest idioms and core library APIs.
- **Inlining**: Support for `//go:fix inline` directives to automate API migrations.

## `go doc` Replacement
`cmd/doc` and `go tool doc` are deleted. Always use `go doc` as a replacement.

## `go mod init` Versioning
`go mod init` now defaults to `go 1.(N-1).0`. For Go 1.26, this means `go 1.25.0` in the `go.mod` file.

## Runtime & Performance
- **Green Tea GC**: Enabled by default. Expect 10-40% reduction in GC overhead. leverages vector instructions on modern CPUs.
- **cgo Overhead**: Baseline overhead of cgo calls is reduced by ~30%.
- **Heap Randomization**: Heap base address is randomized on 64-bit platforms for security.

## Diagnostics
- **pprof Web UI**: Defaults to the **flame graph** view when using the `-http` flag.
