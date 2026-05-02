---
trigger: always_on
---

# ADP Enrichment and Containers
Support for multiple data providers (ADPs) is essential for comprehensive CVE analysis.

## CVE Program Container (ADP)
* Used for references added by the CVE Program after the CNA has published the record.
* Title MUST be "CVE Program Container".
* Provider shortName MUST be "CVE".

## CISA ADP
* Provides critical enrichment for US federal agencies and global users.
* **KEV**: Known Exploited Vulnerabilities catalog data.
* **SSVC**: Stakeholder-Specific Vulnerability Categorization.
* **Vulnrichment**: Missing CVSS, CWE, or CPE data provided by CISA.

## Reference Normalization
* **Deduplication**: When merging references from CNA and ADP containers, identify duplicates by `url`.
* **Merging**: If a reference exists in both, prefer the version with more descriptive `name` or `tags`.
* **Transferred Data**: References with the `x_transferred` tag in the CVE Program ADP container indicate they were originally part of the CNA container in an older schema version (V4) and have been moved to preserve history.

## Conflict Resolution
* **Scoring Conflicts**: If CVSS scores differ between CNA and ADP (e.g., CISA), prioritize the ADP score if it provides a more recent refinement or specific threat context (e.g., KEV).
* **Exploitation Status**: The CISA ADP's KEV status is the definitive source for "Known Exploited" status, regardless of CNA descriptions.
* **SSVC**: Use Stakeholder-Specific Vulnerability Categorization (if present) to recommend prioritization (e.g., "Track", "Attend", "Act").
