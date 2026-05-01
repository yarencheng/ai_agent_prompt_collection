# AI Agent Prompt Collection

A curated collection of AI Agent configurations—rules, skills, and workflows—optimized for automated generation and expert-level development.

## 🛠 Contributing New Tools

Adding a new technology to this collection is fully automated:

1.  **Initialize**: Run the global workflow:
    ```bash
    /init-new-tool <tool-name>
    ```
2.  **References**: Add documentation or reference links in `<tool-name>/references/`.
3.  **Generate**: Run the local update workflow:
    ```bash
    /<tool-name>/antigravity/workflow-update.md
    ```
4.  **Evaluate**: Verify quality with:
    ```bash
    /<tool-name>/antigravity/workflow-evaluate.md
    ```

## 🚀 Using the Collection

Browse the directories to find expert-level prompts and configurations for your specific technology stack:
*   [**Golang**](./golang/antigravity/) - Idiomatic patterns, observability, and migration workflows.
*   [**Docker**](./docker/antigravity/) - Security-focused Dockerfiles and Compose best practices.
*   [**Docsy**](./docsy/antigravity/) - Technical documentation standards and content workflows.
*   [**Hugo**](./hugo/antigravity/) - Theme development and static site best practices.
*   [**Svelte**](./svelte/antigravity/) - Modern frontend patterns and component architecture.

Simply copy the relevant `.md` files to your agent's configuration directory (e.g., `.antigravity/` or `.cursor/rules/`).

---
*All configurations are AI-generated and continuously refined.*
