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

- [ ] Deliverables comply with SOW/release scope.
- [ ] Must/Critical acceptance criteria are met.
- [ ] Blocking defect threshold is not exceeded.
- [ ] Relevant data/security/privacy/NFR evidence has been reviewed.
- [ ] User guide/runbook/release/rollback/handover are ready.
- [ ] Open items and warranty/support boundaries are clear.

## Client decision

| Decision | Select | Conditions / deadline |
| :--- | :---: | :--- |
| Accepted | [ ] | {{CONDITIONS}} |
| Conditionally accepted | [ ] | {{CONDITIONS}} |
| Rejected | [ ] | {{BLOCKING_REASONS}} |

Client approver: {{CLIENT_APPROVER}} — Date: {{DATE}}
