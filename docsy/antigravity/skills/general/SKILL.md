---
name: docsy-general
description: Expert at managing Docsy theme components and documentation content.
---

# Docsy General Skill

Expert at managing Docsy theme components and documentation content.

## Purpose
Use this skill to:
- Verify that the environment has Hugo "extended", Go, Node.js, and PostCSS installed.
- Manage local previews using Hugo server, Docker, or the `LLMS` output format.
- Create and review documentation pages following Docsy style, front matter, and contribution rules.
- Correctly apply Docsy-specific shortcodes like `card`, `tabpane`, and `mermaid`.
- Ensure proper formatting and linting using project-specific scripts.

## Instructions
1. Use `scripts/check-env.sh` to verify your local development environment.
2. Follow the `Add Documentation Page` workflow when creating new content.
3. Apply Docsy-specific styling and shortcodes according to the project style guide.
4. Use `npm run check:format` and `npm run check:markdown` before submitting any changes.
5. Use `hugo server --output LLMS` to preview AI-optimized versions of the content.
6. Follow the `WIP` PR naming convention and ensure CLA compliance.

## Scripts
- `scripts/check-env.sh`: Checks for Hugo extended, Go, Node.js, and PostCSS.
- `npm run check:format`: Verifies Prettier formatting.
- `npm run check:markdown`: Verifies Markdown linting.
- `npm run fix:format`: Applies Prettier corrections.
- `npm run fix:markdown`: Applies Markdown linting fixes.

## Examples
### Adding a Page
```bash
# 1. Create the file
touch content/en/docs/new-feature.md
# 2. Add content with front matter
# 3. Format and lint
npm run fix:format
npm run fix:markdown
# 4. Preview
hugo serve
```

### Checking Environment
```bash
./scripts/check-env.sh
```