#!/bin/bash
# List available go fix modernizers

if [[ "$1" == "--help" ]]; then
  echo "Usage: list-modernizers.sh [path]"
  echo "Lists available go fix modernizers for the given path (defaults to current directory)."
  exit 0
fi

path=${1:-"."}

# Assuming Go 1.26+ is installed
go fix -list "$path"
