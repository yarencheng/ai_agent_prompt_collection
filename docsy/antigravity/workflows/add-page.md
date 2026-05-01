---
description: Workflow for adding a new documentation page to a Docsy site.
---

# Add Documentation Page

Follow these steps to add a new page to the documentation.

1.  **Identify Location**: Determine where the new page fits in the `content/` hierarchy.
2.  **Create File**: Create a new `.md` file in the identified directory.
3.  **Configure Front Matter**:
    - Add a `title` and a `description`.
    - Omit `linkTitle` if it is the same as the `title`.
    - Do NOT quote simple strings.
    - Set a `weight` if specific ordering is required.
4.  **Draft Content**:
    - Use **present tense**.
    - Follow the Google Developer Documentation Style Guide.
    - Use appropriate Docsy shortcodes (e.g., `{{% notice %}}`, `{{% blocks/section %}}`).
5.  **Review Lists**: Ensure list items follow the period usage rules (periods for complete sentences, none for fragments).
6.  **Verify Build**: Run `npm run serve` or `hugo serve` to verify the page renders correctly.
