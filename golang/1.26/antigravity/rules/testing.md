---
trigger: always_on
---
# Go 1.26 Testing Conventions

## Test Artifacts
Use `T.ArtifactDir()`, `B.ArtifactDir()`, or `F.ArtifactDir()` to manage files generated during tests.
- **Usage**: `dir := t.ArtifactDir()`
- **Behavior**: 
  - If `-artifacts` flag is provided to `go test`, artifacts are saved in the output directory.
  - Otherwise, they are saved in a temporary directory removed after the test.
- **Benefit**: Standardizes where logs, dumps, or other test side-effects are stored.

## Deterministic Randomness
For tests requiring deterministic cryptographic output, use `testing/cryptotest.SetGlobalRandom(r)`.
- This affects `crypto/rand` and all internal package randomness.
