# Svelte Code Style Example

Example of idiomatic Svelte/SvelteKit code following all conventions, including Svelte 5 Runes and accessibility.

## Utility Function (JSDoc & snake_case)

```javascript
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
```

## Svelte 5 Component (Runes, Snippets, Accessibility)

```svelte
<script>
	/** @type {{ title: string, items: Array<{ id: string, name: string }> }} */
	let { title, items } = $props();

	let filter_text = $state('');
	
	// Use $derived for state that depends on other state
	let filtered_items = $derived(
		items.filter((item) => item.name.toLowerCase().includes(filter_text.toLowerCase()))
	);

	/** @param {Event} event */
	function handle_input(event) {
		const target = /** @type {HTMLInputElement} */ (event.target);
		filter_text = target.value;
	}
</script>

<svelte:head>
	<title>{title}</title>
</svelte:head>

<section>
	<h1>{title}</h1>

	<label for="search">Search items:</label>
	<input
		id="search"
		type="text"
		value={filter_text}
		oninput={handle_input}
		placeholder="Filter..."
	/>

	{#if filtered_items.length > 0}
		<ul>
			{#each filtered_items as item (item.id)}
				<li>
					{#if item.name.startsWith('!')}
						{@render alert_item(item.name)}
					{:else}
						{item.name}
					{/if}
				</li>
			{/each}
		</ul>
	{:else}
		<p>No items found.</p>
	{/if}
</section>

{#snippet alert_item(name)}
	<strong class="alert">{name}</strong>
{/snippet}

<style>
	/* Use Tabs for indentation */
	section {
		padding: 1rem;
	}

	.alert {
		color: var(--alert-color, red);
	}
</style>
```
