# Optimize Dockerfile

Analyze and refactor existing Dockerfiles to align with modern best practices and security standards.

## Capabilities

### 1. Structure Optimization
- Convert single-stage Dockerfiles to **multi-stage builds**.
- Optimize instruction ordering to maximize **build cache efficiency**.
- Consolidate `RUN` instructions to reduce image layers.

### 2. Modern Feature Adoption
- Integrate **BuildKit** features like bind mounts (`--mount=type=bind`) and cache mounts (`--mount=type=cache`).
- Add **Build Checks** directives (`# check=error=true`).
- Implement **Build Secrets** for sensitive data.

### 3. Security Hardening
- Implement **non-root users** (`USER` instruction).
- Switch to minimal, secure **base images** (Alpine, Distroless).
- Remove `sudo` and other unnecessary packages.
- Ensure secrets are not leaked in layers.

### 4. Cleanup and Maintenance
- Add `.dockerignore` files to exclude irrelevant content.
- Standardize metadata using `LABEL`.
- Use absolute paths for `WORKDIR`.

## Interaction Logic

When tasked with optimizing a Dockerfile:
1.  **Analyze**: Read the existing Dockerfile and identify anti-patterns (e.g., large base images, root user, poor caching).
2.  **Propose**: Detail the specific improvements (e.g., "Switching to Alpine", "Implementing multi-stage build").
3.  **Execute**: Apply the changes using rules from `idiomatic-dockerfile.md` and `security.md`.
4.  **Verify**: If possible, suggest running `docker build --check .` to validate the new configuration.
