---
artifact_id: DOC-04-IMPLEMENTATION-MIGRATION-REGISTRY-MD
phase: "04-Implementation"
artifact_type: implementation
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Migration Registry — {{PROJECT_NAME}}

| Migration ID | Version/order | Change | Forward script/path | Backward/rollback | Data risk | Compatibility window | Owner | Status/evidence |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| MIG-001 | {{VERSION_ORDER}} | {{CHANGE}} | {{FORWARD}} | {{ROLLBACK}} | Low/Medium/High | {{WINDOW}} | {{OWNER}} | Draft |

## Execution controls

- [ ] Script is idempotent or has explicit one-time guard.
- [ ] Preflight, backup and checksum evidence are defined.
- [ ] Forward/backward compatibility with deployed versions is tested.
- [ ] Lock duration, batch size, throttling and monitoring are defined.
- [ ] Restore and rollback exercise is linked to a test ID.

## Registry evidence

| Date | Environment/commit | Command/job | Result | Evidence path | Approver |
| :--- | :--- | :--- | :--- | :--- | :--- |
| {{DATE}} | {{ENV_COMMIT}} | {{COMMAND}} | Pass / Fail | {{EVIDENCE}} | {{APPROVER}} |
