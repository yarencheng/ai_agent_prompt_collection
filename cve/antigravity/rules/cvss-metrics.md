---
trigger: always_on
---

# CVSS Metrics and Scoring
CVE records SHOULD include standardized vulnerability scoring.

## CVSS Version Support
* **CVSS v4.0**: Required for modern analysis.
  * **Nomenclature**:
    * **CVSS-B**: Base metrics only.
    * **CVSS-BT**: Base + Threat metrics.
    * **CVSS-BE**: Base + Environmental metrics.
    * **CVSS-BTE**: Base + Threat + Environmental.
  * **Core Metrics**: Ensure `version`, `vectorString`, and `baseScore` are present.
  * **Supplemental Metrics**: Check for `safety`, `automatable`, and `recovery` (optional but recommended in v4.0).
* **CVSS v3.1**: Widely used legacy standard. Ensure all base metrics (AV, AC, PR, UI, S, C, I, A) are present.

## Severity Levels
* **Critical**: 9.0 - 10.0
* **High**: 7.0 - 8.9
* **Medium**: 4.0 - 6.9
* **Low**: 0.1 - 3.9
* **None**: 0.0

## Best Practices
* Metrics MUST be placed within `containers.cna.metrics` or `containers.adp.metrics`.
* Each entry MUST specify the version and the source (CNA or ADP shortName).
* **Source Hierarchy**: Prioritize ADP (e.g., CISA) scores if they reflect refined analysis or KEV status.
