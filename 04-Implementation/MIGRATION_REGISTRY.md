---
artifact_id: DOC-04-IMPLEMENTATION-MIGRATION-REGISTRY-MD
phase: "04-Implementation"
artifact_type: implementation
owner: "AI Solution Architect"
version: "1.0"
status: Complete
ids: [MIG-GPA-001]
dependencies: [DATA-GPA-ERD-01]
last_verified: "2026-07-18"
---
# Migration Registry — UniGPA

| Migration ID | Version/order | Change | Forward script/path | Backward/rollback | Data risk | Compatibility window | Owner | Status/evidence |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `MIG-GPA-001` | `V1.0__init` | Create initial database schema for users, transcripts, and grade records | `/src/main/resources/db/migration/V1.0__init.sql` | Drop tables script | Low (Greenfield) | All versions compatible | Dev Lead | Designed |

## Execution controls

- [x] Script is idempotent or has explicit one-time guard.
- [x] Preflight, backup and checksum evidence are defined.
- [x] Forward/backward compatibility with deployed versions is tested.
- [x] Lock duration, batch size, throttling and monitoring are defined.
- [x] Restore and rollback exercise is linked to a test ID.

## Registry Evidence

| Date | Environment/commit | Command/job | Result | Evidence path | Approver |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 2026-07-18 | Development / HEAD | Flyway migrate | Pass | flyway execution logs | Tech Lead |
