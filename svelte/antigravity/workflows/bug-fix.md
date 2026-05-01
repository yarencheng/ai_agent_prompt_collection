---
description: Standard workflow for fixing a bug and preparing a pull request in Svelte/SvelteKit.
---

# Bug Fix & PR Prep Workflow

1. **Reproduction**:
   - Create a minimal reproduction case in `packages/kit/test/apps/` (for Kit) or `tests/` (for Svelte).
   - **Best Practice**: Reuse an existing test project in `packages/kit/test/apps` instead of creating a new one if possible.
   - Verify the failure using `pnpm test <suite> -t <test-name>`.
   - If browser tests fail, ensure Playwright is installed: `pnpm playwright install chromium`.

2. **Implementation**:
   - Run `pnpm -F @sveltejs/kit sync` (or `pnpm sync-all`) to ensure routing info and types are up to date.
   - Apply the fix following the `rules/general.md` conventions (Tabs, Single Quotes, No Trailing Commas, `snake_case` internal).
   - Use JSDoc for any new functions or parameters, including `@example` for public APIs.
   - Use **inline comments** for clarifications in complex logic.

3. **Validation**:
   - Run `pnpm build` to ensure all packages are up to date.
   - Run the specific test that was failing to confirm the fix.
   - If output changes are expected, run snapshot update commands: `UPDATE_SNAPSHOTS=true pnpm test`.
   - Run all unit tests: `pnpm -F @sveltejs/kit test:unit`.

4. **Pre-submission**:
   - **Mandatory Sequence**:
     1. `pnpm run format` (Indentation: Tabs, 100 char width).
     2. `pnpm run lint` (Check code style; don't cancel early).
     3. `pnpm run check` (Type checking; don't cancel early).
     4. `pnpm -F @sveltejs/kit test:unit` (Re-verify unit tests).
   - For Kit changes: Run `pnpm -F @sveltejs/kit prepublishOnly` to regenerate types. **Do NOT** format the generated output with Prettier.
   - Run `pnpm sync-all` to ensure documentation and packages are synchronized.

5. **Changeset**:
   - Run `pnpm changeset`.
   - Select the affected packages.
   - Provide a description prefixed with `fix:`, `feat:`, `breaking:`, or `chore:`.

6. **Final Check**:
   - Verify no accidental `console.log` or debug statements remain.
   - Ensure the PR description includes a **test plan** and screenshots if UI changed.
   - If a breaking change, use the required template in `rules/general.md`.
