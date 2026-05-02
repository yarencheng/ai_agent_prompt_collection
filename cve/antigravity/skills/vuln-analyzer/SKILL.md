---
name: vuln-analyzer
description: Analyze CVE records for impact, exploitation status, and enrichment data.
---

# Vulnerability Analyzer

Analyze CVE JSON records to extract key risk indicators and identify missing or enriched data.

## Purpose
Use this skill to:
- Identify if a CVE is in the CISA KEV catalog.
- Extract CVSS scores and severity from both CNA and ADP containers.
- Analyze affected product version ranges and CPEs.
- Evaluate SSVC (Stakeholder-Specific Vulnerability Categorization) for prioritization.

## Instructions
1. Parse the CVE JSON file.
2. Check `containers.adp` for provider shortName "CISA".
3. Look for `x_cisa_kev` field to confirm exploitation status.
4. Compare `metrics` across all containers to find the highest base score.
5. Identify `problemTypes` (CWEs) to categorize the vulnerability type.

## Scripts
- `scripts/check_kev.py`: Checks if a CVE ID is listed in the local KEV snapshot.
- `scripts/summarize_impact.py`: Generates a high-level summary of the vulnerability impact.
