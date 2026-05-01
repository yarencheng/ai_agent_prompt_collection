---
description: Best practices for defining and managing multi-container applications with Docker Compose.
---

# Docker Compose Best Practices

Use Docker Compose to manage local development and production-like environments with consistency.

## Configuration Structure

### 1. Environment Parity
Use a base `compose.yaml` for shared configuration across all environments.
- Use override files (e.g., `compose.override.yaml` for local dev, `compose.prod.yaml` for production).
- Command: `docker compose -f compose.yaml -f compose.prod.yaml up -d`

### 2. Variable Substitution
Use `.env` files and environment variable interpolation to keep configurations flexible.
- Provide a `.env.example` template for other developers.
- Avoid hardcoding host-specific paths or sensitive data.

## Service Definition

### 1. Health Checks
Always define `healthcheck` for services that others depend on.
```yaml
services:
  db:
    image: postgres:17-alpine
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 10s
      timeout: 5s
      retries: 5
```

### 2. Dependencies
Use `depends_on` with `condition: service_healthy` to ensure correct startup order.
```yaml
services:
  app:
    depends_on:
      db:
        condition: service_healthy
```

### 3. Networking
- Use custom networks instead of the default bridge.
- Only expose ports (`ports:`) that need to be accessible from the host. Use `expose:` for internal communication between containers.

### 4. Volumes
- Use named volumes for persistent data (e.g., databases).
- Use bind mounts only for development (e.g., hot-reloading code). Remove bind mounts in production.

## Security

### 1. Secrets Management
Use the top-level `secrets` element instead of environment variables for sensitive data.
```yaml
services:
  db:
    secrets:
      - db_password
secrets:
  db_password:
    file: ./secrets/db_password.txt
```

### 2. Restart Policies
- Use `restart: always` or `restart: unless-stopped` for production services.
- Use `restart: no` for short-lived tasks.

### 3. Resource Limits
Define `deploy.resources` to prevent a single container from consuming all host resources.
```yaml
services:
  app:
    deploy:
      resources:
        limits:
          cpus: '0.50'
          memory: 512M
```
