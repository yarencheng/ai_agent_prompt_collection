# Evaluation Workflow: golang 1.26

**Requirement**: Use the `@[/google-antigravity]` skill to analyze component effectiveness.

## (A) Read all existing files
Read all existing files in `rules/**`, `skills/**`, and `workflows/**`.

## (B) Identify references
Identify all versioned references in `../references/**` up to `1.26`.

## (C) Cumulative Gap Analysis
Perform a Cumulative Gap Analysis:
* Compare the features/rules mentioned across all references in (B) against what is implemented in (A).
* List specific missing items or areas for improvement.
* Provide a coverage estimate (e.g., "90% - missing advanced optimization rules").

## (D) Quality Check
Verify that all components follow the `@[/google-antigravity]` best practices.
