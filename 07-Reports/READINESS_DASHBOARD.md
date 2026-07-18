---
artifact_id: REPORT-READINESS-DASHBOARD
phase: "07-Reports"
artifact_type: report
owner: "Delivery Lead"
version: "0.1"
status: Template
ids: [GATE-00, GATE-01, GATE-02, GATE-03, GATE-04, GATE-05, GATE-06, GATE-07, GATE-08]
dependencies: [TRACEABILITY_MATRIX, TEST_TRACEABILITY_MATRIX]
last_verified: "2026-07-18"
---
# Readiness dashboard

Populate the dashboard from concrete evidence; do not infer coverage solely from the Status column in `PROJECT_STATE.md`.

| Gate | Required evidence | Coverage formula | Current |
| :--- | :--- | :--- | :--- |
| 00 | charter, RACI, standards, front matter | passed controls / applicable controls | Not evaluated |
| 01 | discovery log, scope baseline, risk register | answered or owned questions / applicable questions | Not evaluated |
| 02 | BRD/SRS, BPMN, CRUD matrix, RTM, glossary | traced requirements / approved requirements | Not evaluated |
| 03 | architecture, domain/permission model, threat model, contracts, ASVS | accepted design artifacts / required artifacts | Not evaluated |
| 04 | implementation plan, environment setup, migrations | verified work items / planned work items | Not evaluated |
| 05 | code review, CI, IaC/container evidence | passing controls / applicable controls | Not evaluated |
| 06 | test report, Test RTM, UAT, security, DR exercise | executed accepted tests / required tests | Not evaluated |
| 07 | release report, readiness, rollback | release controls with evidence / release controls | Not evaluated |
| 08 | runbook, DR/BCP, handover, sign-off | signed handover controls / required controls | Not evaluated |

## Decision rule

`Passed` requires a concrete evidence path, reviewer/approver, and gate-specific conditions. A state-only edit is invalid. High/Critical residual security risk requires the single accountable Security/Privacy Owner decision recorded in an ADR or risk acceptance record.
