#!/bin/bash
# Search for log.Printf and log.Fatalf to migrate to slog

if [[ "$1" == "--help" ]]; then
  echo "Usage: scan-log-calls.sh [path]"
  echo "Searches for standard library log calls that should be migrated to slog."
  exit 0
fi

path=${1:-"."}

grep -rE "log\.(Print|Fatal|Panic)(f|ln)?" "$path"
