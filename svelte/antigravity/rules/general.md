---
trigger: always_on
---

# Svelte & SvelteKit Coding Conventions

Follow these rules strictly when working in the Svelte or SvelteKit repositories.

## Formatting
- **Indentation**: Use **Tabs** for all indentation. Never use spaces.
- **Quotes**: Use **single quotes** (`'`) for strings.
- **Trailing Commas**: Do **not** use trailing commas.
- **Line Length**: Limit lines to **100 characters**.
- **Auto-format**: Always run `pnpm run format` before finishing a task.

## Naming Conventions
- **Internal Members**: Use `snake_case` for internal variables, methods, and functions.
- **Public Members**: Use `camelCase` for public variables, methods, and functions.

## Imports & Exports
- **Named Exports**: Use named exports for all functions and classes. **Avoid default exports**.
- **Functions**: Use named function declarations (`export function ...`) for exported functions. Use arrow functions for internal callbacks.
- **JSDoc Imports**: Use JSDoc type imports: `/** @import { Type } from 'module' */`.

## API Design
- **Public APIs**: Provide a single object as the argument to public APIs. This object can have multiple properties.

## Monorepo Management
- **Overrides**: Use `pnpm.overrides` in the root `package.json` to test against local changes in dependencies (e.g., Vite).
- **Playground**: Use `playgrounds/basic` for local experimentation.

## Typing (JSDoc)
- Use JSDoc annotations for all function parameters and return types.
- Complex types: `/** @type {Array<{ type: string }>} */`.
- Type casting: `/** @type {Error} */ (err)`.
- Ensure `checkJs: true` and `strict: true` are honored in the environment.

## Error Handling
- Use `instanceof` to check for known error types (e.g., `HttpError`, `SvelteKitError`).
- Use optional chaining (`?.`) and nullish coalescing (`??`) for safety.

## Breaking Changes
When proposing a breaking change, include the following checklist in the PR description:
- **Who does this affect**:
- **How to migrate**:
- **Why make this breaking change**:
- **Severity**: (number of people affected x effort)

## RFC Process
Proposals for large new features or major changes must go through the RFC process.
1. Discuss the idea in the community/Discord.
2. Create an RFC in the `sveltejs/rfcs` repository.
3. Wait for feedback and approval from maintainers before implementing.

## Documentation Synchronization
When changing APIs or features:
1. Update the relevant `.md` files in the `documentation/` directory.
2. Use `pnpm sync-all` to ensure documentation and packages remain in sync.
3. Review generated types and documentation previews before submission.