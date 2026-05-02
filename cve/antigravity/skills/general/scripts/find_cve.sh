#!/bin/bash
# find_cve.sh: Locate a CVE JSON file in the cvelistV5 repository structure.

if [ -z "$1" ]; then
  echo "Usage: $0 <CVE-ID>"
  exit 1
fi

CVE_ID=$1
# Example: CVE-2024-1234
# Structure: cves/2024/1xxx/CVE-2024-1234.json

YEAR=$(echo "$CVE_ID" | cut -d'-' -f2)
ID_PART=$(echo "$CVE_ID" | cut -d'-' -f3)

# Handle IDs with different lengths
if [ ${#ID_PART} -eq 4 ]; then
    DIR_PREFIX="${ID_PART:0:1}xxx"
elif [ ${#ID_PART} -eq 5 ]; then
    DIR_PREFIX="${ID_PART:0:2}xxx"
elif [ ${#ID_PART} -eq 6 ]; then
    DIR_PREFIX="${ID_PART:0:3}xxx"
else
    DIR_PREFIX="xxx"
fi

# We assume CVELIST_ROOT is provided or we search from current/parent dirs
# But for the tool, we will use a relative path if known or just echo the expected relative path.
RELATIVE_PATH="cves/$YEAR/$DIR_PREFIX/$CVE_ID.json"

echo "$RELATIVE_PATH"
