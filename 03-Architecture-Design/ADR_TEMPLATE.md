---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-ADR-TEMPLATE-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# ADR-{{NNN}} — {{DECISION_TITLE}}

| Field | Value |
| :--- | :--- |
| Status | Proposed / Accepted / Superseded / Deprecated |
| Date / deciders | {{DATE}} / {{DECIDERS}} |
| Linked requirements | {{REQUIREMENT_IDS}} |
| Supersedes / superseded by | {{ADR_IDS}} |

## Context

Vấn đề, forces, constraint, quality attributes và thời điểm cần quyết định: {{CONTEXT}}

## Decision criteria

| Criterion | Weight | Must-have threshold |
| :--- | :---: | :--- |
| {{CRITERION}} | {{WEIGHT}} | {{THRESHOLD}} |

## Options

| Option | Mô tả | Ưu | Nhược/risk | Cost/operability | Score |
| :--- | :--- | :--- | :--- | :--- | :---: |
| A | {{OPTION}} | {{PROS}} | {{CONS}} | {{COST_OPS}} | {{SCORE}} |

## Decision

Chọn {{OPTION}} vì {{RATIONALE}}.

## Consequences

- Positive: {{POSITIVE}}
- Negative/trade-off: {{NEGATIVE}}
- Security/privacy/compliance: {{IMPACT}}
- Migration/rollback: {{IMPACT}}
- Follow-up/expiry trigger: {{ACTION}}

## Validation

| Evidence cần có | Owner | Due | Result |
| :--- | :--- | :--- | :--- |
| {{SPIKE_TEST_METRIC}} | {{OWNER}} | {{DATE}} | Pending |
