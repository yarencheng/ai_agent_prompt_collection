---
trigger: always_on
---

# Docsy Style Guide

Enforce the following writing and formatting conventions for all documentation content.

## Writing Style
- **Standard**: Follow [Google's developer documentation style guide](https://developers.google.com/style/).
- **Verb Tense**:
    - Use **present tense** for all content by default.
    - **Release/Upgrade Blog Posts**: Use present tense for the release itself ("Docsy 0.14.0 adds..."). Use **past tense** when describing behavior in previous releases.
    - **Changelog**: Use **past tense**; refer to the project's [Changelog style guide](/project/about/changelog/#style-guide).
- **Voice**: Use active voice.
- **Person**: Use second person ("you") to address the reader.

## Lists
- Use periods when list items are complete sentences or imperative steps.
- Omit periods when list items are fragments, labels, or link-only bullets.
- Keep punctuation consistent within each list.

## Formatting
- **Tools**: Use Prettier and Markdownlint.
- **Check/Fix**: Use `npm run check:format` to verify and `npm run fix:format` to apply corrections.
- **Prettier Ignores**: Use `<!-- prettier-ignore-start -->` and `<!-- prettier-ignore-end -->` to protect complex Hugo template logic (e.g., `tabpane` shortcodes) from being mangled by Prettier.
- **Links**: Ensure all links are functional and use relative paths where appropriate.

