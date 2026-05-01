---
description: Standard workflow for fixing a bug and preparing a pull request in Svelte/SvelteKit.
---

# Bug Fix & PR Prep Workflow

1. **Reproduction**:
   - Create a minimal reproduction case in `packages/kit/test/apps/` (for Kit) or `tests/` (for Svelte).
   - Verify the failure using `pnpm test <suite> -t <test-name>`.
   - If browser tests fail, ensure Playwright is installed: `pnpm playwright install chromium`.

2. **Implementation**:
   - Run `pnpm -F @sveltejs/kit sync` (or `pnpm sync-all`) to ensure routing info and types are up to date.
   - Apply the fix following the `rules/general.md` conventions (Tabs, Single Quotes, No Trailing Commas).
   - Use JSDoc for any new functions or parameters.

3. **Validation**:
   - Run `pnpm build` to ensure all packages are up to date.
   - Run the specific test that was failing to confirm the fix.
   - If output changes are expected, run snapshot update commands: `UPDATE_SNAPSHOTS=true pnpm test`.
   - Run all unit tests: `pnpm -F @sveltejs/kit test:unit`.

4. **Pre-submission**:
   - Run `pnpm sync-all` to ensure documentation and packages are synchronized.
   - Run `pnpm run format` to ensure correct indentation (Tabs) and style.
   - Run `pnpm run lint` and `pnpm run check` to verify types and style.
   - For Kit changes, run `pnpm -F @sveltejs/kit prepublishOnly` to regenerate types.

5. **Changeset**:
   - Run `pnpm changeset`.
   - Select the affected packages.
   - Provide a description prefixed with `fix:`.

6. **Final Check**:
   - Verify no accidental `console.log` or debug statements remain.
   - Ensure `snake_case` is used for internal variables.
