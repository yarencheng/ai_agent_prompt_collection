# Svelte Performance Investigation

Specialized capability for investigating and optimizing performance in Svelte and SvelteKit.

## Purpose
Use this skill when:
- Identifying bottlenecks in the Svelte compiler or SvelteKit runtime.
- Analyzing memory leaks or CPU hotspots.
- Benchmarking changes to ensure no regressions.

## Resources
- `rules/general.md`: Coding conventions.
- `rules/commands.md`: Standard commands.

## Best Practices
1. **Empirical Measurement**: Always use profiling tools (e.g., Chrome DevTools, Node.js `--inspect`) to identify the root cause before optimizing.
2. **Isolation**: Isolate the component or logic being investigated to reduce noise in measurements.
3. **Repeatability**: Run benchmarks multiple times and use the average/median to account for variance.
4. **Flakiness Awareness**: Be aware of browser test flakiness; run tests multiple times if results are inconsistent.

## Workflow
1. **Profile**: Use `pnpm run dev` and profiling tools to capture performance data.
2. **Analyze**: Identify long-running tasks or excessive memory usage.
3. **Optimize**: Apply surgical changes following Svelte conventions.
4. **Verify**: Re-run the profile and compare results with the baseline.
