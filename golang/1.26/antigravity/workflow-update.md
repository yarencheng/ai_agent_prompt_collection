---
description: Update the golang/1.26 tool rules, skills, and workflows based on references.
---

* **Requirement**: Use the `@[/google-antigravity]` skill to manage all agent components.
* Read all existing files in `rules/**`, `skills/**`, and `workflows/**`.
* Merge files if they have duplicated content.
* Refactor files if they have overlapping content to improve clarity and reduce token usage.
* Read all reference files in `../references/**`.
* Extract any rules for using golang/1.26 and update `rules/**`.
* Extract any skills for using golang/1.26 and update `skills/**`.
* Extract any workflows for using golang/1.26 and update `workflows/**`.
* **Standardization**: Ensure all created/modified components follow the structures (YAML frontmatter, directory layout) defined in `@[/google-antigravity]`.