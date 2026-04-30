# Go 1.26 Standard Library Updates

Miscellaneous improvements across the Go 1.26 standard library.

## Data Structures
- **`bytes.Buffer.Peek(n)`**: Returns the next `n` bytes without advancing the buffer.

## Logging
- **`log/slog.NewMultiHandler(...Handlers)`**: Creates a handler that fans out log records to multiple handlers.

## Cryptography
- **`crypto.Encapsulator` / `crypto.Decapsulator`**: Abstract interfaces for KEM (Key Encapsulation Mechanism).
- **`crypto/ecdh.KeyExchanger`**: Interface for abstract ECDH private keys.
- **RSA Deprecation**: PKCS #1 v1.5 encryption padding is deprecated. Use OAEP instead.

## Tooling & AST
- **`go/ast.ParseDirective(comment)`**: Parses directive comments like `//go:generate`.
- **`go/token.File.End()`**: Convenience method for getting a file's end position.

## Networking
- **`net/http` Redirects**: `ServeMux` trailing slash redirects now use **307 (Temporary Redirect)**.
- **`os.Process.WithHandle()`**: Access to internal process handles (pidfd/Windows Handle).
