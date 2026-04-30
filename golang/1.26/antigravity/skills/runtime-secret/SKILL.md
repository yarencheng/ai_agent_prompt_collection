# Go 1.26 Runtime Secret Management

Expert at using the `runtime/secret` package for secure handling of sensitive data.

## Purpose
- Securely erase temporaries (registers, stack, heap) used for secret/cryptographic information.
- Enhance **forward secrecy** by ensuring sensitive data doesn't persist in memory.

## Requirement
- Must be enabled with `GOEXPERIMENT=runtimesecret` at build time.
- Currently supports **amd64** and **arm64** on **Linux**.

## Key APIs
- `runtime/secret` functions for marking and clearing sensitive memory regions.
