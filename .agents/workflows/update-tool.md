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
  * (B) Scan `../references/**` to find all relevant documentation, including "how to use", "best practices", "user guides", and all versioned release notes.
  * (C) Extract and summarize the core features, idiomatic patterns, and established best practices from the identified documentation.
  * (D) Process these findings systematically (chronologically if versioned):
    * Update `rules/**`, `skills/**`, and `workflows/**` to incorporate the identified best practices.
    * **Priority**: Modern best practices and features MUST take precedence over legacy ones.
  * (E) Merge and refactor all components to remove duplication, improve clarity, and reduce token usage.
  * **Standardization**: Ensure all created/modified components follow the structures (YAML frontmatter, directory layout) defined in `@[/google-antigravity]`.

# Step 2: Define Evaluation Workflow
* Set the content of `[NAME]/[VERSION]/antigravity/workflow-evaluate.md` to the following steps:
  * **Requirement**: Use the `@[/google-antigravity]` skill to analyze component effectiveness.
  * (A) Read all existing files in `rules/**`, `skills/**`, and `workflows/**`.
  * (B) Identify all relevant documentation in `../references/**` (e.g., "how to use", "best practices", "user guides", versioned references).
  * (C) Extract the core features and recommended best practices for the tool from the identified documentation.
  * **Cumulative Gap Analysis**:
    * Compare the features and best practices identified in (C) against the implementation in (A).
    * List specific missing items or areas for improvement.
    * Provide a coverage estimate (e.g., "90% - missing advanced optimization rules").
  * **Quality Check**: Verify that all components follow the `@[/google-antigravity]` best practices.

# Step 3: Execute Evaluation
* Run the newly updated `[NAME]/[VERSION]/antigravity/workflow-evaluate.md` and report the findings to the user.