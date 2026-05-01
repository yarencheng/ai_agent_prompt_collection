#!/bin/bash

# scripts/git_pull_every_submodule.sh
# Iterates through all submodules, pulls latest changes, and commits them.

set -e

# Get all submodule paths from .gitmodules
submodule_paths=$(git config --file .gitmodules --get-regexp path | awk '{ print $2 }')

for sm_path in $submodule_paths; do
    echo "----------------------------------------------------------"
    echo "Processing submodule: $sm_path"
    
    # Check if directory exists
    if [ ! -d "$sm_path" ]; then
        echo "Warning: Directory $sm_path does not exist. Skipping."
        continue
    fi

    # Pull changes in submodule
    echo "Executing git pull in $sm_path..."
    (
        cd "$sm_path"
        # Try to pull current branch, or fallback to master/main
        BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --abbrev-ref HEAD 2>/dev/null)
        if [ "$BRANCH" = "HEAD" ]; then
            # Detached HEAD, try to find the remote's default branch
            BRANCH=$(git remote show origin | grep 'HEAD branch' | cut -d' ' -f5)
        fi
        git pull origin "$BRANCH"
    )

    # Stage and commit the change in parent repo
    echo "Committing update for $sm_path in parent repository..."
    git add "$sm_path"
    
    # Only commit if there are changes
    if ! git diff --cached --quiet "$sm_path"; then
        git commit -m "chore(submodule): update $sm_path to latest"
    else
        echo "No changes to commit for $sm_path."
    fi
done

echo "----------------------------------------------------------"
echo "All submodules processed."
