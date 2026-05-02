#!/bin/bash
# validate_json.sh: Validate a CVE record against the JSON V5 schema.

FILE=$1
SCHEMA_DIR=$2

if [ -z "$FILE" ] || [ -z "$SCHEMA_DIR" ]; then
  echo "Usage: $0 <path-to-cve-json> <path-to-schema-dir>"
  exit 1
fi

# Determine version
VERSION=$(grep -o '"dataVersion": "[^"]*"' "$FILE" | cut -d'"' -f4)

if [ -z "$VERSION" ]; then
  echo "Error: Could not determine dataVersion from $FILE"
  exit 1
fi

echo "Validating $FILE against schema version $VERSION..."

# Find the specific schema file
SCHEMA_FILE="$SCHEMA_DIR/CVE_Record_Format.json"
if [ ! -f "$SCHEMA_FILE" ]; then
    # Fallback to versioned schemas if they exist in subdirs
    SCHEMA_FILE="$SCHEMA_DIR/$VERSION/CVE_Record_Format.json"
fi

if [ ! -f "$SCHEMA_FILE" ]; then
  echo "Error: Schema file not found at $SCHEMA_FILE"
  exit 1
fi

# Use ajv-cli if available, otherwise suggest it
if command -v ajv >/dev/null 2>&1; then
  ajv validate -s "$SCHEMA_FILE" -d "$FILE"
else
  echo "Requirement: ajv-cli (npm install -g ajv-cli)"
  echo "Command: ajv validate -s $SCHEMA_FILE -d $FILE"
fi
