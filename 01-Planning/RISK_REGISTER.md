---
artifact_id: DOC-01-PLANNING-RISK-REGISTER-MD
phase: "01-Planning"
artifact_type: planning
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Risk, Assumption, Issue & Dependency Register

## Scoring Scale

Probability and Impact: 1–5; Exposure = P × I. `15–25 Critical`, `10–14 High`, `5–9 Medium`, `1–4 Low`.

| ID | Type | Description | P | I | Exposure | Trigger | Response/mitigation | Owner | Due | Status |
| :--- | :--- | :--- | :---: | :---: | :---: | :--- | :--- | :--- | :--- | :--- |
| RISK-001 | Risk | {{RISK}} | 3 | 4 | 12 | {{TRIGGER}} | {{MITIGATION}} | {{OWNER}} | {{DATE}} | Open |
| ASM-001 | Assumption | {{ASSUMPTION}} | — | — | — | Validation fails | {{ACTION}} | {{OWNER}} | {{DATE}} | Unverified |
| ISS-001 | Issue | {{ISSUE}} | — | 4 | — | Already occurred | {{RESOLUTION}} | {{OWNER}} | {{DATE}} | Open |
| DEP-001 | Dependency | {{DEPENDENCY}} | 3 | 3 | 9 | Missed commitment | {{FALLBACK}} | {{OWNER}} | {{DATE}} | At Risk |
| RISK-SEC-REF-001 | Risk | Legacy source contains committed secrets and weak PBE config | 4 | 5 | 20 | Raw source is copied/published | Do not copy values; sanitize snapshot; owner rotates credentials if still valid | Security Owner | 2026-07-17 | Mitigated in template |
| RISK-SEC-REF-011 | Issue | Both sources lack tests; starter fails compilation; legacy lacks private dependencies | — | 5 | — | Project treats snapshot as production-ready | Quarantine; mandatory clean build and Security Verification Matrix at adoption | Project Tech/Security Owner | Per project | Open per adoption |
| RISK-SEC-REF-013 | Risk | Dependency/framework baseline is outdated or unsupported | 4 | 4 | 16 | SCA/support check fails | Resolve current supported stack per project; compatibility testing prior to upgrade | Project Tech Lead | Before Gate 05 | Open per adoption |

## Review rules

- Critical/High: reviewed at every delivery update; cannot pass phase gates without a designated owner and response plan.
- Accepted risks must have an approver, expiry/review date, and documented residual impact.
- Closed risks must retain their history and resolution evidence.
