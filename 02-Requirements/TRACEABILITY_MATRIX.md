---
artifact_id: DOC-02-REQUIREMENTS-TRACEABILITY-MATRIX-MD
phase: "02-Requirements"
artifact_type: requirements
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Requirements Traceability Matrix — {{PROJECT_NAME}}

> Each row must trace bidirectionally from the objective to the handover evidence. Use specific file paths, symbols, or test IDs instead of vague statements like "done".

| Objective | Requirement | Source/owner | Priority | Design/ADR | Work item | Code/config evidence | Test/evidence | Release/handover | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| OBJ-001 | FR-001 | Q-Cxxx / {{OWNER}} | Must | DES-001 / ADR-001 | WI-001 | `path::symbol` | TC-001 / result | REL-001 / doc | Draft |

## Valid Statuses

`Draft`, `Approved`, `Designed`, `In Progress`, `Implemented`, `Verified`, `Accepted`, `Deferred`, `Deprecated`.

## Coverage Summary

| Metric | Count | Missing IDs/action |
| :--- | :--- | :--- |
| Approved requirements | 0 | — |
| With design links | 0 | {{IDS}} |
| With implementation evidence | 0 | {{IDS}} |
| With passing test evidence | 0 | {{IDS}} |
| Accepted/handover | 0 | {{IDS}} |

## Accepted Exceptions

| Requirement | Missing link/evidence | Risk | Approver | Expiry/action |
| :--- | :--- | :--- | :--- | :--- |
| {{ID}} | {{GAP}} | {{RISK}} | {{APPROVER}} | {{DATE_ACTION}} |

---

## Template-Maintenance Trace — CR-SECURITY-REFERENCE-001

| Objective | Requirement | Source/owner | Priority | Design/ADR | Work item | Code/config evidence | Test/evidence | Release/handover | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| OBJ-AUTO-001 | BR-AUTO-001 — AI explores evidence before human assistance | Q-CHG-001 / Client | Must | DEC-AUTO-001 | WI-AUTO-001 | `SKILL.md`; `autonomy-and-approvals.md`; Human–AI Protocol | TC-TPL-DOC-001 | Security Reference Index | Implemented |
| OBJ-SEC-001 | NFR-SEC-REF-001 — Template contains full Java code reference with provenance | Q-SEC-001 / Client | Must | DEC-SEC-001 | WI-SEC-REF-001 | `.agents/.../assets/security-reference/` | TC-TPL-SEC-001/002 | Security Reference Index | Implemented |
| OBJ-SEC-001 | NFR-SEC-PORT-001 — Non-Java stack has native refactor/equivalence workflow | Q-SEC-002 / Client | Must | DEC-SEC-002 | WI-SEC-PORT-001 | `security-portability-matrix.md`; SEC-BNK-031..033 | TC-TPL-PORT-001 | Security Reference Index | Implemented |
| OBJ-SEC-001 | NFR-SEC-GATE-001 — Known source finding blocked before production | Security Review / AI | Must | DEC-SEC-003 | WI-SEC-GATE-001 | Bank Security Baseline; Adoption Record; Verification Matrix | TC-TPL-SEC-002/003 | Security Review | Implemented |
| OBJ-QUAL-001 | FR-VAL-001 — Validator checks asset count, required docs and unsafe config | Audit finding / AI | Must | DES-VAL-001 | WI-VAL-001 | `validate_delivery.ps1` | TC-TPL-VAL-001 | Usage Guide | Implemented |

## P0-P3 Template Hardening Trace — 2026-07-18

| Objective | Requirement | Design/decision | Work item | Evidence/test | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| OBJ-TPL-001 | FR-TPL-001: validator SHALL parse only requirement table rows | DEC-TPL-001 / `lint_delivery.ps1` | WI-TPL-001 | TC-TPL-SEM-001 | Implemented |
| OBJ-TPL-002 | FR-TPL-002: required artifacts SHALL include workflow, domain, permission, ASVS, contracts, UI/UX, DevOps, DB, DR/BCP and glossary | artifact-map + phase READMEs | WI-TPL-002 | TC-TPL-DOC-001 | Implemented |
| OBJ-TPL-003 | NFR-TPL-001: Gate 02/03/06/08 SHALL require concrete evidence and sign-off | phase-gates + linter | WI-TPL-003 | TC-TPL-GATE-001 | Implemented |
| OBJ-TPL-004 | NFR-TPL-002: High residual security risk SHALL have exactly one accountable owner | governance RACI | WI-TPL-004 | TC-TPL-RACI-001 | Implemented |
| OBJ-TPL-005 | NFR-TPL-003: contracts SHALL be machine-readable and structurally validated | OpenAPI/AsyncAPI + validator | WI-TPL-005 | TC-TPL-CONTRACT-001 | Implemented |
| OBJ-TPL-006 | NFR-TPL-004: artifacts SHALL expose owner/version/status/IDs/dependencies in front matter | front matter standard + normalizer | WI-TPL-006 | TC-TPL-FM-001 | Implemented |
| OBJ-TPL-007 | FR-TPL-005: START prompts SHALL explicitly select `ai-project-delivery` skill and routed references | START.md Prompt A/B | WI-TPL-007 | TC-TPL-START-001 | Implemented |
| OBJ-TPL-008 | FR-TPL-006: START SHALL provide Vietnamese GREENFIELD and BROWNFIELD prompts equivalent to the English prompts | START.md Vietnamese Prompt A/B | WI-TPL-008 | TC-TPL-START-002 | Implemented |
