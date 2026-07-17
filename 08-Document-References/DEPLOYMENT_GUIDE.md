# Deployment & Configuration Guide — {{PROJECT_NAME}}

| Field | Value |
| :--- | :--- |
| Document ID | `{{PROJECT_CODE}}-DEP-001` |
| Version / status | {{VERSION}} / {{STATUS}} |
| Release/environment | REL-{{VERSION}} / {{ENVIRONMENT}} |
| Owner / approver | {{OPS_OWNER}} / {{APPROVER}} |

## Version history

| Version | Date | Author | Reason/change | Release/environment affected |
| :--- | :--- | :--- | :--- | :--- |
| 0.1 | {{DATE}} | {{AUTHOR}} | Initial guide | {{SCOPE}} |

## Environment matrix

| Environment | Purpose | Runtime/region/network | Data classification | Access/approval | Differences |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Development / Test / Staging / Production | {{PURPOSE}} | {{RUNTIME_REGION_NETWORK}} | {{CLASS}} | {{PROCESS}} | {{DIFFERENCES}} |

## Prerequisites and ownership

| Prerequisite | Exact version/capacity | Verify command/evidence | Provider/owner |
| :--- | :--- | :--- | :--- |
| Runtime/tool/service | {{VERSION_TARGET}} | `{{VERIFY_COMMAND}}` | {{OWNER}} |

## Configuration and secrets

| Variable/config | Required | Safe example/default | Secret? | Source/rotation owner | Validation/failure behavior |
| :--- | :--- | :--- | :---: | :--- | :--- |
| `APP_ENV` | Yes | `staging` | No | Config store / {{OWNER}} | Startup fails with exact diagnostic |
| `SERVICE_KEY` | Conditional | `<secret-reference>` | Yes | Secret manager / {{OWNER}} | Never print value |

Không ghi secret value. Chỉ ghi secret reference, quyền lấy, owner, rotation/revocation và cách verify an toàn.

## Build and artifact verification

```text
{{INSTALL_COMMAND}}
{{BUILD_COMMAND}}
{{TEST_COMMAND}}
{{PACKAGE_COMMAND}}
{{CHECKSUM_SIGNATURE_SBOM_COMMAND}}
```

| Artifact | Version/checksum/signature | Source | Retention |
| :--- | :--- | :--- | :--- |
| {{ARTIFACT}} | {{IDENTITY}} | {{REGISTRY}} | {{RETENTION}} |

## Deployment sequence

| Step | Command/action | Expected result | Evidence/check | Owner |
| :---: | :--- | :--- | :--- | :--- |
| 1 | Confirm approval/change window | Approved release identity | {{EVIDENCE}} | {{OWNER}} |
| 2 | Apply backward-compatible config/schema step | {{EXPECTED}} | {{CHECK}} | {{OWNER}} |
| 3 | Deploy artifact/enable controlled traffic | {{EXPECTED}} | {{CHECK}} | {{OWNER}} |
| 4 | Run smoke/reconciliation | {{EXPECTED}} | {{CHECK}} | {{OWNER}} |

## Database migration and data validation

- Migration IDs/order: {{MIGRATIONS}}
- Backup/snapshot and restore evidence: {{EVIDENCE}}
- Backfill/throttling/reconciliation: {{PLAN}}
- Compatibility window: {{WINDOW}}
- Abort/rollback threshold: {{THRESHOLD}}

## Smoke tests and operational acceptance

| Smoke/Test ID | Exact request/action | Exact expected result/threshold | Evidence |
| :--- | :--- | :--- | :--- |
| TC-SMOKE-001 | {{ACTION}} | {{RESULT_THRESHOLD}} | {{EVIDENCE}} |

## Rollback

| Trigger | Decision owner | Rollback action | Data/schema compatibility | Verify/recovery target |
| :--- | :--- | :--- | :--- | :--- |
| {{TRIGGER_THRESHOLD}} | {{OWNER}} | {{ACTION}} | {{COMPATIBILITY}} | {{TARGET}} |

Không ghi lệnh destructive production mơ hồ. Mỗi lệnh phải chỉ rõ environment/target và precondition/backup.

## Troubleshooting

| Symptom/error code | Likely cause | Safe diagnosis | Recovery/escalation |
| :--- | :--- | :--- | :--- |
| {{SYMPTOM}} | {{CAUSE}} | {{DIAGNOSIS}} | {{RECOVERY_OWNER}} |

## New Developer/Ops dry-run evidence

| Participant | Clean baseline/timebox | Setup/build/deploy/smoke result | Blocking questions | Finding/retest |
| :--- | :--- | :--- | :--- | :--- |
| {{PARTICIPANT}} | {{BASELINE_TIMEBOX}} | {{RESULT_EVIDENCE}} | {{QUESTIONS}} | {{ACTION}} |
