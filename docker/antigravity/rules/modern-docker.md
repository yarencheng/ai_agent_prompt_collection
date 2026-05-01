---
description: Leverage modern Docker features (BuildKit, Buildx, Bake, Build Checks) for advanced workflows.
---

# Modern Docker

Incorporate modern Docker capabilities to improve build performance, validation, and automation.

## BuildKit & Buildx

BuildKit is the modern build engine. Ensure it is enabled (default in Docker Desktop and recent Engine versions).

### 1. Build Checks (Dockerfile 1.8+)
Use build checks to validate your Dockerfile against best practices during the build process.
- Use `# check=error=true` to fail the build on lint violations.
- Use `docker build --check .` for a dry-run linting.

### 2. Multi-Platform Builds
Use `docker buildx build --platform linux/amd64,linux/arm64 ...` to create images for multiple architectures.

### 3. Build Secrets
Use `--secret` to securely pass sensitive information during build without leaking it in layers.
```dockerfile
RUN --mount=type=secret,id=my_secret \
    cat /run/secrets/my_secret
```

## Docker Bake
Use `docker buildx bake` for complex, multi-service build configurations.
- Define build targets in a `docker-bake.hcl` file.
- Support inheritance, variables, and parallel builds.

```hcl
target "default" {
  dockerfile = "Dockerfile"
  platforms = ["linux/amd64", "linux/arm64"]
}

target "app" {
  inherits = ["default"]
  context = "./app"
  tags = ["myapp:latest"]
}
```

## Docker Scout
Use Docker Scout for real-time security analysis and supply chain management.
- Enable Scout in your CI/CD pipeline.
- Use Scout to identify base image updates and vulnerabilities.

## CI/CD Integration
- Use official GitHub Actions: `docker/setup-buildx-action`, `docker/login-action`, `docker/build-push-action`.
- Leverage cache backends (e.g., `type=gha`, `type=registry`) for faster builds in CI.
- Enable Build Checks in CI to catch anti-patterns early.
