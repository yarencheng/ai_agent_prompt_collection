---
trigger: always_on
---

# Svelte Project Commands

Standard commands for development, validation, and testing in the Svelte and SvelteKit monorepos.

## Lifecycle Commands
- **Setup**: `pnpm install --frozen-lockfile` (Initial setup may take 3-4 minutes)
- **Build**: `pnpm build`
- **Format**: `pnpm run format`
- **Lint**: `pnpm run lint`
- **Type Check**: `pnpm run check`
- **Git Hooks**: `git config core.hookspath .githooks`

## Testing Commands
- **Unit Tests (Kit)**: `pnpm -F @sveltejs/kit test:unit`
- **Single Unit Test**: `pnpm -F @sveltejs/kit test:unit:dev path/to/test.spec.js`
- **Integration Tests (Kit)**: `pnpm test:kit`
- **Single Integration Suite**: `pnpm -F {name-of-suite} test` (Find suite name in `packages/kit/test/apps/*/package.json`)
- **Single Playwright Test**: `cd packages/kit/test/apps/basics && npx playwright test --grep "test name"`
- **Other Package Tests**: `pnpm test:others`
- **Core Svelte Tests**: `pnpm test`
- **Filter Tests**: `pnpm test <suite-name> -t <test-name>`
- **Update Snapshots**: `UPDATE_SNAPSHOTS=true pnpm test` or `npx vitest -u`

## Contribution Commands
- **Changesets**: `pnpm changeset` (prefix with `fix`, `feat`, `breaking`, or `chore`)
- **Generate Types (Kit)**: `pnpm -F @sveltejs/kit prepublishOnly`
- **Generate Types (Core)**: `pnpm generate:types`
- **Sync All**: `pnpm sync-all` (Synchronizes all packages and documentation across the monorepo)

## Troubleshooting & Setup
- **Install Playwright**: `pnpm playwright install chromium`
- **Install OS Deps (Ubuntu)**: `npx playwright install-deps`
- **Sync Project**: `pnpm -F @sveltejs/kit sync` (Regenerates routing info and types)
