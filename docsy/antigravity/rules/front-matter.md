---
trigger: always_on
---

# Front Matter Conventions

Enforce the following rules for Hugo front matter in markdown files.

## Rules
- **Quoting**: Do NOT quote string values unless necessary (e.g., if the string contains a colon followed by a space, or if it would be interpreted as a boolean/number).
- **Redundancy**: Drop the `linkTitle` parameter if it is identical to the `title`.
- **Description**: Every page should have a concise `description` in its front matter.
- **Weight**: Use `weight` to control the order of pages in sidebars and menus.
