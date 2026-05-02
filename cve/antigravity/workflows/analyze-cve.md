---
description: Comprehensive analysis of a specific CVE record.
---

# Analyze CVE Workflow

Systematically evaluate a CVE record using all available data containers and enrichment sources.

## Steps

1. **Locate Record**:
   - Use the `general` skill to find the JSON file for the target CVE ID in `cvelistV5/`.
2. **Basic Extraction**:
   - Identify the CNA (assigner) and publication state.
   - Extract primary descriptions and problem types (CWE).
3. **Impact Assessment**:
   - Use the `vuln-analyzer` skill to extract CVSS metrics.
   - Check both CNA and ADP containers for the most detailed scoring.
4. **Affected Analysis**:
   - List all affected products and version ranges.
   - Look for PURL or CPE identifiers.
5. **Enrichment Check**:
   - Search for "CISA" or "CVE" ADP containers.
   - Identify KEV status and SSVC prioritization.
6. **Summary Generation**:
   - Produce a concise summary of the vulnerability, its impact, and its exploitation status.
