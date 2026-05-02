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
- Validate local JSON files against the CVE V5 schema (5.0, 5.1, 5.2).
- Sync and maintain the local CVE list using `deltaLog.json`.

## Instructions
1. To locate a CVE (e.g., CVE-2024-1234):
   - Path: `cvelistV5/cves/2024/1xxx/CVE-2024-1234.json`.
2. Use `grep` or `find` to search for specific product names or PURLs in the `affected` fields across the repository.
3. **Delta Maintenance**:
   - Use `deltaLog.json` in the root of `cvelistV5` to identify and process recent updates.
   - Note: `deltaLog.json` typically retains 30 days of history (reduced to 15 days during normalization events).
4. **Validation**:
   - Before processing or after any manual edits, validate the record.
   - Determine schema version from `dataVersion` in the JSON file.
   - Use the appropriate schema file from the `cve-schema` reference directory.

## Scripts
- `scripts/find_cve.sh`: Locates the JSON file for a given CVE ID.
- `scripts/validate_json.sh`: Validates a file against the production schema.
