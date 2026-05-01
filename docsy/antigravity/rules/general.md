---
trigger: always_on
---

# Docsy Repository Conventions

General conventions for working in the Docsy repository.

## Environment
- **Hugo**: Use Hugo "extended" version (v0.153.0+ required, v0.157.0+ recommended).
- **Node**: Use Node.js LTS (v24+ recommended).
- **PostCSS**: Ensure `autoprefixer`, `postcss-cli`, and `postcss` are installed for CSS builds.

## Directory Structure
- `assets/scss/`: Theme styles (moved to `assets/scss/td/` for internal files since v0.14.0).
- `layouts/`: Hugo templates.
- `content/`: Documentation content.
- `docsy.dev/`: Source for the Docsy user guide and project documentation.

## Contributions
- Follow the process in `CONTRIBUTING.md`.
- Reference `AGENTS.md` for AI-specific guidance.