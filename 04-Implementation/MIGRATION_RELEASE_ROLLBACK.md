---
artifact_id: DOC-04-IMPLEMENTATION-MIGRATION-RELEASE-ROLLBACK-MD
phase: "04-Implementation"
artifact_type: implementation
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Migration, Release & Rollback Plan — REL-{{VERSION}}

## Change summary

| Area | Change | Compatibility risk | Owner |
| :--- | :--- | :--- | :--- |
| Code/API/data/config/infra | {{CHANGE}} | {{RISK}} | {{OWNER}} |

## Preconditions

- [ ] Backup/snapshot/restore path phù hợp đã xác minh.
- [ ] Artifact/version/config/secret references đã sẵn sàng.
- [ ] Migration forward/backward compatibility được review.
- [ ] Monitoring, smoke test, on-call và communication sẵn sàng.
- [ ] Client/production approval đã có nếu cần.

## Migration steps

| Step | Command/action | Expected | Verify | Duration/owner |
| :--- | :--- | :--- | :--- | :--- |
| 1 | {{ACTION}} | {{EXPECTED}} | {{CHECK}} | {{TIME_OWNER}} |

## Release strategy

- Strategy: Rolling / Blue-green / Canary / Feature flag / Manual
- Maintenance window: {{WINDOW}}
- Traffic/rollout increments: {{PLAN}}
- Communication: {{AUDIENCE_CHANNEL}}

## Smoke và observability

| Check | Expected/threshold | Evidence | Owner |
| :--- | :--- | :--- | :--- |
| Health + critical journey | {{EXPECTED}} | {{RESULT}} | {{OWNER}} |
| Error/latency/business metrics | {{THRESHOLD}} | {{DASHBOARD}} | {{OWNER}} |

## Rollback triggers

| Trigger | Threshold/window | Decision owner | Action |
| :--- | :--- | :--- | :--- |
| Error/data/security/SLO | {{THRESHOLD}} | {{OWNER}} | Rollback / disable flag / failover |

## Rollback steps

1. Stop/pause rollout and preserve evidence.
2. {{ROLLBACK_ACTION}}
3. Verify schema/data/client compatibility.
4. Run rollback smoke tests and monitor.
5. Notify stakeholders and open incident/PIR when applicable.

## Post-release

- [ ] RTM/release report/changelog updated.
- [ ] Temporary flags/jobs/access cleaned or assigned expiry.
- [ ] Data reconciliation completed.
- [ ] Residual risk/incident/lessons recorded.
