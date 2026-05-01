#!/bin/bash

# scripts/download.sh
# Automates downloading rules, skills, and workflows for specified tools using curl and GitHub API.

set -e

TOOLS=("$@")

if [ ${#TOOLS[@]} -eq 0 ]; then
    echo "Usage: $0 tool_1 tool_2 ..."
    exit 1
fi

if ! command -v jq &> /dev/null; then
    echo "Error: 'jq' is required but not found. Please install jq and try again."
    exit 1
fi

# Function to read input from /dev/tty to support piped execution
ask_yes_no() {
    local prompt=$1
    local default=$2
    local choice
    printf "%s [%s] " "$prompt" "$default" >&2
    read choice < /dev/tty || true
    choice=${choice:-$default}
    case "$choice" in
        [Yy]*) return 0 ;;
        *) return 1 ;;
    esac
}

ask_folder() {
    local prompt=$1
    local default=$2
    local folder
    printf "%s [%s] " "$prompt" "$default" >&2
    read folder < /dev/tty || true
    echo "${folder:-$default}"
}

# Task 1/3: Rules
DOWNLOAD_RULES=false
RULES_FOLDER=""
if ask_yes_no "Download rules?" "Y"; then
    DOWNLOAD_RULES=true
    RULES_FOLDER=$(ask_folder "rules folder?" ".agents/rules")
fi

# Task 2/3: Skills
DOWNLOAD_SKILLS=false
SKILLS_FOLDER=""
if ask_yes_no "Download skills?" "Y"; then
    DOWNLOAD_SKILLS=true
    SKILLS_FOLDER=$(ask_folder "skills folder?" ".agents/skills")
fi

# Task 3/3: Workflows
DOWNLOAD_WORKFLOWS=false
WORKFLOWS_FOLDER=""
if ask_yes_no "Download workflows?" "Y"; then
    DOWNLOAD_WORKFLOWS=true
    WORKFLOWS_FOLDER=$(ask_folder "workflows folder?" ".agents/workflows")
fi

if ! $DOWNLOAD_RULES && ! $DOWNLOAD_SKILLS && ! $DOWNLOAD_WORKFLOWS; then
    echo "Nothing to download. Exiting."
    exit 0
fi

# Fetch the repository file tree
echo "Fetching repository file tree..."
TREE_FILE=$(mktemp)
cleanup() {
    rm -f "$TREE_FILE"
}
trap cleanup EXIT

# Using Git Tree API to get all files recursively in one call
curl -s "https://api.github.com/repos/yarencheng/ai_agent_prompt_collection/git/trees/main?recursive=1" -o "$TREE_FILE"

BASE_RAW_URL="https://raw.githubusercontent.com/yarencheng/ai_agent_prompt_collection/main"

# Process each tool
for TOOL in "${TOOLS[@]}"; do
    echo "Processing tool: $TOOL"
    
    # Check if tool exists in the tree
    if ! jq -e ".tree[] | select(.path | startswith(\"$TOOL/\"))" "$TREE_FILE" > /dev/null; then
        echo "Error: Tool '$TOOL' not found in repository."
        exit 1
    fi

    # Rules
    if $DOWNLOAD_RULES; then
        # Find all files in [TOOL]/antigravity/rules/
        # Filter for .md files as requested
        jq -r '.tree[] | select(.path | test("^'$TOOL'/antigravity/rules/.*\\.md$")) | .path' "$TREE_FILE" | while read -r path; do
            filename=$(basename "$path")
            dest="$RULES_FOLDER/$TOOL-$filename"
            mkdir -p "$(dirname "$dest")"
            echo "  + Rules: $filename -> $TOOL-$filename"
            curl -sL "$BASE_RAW_URL/$path" -o "$dest"
        done
    fi

    # Skills
    if $DOWNLOAD_SKILLS; then
        # Find all files in [TOOL]/antigravity/skills/
        # Example path: golang/antigravity/skills/generics/SKILL.md
        # Target path: .agents/skills/golang-generics/SKILL.md
        jq -r '.tree[] | select(.path | startswith("'$TOOL'/antigravity/skills/")) | select(.type == "blob") | .path' "$TREE_FILE" | while read -r path; do
            # Extract the skill name and subpath
            # path is tool/antigravity/skills/skill_name/sub/path
            # We want to replace tool/antigravity/skills/skill_name with tool-skill_name
            
            # Use sed to transform the path
            # From: tool/antigravity/skills/skill_name/rest
            # To: tool-skill_name/rest
            rel_path=$(echo "$path" | sed -E "s|^$TOOL/antigravity/skills/([^/]+)/?|${TOOL}-\1/|")
            dest="$SKILLS_FOLDER/$rel_path"
            
            mkdir -p "$(dirname "$dest")"
            echo "  + Skill: $rel_path"
            curl -sL "$BASE_RAW_URL/$path" -o "$dest"
        done
    fi

    # Workflows
    if $DOWNLOAD_WORKFLOWS; then
        # Find all files in [TOOL]/antigravity/workflows/
        jq -r '.tree[] | select(.path | test("^'$TOOL'/antigravity/workflows/.*\\.md$")) | .path' "$TREE_FILE" | while read -r path; do
            filename=$(basename "$path")
            dest="$WORKFLOWS_FOLDER/$TOOL-$filename"
            mkdir -p "$(dirname "$dest")"
            echo "  + Workflow: $filename -> $TOOL-$filename"
            curl -sL "$BASE_RAW_URL/$path" -o "$dest"
        done
    fi
done

echo "Download completed successfully."
