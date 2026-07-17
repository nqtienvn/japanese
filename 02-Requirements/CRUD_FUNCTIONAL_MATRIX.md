---
artifact_id: DOC-02-REQUIREMENTS-CRUD-FUNCTIONAL-MATRIX-MD
phase: "02-Requirements"
artifact_type: requirements
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# CRUD–Functional Matrix — {{PROJECT_NAME}}

| Entity/resource | Create | Read/list | Update | Delete/archive | Actor/role | Permission | Validation/business rule | Audit/event | API/use case/test |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| {{ENTITY}} | Allowed / Denied / Conditional | {{READ_RULE}} | {{UPDATE_RULE}} | {{DELETE_RULE}} | {{ACTOR}} | {{RESOURCE_ACTION}} | BR/FR-XXX | {{AUDIT}} | API/UC/TC-XXX |

## Matrix rules

- Every non-empty cell must state actor, scope and condition.
- Blank permission means `Denied` until explicitly tailored.
- Delete must distinguish hard delete, soft delete and archive.
- Read/list must state tenant, owner, field-level and pagination scope.
- Update must state optimistic concurrency/version behavior.
- Each row must link to requirement, endpoint/use case and positive/negative tests.

## Review evidence

| Check | Evidence path/command | Result | Reviewer/date |
| :--- | :--- | :--- | :--- |
| CRUD rows cover all persisted aggregates | {{EVIDENCE}} | Pass / Fail | {{REVIEWER_DATE}} |
| Permission matrix has no orphan action | {{EVIDENCE}} | Pass / Fail | {{REVIEWER_DATE}} |
| Negative tests cover denied operations | {{EVIDENCE}} | Pass / Fail | {{REVIEWER_DATE}} |
