# Svelte Monorepo Packages

Key packages in the Svelte and SvelteKit monorepos.

## SvelteKit (`packages/kit/`)
- `@sveltejs/kit`: Main framework runtime and core logic.
- `adapter-node`: Adapter for Node.js environments.
- `adapter-cloudflare`: Adapter for Cloudflare Pages/Workers.
- `adapter-netlify`: Adapter for Netlify.
- `adapter-vercel`: Adapter for Vercel.
- `adapter-static`: Adapter for static site generation (SSG).
- `adapter-auto`: Automatically chooses the best adapter for the environment.

## Svelte Core (`packages/svelte/`)
- `svelte`: The compiler and runtime components.

## Utilities & Others
- `@sveltejs/package`: Utilities for building Svelte packages.
- `@sveltejs/enhanced-img`: Enhanced image component for SvelteKit.
- `@sveltejs/amp`: AMP (Accelerated Mobile Pages) support.
- `playgrounds/*`: Local playgrounds for experimentation.
