# Svelte & SvelteKit Development

Specialized capability for contributing to the Svelte and SvelteKit monorepos.

## Purpose
Use this skill when:
- Implementing features or fixing bugs in Svelte or SvelteKit.
- Investigating performance issues or test failures.
- Preparing changes for submission (formatting, linting, changesets).

## Resources
- `rules/general.md`: Coding conventions.
- `rules/commands.md`: Standard commands.

## Best Practices
1. **Always build before testing**: Run `pnpm build` if you change any shared package.
2. **Strict Validation**: Never skip `pnpm run format`, `pnpm run lint`, and `pnpm run check`.
3. **Unit Tests First**: Run unit tests (`test:unit`) before full integration suites.
4. **Changeset Mandatory**: Always include a changeset for any user-facing changes.

## Commands
- `pnpm install`
- `pnpm build`
- `pnpm test`
- `pnpm run format`
- `pnpm changeset`