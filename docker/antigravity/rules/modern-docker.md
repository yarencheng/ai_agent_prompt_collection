---
name: modern-docker
description: Leveraging modern Docker features and ecosystem tools.
---

# Modern Docker Features

Stay ahead by utilizing the latest advancements in the Docker ecosystem.

## Buildx and Multi-Platform
- **Multi-Platform Builds**: Use `docker buildx build --platform linux/amd64,linux/arm64` to create images for different architectures.
- **Remote Builders**: Utilize remote BuildKit instances for faster, distributed builds.

## Development Experience
- **Docker Init**: Use `docker init` to automatically generate `Dockerfile`, `compose.yaml`, and `.dockerignore` for new projects.
- **Dev Containers**: Use the Dev Containers standard ( `.devcontainer/devcontainer.json`) to provide a consistent development environment within Docker.
- **Compose Watch**: Use `docker compose watch` for automatic synchronization of local changes into running containers.

## Image Management
- **Docker Scout**: Use `docker scout` for deep image analysis, including vulnerability scanning and software supply chain insights.
- **Attestations**: Generate and attach build attestations (SBOM, SLSA) to your images for enhanced provenance and security.

## Best Practices
- **Standardized Naming**: Follow a consistent tagging strategy (e.g., semantic versioning + commit SHA).
- **Ephemeral Infrastructure**: Treat containers as disposable; never store state inside a container.
