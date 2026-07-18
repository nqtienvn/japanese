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

Problem, forces, constraints, quality attributes, and decision timeline: {{CONTEXT}}

## Decision criteria

| Criterion | Weight | Must-have threshold |
| :--- | :---: | :--- |
| {{CRITERION}} | {{WEIGHT}} | {{THRESHOLD}} |

## Options

| Option | Description | Pros | Cons/Risks | Cost/Operability | Score |
| :--- | :--- | :--- | :--- | :--- | :---: |
| A | {{OPTION}} | {{PROS}} | {{CONS}} | {{COST_OPS}} | {{SCORE}} |

## Decision

Selected {{OPTION}} because {{RATIONALE}}.

## Consequences

- Positive: {{POSITIVE}}
- Negative/trade-off: {{NEGATIVE}}
- Security/privacy/compliance: {{IMPACT}}
- Migration/rollback: {{IMPACT}}
- Follow-up/expiry trigger: {{ACTION}}

## Validation

| Required Evidence | Owner | Due | Result |
| :--- | :--- | :--- | :--- |
| {{SPIKE_TEST_METRIC}} | {{OWNER}} | {{DATE}} | Pending |
