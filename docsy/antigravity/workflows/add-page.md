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
    - Use **present tense** (except for Changelogs or describing past releases).
    - Follow the Google Developer Documentation Style Guide.
    - Use appropriate Docsy shortcodes (e.g., `{{% notice %}}`, `{{% blocks/section %}}`).
    - Use `prettier-ignore` comments to protect complex template logic.
5.  **Format and Lint Check**:
    - Run `npm run check:format` and `npm run check:markdown`.
    - Apply fixes with `npm run fix:format` and `npm run fix:markdown` if necessary.
6.  **Verify Build**:
    - Run `hugo serve --themesDir ../..` from `docsy.dev`.
    - Preview the AI-friendly version with `hugo serve --output LLMS`.
    - Alternatively, use `docker-compose up` to preview in a container.
7.  **Submit**:
    - Prefix the PR with `WIP` until it is ready for final review.
    - Sign the CLA if you haven't already.

