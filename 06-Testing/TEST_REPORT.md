---
artifact_id: DOC-06-TESTING-TEST-REPORT-MD
phase: "06-Testing"
artifact_type: testing
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Test Completion Report — {{PROJECT_NAME}} / REL-{{VERSION}}

| Field | Value |
| :--- | :--- |
| Document ID | `{{PROJECT_CODE}}-TST-COMP-001` |
| Version / status | {{VERSION}} / {{STATUS}} |
| Owner / approver | {{QA_LEAD}} / {{APPROVER}} |

## Version history

| Version | Date | Author | Reason/change | Build/cycle affected |
| :--- | :--- | :--- | :--- | :--- |
| 0.1 | {{DATE}} | {{AUTHOR}} | Initial completion report | {{BUILD_CYCLE}} |

## Executive recommendation

- Build/artifact: {{VERSION_ARTIFACT}}
- Recommendation: Go / Conditional Go / No-Go
- Reason: {{SUMMARY}}
- Residual risk requiring acceptance: {{RISKS}}

## Execution summary

| Type | Total Cases | Executed | Passed | Failed | Blocked | Skipped | Not Run | Evidence |
| :--- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | :--- |
| Unit | 0 | 0 | 0 | 0 | 0 | 0 | 0 | {{REPORT}} |
| Integration/Contract | 0 | 0 | 0 | 0 | 0 | 0 | 0 | {{REPORT}} |
| E2E/UAT | 0 | 0 | 0 | 0 | 0 | 0 | 0 | {{REPORT}} |
| Security/Performance/Recovery | 0 | 0 | 0 | 0 | 0 | 0 | 0 | {{REPORT}} |
| **Total** | **0** | **0** | **0** | **0** | **0** | **0** | **0** | {{REPORT}} |

Clearly document 'Total Cases', 'Executed', 'Passed', 'Failed', 'Blocked', 'Skipped', 'Not Run', and the pass rate formula used; the sum of all states must reconcile with the test inventory or include a clear explanation.

## Requirement/risk coverage

| Requirement/risk | Tests | Result | Gap/exception |
| :--- | :--- | :--- | :--- |
| FR/NFR/THR-XXX | TC-XXX | Pass / Fail | {{GAP}} |

## Defects

| Severity | Open | Accepted | Closed | Blocking IDs |
| :--- | :---: | :---: | :---: | :--- |
| Critical | 0 | 0 | 0 | — |
| High | 0 | 0 | 0 | — |

## Environment and limitations

- Environment/config/data: {{DETAIL}}
- Not tested/limitations: {{LIMITATIONS}}
- Differences from production: {{DIFFERENCES}}

## Verification evidence

| Date | Command/job/scenario | Result | Version/environment | Evidence path/link |
| :--- | :--- | :--- | :--- | :--- |
| {{DATE}} | {{COMMAND}} | {{RESULT}} | {{VERSION_ENV}} | {{EVIDENCE}} |

## Sign-off

| Role | Decision | Date | Conditions |
| :--- | :--- | :--- | :--- |
| QA Lead | Pending | {{DATE}} | {{CONDITION}} |
| Client Product Owner | Pending | {{DATE}} | {{CONDITION}} |
| Security/Ops when applicable | Pending | {{DATE}} | {{CONDITION}} |
