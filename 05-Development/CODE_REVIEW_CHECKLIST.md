---
artifact_id: DOC-05-DEVELOPMENT-CODE-REVIEW-CHECKLIST-MD
phase: "05-Development"
artifact_type: development
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Code Review Checklist

## Context

| Field | Value |
| :--- | :--- |
| WI / requirements | {{WI_IDS}} / {{REQUIREMENT_IDS}} |
| Design / ADR | {{DESIGN_IDS}} |
| Reviewer | {{REVIEWER}} |
| Risk level | Low / Medium / High / Critical |

## Correctness and maintainability

- [ ] Code implements correct acceptance criteria, without silent scope expansion.
- [ ] Edge, error, concurrency, idempotency, and transaction paths are correct.
- [ ] Naming, boundaries, dependencies, and conventions align with the codebase.
- [ ] Module contracts, blast radius, and compatibility are clear; does not rely on "no impact on other modules" assumptions.
- [ ] No dead code, debug statements, generated noise, or significant duplication.
- [ ] Error messages and actionable handling do not mask errors or leak internal details.

## Security and privacy

- [ ] Authentication/authorization are enforced at trust boundaries, default deny.
- [ ] Input/output/files/queries are properly validated, encoded, and parameterized.
- [ ] Security Profile controls and linked threat/security requirements have code/test evidence.
- [ ] Secrets and PII are not hard-coded, logged, or transmitted outside policy.
- [ ] Dependencies, cryptography, random generation, token/session lifecycle, and rate limits are appropriate.
- [ ] Threat/abuse cases and audit requirements are tested.

## Data, compatibility, and operations

- [ ] Schema, migrations, and data backfills have compatibility and rollback plans.
- [ ] API/event/config/feature flag versioning, defaults, and expiry are clear.
- [ ] Logs, metrics, traces, health checks, and alerts are sufficient for operations.
- [ ] Timeout, retry, fallback, cost, and capacity impacts are considered.

## Tests and documentation

- [ ] New tests demonstrate failure first and pass post-fix when applicable.
- [ ] Assertions verify behavior, including negative and regression paths.
- [ ] No flaky tests, shared state issues, or real test data usage.
- [ ] RTM, changelog, design, runbook, and user docs are updated.

## Review outcome

| Finding | Severity | Action | Owner | Status |
| :--- | :--- | :--- | :--- | :--- |
| {{FINDING}} | Critical / High / Medium / Low | {{ACTION}} | {{OWNER}} | Open |
