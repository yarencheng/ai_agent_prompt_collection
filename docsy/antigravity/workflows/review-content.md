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
    - Does the Changelog use **past tense**?
3.  **Check List Punctuation**:
    - Do complete sentences in lists have periods?
    - Are fragments in lists free of periods?
4.  **Verify Formatting and Linting**:
    - Has `npm run check:format` been run?
    - Has `npm run check:markdown` been run?
    - Are complex shortcodes protected with `prettier-ignore`?
5.  **Build Check**:
    - Check the **Netlify deploy preview** in the PR status.
    - Does the site build without errors?
    - Does the `LLMS` output format render correctly?
6.  **Compliance**:
    - Is the contributor CLA compliant?
    - Is the PR title prefixed with `WIP` if still in progress?

