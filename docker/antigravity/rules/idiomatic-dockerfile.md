---
name: idiomatic-dockerfile
description: Best practices for writing efficient, secure, and maintainable Dockerfiles.
trigger: always_on
---

# Idiomatic Dockerfile

Follow these rules to ensure your Dockerfiles are modern, efficient, and secure.

## Core Directives
- **Syntax**: Always include `# syntax=docker/dockerfile:1` as the first line to enable BuildKit features.
- **Multi-Stage**: Mandatory for production images. Separate build-time dependencies from the runtime environment.

## Layer Optimization
- **Order**: Place instructions that change frequently (e.g., `COPY . .`) as late as possible.
- **Consolidation**: Combine `RUN apt-get update && apt-get install -y ...` to reduce layer count.
- **Cleanup**: Always clean up package manager caches in the same `RUN` layer (e.g., `rm -rf /var/lib/apt/lists/*`).
- **Cache Mounts**: Use BuildKit cache mounts for package managers:
  ```dockerfile
  RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
      --mount=type=cache,target=/var/lib/apt,sharing=locked \
      apt-get update && apt-get install -y --no-install-recommends ...
  ```

## Instructions
- **FROM**: Use Official/Verified images. Prefer minimal bases like `alpine` or `distroless` for production.
- **WORKDIR**: Always use absolute paths (e.g., `WORKDIR /app`).
- **COPY vs ADD**: Use `COPY` unless you specifically need `ADD`'s features (remote URLs or auto-extraction).
- **USER**: Always run as a non-root user in production. Create a user and switch to it using `USER`.
- **EXPOSE**: Explicitly document the ports the application listens on.
- **CMD/ENTRYPOINT**: Prefer "exec form" (JSON array) over "shell form":
  ```dockerfile
  ENTRYPOINT ["/usr/bin/my-app"]
  CMD ["--config", "/etc/my-app.yaml"]
  ```

## Context Management
- **.dockerignore**: Always include a `.dockerignore` file to exclude unnecessary files (e.g., `.git`, `node_modules`, `tests`) from the build context.
