---
name: compose-best-practices
description: Best practices for designing multi-container architectures with Docker Compose.
trigger: always_on
---

# Docker Compose Best Practices

Leverage the modern Compose Spec to build robust and portable multi-container environments.

## Specification
- **Versionless**: Omit the `version` field. Modern Docker Compose follows the Compose Spec.
- **Service Naming**: Use lowercase, alphanumeric names for services (e.g., `api`, `db`, `cache`).

## Configuration
- **Environment Variables**:
  - Use `.env` files for default values.
  - Use `env_file` for service-specific variables.
  - Avoid hardcoding secrets; use `secrets` for sensitive data.
- **Dependency Management**:
  - Use `depends_on` with `condition: service_healthy` to ensure proper startup order.
  - Implement `healthcheck` in services to define readiness.

## Storage and Networking
- **Volumes**:
  - Use named volumes for persistent data.
  - Use bind mounts only for local development (e.g., hot-reloading code).
- **Networks**:
  - Use bridge networks for service isolation.
  - Define custom networks to control traffic flow between tiers (e.g., `frontend`, `backend`, `data`).

## Operations
- **Profiles**: Use `profiles` to manage optional or environment-specific services (e.g., `debug`, `test`).
- **Resource Limits**: Define `deploy.resources` to prevent a single container from exhausting host resources.
- **Restart Policy**: Use `restart: unless-stopped` for production services.

## Example Pattern
```yaml
services:
  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_PASSWORD_FILE: /run/secrets/db_password
    secrets:
      - db_password
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 5s
      timeout: 5s
      retries: 5

  api:
    build: .
    depends_on:
      db:
        condition: service_healthy
    networks:
      - backend
    secrets:
      - db_password

networks:
  backend:

secrets:
  db_password:
    file: ./secrets/db_password.txt
```
