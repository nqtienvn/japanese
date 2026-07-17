---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-ASVS-MAPPING-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# OWASP ASVS Mapping — {{PROJECT_NAME}}

Reference version: **OWASP ASVS 5.0.0**. Pin the version in every row; identifiers may change between versions.

| ASVS ID | Project requirement/control | Threat/asset | Design/code evidence | Test ID/result | Apply/Tailor/N/A rationale | Owner/approver |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `v5.0.0-{{CHAPTER.SECTION.REQUIREMENT}}` | {{CONTROL}} | THR/RISK-XXX | {{PATH_SYMBOL}} | TC-SEC-XXX | {{DECISION_RATIONALE}} | {{OWNER_APPROVER}} |

## Mapping rules

- Use versioned ASVS IDs, not unversioned numbers.
- Map project requirements to ASVS verification items; do not claim ASVS certification.
- Every `N/A` row requires applicability evidence and a replacement control.
- Every Must/Critical security requirement needs a passing test before Gate 06.

## Coverage summary

| Level/profile | Applicable items | Mapped | Tested | Missing/action |
| :--- | ---: | ---: | ---: | :--- |
| L1/Standard | {{COUNT}} | {{COUNT}} | {{COUNT}} | {{ACTION}} |
| L2/High | {{COUNT}} | {{COUNT}} | {{COUNT}} | {{ACTION}} |
| L3/Critical | {{COUNT}} | {{COUNT}} | {{COUNT}} | {{ACTION}} |
