---
artifact_id: DOC-06-TESTING-DEFECT-REGISTER-MD
phase: "06-Testing"
artifact_type: testing
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Defect Register — {{PROJECT_NAME}}

| Defect ID | Requirement/test | Summary | Severity/priority | Environment/build | Reproduce/evidence | Owner | Status | Fix/retest |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| DEF-001 | FR/TC-XXX | {{SUMMARY}} | Critical / High / Medium / Low | {{ENV_BUILD}} | {{STEPS_EVIDENCE}} | {{OWNER}} | Open | {{WI_RESULT}} |

## Defect detail template

- Expected: {{EXPECTED}}
- Actual: {{ACTUAL}}
- Reproduction rate: {{RATE}}
- User/business/security/data impact: {{IMPACT}}
- Workaround: {{WORKAROUND}}
- Root cause: {{ROOT_CAUSE}}
- Fix/commit/work item: {{EVIDENCE}}
- Regression scope: {{SCOPE}}
- Retest result/date: {{RESULT_DATE}}

## Triage rule

Critical/High phải có owner và quyết định release. `Won't Fix` hoặc accepted defect phải có Client/QA/Security approver phù hợp, risk và review/expiry date.
