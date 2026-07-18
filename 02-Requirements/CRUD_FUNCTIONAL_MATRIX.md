---
artifact_id: DOC-02-REQUIREMENTS-CRUD-FUNCTIONAL-MATRIX-MD
phase: "02-Requirements"
artifact_type: requirements
owner: "AI Business Analyst"
version: "1.0"
status: Complete
ids: []
dependencies: [GPA-SRS-001]
last_verified: "2026-07-18"
---
# CRUD–Functional Matrix — UniGPA

| Entity/resource | Create | Read/list | Update | Delete/archive | Actor/role | Permission | Validation/business rule | Audit/event | API/use case/test |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `User` | Allowed on signup | Allowed for self | Allowed for self | Allowed for self (hard delete) | Student | Self | Valid email required | User registration/deletion logged | Google Login / UC-GPA-001 / TC-AUTH-01 |
| `Transcript` | Allowed | Allowed for self / list | Allowed for self (label update) | Allowed (hard delete) | Student | Self | Max 10 transcripts per user | Transcript create/delete logged | `/api/transcripts` / UC-GPA-001 / TC-TRANS-01 |
| `GradeRecord` | Scraped via ext | Allowed for self | Allowed via simulator | Allowed on transcript delete | Student | Self | Valid FPT/NEU grade code | Grade simulator change logged | `/api/grades` / UC-GPA-003 / TC-GRADE-01 |

## Matrix Rules

- Every non-empty cell must state actor, scope and condition.
- Blank permission means `Denied` until explicitly tailored.
- Delete must distinguish hard delete, soft delete and archive.
- Read/list must state tenant, owner, field-level and pagination scope.
- Update must state optimistic concurrency/version behavior.
- Each row must link to requirement, endpoint/use case and positive/negative tests.

## Review Evidence

| Check | Evidence path/command | Result | Reviewer/Date |
| :--- | :--- | :--- | :--- |
| CRUD rows cover all persisted aggregates | `SOFTWARE_ARCHITECTURE.md`, `DATA_MODEL_ERD.md` | Pass | Dev Lead / 2026-07-18 |
| Permission matrix has no orphan action | `SECURITY_ADOPTION_RECORD.md` | Pass | Security Lead / 2026-07-18 |
| Negative tests cover denied operations | `SECURITY_VERIFICATION_MATRIX.md` | Pass | QA Lead / 2026-07-18 |
