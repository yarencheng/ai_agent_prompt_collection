---
trigger: always_on
---

# Svelte Project Commands

Standard commands for development, validation, and testing in the Svelte and SvelteKit monorepos.

## Lifecycle Commands
- **Setup**: `pnpm install --frozen-lockfile` (Initial setup may take 3-4 minutes, set 10+ min timeout)
- **Build All**: `pnpm build` (Root level, ~1-2 seconds)
- **Format**: `pnpm run format` (~15 seconds)
- **Lint**: `pnpm run lint` (2-3 minutes, set 5+ min timeout)
- **Type Check**: `pnpm run check` (3-4 minutes, set 8+ min timeout)
- **Sync All**: `pnpm sync-all` (Synchronizes all packages and documentation)

## Testing Commands
- **Unit Tests (Kit)**: `pnpm -F @sveltejs/kit test:unit` (~6 seconds)
- **Single Unit Test**: `pnpm -F @sveltejs/kit test:unit:dev path/to/test.spec.js`
- **Integration Tests (Kit)**: `pnpm test:kit` (10-30 minutes, set 60+ min timeout)
- **Single Integration Suite**: `pnpm -F {name-of-suite} test`
- **Single Playwright Test**: `cd packages/kit/test/apps/basics && npx playwright test --grep "test name"`
- **Core Svelte Tests**: `pnpm test`
- **Svelte 5 Runes Tests**: `pnpm test runtime-runes`
- **Update Snapshots**: `UPDATE_SNAPSHOTS=true pnpm test` or `npx vitest -u`

## Performance & Optimization
- **Image Optimization**: Use `@sveltejs/enhanced-img` for automatic image resizing and format conversion.
- **Bundle Analysis**: `npx rollup-plugin-visualizer` (Identify large packages in build output).
- **Profiling**: Use `pnpm run dev` with Chrome DevTools (Performance/Memory tabs).
- **Benchmarking**: Run benchmarks multiple times and use median results to account for variance.

## Contribution Commands
- **Changesets**: `pnpm changeset` (prefix with `fix`, `feat`, `breaking`, or `chore`)
- **Generate Types (Kit)**: `pnpm -F @sveltejs/kit prepublishOnly` (Review but DO NOT format with Prettier)
- **Generate Types (Core)**: `pnpm generate:types`

## Troubleshooting
- **Playwright Setup**: `pnpm playwright install chromium`
- **Type Errors**: Run `pnpm -F @sveltejs/kit prepublishOnly` (Kit) or `pnpm generate:types` (Core).
- **Build Failures**: Ensure `pnpm install` completed and all shared packages are built.
