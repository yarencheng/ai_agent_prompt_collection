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

## Implementation Rules
* Always check all `containers.adp` entries for additional context.
* **Provider Priority**: Treat CNA data as the source of truth for product names, but ADP data (especially CISA) as the source of truth for exploitation status and scoring refinements.
* **Transferred Data**: References with the `x_transferred` tag in the CVE Program ADP container indicate they were originally part of the CNA container in an older schema version (V4) and have been moved to preserve history.
* **SSVC**: Use Stakeholder-Specific Vulnerability Categorization (if present) to recommend prioritization (e.g., "Track", "Attend", "Act").
