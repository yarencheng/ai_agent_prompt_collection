---
trigger: always_on
---

# Svelte Project Commands

Standard commands for development, validation, and testing.

## Lifecycle Commands
- **Setup**: `pnpm install --frozen-lockfile`
- **Build**: `pnpm build`
- **Format**: `pnpm run format`
- **Lint**: `pnpm run lint`
- **Type Check**: `pnpm run check`

## Testing Commands
- **Unit Tests (Kit)**: `pnpm -F @sveltejs/kit test:unit`
- **Single Unit Test**: `pnpm -F @sveltejs/kit test:unit:dev path/to/test.spec.js`
- **Integration Tests (Kit)**: `pnpm test:kit`
- **Core Svelte Tests**: `pnpm test`
- **Filter Tests**: `pnpm test <suite-name> -t <test-name>`

## Contribution Commands
- **Changesets**: `pnpm changeset` (prefix with `fix`, `feat`, `breaking`, or `chore`)
- **Generate Types**: `pnpm -F @sveltejs/kit prepublishOnly` (or `pnpm generate:types` in core)
