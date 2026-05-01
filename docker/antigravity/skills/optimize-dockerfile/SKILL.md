---
name: optimize-dockerfile
description: Skill for analyzing and refactoring Dockerfiles for performance, size, and security.
---

# Dockerfile Optimizer

Expert at refactoring Dockerfiles to follow modern best practices and efficiency standards.

## Capabilities
- **Size Reduction**: Implementing multi-stage builds and minimal base images.
- **Build Speed**: Optimizing layer caching and using BuildKit cache mounts.
- **Security Audit**: Identifying root usage, exposed secrets, and vulnerable base images.

## Refactoring Workflow
1. **Analyze Current State**: Read the existing `Dockerfile` and identify anti-patterns (e.g., missing multi-stage, large base images, poor layer order).
2. **Apply Multi-Stage**:
   - Create a `build` stage for compiling/installing dependencies.
   - Create a `final` stage using a minimal runtime image (e.g., `alpine`, `distroless`).
   - Copy only the necessary artifacts from `build` to `final`.
3. **Optimize Layers**:
   - Group `RUN` instructions.
   - Use `# syntax=docker/dockerfile:1`.
   - Add cache mounts for package managers.
4. **Hardening**:
   - Add `USER` to run as non-root.
   - Verify absolute paths for `WORKDIR`.
5. **Context Check**: Verify `.dockerignore` exists and is comprehensive.

## Verification
- Run `docker build --no-cache` to ensure the new Dockerfile is valid.
- Compare image sizes before and after optimization.
