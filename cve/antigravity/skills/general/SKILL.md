---
name: general
description: General CVE tool maintenance and data navigation.
---

# General CVE Skill

Core utilities for navigating the CVE List repository and managing local CVE data.

## Purpose
Use this skill to:
- Navigate the `cvelistV5` directory structure (Year/Month/CVE-ID.json).
- Search for CVE records by ID or keyword.
- Validate local JSON files against the CVE V5 schema.

## Instructions
1. To locate a CVE (e.g., CVE-2024-1234):
   - Path: `cvelistV5/cves/2024/1xxx/CVE-2024-1234.json`.
2. Use `grep` or `find` to search for specific product names or PURLs in the `affected` fields across the repository.
3. Use the `deltaLog.json` in the root of `cvelistV5` to identify and process recent updates.
4. When validating:
   - Use the schema files found in the `cve-schema` reference directory.
   - Prefer the production schema for final validation.

## Scripts
- `scripts/find_cve.sh`: Locates the JSON file for a given CVE ID.
- `scripts/validate_json.sh`: Validates a file against the production schema.
