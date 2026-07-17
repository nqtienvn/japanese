---
artifact_id: DOC-08-DOCUMENT-REFERENCES-OPERATIONS-RUNBOOK-MD
phase: "08-Document-References"
artifact_type: handover
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Operations Runbook — {{PROJECT_NAME}}

## Service Ownership

| Service/component | Owner/on-call | Repository/artifact | SLO | Dashboard/alerts |
| :--- | :--- | :--- | :--- | :--- |
| {{SERVICE}} | {{OWNER}} | {{LOCATION}} | {{SLO}} | {{LINK}} |

## Environments and Access

| Environment | Purpose | Access process | Config/secret source | Data classification |
| :--- | :--- | :--- | :--- | :--- |
| {{ENV}} | {{PURPOSE}} | {{PROCESS}} | {{SECRET_MANAGER_REF}} | {{CLASS}} |

Do not record raw secret values in this file.

## Deploy and Verify

1. Confirm approval, artifact, change/release/test report.
2. Follow `../04-Implementation/MIGRATION_RELEASE_ROLLBACK.md`.
3. Run health/smoke/metric checks and record evidence.
4. Observe for {{WINDOW}}; communicate result.

## Monitoring and Alerts

| Signal/alert | Normal/threshold | First checks | Mitigation | Escalate |
| :--- | :--- | :--- | :--- | :--- |
| Availability/error/latency/business/data | {{THRESHOLD}} | {{CHECKS}} | {{MITIGATION}} | {{OWNER}} |

## Common Incidents

| Symptom | Likely causes | Safe diagnosis | Recovery/rollback | Evidence to preserve |
| :--- | :--- | :--- | :--- | :--- |
| {{SYMPTOM}} | {{CAUSES}} | {{DIAGNOSIS}} | {{RECOVERY}} | {{EVIDENCE}} |

## Backup/Restore and Continuity

- Backup schedule/retention: {{POLICY}}
- Restore procedure/environment: {{PROCEDURE}}
- Latest restore test/evidence: {{DATE_EVIDENCE}}
- RTO/RPO/failover: {{TARGET_PLAN}}

## Maintenance

| Task | Frequency | Owner | Procedure/evidence |
| :--- | :--- | :--- | :--- |
| Dependency/certificate/key/retention/capacity review | {{FREQUENCY}} | {{OWNER}} | {{PROCEDURE}} |

## Incident Protocol

Classify severity, appoint commander, preserve evidence, mitigate, communicate, recover, then fill `../07-Reports/INCIDENT_AND_PIR.md`. Security/privacy breach follows required notification timelines.
