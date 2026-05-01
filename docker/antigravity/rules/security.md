---
name: security
description: Security guidelines for Docker images and containers.
trigger: always_on
---

# Docker Security Rules

Prioritize security throughout the container lifecycle.

## Image Security
- **Base Images**: Use minimal base images (e.g., `alpine`, `distroless`) to reduce the attack surface.
- **Scanning**: Regularly scan images for vulnerabilities using tools like `docker scout` or `trivy`.
- **Rootless**: Never run applications as `root`. Use a dedicated user:
  ```dockerfile
  RUN addgroup -S appgroup && adduser -S appuser -G appgroup
  USER appuser
  ```

## Runtime Security
- **Privileged Mode**: Never use `--privileged` unless absolutely necessary.
- **Capabilities**: Drop all capabilities and add only what is needed:
  ```yaml
  cap_drop:
    - ALL
  cap_add:
    - NET_BIND_SERVICE
  ```
- **Read-Only Filesystem**: Run containers with a read-only root filesystem when possible:
  ```yaml
  read_only: true
  tmpfs:
    - /tmp
    - /run
  ```
- **Resource Constraints**: Always set memory and CPU limits to prevent DoS attacks:
  ```yaml
  deploy:
    resources:
      limits:
        cpus: '0.50'
        memory: 512M
  ```

## Secret Management
- **Avoid ENV for Secrets**: Do not pass sensitive information via environment variables as they can be seen in `docker inspect`.
- **BuildKit Secrets**: Use `--mount=type=secret` for secrets needed during build.
- **Compose Secrets**: Use the `secrets` top-level element in Compose.
