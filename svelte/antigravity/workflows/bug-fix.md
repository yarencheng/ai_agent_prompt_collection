---
description: Standard workflow for fixing a bug and preparing a pull request in Svelte/SvelteKit.
---

# Bug Fix & PR Prep Workflow

1. **Reproduction**:
   - Create a minimal reproduction case in `packages/kit/test/apps/` (Kit) or `tests/` (Svelte).
   - **Best Practice**: Reuse an existing test project instead of creating a new one if possible.
   - Verify the failure using `pnpm test <suite> -t <test-name>`.

2. **Implementation**:
   - Run `pnpm sync-all` to ensure routing info, types, and documentation are in sync.
   - Apply the fix following `rules/general.md` conventions:
     - **Reactivity**: Use Runes (`$state`, `$derived`, `$props`). Use `$state.raw` for large data.
     - **Templating**: Use snippets, callback props, and keyed `{#each}` blocks.
     - **Styling**: Use `style:` directive or `--prop` for children.
     - **Accessibility**: Ensure unique `<title>` and proper focus management.
     - **Naming**: `snake_case` internal, `camelCase` public.
     - **Typing**: JSDoc with `@example` for public APIs.

3. **Validation**:
   - Run `pnpm build` to update all packages.
   - Confirm the fix with the specific test case.
   - Update snapshots if needed: `UPDATE_SNAPSHOTS=true pnpm test`.
   - Run all unit tests: `pnpm -F @sveltejs/kit test:unit`.
   - Run core reactivity tests: `pnpm test runtime-runes`.

4. **Pre-submission**:
   - **Mandatory Sequence**:
     1. `pnpm run format` (Tabs, 100 char width).
     2. `pnpm run lint`.
     3. `pnpm run check`.
     4. `pnpm -F @sveltejs/kit test:unit`.
   - **Type Generation**: Run `prepublishOnly` (Kit) or `generate:types` (Core). **Do NOT** format generated output.
   - **Sync**: Run `pnpm sync-all`.

5. **Changeset**:
   - Run `pnpm changeset`.
   - Provide a description prefixed with `fix:`, `feat:`, `breaking:`, or `chore:`.

6. **Final Check**:
   - Remove `console.log` or debug statements.
   - Ensure PR description includes a **test plan** and accessibility considerations.
   - If breaking, use the template in `rules/general.md`.
