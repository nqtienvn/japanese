---
artifact_id: DOC-04-IMPLEMENTATION-WORK-ITEM-TEMPLATE-MD
phase: "04-Implementation"
artifact_type: implementation
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# WI-{{NNN}} — {{WORK_ITEM_TITLE}}

| Field | Value |
| :--- | :--- |
| Type | Feature / Defect / Refactor / Migration / Spike / Documentation |
| Owner / reviewer | {{OWNER}} / {{REVIEWER}} |
| Requirement/design | {{REQUIREMENT_IDS}} / {{DESIGN_IDS}} |
| Priority / estimate | {{PRIORITY}} / {{ESTIMATE_CONFIDENCE}} |
| Status | Ready / In Progress / Review / Verified / Done / Blocked |

## Outcome and scope

- User/business outcome: {{OUTCOME}}
- In scope: {{IN_SCOPE}}
- Out of scope: {{OUT_OF_SCOPE}}

## Implementation notes

- Components/files likely affected: {{AREAS}}
- Contract/data/migration: {{IMPACT}}
- Security/privacy/observability: {{IMPACT}}
- Compatibility/feature flag: {{PLAN}}
- Module/dependency blast radius and regression boundary: {{IMPACT_EVIDENCE}}
- Human/manual/approval dependency (if any): {{ASSISTANCE_ID_TRIGGER_MIN_ACTION}}

## Acceptance / verification

- [ ] {{FUNCTIONAL_ACCEPTANCE}}
- [ ] {{NEGATIVE_EDGE_ACCEPTANCE}}
- [ ] Relevant build/lint/static/unit checks passed.
- [ ] `TC-XXX` passed and evidence recorded.
- [ ] RTM/changelog/docs/runbook updated if affected.

## Execution log

| Date | Action/command | Result/evidence | Decision/follow-up |
| :--- | :--- | :--- | :--- |
| {{DATE}} | {{ACTION}} | {{RESULT}} | {{FOLLOW_UP}} |

If status is `Blocked`, document at least three materially different alternatives attempted before triggering a `HUM-BLOCKER` assistance request, unless the blocker is clearly related to access, credentials, manual configuration, or approvals.
