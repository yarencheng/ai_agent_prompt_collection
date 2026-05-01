---
trigger: always_on
---

# Docsy Contribution Process

Guidelines for contributing changes to the Docsy repository.

## Contribution Requirements
- **CLA**: Ensure you have signed the [Google Contributor License Agreement](https://cla.developers.google.com/).
- **WIP PRs**: Prefix PR titles with "WIP" (Work In Progress) until they are ready for review. Avoid setting `draft = true` in front matter as it blocks previews.

## Review and Preview
- **Netlify Previews**: Utilize automated Netlify deploy previews to verify changes. Click "Details" next to "Deploy preview ready" in the PR status.
- **Local Preview**: Use `hugo server --themesDir ../..` from the `docsy.dev` directory, or use Docker.

## Community
- Follow [Google's Open Source Community Guidelines](https://opensource.google.com/conduct/).
