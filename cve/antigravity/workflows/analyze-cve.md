---
description: Comprehensive analysis of a specific CVE record.
---

# Analyze CVE Workflow

Systematically evaluate a CVE record using all available data containers and enrichment sources.

## Steps

1. **Validate Environment**:
   - Run `skills/general/scripts/validate_env.sh` to ensure all reference data and tools are available.
2. **Locate Record**:
   - Use the `general` skill (`skills/general/scripts/find_cve.sh`) to find the JSON file for the target CVE ID.
3. **Validate Record**:
   - Use the `general` skill (`skills/general/scripts/validate_json.sh`) to validate the JSON against the correct schema.
4. **Basic Extraction**:
   - Identify the CNA (assigner) and publication state.
   - Extract primary descriptions and problem types (CWE).
5. **Impact Assessment**:
   - Use the `vuln-analyzer` skill (`skills/vuln-analyzer/scripts/summarize_impact.py`) to extract CVSS metrics and generate a summary.
   - Check both CNA and ADP containers for the most detailed scoring.
6. **Affected Analysis**:
   - List all affected products and version ranges.
   - Look for PURL or CPE identifiers.
7. **Normalize References**:
   - Use the `vuln-analyzer` skill to deduplicate and merge references from all containers.
8. **Enrichment Check**:
   - Search for "CISA" or "CVE" ADP containers.
   - Identify KEV status (`skills/vuln-analyzer/scripts/check_kev.py`) and SSVC prioritization.
9. **Summary Generation**:
   - Produce a concise summary of the vulnerability, its impact, and its exploitation status.
