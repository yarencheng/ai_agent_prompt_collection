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
  * Read all existing files in `rules/**`, `skills/**`, and `workflows/**`.
  * Merge files if they have duplicated content.
  * Refactor files if they have overlapping content to improve clarity and reduce token usage.
  * Read all reference files in `references/**`.
  * Extract any rules for using [NAME]/[VERSION] and update `rules/**`.
  * Extract any skills for using [NAME]/[VERSION] and update `skills/**`.
  * Extract any workflows for using [NAME]/[VERSION] and update `workflows/**`.
  * **Standardization**: Ensure all created/modified components follow the structures (YAML frontmatter, directory layout) defined in `@[/google-antigravity]`.

# Step 2: Define Evaluation Workflow
* Set the content of `[NAME]/[VERSION]/antigravity/workflow-evaluate.md` to the following steps:
  * **Requirement**: Use the `@[/google-antigravity]` skill to analyze component effectiveness.
  * (A) Read all existing files in `rules/**`, `skills/**`, and `workflows/**`.
  * (B) Read all reference files in `references/**`.
  * Perform a Gap Analysis:
    * Compare the features/rules mentioned in (B) against what is implemented in (A).
    * List specific missing items or areas for improvement.
    * Provide a coverage estimate (e.g., "90% - missing advanced optimization rules").
  * **Quality Check**: Verify that all components follow the `@[/google-antigravity]` best practices.

# Step 3: Execute Evaluation
* Run the newly updated `[NAME]/[VERSION]/antigravity/workflow-evaluate.md` and report the findings to the user.