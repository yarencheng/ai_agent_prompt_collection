---
description: Workflow for reviewing documentation changes for Docsy.
---

# Review Documentation Content

Follow these steps when reviewing documentation pull requests or local changes.

1.  **Check Front Matter**:
    - Are strings unquoted where possible?
    - Is `linkTitle` dropped if redundant?
    - Is a `description` present?
2.  **Verify Style Guide**:
    - Does the content follow the Google Developer Documentation Style Guide?
    - Is the **present tense** used (except for changelogs/past releases)?
3.  **Check List Punctuation**:
    - Do complete sentences in lists have periods?
    - Are fragments in lists free of periods?
4.  **Verify Shortcodes**:
    - Are Docsy shortcodes used correctly and effectively?
5.  **Build Check**:
    - Does the site build without errors?
    - Are there any PostCSS or SCSS warnings?
