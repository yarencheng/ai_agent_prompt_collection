# Performance Investigation Example

Example of a performance bottleneck analysis and optimization.

## Profiling Results
- **Scenario**: Rendering a list of 10,000 items with complex logic.
- **Observation**: UI freezes for ~2 seconds during initial render.
- **Flame Graph Analysis**: `validate_component` and `update_text` are taking 80% of the CPU time.
- **Memory**: Heap usage spikes by 200MB during render.

## Analysis
The bottleneck is caused by excessive reactivity in the list item component. Each item is tracking several derived values that don't need to be reactive once rendered.

## Optimization Applied
1. Moved non-reactive logic out of the component template.
2. Used `untrack` where appropriate to prevent unnecessary dependency tracking.
3. Implemented virtualization for the list to reduce the number of DOM nodes.

## Verification
- **Scenario**: Same rendering scenario.
- **Result**: UI remains responsive. Initial render time reduced to ~200ms (90% improvement).
- **Memory**: Heap usage spike reduced to 20MB.
