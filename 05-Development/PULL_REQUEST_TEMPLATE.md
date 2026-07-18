---
artifact_id: DOC-05-DEVELOPMENT-PULL-REQUEST-TEMPLATE-MD
phase: "05-Development"
artifact_type: development
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# {{WI-ID}} — {{CHANGE_TITLE}}

## Why / outcome

{{BUSINESS_AND_USER_OUTCOME}}

## Traceability

- Requirements: {{REQUIREMENT_IDS}}
- Design/ADR: {{DESIGN_IDS}}
- Tests: {{TEST_IDS}}
- Change/release: {{CR_REL_IDS}}

## What changed

- {{CHANGE}}

## Risk and rollout

- Risk level/areas: {{RISK}}
- Data/API/config/compatibility: {{IMPACT}}
- Feature flag/migration/rollback: {{PLAN}}
- Security/privacy/observability: {{IMPACT}}

## Evidence

| Check | Command/job | Result |
| :--- | :--- | :--- |
| Build/lint/type/static | {{COMMAND}} | {{RESULT}} |
| Unit/integration/E2E | {{COMMAND}} | {{RESULT}} |
| Manual/visual/NFR | {{METHOD}} | {{RESULT}} |

## Checklist

- [ ] Scope is small and reviewable; unrelated user changes are preserved.
- [ ] Acceptance, tests, RTM, changelog, and documentation are updated.
- [ ] No secrets, PII, or debug artifacts included.
- [ ] Appropriate reviewers/owners have been assigned.
