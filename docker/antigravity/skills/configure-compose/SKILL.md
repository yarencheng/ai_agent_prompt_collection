# Configure Docker Compose

Design and implement production-ready multi-container orchestration using Docker Compose.

## Capabilities

### 1. Multi-Environment Orchestration
- Implement **Environment Parity** using base and override Compose files.
- Configure variable substitution using `.env` files.
- Support production-specific overrides (e.g., resource limits, restart policies).

### 2. Service Reliability
- Implement **Health Checks** for all critical services.
- Configure **Correct Startup Order** using `depends_on` with conditions.
- Set appropriate **Restart Policies** (`unless-stopped`, `always`).

### 3. Networking and Security
- Define custom bridge or overlay **Networks** for isolation.
- Implement **Secrets Management** using the `secrets` element.
- Configure **Resource Limits** (CPU/Memory) to prevent resource exhaustion.

### 4. Volume and Data Management
- Define **Named Volumes** for persistent data.
- Ensure proper mapping of configuration files using bind mounts (dev) or configs (prod).

## Interaction Logic

When designing or refactoring a Compose setup:
1.  **Map Components**: Identify the services, their dependencies, and their data requirements.
2.  **Apply Standards**: Use rules from `compose-best-practices.md` to ensure production readiness.
3.  **Draft Configuration**: Create the `compose.yaml` and any necessary `.env` or override files.
4.  **Security Audit**: Verify that secrets are handled correctly and services are properly isolated.
