---
artifact_id: DOC-07-REPORTS-RELEASE-REPORT-MD
phase: "07-Reports"
artifact_type: report
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Release Report — {{PROJECT_NAME}} / REL-{{VERSION}}

## Release identity

| Item | Value |
| :--- | :--- |
| Artifact/version/commit | {{IDENTITY}} |
| Environment/date | {{ENV_DATE}} |
| Release owner | {{OWNER}} |
| Client approval | {{APPROVAL_EVIDENCE}} |

## Delivered scope

| Requirement/outcome | Change summary | Evidence | Acceptance |
| :--- | :--- | :--- | :--- |
| FR/OBJ-XXX | {{CHANGE}} | {{RTM_TEST_DEMO}} | Accepted / Conditional |

## Deferred/out of scope

| Item | Reason | Risk/impact | Next action/owner |
| :--- | :--- | :--- | :--- |
| {{ITEM}} | {{REASON}} | {{IMPACT}} | {{ACTION}} |

## Quality evidence

- Build/CI: {{EVIDENCE}}
- Test report/UAT: `../06-Testing/TEST_REPORT.md`, `../06-Testing/UAT_AND_ACCEPTANCE.md`
- Security/performance/recovery: {{EVIDENCE}}
- Security Profile / threat-control-test coverage: {{PROFILE_EVIDENCE}}
- Security scans/pentest scope, exclusions, and results: {{SECURITY_VERIFICATION}}
- Open defects/accepted risk: {{IDS}}

Release decision must be No-Go if any Critical security risk/vulnerability remains open. High acceptance requires mitigation, owner, expiry, retest, and appropriate Security/Client authority.

## Deployment/migration

| Step/window | Result | Verification | Incident/deviation |
| :--- | :--- | :--- | :--- |
| {{STEP}} | {{RESULT}} | {{EVIDENCE}} | {{ISSUE}} |

## Rollback and Monitoring

- Rollback plan/trigger: `../04-Implementation/MIGRATION_RELEASE_ROLLBACK.md`
- SLI/dashboard/alert review: {{EVIDENCE}}
- Observation period/result: {{RESULT}}

## Known Issues and Support

| Issue/risk | Workaround | Owner/SLA | Client impact |
| :--- | :--- | :--- | :--- |
| {{ISSUE}} | {{WORKAROUND}} | {{OWNER_SLA}} | {{IMPACT}} |

## Decision

| Decision |
| :--- |
| Go / Conditional Go / No-Go — {{DECIDER_DATE_REASON}} |
