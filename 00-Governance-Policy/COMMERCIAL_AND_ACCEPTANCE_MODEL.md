---
artifact_id: DOC-00-GOVERNANCE-POLICY-COMMERCIAL-AND-ACCEPTANCE-MODEL-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Commercial Assumptions & Acceptance Model

> Delivery governance template, does not replace legal contract/counsel.

## Estimation model

| Topic | Options/Assumptions |
| :--- | :--- |
| Commercial model | Fixed scope / Time & materials / Milestone / Internal |
| Currency/tax | {{CURRENCY_TAX}} |
| Estimation confidence | ROM / Budgetary / Committed |
| Contingency | {{PERCENT}} |
| Client review delay treatment | {{RULE}} |
| Third-party cost treatment | {{RULE}} |

## Acceptance window

- Vendor notifies that the deliverable is ready and provides evidence.
- Client reviews within {{REVIEW_DAYS}} business days.
- Client clearly records pass/fail according to acceptance criteria; new feedback outside the baseline must go through change control.
- Silence does not automatically constitute acceptance unless specified in the actual contract and legally reviewed.

## Defect severity during acceptance

| Severity | Definition | Acceptance Impact | Resolution Target |
| :--- | :--- | :--- | :--- |
| Critical | Data loss, security breach, core function unusable | Block | {{SLA}} |
| High | Core function incorrect, no reasonable workaround | Block/conditional | {{SLA}} |
| Medium | Partial impact, workaround available | Conditional/backlog | {{SLA}} |
| Low | Cosmetic/improvement | Non-blocking | {{SLA}} |

## Warranty/support boundary

| In warranty | Out of warranty/change request |
| :--- | :--- |
| Deviation from approved baseline/acceptance criteria | New requirement or behavior change |
| Regression caused by Vendor deliverables | Third-party changes outside control |
| Security defects within design scope | Misconfiguration/operation outside guidelines |
