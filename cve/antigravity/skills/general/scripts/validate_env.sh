#!/bin/bash
# validate_env.sh: Check if the required CVE data and schema references are available.

# We expect these relative to the workspace root or via environment variables
CVELIST_ROOT=${CVELIST_ROOT:-"cve/references/github.com/CVEProject/cvelistV5"}
SCHEMA_ROOT=${SCHEMA_ROOT:-"cve/references/github.com/CVEProject/cve-schema.git/schema"}

echo "Checking environment..."

if [ -d "$CVELIST_ROOT" ]; then
    echo "✅ CVE List: Found at $CVELIST_ROOT"
else
    echo "❌ CVE List: NOT FOUND at $CVELIST_ROOT"
    echo "   Action: git clone https://github.com/CVEProject/cvelistV5.git into references"
fi

if [ -d "$SCHEMA_ROOT" ]; then
    echo "✅ CVE Schema: Found at $SCHEMA_ROOT"
else
    echo "❌ CVE Schema: NOT FOUND at $SCHEMA_ROOT"
    echo "   Action: git clone https://github.com/CVEProject/cve-schema.git into references"
fi

# Check for tools
for tool in "ajv" "python3" "grep" "find"; do
    if command -v $tool >/dev/null 2>&1; then
        echo "✅ Tool: $tool is available"
    else
        echo "⚠️ Tool: $tool is MISSING"
    fi
done
