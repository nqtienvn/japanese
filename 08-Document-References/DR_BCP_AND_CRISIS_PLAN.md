---
artifact_id: DOC-08-DOCUMENT-REFERENCES-DR-BCP-AND-CRISIS-PLAN-MD
phase: "08-Document-References"
artifact_type: handover
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Disaster Recovery, Business Continuity & Crisis Communication — {{PROJECT_NAME}}

## Service continuity profile

| Service/process | Criticality | RTO | RPO | Maximum tolerable downtime | Dependency | Owner |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| {{SERVICE}} | Critical/High/Medium/Low | {{RTO}} | {{RPO}} | {{MTD}} | {{DEPENDENCY}} | {{OWNER}} |

## Recovery strategy

| Failure mode | Detection | Containment | Recovery path | Data integrity check | Rollback/exit | Exercise ID |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| {{FAILURE}} | {{DETECTION}} | {{CONTAINMENT}} | {{RECOVERY}} | {{CHECK}} | {{EXIT}} | TC-DR-XXX |

## Backup/restore and failover

- Backup type/frequency/retention: {{BACKUP}}
- Encryption/key ownership: {{KEYS}}
- Restore order and dependencies: {{ORDER}}
- Failover topology/runbook: {{FAILOVER}}
- Reconciliation/idempotency after recovery: {{RECONCILIATION}}
- Last exercise and unresolved findings: {{EXERCISE}}

## Crisis communication

| Severity | Trigger | Internal audience | External audience | Initial update target | Update cadence | Approver/channel |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Critical | {{TRIGGER}} | {{INTERNAL}} | {{EXTERNAL}} | {{TARGET}} | {{CADENCE}} | {{APPROVER_CHANNEL}} |

No real credential, customer PII or unapproved incident detail belongs in this document. Use the incident system and approved communication channel.
