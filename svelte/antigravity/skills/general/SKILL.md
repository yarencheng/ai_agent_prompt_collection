# Svelte & SvelteKit Development

Specialized capability for contributing to the Svelte and SvelteKit monorepos.

## Purpose
Use this skill when:
- Implementing features or fixing bugs in Svelte or SvelteKit.
- Investigating test failures or type mismatches.
- Preparing changes for submission (formatting, linting, changesets).

## Resources
- `rules/general.md`: Coding conventions, RFC process, and breaking changes.
- `rules/commands.md`: Standard commands for testing, building, and syncing.

## Best Practices
1. **Build First**: Always run `pnpm build` if you change any shared package to ensure dependencies are updated.
2. **Strict Validation**: Follow the pre-submission checklist: format, lint, check, and unit tests.
3. **Documentation Sync**: Use `pnpm sync-all` when modifying APIs to keep documentation in sync.
4. **Changeset Mandatory**: Every user-facing change must include a changeset (run `pnpm changeset`).
5. **Snapshot Awareness**: If tests fail due to expected output changes, use snapshot update commands.

## Common Tasks
- **Fixing a bug**: Follow the Bug Fix & PR Prep Workflow.
- **Adding a feature**: Check if an RFC is required; ensure types and documentation are updated.
- **Refactoring**: Ensure `snake_case` for internal members and `camelCase` for public APIs.