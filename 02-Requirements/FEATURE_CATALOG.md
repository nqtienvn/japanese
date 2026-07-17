---
artifact_id: DOC-02-REQUIREMENTS-FEATURE-CATALOG-MD
phase: "02-Requirements"
artifact_type: requirements
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Feature Catalog — {{PROJECT_NAME}}

## Feature Inventory

| Feature ID | Name | Outcome/persona | BR/FR/UC | Priority | Complexity | Risk domains | Release | Owner | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| FEAT-XXX-001 | {{FEATURE_NAME}} | {{OUTCOME_PERSONA}} | {{REQUIREMENT_IDS}} | Must | Low / Medium / High / Critical | Integration / Payment / PII / State / Concurrency / Migration / Background | REL-XXX | {{OWNER}} | Draft |

## Feature Detail

### FEAT-XXX-001 — {{FEATURE_NAME}}

- Business outcome and KPI: {{OUTCOME_KPI}}
- Primary/secondary actors: {{ACTORS}}
- Trigger and preconditions: {{TRIGGER_PRECONDITIONS}}
- In scope / out of scope: {{SCOPE}}
- Data/entities and classification: {{DATA}}
- Integrations/interfaces: {{INTEGRATIONS}}
- State transitions/business rules: {{STATE_RULES}}
- Permission/audit/privacy: {{SECURITY_PRIVACY}}
- NFR targets and measurement: {{NFR_TARGETS}}
- Use cases: {{UC_IDS}}
- Design/API/UI/Test links: {{TRACE_LINKS}}
- Release/rollback/operations impact: {{DELIVERY_IMPACT}}

## Readiness Checklist

- [ ] ID, owner, outcome, priority, release, and linked requirements are clear.
- [ ] Complexity/risk domains are assessed to select quality audit samples.
- [ ] Happy/alternate/error/recovery and edge cases have associated use cases.
- [ ] NFRs use measurable targets, avoiding vague terms.
- [ ] Design/API/data/UI/test trace links have an owner or additions plan.
