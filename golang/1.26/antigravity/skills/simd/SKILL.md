# Go 1.26 Experimental SIMD

Knowledge of architecture-specific SIMD operations introduced in Go 1.26.

## Purpose
- Leverage hardware-specific vector instructions for high-performance data processing.
- Currently supports **amd64** architecture with 128-bit, 256-bit, and 512-bit vector types.

## Requirement
- Must be enabled with `GOEXPERIMENT=simd` at build time.

## Key APIs
- `simd/archsimd.Int8x16`, `simd/archsimd.Float64x8`, etc.
- Methods like `.Add()`, `.Sub()`, etc., on vector types.

## Warning
- The API is **architecture-specific** and **non-portable**.
- It is currently an experimental feature and may change.
