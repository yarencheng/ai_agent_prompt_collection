# Svelte Code Style Example

Example of idiomatic Svelte/SvelteKit code following all conventions.

```javascript
/** @import { Handle, RequestEvent } from '@sveltejs/kit' */
import { HttpError, SvelteKitError } from '@sveltejs/kit/internal';

/**
 * Coalesce an unknown error into a standard Error object.
 * 
 * @example
 * ```js
 * const error = coalesce_to_error(err);
 * ```
 * 
 * @param {unknown} error
 * @returns {Error}
 */
export function coalesce_to_error(error) {
	if (error instanceof Error) return error;

	// fallback for non-Error types
	return new Error(String(error));
}

/**
 * Standard SvelteKit handle function example.
 * 
 * @type {Handle}
 */
export const handle = async ({ event, resolve }) => {
	try {
		const response = await resolve(event);
		return response;
	} catch (err) {
		// handle known kit errors
		if (err instanceof HttpError || err instanceof SvelteKitError) {
			throw err;
		}

		const error = coalesce_to_error(err);
		console.error(error);
		
		return new Response(error.message, { status: 500 });
	}
};
```
