---
description: Standard workflow for containerizing a new or existing application following best practices.
---

# Containerization Workflow

Follow these steps to create a production-ready Docker environment for an application.

## 1. Initial Assessment
- Identify the application stack (language, framework, runtime).
- List all external dependencies (databases, caches, APIs).
- Determine persistent data requirements.

## 2. Dockerfile Design
- Use `rules/idiomatic-dockerfile.md` to draft the Dockerfile.
- **Base Image**: Select the smallest official image (e.g., `alpine`, `node:slim`).
- **Build Stages**: Implement a multi-stage build to keep the final image small.
- **Permissions**: Add a non-root user and switch to it using `USER`.
- **Caching**: Order instructions to optimize build cache hits.

## 3. Local Orchestration (Compose)
- Use `rules/compose-best-practices.md` to draft the `compose.yaml`.
- **Services**: Define the app service and its dependencies.
- **Reliability**: Add `healthcheck` and `depends_on`.
- **Networking**: Create a dedicated network for service isolation.
- **Volumes**: Configure named volumes for persistent data.

## 4. Security Audit
- Use `rules/security.md` to audit the configuration.
- **Secrets**: Move sensitive data from environment variables to `secrets`.
- **Minimalism**: Ensure no unnecessary tools or packages are in the final image.

## 5. Verification and CI
- Validate the Dockerfile with `docker build --check .`.
- Test the full stack locally with `docker compose up`.
- Prepare the configuration for CI/CD using `rules/modern-docker.md`.
