---
description: Security guidelines for building and running Docker containers.
---

# Docker Security

Implement a "defense in depth" strategy for your containerized applications.

## Build Security

### 1. Run as Non-Root User
Never run your application as `root` unless absolutely necessary.
- Create a specific user in the Dockerfile.
- Use the `USER` instruction to switch before the final `ENTRYPOINT`.

```dockerfile
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser
```

### 2. Secure Base Images
- Use verified and official images.
- Prefer minimal images (Alpine, Distroless) to reduce the attack surface.
- Scan images for vulnerabilities using `docker scout` or `trivy`.

### 3. Handle Secrets Securely
- Never bake secrets (API keys, passwords) into the image layers via `ENV` or `RUN`.
- Use BuildKit build secrets (`--secret`) or runtime secrets (Docker Secrets, HashiCorp Vault).

### 4. Supply Chain Integrity
- Use fixed versions or digests for base images: `FROM alpine:3.21@sha256:...`
- Sign your images with Docker Content Trust (DCT).

## Runtime Security

### 1. Minimal Privileges
- Use `--read-only` root filesystem whenever possible.
- Drop unnecessary capabilities: `--cap-drop=ALL`.
- Avoid `--privileged` mode.

### 2. Resource Constraints
- Limit CPU and Memory usage to prevent DoS attacks from compromised containers.
- Limit PID usage to prevent fork bombs.

### 3. Network Isolation
- Isolate containers in private networks.
- Use firewall rules or Network Policies (in K8s) to restrict traffic.

### 4. Logging and Auditing
- Ensure logs are centralized and monitored.
- Audit container events and system calls.
