---
artifact_id: DOC-06-TESTING-UAT-AND-ACCEPTANCE-MD
phase: "06-Testing"
artifact_type: testing
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Client UAT & Acceptance — {{PROJECT_NAME}} / REL-{{VERSION}}

## UAT scope

| Scenario | Persona | Requirements | Test data | Business outcome | Approver |
| :--- | :--- | :--- | :--- | :--- | :--- |
| UAT-001 | {{PERSONA}} | {{IDS}} | {{DATA}} | {{OUTCOME}} | {{CLIENT_APPROVER}} |

## UAT execution

| Scenario | Date/build | Result | Feedback/defect | Evidence |
| :--- | :--- | :--- | :--- | :--- |
| UAT-001 | {{DATE_VERSION}} | Pass / Fail / Blocked | {{FEEDBACK}} | {{EVIDENCE}} |

## Acceptance checklist

- [ ] Deliverables đúng SOW/release scope.
- [ ] Must/Critical acceptance criteria đạt.
- [ ] Blocking defect threshold không bị vượt.
- [ ] Data/security/privacy/NFR evidence phù hợp đã review.
- [ ] User guide/runbook/release/rollback/handover sẵn sàng.
- [ ] Open items và warranty/support boundary rõ.

## Client decision

| Decision | Chọn | Conditions / deadline |
| :--- | :---: | :--- |
| Accepted | [ ] | {{CONDITIONS}} |
| Conditionally accepted | [ ] | {{CONDITIONS}} |
| Rejected | [ ] | {{BLOCKING_REASONS}} |

Client approver: {{CLIENT_APPROVER}} — Date: {{DATE}}
