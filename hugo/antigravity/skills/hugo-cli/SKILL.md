---
name: hugo-cli
description: Expert at using the Hugo CLI and Mage for site management, development, and deployment.
---

# Hugo CLI & Mage Expert

Expert at using the Hugo CLI and Mage for site management, development, and deployment.

## Purpose
Use this skill when you need to:
- Initialize a new Hugo site or module.
- Manage Hugo content (create, organize, metadata).
- Run the Hugo development server.
- Build and deploy Hugo sites using `hugo` or `mage`.
- Run tests and manage dependencies with `mage`.

## Instructions
1. Use `hugo env` to check the current environment.
2. Use `hugo new` for creating content or sites.
3. Use `hugo server` for development with live reload.
4. Use `hugo mod` for module management.
5. Use `mage` for building and testing the Hugo binary itself.

## Common Commands
* `hugo new site [path]`: Create a new Hugo site.
* `hugo new [path/to/content]`: Create new content.
* `hugo server -D`: Run development server with drafts enabled.
* `hugo`: Build the site to `public/`.
* `hugo env`: Display Hugo environment information.
* `hugo mod init [module]`: Initialize a new Hugo module.
* `hugo mod get -u`: Update modules.

### Mage Commands (for Hugo development)
* `mage -l`: List all available mage targets.
* `mage hugo`: Build Hugo.
* `mage install`: Install Hugo in `$HOME/go/bin`.
* `mage -v check`: Run all tests.
* `mage hugoRace`: Run tests with race detection.

## Best Practices
* Use Hugo Modules for sharing assets and configuration.
* Organize content with clear taxonomies and sections.
* Use `hugo server` to preview changes in real-time.
* Use `HUGO_BUILD_TAGS=extended mage install` for SCSS support.
