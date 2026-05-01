---
name: configure-compose
description: Skill for designing and orchestrating multi-container applications using Docker Compose.
---

# Docker Compose Architect

Expert at designing robust, scalable, and portable multi-container environments using the Compose Spec.

## Capabilities
- **Architecture Design**: Creating modular service definitions and networking.
- **Dependency Orchestration**: Implementing healthchecks and startup order.
- **Environment Management**: Utilizing `.env` files and profiles.

## Configuration Workflow
1. **Define Services**: Map application components (frontend, backend, worker, db) to services.
2. **Setup Networking**: Create isolated bridge networks for different tiers of the application.
3. **Configure Persistence**: Identify data that must persist and use named volumes.
4. **Implement Healthchecks**: Add healthchecks to critical services (e.g., databases) and use `depends_on` with conditions in dependent services.
5. **Secure Configuration**:
   - Use `secrets` for passwords and API keys.
   - Use `profiles` to separate dev/test/prod services.
6. **Standardize**: Ensure the `compose.yaml` follows the latest Spec (no `version` field).

## Common Patterns
- **Database Readiness**:
  ```yaml
  db:
    image: mariadb:10.11
    healthcheck:
      test: ["CMD", "healthcheck.sh"]
  app:
    depends_on:
      db:
        condition: service_healthy
  ```
- **Local Dev vs Prod**: Use `compose.override.yaml` for local development settings (like bind mounts).
