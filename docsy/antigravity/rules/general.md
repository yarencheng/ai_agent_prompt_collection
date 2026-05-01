---
trigger: always_on
---

# Docsy Repository Conventions

General conventions for working in the Docsy repository.

## Environment
- **Hugo**: Use Hugo "extended" version (v0.146.0+ required, v0.157.0+ recommended).
- **Go**: Use Go (required if using Docsy as a Hugo module).
- **Node**: Use Node.js LTS (v24+ recommended). Follow `.nvmrc` if present.
- **PostCSS**: Ensure `postcss`, `autoprefixer`, and `postcss-cli` are installed for CSS builds.
- **Docker**: Optionally use `Dockerfile` and `docker-compose.yaml` for local previews.

## Modern Features
- **LLMS Support**: Docsy supports an `LLMS` output format for AI-friendly content. Verify builds with `hugo --output LLMS`.
- **Agent Support**: Use `afdocs` for checking agent documentation effectiveness. Refer to `agent-docs.config.yml`.

## Directory Structure
- `assets/scss/`: Theme styles (moved to `assets/scss/td/` for internal files since v0.14.0).
- `layouts/`: Hugo templates.
- `content/`: Documentation content.
- `docsy.dev/`: Source for the Docsy user guide and project documentation.

## Authoritative Sources
- **Git Info**: Refer to `git-info.md` (or `docsy.dev/content/en/project/build/git-repo.md`) for CI/CD and release details.
- **Project Docs**: See `docsy.dev/content/en/project/` for authoritative project information.
- **Agent Guidance**: Refer to `AGENTS.md` for AI-specific repo guidance.

## Contributions
- Follow the process in `CONTRIBUTING.md`.
- Ensure CLA compliance.
- Prefix PR titles with `WIP` until ready for review.