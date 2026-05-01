---
description: Guidelines for writing clean, efficient, and maintainable Dockerfiles.
---

# Idiomatic Dockerfile

Follow these best practices to ensure your Docker images are secure, small, and fast to build.

## Core Principles

### 1. Use Multi-Stage Builds
Always use multi-stage builds to separate the build environment from the runtime environment. This ensures the final image only contains necessary artifacts.

```dockerfile
# syntax=docker/dockerfile:1
FROM golang:1.23-alpine AS build
WORKDIR /src
COPY . .
RUN go build -o /app .

FROM alpine:3.21
COPY --from=build /app /app
ENTRYPOINT ["/app"]
```

### 2. Choose Minimal Base Images
Prefer minimal, official base images like `alpine` or `distroless`.
- Use `Official Images` from Docker Hub whenever possible.
- Avoid large distributions (e.g., full Ubuntu) unless strictly necessary.

### 3. Optimize the Build Cache
Order instructions from least frequently changed to most frequently changed.
- Copy dependency files (e.g., `package.json`, `go.mod`) and install dependencies before copying the rest of the source code.

```dockerfile
COPY go.mod go.sum ./
RUN go mod download
COPY . .
```

### 4. Leverage BuildKit Features
Use BuildKit features like bind mounts to avoid unnecessary `COPY` instructions and reduce layer size.

```dockerfile
RUN --mount=type=bind,source=package.json,target=package.json \
    --mount=type=bind,source=package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm install
```

## Instruction Guidelines

### RUN
- Combine multiple commands into a single `RUN` instruction using `&&` to reduce layers.
- Use here-documents (`<<EOF`) for complex multi-line scripts.
- Sort multi-line arguments alphanumerically for readability.
- In Debian/Ubuntu images, always combine `apt-get update` and `apt-get install` and clean up the cache:
  `RUN apt-get update && apt-get install -y --no-install-recommends <pkgs> && rm -rf /var/lib/apt/lists/*`

### CMD & ENTRYPOINT
- Prefer the **exec form** `["executable", "param1", "param2"]` over the shell form.
- Use `ENTRYPOINT` for the main command and `CMD` for default arguments.

### ENV & ARG
- Use `ARG` for build-time variables.
- Use `ENV` for runtime environment variables.
- Avoid using `ENV` for secrets; use Docker Secrets or build-time secrets instead.

### COPY & ADD
- Prefer `COPY` over `ADD` for simple file transfers.
- Use `ADD` only when you need to auto-extract local tar files or download from URLs.

### WORKDIR
- Always use absolute paths for `WORKDIR`.
- Avoid using `RUN cd ...`.

## Metadata
- Use `LABEL` to add metadata (version, maintainer, description).
- Use `.dockerignore` to exclude irrelevant files from the build context (e.g., `.git`, `node_modules`, `tests`).
