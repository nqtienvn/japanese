---
artifact_id: EXAMPLE-TASK-REQUIREMENTS
phase: "09-Example-Project"
artifact_type: requirements
owner: "Product Owner"
version: "1.0"
status: Accepted-example
ids: [BR-TASK-001, FR-TASK-001, FR-TASK-002, NFR-TASK-001]
dependencies: [EXAMPLE-TASK-DISCOVERY]
last_verified: "2026-07-18"
---
# Requirements baseline

| ID | Requirement | Acceptance evidence |
| :--- | :--- | :--- |
| BR-TASK-001 | The board owner SHALL see the current task state and last update time. | `TC-TASK-001` verifies list response and timestamp. |
| FR-TASK-001 | The API SHALL create a task with title, state, and board identifier. | `TC-TASK-002` returns HTTP 201 and persisted row. |
| FR-TASK-002 | The API SHALL allow a board owner to move a task between Todo, Doing, and Done. | `TC-TASK-003` verifies permission and state transition. |
| NFR-TASK-001 | The list endpoint SHALL return within 300 ms p95 for 100 tasks in the sandbox. | `TC-TASK-004` records a 100-request benchmark. |

Traceability: design is `EXAMPLE-TASK-DESIGN`; implementation is `EXAMPLE-TASK-IMPLEMENTATION`; tests are `EXAMPLE-TASK-TESTING`.
