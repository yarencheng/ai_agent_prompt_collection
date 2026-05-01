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

You can automatically download and configure the tools for your project using our setup script:

```bash
curl -fsSL https://raw.githubusercontent.com/yarencheng/ai_agent_prompt_collection/refs/heads/main/scripts/download.sh | sh -s <tool_name>...
```

This script will interactively download:
- **Rules**: Expert-level instructions to `.agents/rules/`
- **Skills**: Specialized agent capabilities to `.agents/skills/`
- **Workflows**: Multi-step automation guides to `.agents/workflows/`

### Available Tools:
*   [**Golang**](./golang/antigravity/) - Idiomatic patterns, observability, and migration workflows.
*   [**Docker**](./docker/antigravity/) - Security-focused Dockerfiles and Compose best practices.
*   [**Docsy**](./docsy/antigravity/) - Technical documentation standards and content workflows.
*   [**Hugo**](./hugo/antigravity/) - Theme development and static site best practices.
*   [**Svelte**](./svelte/antigravity/) - Modern frontend patterns and component architecture.


---
*All configurations are AI-generated and continuously refined.*
