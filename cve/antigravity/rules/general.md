---
trigger: always_on
---

# General CVE Guidelines

* **Version Sensitivity**: Always verify the `dataVersion` in the CVE record. Prefer V5.1+ features when available.
* **Source Trust**: Prioritize the CNA container for official product information, but always check ADP containers for independent security assessments (e.g., CISA, Red Hat).
* **Reference Integrity**: When citing references, include the `tags` to provide context (e.g., "Exploit", "Third Party Advisory").
* **Schema Adherence**: Never recommend modifications that break the JSON schema defined in `cve-schema`.