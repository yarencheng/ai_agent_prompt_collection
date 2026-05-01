#!/bin/bash
# Scan for potentially unsafe file operations that could benefit from os.Root

if [[ "$1" == "--help" ]]; then
  echo "Usage: scan-unsafe-fs.sh [path]"
  echo "Scans for os.Open, os.Create, etc. that use string concatenation or paths that might escape a root."
  exit 0
fi

path=${1:-"."}

echo "Searching for potentially unsafe filesystem operations in $path..."
grep -rE "os\.(Open|Create|OpenFile|Mkdir|Remove)\(.*\+.*\)" "$path"
grep -rE "os\.(Open|Create|OpenFile|Mkdir|Remove)\(.*\.\.\/.*\)" "$path"
