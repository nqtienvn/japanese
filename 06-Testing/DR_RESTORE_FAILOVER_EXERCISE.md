---
artifact_id: DOC-06-TESTING-DR-RESTORE-FAILOVER-EXERCISE-MD
phase: "06-Testing"
artifact_type: testing
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# DR Restore, Failover & Recovery Exercise — {{PROJECT_NAME}}

| Field | Value |
| :--- | :--- |
| Scenario/profile | {{SCENARIO}} / {{RTO_RPO_PROFILE}} |
| Environment | Sandbox / Staging / Other approved |
| Owner/observer | {{OWNER}} / {{OBSERVER}} |
| Authorization/date | {{AUTHORIZATION}} / {{DATE}} |

## Exercise cases

| Case ID | Failure/restore action | Preconditions/data | Exact expected result | Actual result/evidence | RTO/RPO | Defect/risk |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| TC-DR-001 | Restore database backup | Synthetic backup/checksum | Service recovers within RTO; data loss within RPO | {{RESULT}} | {{RTO_RPO}} | {{DEFECT}} |
| TC-DR-002 | Fail over dependency/zone | Approved fault injection | Traffic routes to healthy target; no unsafe write split | {{RESULT}} | {{RTO_RPO}} | {{DEFECT}} |
| TC-DR-003 | Roll back release/migration | Versioned artifact | Previous version runs with compatibility intact | {{RESULT}} | {{RTO_RPO}} | {{DEFECT}} |
| TC-DR-004 | Crisis communication | Contact tree and message templates | Stakeholders receive correct update within target | {{RESULT}} | {{TIME_TARGET}} | {{DEFECT}} |

## Lessons and sign-off

| Finding/action | Owner | Due | Retest | Status |
| :--- | :--- | :--- | :--- | :--- |
| {{FINDING}} | {{OWNER}} | {{DATE}} | {{RETEST}} | Open / Closed |

| Role | Decision | Date | Conditions |
| :--- | :--- | :--- | :--- |
| Operations/DR Owner | Pending | {{DATE}} | {{CONDITIONS}} |
