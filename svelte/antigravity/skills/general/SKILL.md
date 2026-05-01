# Svelte & SvelteKit Development

Specialized capability for contributing to the Svelte and SvelteKit monorepos.

## Purpose
Use this skill when:
- Implementing features or fixing bugs in Svelte or SvelteKit.
- Investigating test failures or type mismatches.
- Preparing changes for submission (formatting, linting, changesets).
- Refactoring legacy Svelte 4 code to Svelte 5 Runes.

## Resources
- `rules/general.md`: Coding conventions, Runes, RFC process, and breaking changes.
- `rules/commands.md`: Standard commands for testing, building, and syncing.
- `resources/packages.md`: Key packages and monorepo structure.

## Examples
- `examples/code-style.md`: Idiomatic code following Svelte 5 conventions.

## Best Practices
1. **Runes by Default**: Use `$state`, `$derived`, and `$props` for all new logic. Avoid legacy APIs (`export let`, `$:`, `on:`).
2. **Build First**: Always run `pnpm build` if you change any shared package to ensure dependencies are updated.
3. **Strict Validation**: Follow the pre-submission checklist: format, lint, check, and unit tests.
4. **Documentation Sync**: Use `pnpm sync-all` when modifying APIs to keep documentation in sync.
5. **Changeset Mandatory**: Every user-facing change must include a changeset (run `pnpm changeset`).
6. **Snapshot Awareness**: If tests fail due to expected output changes, use snapshot update commands.
7. **Type Generation**: Use `prepublishOnly` (Kit) or `generate:types` (Core) and DO NOT format output with Prettier.

## Common Tasks
- **Fixing a bug**: Follow the Bug Fix & PR Prep Workflow.
- **Adding a feature**: Check if an RFC is required; ensure types and documentation are updated.
- **Modernizing code**: Refactor `export let` to `$props()` and `$: ` to `$derived()`.
- **Refactoring**: Ensure `snake_case` for internal members and `camelCase` for public APIs.