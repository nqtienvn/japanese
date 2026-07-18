---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-DESIGN-REVIEW-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Architecture & Design Review

## Checklist

- [ ] Scope, drivers, and linked requirements align with the baseline.
- [ ] Context/container/component/dependency boundaries are clear and not over-engineered.
- [ ] Data ownership, schema, transaction, migration, and retention are clear.
- [ ] ERDs define cardinality/optionality/keys/constraints; the data dictionary matches SRS/API/tests.
- [ ] API/event contracts, versioning, idempotency, and timeout/retry/fallback are clear.
- [ ] API requests/responses/errors/permissions/status/side effects are specific and linked to requirements/tests.
- [ ] State, concurrency, error/recovery, and reversal scenarios are addressed.
- [ ] Auth/authz, threats, privacy, secrets, audit, and abuse controls are sufficient.
- [ ] Security Profile, regulatory applicability, OWASP/project threats, scan/pentest applicability, and severity gates are tailored.
- [ ] No open Critical security risks; High risks have a treatment/owner/expiry or the gate is marked Fail.
- [ ] Module responsibility/contract/dependency/blast radius are clear; "no impact on other modules" claims are replaced by impact/regression evidence.
- [ ] When UI is applicable, design system, component/states, responsive/accessibility, and prototype evidence for High/Critical user journeys are defined; tool N/A has a rationale.
- [ ] Performance/capacity/reliability/observability/cost targets/tactics are defined.
- [ ] Testability, rollout, compatibility, and rollback are feasible.
- [ ] ADRs record decisions that are hard to reverse; the RTM is updated.

## Findings

| Finding ID | Severity | Design/requirement | Finding | Required action | Owner | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| DR-001 | Critical / High / Medium / Low | DES/ADR/REQ | {{FINDING}} | {{ACTION}} | {{OWNER}} | Open |

## Gate decision

| Reviewer | Decision | Date | Conditions/accepted risk |
| :--- | :--- | :--- | :--- |
| Tech Lead | Pending / Pass / Conditional / Fail | {{DATE}} | {{CONDITION}} |
| QA/Security/Ops | Pending / Pass / Conditional / Fail | {{DATE}} | {{CONDITION}} |
