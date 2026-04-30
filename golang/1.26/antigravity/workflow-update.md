---
description: Update the golang/1.26 tool rules, skills, and workflows based on references.
---

* **Requirement**: Use the `@[/google-antigravity]` skill to manage all agent components.
* (A) Read all existing files in `rules/**`, `skills/**`, and `workflows/**`.
* (B) Scan `../references/**` for all versioned documentation (e.g., release notes, spec changes like `go1.x.md`).
* (C) Filter (B) for versions from the first version (or first compatible version) up to 1.26.
* (D) Process the filtered references in **chronological order** (oldest to newest):
  * Extract and update `rules/**`, `skills/**`, and `workflows/**`.
  * **Priority**: If information in a newer reference contradicts or updates an older one, the newer version's content MUST be used.
* Merge and refactor all components to remove duplication, improve clarity, and reduce token usage.
* **Standardization**: Ensure all created/modified components follow the structures (YAML frontmatter, directory layout) defined in `@[/google-antigravity]`.