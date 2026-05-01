---
name: svelte-general
description: Specialized capability for contributing to the Svelte and SvelteKit monorepos, focused on modern Svelte 5 conventions.
---

# Svelte & SvelteKit Development

Specialized capability for contributing to the Svelte and SvelteKit monorepos, focused on modern Svelte 5 conventions and robust web standards.

## Purpose
Use this skill when:
- Implementing features or fixing bugs in Svelte or SvelteKit.
- Investigating test failures, type mismatches, or performance bottlenecks.
- Preparing changes for submission (formatting, linting, changesets).
- Refactoring legacy Svelte code to Svelte 5 Runes.
- Ensuring accessibility compliance (focus management, route announcements).

## Resources
- `rules/general.md`: Coding conventions, Runes, accessibility, and styling.
- `rules/commands.md`: Standard commands for testing, performance, and building.

## Best Practices
1. **Runes by Default**: Use `$state`, `$derived`, and `$props` for all logic. Avoid legacy APIs (`export let`, `$:`, `on:`).
2. **Reactivity Performance**: Use `$state.raw` for large objects and `$derived.by` for complex computations.
3. **Accessibility**: Use `<svelte:head>` for unique titles and `afterNavigate` for focus management.
4. **Build First**: Always run `pnpm build` if changing shared packages to update dependencies.
5. **Strict Validation**: Follow the pre-submission checklist: format, lint, check, and unit tests.
6. **Documentation Sync**: Use `pnpm sync-all` when modifying APIs to keep documentation in sync.
7. **Changeset Mandatory**: Every user-facing change must include a changeset (run `pnpm changeset`).
8. **Type Generation**: Use `prepublishOnly` (Kit) or `generate:types` (Core) and DO NOT format output with Prettier.

## Common Tasks
- **Fixing a bug**: Follow the Bug Fix & PR Prep Workflow; ensure minimal reproductions.
- **Adding a feature**: Check for RFC requirements; update types, documentation, and performance.
- **Modernizing code**: Refactor to Runes, snippets, callback props, and `createContext`.
- **Refactoring**: Ensure `snake_case` for internal members and `camelCase` for public APIs.