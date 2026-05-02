---
description: Evaluate the AI agent configurations against reference
---
 
# Evaluation Workflow
* **Constraints**:
  * **Workdir Isolation**: This workflow MUST only operate within its own workdir (the tool directory). Do NOT access or use any files outside of this directory.
  * **Path Blindness**: Do NOT use any information outside this workdir. **All output (gap analysis, quality checks) MUST be agnostic to the local environment.** Do NOT include path-specific information in any reports or summaries.
  * **General Evaluation**: Do NOT focus on a specific reason or incremental update path. Evaluate the tool components as a whole against all available documentation in the workdir.
* **Requirement**: Follow Antigravity design principles to manage all agent components, including advanced CVE JSON V5 features and maintenance procedures.
* (A) Read all existing files in `rules/**`, `skills/**`, and `workflows/**` (relative to the `antigravity/` directory).
* (B) Identify all relevant documentation in `../references/**` (e.g., "how to use", "best practices", "user guides", references).
* (C) Extract the core features and recommended best practices for the tool from the identified documentation.
* **Cumulative Gap Analysis**:
  * Compare the features and best practices identified in (C) against the implementation in (A).
  * List specific missing items or areas for improvement.
  * Provide a coverage estimate (e.g., "90% - missing advanced optimization rules").
* **Standardization**: Ensure all created/modified components follow standardized structures (YAML frontmatter, directory layout) and `@[/google-antigravity]` best practices.
