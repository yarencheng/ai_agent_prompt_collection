---
description: Standard workflow for fixing a bug and preparing a pull request in Svelte/SvelteKit.
---

# Bug Fix & PR Prep Workflow

1. **Reproduction**:
   - Create a minimal reproduction case in `packages/kit/test/apps/` (for Kit) or `tests/` (for Svelte).
   - Verify the failure using `pnpm test <suite> -t <test-name>`.

2. **Implementation**:
   - Apply the fix following the `rules/general.md` conventions (Tabs, Single Quotes, No Trailing Commas).
   - Use JSDoc for any new functions or parameters.

3. **Validation**:
   - Run `pnpm build` to ensure all packages are up to date.
   - Run the specific test that was failing to confirm the fix.
   - Run all unit tests: `pnpm -F @sveltejs/kit test:unit`.

4. **Pre-submission**:
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
