---
artifact_id: EXAMPLE-TASK-DESIGN
phase: "09-Example-Project"
artifact_type: design
owner: "Solution Architect"
version: "1.0"
status: Accepted-example
ids: [DES-TASK-001, API-TASK-001, DATA-TASK-001]
dependencies: [EXAMPLE-TASK-REQUIREMENTS]
last_verified: "2026-07-18"
---
# Design

The service is a stateless REST API with PostgreSQL. `GET /boards/{boardId}/tasks` reads tasks; `POST /boards/{boardId}/tasks` creates one; `PATCH /boards/{boardId}/tasks/{taskId}` changes state; `POST /boards/{boardId}/tasks/{taskId}/archive` archives a task.

The permission rule is `board.owner_id == subject.id`; all writes emit an audit event. The physical model uses `boards`, `tasks`, and `task_audit` with foreign keys and an index on `(board_id, state, updated_at)`. The API contract is copied into the repository's OpenAPI scaffold and checked by `validate_contracts.ps1`.
