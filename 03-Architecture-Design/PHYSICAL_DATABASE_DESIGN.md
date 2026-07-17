---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-PHYSICAL-DATABASE-DESIGN-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Physical Database Design — {{PROJECT_NAME}}

| Field | Value |
| :--- | :--- |
| Engine/version | {{DB_ENGINE_VERSION}} |
| Environment | {{ENVIRONMENT}} |
| Owner/reviewer | {{OWNER}} / {{REVIEWER}} |
| Logical model | `DATA_MODEL_ERD.md` / {{VERSION}} |

## Table catalog

| Table | Schema/tenant | Purpose | PK | FK/unique/check | Classification | RLS/row policy | Retention | Migration ID |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| {{TABLE}} | {{SCHEMA_TENANT}} | {{PURPOSE}} | {{PK}} | {{CONSTRAINTS}} | {{CLASS}} | {{RLS}} | {{RETENTION}} | MIG-XXX |

## Column/index catalog

| Table.column/index | Type/length | Null/default | Encryption/masking | Index/partition | Query rationale | Evidence |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| {{TABLE.COLUMN}} | {{TYPE}} | {{NULL_DEFAULT}} | {{PROTECTION}} | {{INDEX_PARTITION}} | {{RATIONALE}} | {{EVIDENCE}} |

## Operational controls

- [ ] Backup/PITR, restore owner and retention are defined.
- [ ] Migration lock/online strategy and rollback are defined.
- [ ] Least-privilege roles and secret references are defined.
- [ ] Capacity, index maintenance and data quality checks have thresholds.
