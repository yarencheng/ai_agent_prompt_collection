---
description: Update the workflow files for a tool
---

# Parameters
1. Name: Name of the tool (e.g., golang)

# Step 0: Validation
* Verify that the directory `[NAME]/antigravity` exists.
* If it does not exist, stop and inform the user that they should run `init-new-tool` first.

# Step 1: Define Update Workflow
* Set the content of `[NAME]/antigravity/workflow-update.md` to the following:
  ```markdown
  ---
  description: Update the AI agent configurations to support an 'engineer vibe' coding style.
  ---

  # Update Workflow
  * **Constraints**:
    * **Workdir Isolation**: This workflow MUST only operate within its own workdir (the tool directory). Do NOT access or use any files outside of this directory.
    * **Path Blindness**: Do NOT use any information outside this workdir. **All output (implementation plans, rules, skills, workflows) MUST be agnostic to the local environment.** Do NOT include path-specific information in any titles, summaries, or content.
    * **General Update**: Do NOT focus on a specific reason or incremental update path. Update the tool components as a whole based on all available documentation in the workdir.
  * **Requirement**: Use the `@[/google-antigravity]` skill to manage all agent components.
  * (A) Read all existing files in `rules/**`, `skills/**`, and `workflows/**` (relative to the `antigravity/` directory).
  * (B) Scan `../references/**` to find all relevant documentation, including "how to use", "best practices", "user guides", and all release notes.
  * (C) Extract and summarize the core features, idiomatic patterns, and established best practices from the identified documentation.
  * (D) Process these findings systematically:
    * Update `rules/**`, `skills/**`, and `workflows/**` to incorporate the identified best practices.
    * **Priority**: Modern best practices and features MUST take precedence over legacy ones.
  * (E) Merge and refactor all components to remove duplication, improve clarity, and reduce token usage.
  * **Standardization**: Ensure all created/modified components follow the structures (YAML frontmatter, directory layout) defined in `@[/google-antigravity]`.
  ```

# Step 2: Define Evaluation Workflow
* Set the content of `[NAME]/antigravity/workflow-evaluate.md` to the following:
  ```markdown
  ---
  description: Evaluate the AI agent configurations against reference
  ---
 
  # Evaluation Workflow
  * **Constraints**:
    * **Workdir Isolation**: This workflow MUST only operate within its own workdir (the tool directory). Do NOT access or use any files outside of this directory.
    * **Path Blindness**: Do NOT use any information outside this workdir. **All output (gap analysis, quality checks) MUST be agnostic to the local environment.** Do NOT include path-specific information in any reports or summaries.
    * **General Evaluation**: Do NOT focus on a specific reason or incremental update path. Evaluate the tool components as a whole against all available documentation in the workdir.
  * **Requirement**: Use the `@[/google-antigravity]` skill to analyze component effectiveness.
  * (A) Read all existing files in `rules/**`, `skills/**`, and `workflows/**` (relative to the `antigravity/` directory).
  * (B) Identify all relevant documentation in `../references/**` (e.g., "how to use", "best practices", "user guides", references).
  * (C) Extract the core features and recommended best practices for the tool from the identified documentation.
  * **Cumulative Gap Analysis**:
    * Compare the features and best practices identified in (C) against the implementation in (A).
    * List specific missing items or areas for improvement.
    * Provide a coverage estimate (e.g., "90% - missing advanced optimization rules").
  * **Quality Check**: Verify that all components follow the `@[/google-antigravity]` best practices.
  ```

# Step 3: Execute Evaluation
* Run the newly updated `[NAME]/antigravity/workflow-evaluate.md` and report the findings to the user.