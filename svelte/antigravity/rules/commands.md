---
trigger: always_on
---

# Svelte Project Commands

Standard commands for development, validation, and testing in the Svelte and SvelteKit monorepos.

## Lifecycle Commands
- **Setup**: `pnpm install --frozen-lockfile` (Initial setup may take 3-4 minutes, set 10+ min timeout)
- **Build All**: `pnpm build` (Root level, ~1-2 seconds)
- **Build Svelte Core**: `pnpm build` (Inside `packages/svelte`, builds UMD version for CommonJS/browser)
- **Format**: `pnpm run format` (~15 seconds)
- **Lint**: `pnpm run lint` (2-3 minutes, set 5+ min timeout)
- **Type Check**: `pnpm run check` (3-4 minutes, set 8+ min timeout)
- **Git Hooks**: `git config core.hookspath .githooks`

## Testing Commands
- **Unit Tests (Kit)**: `pnpm -F @sveltejs/kit test:unit` (~6 seconds)
- **Single Unit Test**: `pnpm -F @sveltejs/kit test:unit:dev path/to/test.spec.js`
- **Integration Tests (Kit)**: `pnpm test:kit` (10-30 minutes, set 60+ min timeout)
- **Single Integration Suite**: `pnpm -F {name-of-suite} test` (Find suite name in `packages/kit/test/apps/*/package.json`)
- **Single Playwright Test**: `cd packages/kit/test/apps/basics && npx playwright test --grep "test name"` (Must `cd` to workdir, no `pnpm -F` shorthand)
- **Playwright Env Vars**: Use `KIT_E2E_RETRIES=2`, `KIT_E2E_BROWSER=chromium`, etc. to augment runs.
- **Other Package Tests**: `pnpm test:others` (5-15 minutes, set 30+ min timeout)
- **Core Svelte Tests**: `pnpm test`
- **Svelte 5 Runes Tests**: `pnpm test runtime-runes`
- **Filter Tests**: `pnpm test <suite-name> -t <test-name>`
- **Update Snapshots**: `UPDATE_SNAPSHOTS=true pnpm test` or `npx vitest -u`

## Contribution Commands
- **Changesets**: `pnpm changeset` (prefix with `fix`, `feat`, `breaking`, or `chore`)
- **Generate Types (Kit)**: `pnpm -F @sveltejs/kit prepublishOnly` (Regenerates types; review but DO NOT format with Prettier)
- **Generate Types (Core)**: `pnpm generate:types`
- **Sync All**: `pnpm sync-all` (Synchronizes all packages and documentation across the monorepo)
- **Kit Sync**: `pnpm -F @sveltejs/kit sync` (Regenerates routing info and types)

## Troubleshooting & Setup
- **Install Playwright**: `pnpm playwright install chromium`
- **Install OS Deps (Ubuntu)**: `npx playwright install-deps`
- **Build Failures**: Ensure `pnpm install --frozen-lockfile` completed successfully.
- **Type Errors**: Run `pnpm -F @sveltejs/kit prepublishOnly` (Kit) or `pnpm generate:types` (Core).
