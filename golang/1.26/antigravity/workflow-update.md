---
description: Update the tool components based on the latest documentation
---

# Update Workflow
* **Constraints**:
  * **Workdir Isolation**: This workflow MUST only operate within its own workdir (the tool's version directory). Do NOT access or use any files outside of this directory.
  * **Path/Version Blindness**: Do NOT use any information from the file path, directory names, or workspace path (e.g., version strings like "1.26"). Rely exclusively on the content of the files.
  * **General Update**: Do NOT focus on a specific reason or incremental update path. Update the tool components as a whole based on all available documentation in the workdir.
* **Requirement**: Use the `@[/google-antigravity]` skill to manage all agent components.
* (A) Read all existing files in `rules/**`, `skills/**`, and `workflows/**` (relative to the `antigravity/` directory).
* (B) Scan `../references/**` to find all relevant documentation, including "how to use", "best practices", "user guides", and all versioned release notes.
* (C) Extract and summarize the core features, idiomatic patterns, and established best practices from the identified documentation.
* (D) Process these findings systematically:
  * Update `rules/**`, `skills/**`, and `workflows/**` to incorporate the identified best practices.
  * **Priority**: Modern best practices and features MUST take precedence over legacy ones.
* (E) Merge and refactor all components to remove duplication, improve clarity, and reduce token usage.
* **Standardization**: Ensure all created/modified components follow the structures (YAML frontmatter, directory layout) defined in `@[/google-antigravity]`.
