---
trigger: always_on
---

# Svelte & SvelteKit Coding Conventions

Follow these rules strictly when working in the Svelte or SvelteKit repositories.

## Reactivity (Svelte 5 Runes)
Svelte 5 uses runes for explicit reactivity. **Always use runes mode for new code.**
- **State**: Use `$state` for reactive variables. Use `$state.raw` for large collections or objects that don't need deep reactivity (e.g., API responses).
- **Derivations**: Use `$derived` for state that depends on other state. Use `$derived.by` for complex logic. `$derived` is writable and will re-evaluate when its expression changes.
- **Effects**: Use `$effect` for side effects that synchronize with the DOM or external systems. Prefer `{@attach ...}` for library synchronization and `$derived` for state derivations.
- **Props**: Use `$props` to receive component properties through destructuring. Treat props as though they will change; use `$derived` for values dependent on props.
- **Binding**: Use `$bindable` to denote props that can be bound to by the parent.
- **Debugging**: Use `$inspect` to trace state changes and `$inspect.trace(label)` as the first line of an effect or derivation to identify dependencies.
- **External**: Use `createSubscriber` for observing things external to Svelte.
- **Legacy**: Avoid `export let` (use `$props`), `$: ` (use `$derived`), `createEventDispatcher` (use callback props), `<svelte:component this={...}>` (use `<DynamicComponent>`), and `<svelte:self>` (use explicit import).

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
- **Logic Files**: Use `.svelte.js` or `.svelte.ts` file extensions for modules that use runes.

## API Design & Events
- **Public APIs**: Provide a single object as the argument to public APIs.
- **Event Handlers**: Use callback props (e.g., `onclick`, `onchange`) instead of the `on:` directive. Use `<svelte:window>` and `<svelte:document>` for global listeners instead of `onMount`.
- **Snippets**: Use snippets (`{#snippet ...}`) and the `{@render ...}` tag instead of slots. Snippets declared at the top level are available in `<script>`.
- **Attributes**: Use clsx-style arrays and objects in `class` attributes instead of the `class:` directive.

## Styling
- **Custom Properties**: Use the `style:` directive (e.g., `style:--columns={columns}`) to pass JS variables to CSS.
- **Child Styling**: Prefer CSS custom properties (`--prop`) for styling child components. Use `:global` only as a last resort for library components.

## Accessibility
- **Titles**: Provide unique, descriptive titles using `<svelte:head>` on every page for route announcements.
- **Focus**: Use `afterNavigate` or the `keepFocus` option in `goto` to manage user focus after navigations.
- **Language**: Set the correct `lang` attribute in `app.html` or dynamically via the `handle` hook.

## Context
- **Type Safety**: Use `createContext` instead of `setContext`/`getContext` for type safety.
- **Leaking**: Use context to scope state and prevent leaks between users during SSR.

## Monorepo Management
- **Overrides**: Use `pnpm.overrides` in the root `package.json` to test against local changes.
- **Playground**: Use `playgrounds/basic` for local experimentation.
- **Test Strategy**: Avoid creating new test projects under `packages/kit/test/apps` but reuse an existing one when possible. Use keyed `{#each}` blocks for better DOM performance.

## Typing (JSDoc)
- Use JSDoc annotations for all function parameters and return types.
- **Public API Examples**: Use `@example` with code blocks for public APIs.
- **Type Generation**: Review generated types but **DO NOT** format them with Prettier.

## Error Handling
- Use `instanceof` to check for known error types (e.g., `HttpError`).
- Use optional chaining (`?.`) and nullish coalescing (`??`) for safety.

## RFC Process
Proposals for large new features must go through the RFC process.
1. Discuss in community/Discord.
2. Create an RFC in `sveltejs/rfcs`.
3. Wait for approval before implementation.

## Documentation Synchronization
- Update `.md` files in the `documentation/` directory when changing APIs.
- Use `pnpm sync-all` to ensure documentation and packages remain in sync.