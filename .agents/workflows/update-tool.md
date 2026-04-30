---
description: Update the workflow files for a specific tool version
---

# Parameters
1. Name: Name of the tool (e.g., golang)
2. Version: Version of the tool (e.g., 1.22)

# Step 0: Validation
* Verify that the directory `[NAME]/[VERSION]/antigravity` exists.
* If it does not exist, stop and inform the user that they should run `init-new-tool` first.

# Step 1: Define Update Workflow
* Set the content of `[NAME]/[VERSION]/antigravity/workflow-update.md` to the following steps:
  * **Requirement**: Use the `@[/google-antigravity]` skill to manage all agent components.
  * (A) Read all existing files in `rules/**`, `skills/**`, and `workflows/**`.
  * (B) Scan `../references/**` for all versioned documentation (e.g., release notes, spec changes like `go1.x.md`).
  * (C) Filter (B) for versions from the first version (or first compatible version) up to `[VERSION]`.
  * (D) Process the filtered references in **chronological order** (oldest to newest):
    * Extract and update `rules/**`, `skills/**`, and `workflows/**`.
    * **Priority**: If information in a newer reference contradicts or updates an older one, the newer version's content MUST be used.
  * Merge and refactor all components to remove duplication, improve clarity, and reduce token usage.
  * **Standardization**: Ensure all created/modified components follow the structures (YAML frontmatter, directory layout) defined in `@[/google-antigravity]`.

# Step 2: Define Evaluation Workflow
* Set the content of `[NAME]/[VERSION]/antigravity/workflow-evaluate.md` to the following steps:
  * **Requirement**: Use the `@[/google-antigravity]` skill to analyze component effectiveness.
  * (A) Read all existing files in `rules/**`, `skills/**`, and `workflows/**`.
  * (B) Identify all versioned references in `../references/**` up to `[VERSION]`.
  * Perform a Cumulative Gap Analysis:
    * Compare the features/rules mentioned across all references in (B) against what is implemented in (A).
    * List specific missing items or areas for improvement.
    * Provide a coverage estimate (e.g., "90% - missing advanced optimization rules").
  * **Quality Check**: Verify that all components follow the `@[/google-antigravity]` best practices.

# Step 3: Execute Evaluation
* Run the newly updated `[NAME]/[VERSION]/antigravity/workflow-evaluate.md` and report the findings to the user.