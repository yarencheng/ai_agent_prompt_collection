---
trigger: always_on
---

# Docsy Repository Conventions

General conventions for working in the Docsy repository.

## Environment
- **Hugo**: Use Hugo "extended" version (v0.153.0+ required, v0.157.0+ recommended).
- **Go**: Use Go (required if using Docsy as a Hugo module).
- **Node**: Use Node.js LTS (v24+ recommended). Follow `.nvmrc` if present.
- **PostCSS**: Ensure `autoprefixer`, `postcss-cli`, and `postcss` are installed for CSS builds.
- **Docker**: Optionally use `Dockerfile` and `docker-compose.yaml` for local previews.

## Directory Structure
- `assets/scss/`: Theme styles (moved to `assets/scss/td/` for internal files since v0.14.0).
- `layouts/`: Hugo templates.
- `content/`: Documentation content.
- `docsy.dev/`: Source for the Docsy user guide and project documentation.

## Authoritative Sources
- **Git Info**: Refer to `git-info.md` (or `docsy.dev/content/en/project/build/git-repo.md`) for CI/CD and release details.
- **Project Docs**: See `docsy.dev/content/en/project/` for authoritative project information.

## Contributions
- Follow the process in `CONTRIBUTING.md`.
- Reference `AGENTS.md` for AI-specific guidance.