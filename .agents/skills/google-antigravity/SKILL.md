# Google Antigravity Component Manager

Expert at creating and managing Google Antigravity components (Skills, Rules, and Workflows). This skill ensures all components follow Google Antigravity best practices for modularity, clarity, and effectiveness.

## Purpose
Use this skill when you need to:
- Create a new Antigravity Skill, Rule, or Workflow.
- Refactor existing agent components to follow best practices.
- Decide which component type is best for a specific task.

## Best Practices
1. **Focus**: Each skill should do one thing well. Avoid "Swiss Army Knife" skills.
2. **Clarity**: Use clear, descriptive names for all components.
3. **Modularity**: Break down complex workflows into smaller, reusable steps.
4. **Executability**: Ensure scripts in the `scripts/` directory are executable and provide a `--help` flag.
5. **Rules as Guardrails**: Use rules to enforce project-wide consistency (e.g., coding style, documentation format).
6. **Workflows as Guides**: Use workflows to document complex, multi-step processes that require consistency.

## Component Structures

### Skills
Stored in `.agents/skills/[skill-name]/`.
- `SKILL.md`: Metadata and high-level instructions.
- `scripts/`: Executable scripts for the skill.
- `examples/`: Usage examples.
- `resources/`: Supporting documentation or data.

### Rules
Stored in `.agents/rules/`.
- Must contain YAML frontmatter with a `trigger` (e.g., `always_on` or specific keywords).
- Markdown body describing the rule and its application.

### Workflows
Stored in `.agents/workflows/`.
- YAML frontmatter with a `description`.
- Markdown body with clear, numbered steps.

## Decision Tree
- **Is it a repeatable sequence of actions?** -> **Workflow**
- **Is it a set of conventions or guardrails?** -> **Rule**
- **Is it a specialized capability with tools/scripts?** -> **Skill**
