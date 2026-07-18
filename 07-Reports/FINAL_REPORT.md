---
artifact_id: DOC-07-REPORTS-FINAL-REPORT-MD
phase: "07-Reports"
artifact_type: report
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Final Project Report — {{PROJECT_NAME}}

## Executive outcome

- Client problem: {{PROBLEM}}
- Delivered solution/outcomes: {{DELIVERED}}
- Overall acceptance: Accepted / Conditional / Not Accepted
- Final release: {{VERSION}}

## Planned vs delivered

| Objective/deliverable | Planned target | Actual result | Evidence | Status |
| :--- | :--- | :--- | :--- | :--- |
| OBJ/DEL-XXX | {{TARGET}} | {{ACTUAL}} | {{EVIDENCE}} | Met / Partial / Not Met |

## Scope and change summary

| Category | Items | Reason/decision |
| :--- | :--- | :--- |
| Delivered | {{IDS}} | {{REASON}} |
| Deferred | {{IDS}} | {{REASON}} |
| Removed/out of scope | {{IDS}} | {{REASON}} |
| Approved changes | {{CR_IDS}} | {{REASON}} |

## Schedule/cost/capacity summary

| Dimension | Baseline | Actual | Variance and cause |
| :--- | :--- | :--- | :--- |
| Schedule | {{BASELINE}} | {{ACTUAL}} | {{VARIANCE}} |
| Commercial/capacity | {{BASELINE}} | {{ACTUAL}} | {{VARIANCE}} |

## Quality and risk

- Verification summary: {{SUMMARY}}
- Defects/tech debt: {{SUMMARY_IDS}}
- Security/privacy/compliance: {{SUMMARY}}
- Security Profile, verification scope/exclusions, and Critical/High disposition: {{SECURITY_GATE_SUMMARY}}
- Human-assistance requests and tasks that the AI resumed/verified: {{ASSISTANCE_SUMMARY}}
- Residual risks accepted by: {{APPROVER}}

## Operational readiness

- Release/rollback/monitoring: {{STATUS}}
- Runbook/user guide/training: {{STATUS}}
- Ownership/support/warranty: {{STATUS}}

## Recommended next phase

| Priority | Recommendation | Value/risk addressed | Owner/timeframe |
| :--- | :--- | :--- | :--- |
| 1 | {{RECOMMENDATION}} | {{VALUE}} | {{OWNER_DATE}} |

## Final statement

State clearly what has been proven, what is only inferred/unmeasured, and the next decisions the Client needs to make: {{STATEMENT}}
