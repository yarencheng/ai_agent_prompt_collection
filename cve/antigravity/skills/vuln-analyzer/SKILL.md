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
2. Check `containers.adp` for provider shortName "CISA" or "CVE".
3. Compare `metrics` across all containers; prioritize the version with the highest base score unless an ADP provides a more authoritative refinement.
4. **Version Analysis**:
   - For each entry in `affected[].versions`:
     - Identify the `versionType` to apply correct comparison logic.
     - Process the `changes` list: sort by version (topological sort for `git`) and iterate to determine the status at specific points.
     - Respect `defaultStatus` if no ranges match.
5. **Reference Normalization**:
   - Merge `references` from all containers.
   - Deduplicate by `url`, preferring the most detailed metadata (name, tags).
6. **Integrity Check**:
   - Identify `problemTypes` (CWEs) and cross-reference with `descriptions` for accuracy.
   - Verify KEV status via `x_cisa_kev` in the CISA ADP container.

## Scripts
- `scripts/check_kev.py`: Checks if a CVE ID is listed in the local KEV snapshot.
- `scripts/summarize_impact.py`: Generates a high-level summary of the vulnerability impact.
