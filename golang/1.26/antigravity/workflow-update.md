---
description: Update the tool components based on the latest documentation
---

# Update Workflow
* **Requirement**: Use the `@[/google-antigravity]` skill to manage all agent components.
* (A) Read all existing files in `rules/**`, `skills/**`, and `workflows/**`.
* (B) Scan `../references/**` to find all relevant documentation, including "how to use", "best practices", "user guides", and all versioned release notes.
* (C) Extract and summarize the core features, idiomatic patterns, and established best practices from the identified documentation.
* (D) Process these findings systematically (chronologically if versioned):
  * Update `rules/**`, `skills/**`, and `workflows/**` to incorporate the identified best practices.
  * **Priority**: Modern best practices and features MUST take precedence over legacy ones.
* (E) Merge and refactor all components to remove duplication, improve clarity, and reduce token usage.
* **Standardization**: Ensure all created/modified components follow the structures (YAML frontmatter, directory layout) defined in `@[/google-antigravity]`.
