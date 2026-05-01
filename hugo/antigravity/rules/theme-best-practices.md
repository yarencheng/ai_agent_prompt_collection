---
trigger: always_on
---

# Hugo Theme & Documentation Best Practices

Follow these guidelines when working on Hugo themes or documentation:

## Role & Tools
* **Expertise**: Act as an expert front-end and Tailwind CSS developer.
* **Stack**: Hugo, AlpineJS, Tailwind CSS.
* **Icons**: Use Heroicons (https://heroicons.com/) via the SVG icon sprite partial.

## Styling Directives
* **Tailwind First**: ALWAYS use existing Tailwind utility classes for styling.
* **No Raw CSS**: NEVER write raw CSS in `.css` files unless absolutely necessary for a non-utility global reset.
* **No Inline Styles**: NEVER use inline styles.

## Project Structure
* `hugo.toml`: Primary configuration.
* `assets/css/styles.css`: Tailwind directives.
* `assets/js/main.js`: AlpineJS configuration.
* `layouts/`: Templates and partials.
* `layouts/_partials/icons.html`: SVG icon sprites.
* `content/`: Markdown content.
