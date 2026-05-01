#!/bin/bash

# Logic:
# 1. Read tool name from argv
# 2. Link rules files: create link .agents/rules/[TOOL_NAME] to '../../[TOOL_NAME]/antigravity/rules'
# 3. Link skills: for each folder in '[TOOL_NAME]/antigravity/skills/[SKILL_NAME]', create a link .agents/skills/[TOOL_NAME]-[SKILL_NAME] to '../../[TOOL_NAME]/antigravity/skills/[SKILL_NAME]'
# 4. Link workflows: for each files in '[TOOL_NAME]/antigravity/workflows/[WORKFLOW_NAME].md', create a link .agents/workflows/[TOOL_NAME]-[WORKFLOW_NAME] to '../../[TOOL_NAME]/antigravity/workflows/[WORKFLOW_NAME]'

set -e

TOOL_NAME=$1

if [ -z "$TOOL_NAME" ]; then
  echo "Usage: $0 <TOOL_NAME>"
  exit 1
fi

if [ ! -d "$TOOL_NAME" ]; then
  echo "Error: Tool directory '$TOOL_NAME' not found."
  exit 1
fi

# Ensure .agents directories exist
mkdir -p .agents/rules
mkdir -p .agents/skills
mkdir -p .agents/workflows

# 2. Link rules
RULES_DIR="$TOOL_NAME/antigravity/rules"
if [ -d "$RULES_DIR" ]; then
  echo "Linking rules for $TOOL_NAME..."
  ln -sfhv "../../$RULES_DIR" ".agents/rules/$TOOL_NAME"
else
  echo "No rules directory found at $RULES_DIR"
fi

# 3. Link skills
SKILLS_DIR="$TOOL_NAME/antigravity/skills"
if [ -d "$SKILLS_DIR" ]; then
  echo "Linking skills for $TOOL_NAME..."
  for skill_path in "$SKILLS_DIR"/*; do
    if [ -d "$skill_path" ]; then
      SKILL_NAME=$(basename "$skill_path")
      ln -sfhv "../../$skill_path" ".agents/skills/$TOOL_NAME-$SKILL_NAME"
    fi
  done
else
  echo "No skills directory found at $SKILLS_DIR"
fi

# 4. Link workflows
WORKFLOWS_DIR="$TOOL_NAME/antigravity/workflows"
if [ -d "$WORKFLOWS_DIR" ]; then
  echo "Linking workflows for $TOOL_NAME..."
  for workflow_path in "$WORKFLOWS_DIR"/*.md; do
    if [ -f "$workflow_path" ]; then
      WORKFLOW_FILENAME=$(basename "$workflow_path")
      ln -sfhv "../../$workflow_path" ".agents/workflows/$TOOL_NAME-$WORKFLOW_FILENAME"
    fi
  done
else
  echo "No workflows directory found at $WORKFLOWS_DIR"
fi

echo "Done linking $TOOL_NAME agent files."
