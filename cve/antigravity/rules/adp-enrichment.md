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
* If a field exists in both CNA and ADP containers (e.g., CVSS), the ADP version may provide a more recent or independent assessment.
* References with the `x_transferred` tag in the CVE Program container are historical snapshots from the CNA container.
