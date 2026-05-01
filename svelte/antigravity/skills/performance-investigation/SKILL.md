# Svelte Performance Investigation

Specialized capability for investigating and optimizing performance in Svelte and SvelteKit, using modern profiling and benchmarking standards.

## Purpose
Use this skill when:
- Identifying bottlenecks in the Svelte compiler or SvelteKit runtime.
- Analyzing memory leaks, CPU hotspots, or reactivity overhead.
- Benchmarking changes to ensure no regressions.
- Optimizing bundle size and asset loading (images, fonts).

## Resources
- `rules/general.md`: Coding conventions and Runes best practices.
- `rules/commands.md`: Standard commands, `runtime-runes` tests, and performance tools.

## Best Practices
1. **Empirical Measurement**: Use profiling tools (Chrome DevTools, Node.js `--inspect`) to identify the root cause. Do not optimize blindly.
2. **Isolation**: Isolate the logic being investigated to reduce noise.
3. **Repeatability**: Run benchmarks multiple times and use the **median** results to account for system variance.
4. **Rune Awareness**: Svelte 5 reactivity is runtime-based. Use `$inspect.trace` to trace state changes and `$state.raw` to optimize large datasets.
5. **Bundle Analysis**: Use `rollup-plugin-visualizer` to identify large dependencies.
6. **Asset Optimization**: Use `@sveltejs/enhanced-img` for images and preload critical fonts in the `handle` hook.

## Workflow
1. **Profile**: Use `pnpm run dev` and Chrome Performance/Memory tabs to capture data.
2. **Analyze**: Identify long-running tasks, excessive memory usage, or deep reactivity chains.
3. **Optimize**: Apply surgical changes (e.g., `$state.raw`, `$derived.by`, or database joins to prevent waterfalls).
4. **Verify**: Re-run the profile and compare median results with the baseline. Run `pnpm test runtime-runes` if applicable.
