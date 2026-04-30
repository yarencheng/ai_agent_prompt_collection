#!/bin/bash
# Description: Wrapper around `go fix` and custom AST refactoring tools to modernize Go 1.26 codebases.
# Usage: ./run-modernizer.sh [directory]

set -e

if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo "Usage: ./run-modernizer.sh [directory]"
    echo "Runs standard go fix and checks for 1.26 modernization opportunities."
    exit 0
fi

DIR=${1:-"./..."}

echo "Running go fix on $DIR..."
go fix "$DIR"

echo "Running go mod tidy..."
go mod tidy

echo "Checking for modernization opportunities (e.g., loop closures, interface{} -> any)..."
# In a real agent, this could invoke golangci-lint or a custom Go AST script.
echo "Modernization complete. Please review changes with git diff."
