#!/bin/bash
# Search for repetitive functions that could be candidates for generics

if [[ "$1" == "--help" ]]; then
  echo "Usage: scan-repetitive-funcs.sh [path]"
  echo "Searches for patterns like SumInt, SumFloat, etc."
  exit 0
fi

path=${1:-"."}

# Common patterns for repetitive functions
patterns=("Sum" "Max" "Min" "Filter" "Map" "Contains")

for p in "${patterns[@]}"; do
  echo "Searching for repetitive '$p' functions..."
  grep -rE "func $p(Int|Float|String|Uint)" "$path"
done
