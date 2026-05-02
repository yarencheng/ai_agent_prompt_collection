---
trigger: always_on
---

# CVSS Metrics and Scoring
CVE records SHOULD include standardized vulnerability scoring.

## CVSS Version Support
* **CVSS v4.0**: Preferred for new records. Requires `version`, `vectorString`, and `baseScore`.
* **CVSS v3.1**: Widely used. Ensure all base metrics (AV, AC, PR, UI, S, C, I, A) are present in the vector string.

## Severity Levels
* **Critical**: 9.0 - 10.0
* **High**: 7.0 - 8.9
* **Medium**: 4.0 - 6.9
* **Low**: 0.1 - 3.9
* **None**: 0.0

## Formatting
* Metrics MUST be placed within `containers.cna.metrics` or `containers.adp.metrics`.
* Each entry MUST specify the version and the source (CNA or ADP shortName).
