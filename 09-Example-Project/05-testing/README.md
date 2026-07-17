---
artifact_id: EXAMPLE-TASK-TESTING
phase: "09-Example-Project"
artifact_type: testing
owner: "QA Lead"
version: "1.0"
status: Verified-example
ids: [TC-TASK-001, TC-TASK-002, TC-TASK-003, TC-TASK-004]
dependencies: [EXAMPLE-TASK-IMPLEMENTATION]
last_verified: "2026-07-18"
---
# Test evidence

| Test case | Result | Evidence |
| :--- | :--- | :--- |
| TC-TASK-001 list tasks | Pass | contract test response fixture |
| TC-TASK-002 create task | Pass | database assertion and HTTP 201 |
| TC-TASK-003 ownership/state transition | Pass | negative test with another user |
| TC-TASK-004 p95 latency | Pass | 100 requests, p95 184 ms on local sandbox |

The test set includes unit, API contract, integration, authorization-negative, migration-up/down, and smoke checks. A production release would additionally require UAT sign-off and independent security review.
