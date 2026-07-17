# Operations Runbook — {{PROJECT_NAME}}

## Service ownership

| Service/component | Owner/on-call | Repository/artifact | SLO | Dashboard/alerts |
| :--- | :--- | :--- | :--- | :--- |
| {{SERVICE}} | {{OWNER}} | {{LOCATION}} | {{SLO}} | {{LINK}} |

## Environments and access

| Environment | Purpose | Access process | Config/secret source | Data classification |
| :--- | :--- | :--- | :--- | :--- |
| {{ENV}} | {{PURPOSE}} | {{PROCESS}} | {{SECRET_MANAGER_REF}} | {{CLASS}} |

Không ghi secret value trong file này.

## Deploy and verify

1. Confirm approval, artifact, change/release/test report.
2. Follow `../04-Implementation/MIGRATION_RELEASE_ROLLBACK.md`.
3. Run health/smoke/metric checks and record evidence.
4. Observe for {{WINDOW}}; communicate result.

## Monitoring and alerts

| Signal/alert | Normal/threshold | First checks | Mitigation | Escalate |
| :--- | :--- | :--- | :--- | :--- |
| Availability/error/latency/business/data | {{THRESHOLD}} | {{CHECKS}} | {{MITIGATION}} | {{OWNER}} |

## Common incidents

| Symptom | Likely causes | Safe diagnosis | Recovery/rollback | Evidence to preserve |
| :--- | :--- | :--- | :--- | :--- |
| {{SYMPTOM}} | {{CAUSES}} | {{DIAGNOSIS}} | {{RECOVERY}} | {{EVIDENCE}} |

## Backup/restore and continuity

- Backup schedule/retention: {{POLICY}}
- Restore procedure/environment: {{PROCEDURE}}
- Latest restore test/evidence: {{DATE_EVIDENCE}}
- RTO/RPO/failover: {{TARGET_PLAN}}

## Maintenance

| Task | Frequency | Owner | Procedure/evidence |
| :--- | :--- | :--- | :--- |
| Dependency/certificate/key/retention/capacity review | {{FREQUENCY}} | {{OWNER}} | {{PROCEDURE}} |

## Incident protocol

Classify severity, appoint commander, preserve evidence, mitigate, communicate, recover, then fill `../07-Reports/INCIDENT_AND_PIR.md`. Security/privacy breach follows required notification timelines.
