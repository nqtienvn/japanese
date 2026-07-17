---
artifact_id: EXAMPLE-TASK-DISCOVERY
phase: "09-Example-Project"
artifact_type: discovery
owner: "Product Owner"
version: "1.0"
status: Approved-example
ids: [OBJ-TASK-001, STK-TASK-001]
dependencies: []
last_verified: "2026-07-18"
---
# Discovery baseline

Objective `OBJ-TASK-001`: provide a small team with a shared task board where a user can create, view, move, and archive tasks.

Stakeholders: Product Owner (decision authority), Engineering (implementation), QA (verification), Operations (sandbox support).

Selected profiles: Web CRUD and Integration-heavy (REST contract). Security Profile: STANDARD. Scope is a single tenant; authentication is delegated to a local test identity provider in the sandbox.

Decisions: maximum 100 tasks per board in the example; API response p95 target is 300 ms on the sandbox dataset; archived tasks are retained for 30 days. Unknowns are not hidden: production identity provider, retention policy, and SLO budget require downstream owner approval.
