---
name: containerize
description: Standardized workflow for containerizing a new or existing application.
---

# Containerization Workflow

Follow these steps to containerize an application from scratch.

## Prerequisites
- Working application code.
- Knowledge of the application's runtime dependencies and entry point.

## Workflow Steps

### 1. Initialize
- Run `docker init` if available to generate a baseline.
- If not, create `Dockerfile`, `compose.yaml`, and `.dockerignore`.

### 2. Configure Dockerfile
- Apply `@[/optimize-dockerfile]` to create an efficient multi-stage build.
- Ensure `# syntax=docker/dockerfile:1` is present.
- Define build and runtime stages.
- Switch to a non-root `USER`.

### 3. Configure Compose
- Apply `@[/configure-compose]` to define the service architecture.
- Add dependent services (databases, caches) with Official images.
- Set up networks and volumes.
- Add healthchecks for dependency orchestration.

### 4. Security Pass
- Review rules in `@[/security]`.
- Check base image vulnerabilities.
- Ensure no secrets are hardcoded.

### 5. Validate
- Build the project: `docker compose build`.
- Start the services: `docker compose up -d`.
- Verify the application is reachable and functioning.

## Deliverables
- A production-ready `Dockerfile`.
- A robust `compose.yaml`.
- A comprehensive `.dockerignore`.
