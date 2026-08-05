---
artifact_id: DOC-02-REQUIREMENTS-TRACEABILITY-MATRIX-MD
phase: "02-Requirements"
artifact_type: requirements
owner: "AI Business Analyst"
version: "0.2"
status: Draft
ids: [OBJ-JNOTE-001, OBJ-JNOTE-002, OBJ-JNOTE-003, OBJ-JNOTE-004]
dependencies: [PROJECT_PROFILE.md, 01-Planning/DISCOVERY_LOG.md]
last_verified: "2026-08-06"
---
# Requirements Traceability Matrix — Sổ tay học tiếng Nhật (`JNOTE`)

> This is a Discovery-stage trace seed. It deliberately contains no approved `BR`, `FR`, or `NFR`: atomic, normative requirements will be created only after the Client approves the problem/scope/requirements baseline. `TBD` is not evidence of delivery.

| Objective | Requirement / discovery seed | Source / owner | Priority | Design / ADR | Work item | Code / config evidence | Test / evidence | Release / handover | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `OBJ-JNOTE-001` — Capture vocabulary | Manual Japanese/Vietnamese entries have independent multi-select labels, start unlabelled, prevent exact-pair duplicates, support archive/restore, and remain isolated to a verified email/password account. Validation and deletion semantics remain open. | Client / Round 1–4 decisions | Candidate Must | TBD after baseline | TBD | No production code permitted | Discovery Log: `DEC-JNOTE-006`, `DEC-JNOTE-009`, `DEC-JNOTE-010` | TBD | Draft |
| `OBJ-JNOTE-002` — Practise vocabulary | Flashcard and Study support two directions; all/mode-labelled source and 10/20/all size; stored self-rating/progress; four choices; immediate feedback; near-50/50 mixed mode; and diacritic-sensitive Vietnamese written answers. Retry/scoring and UX error edges remain open. | Client / Round 1–4 decisions | Candidate Must | TBD after baseline | TBD | No production code permitted | Discovery Log: `DEC-JNOTE-006`, `DEC-JNOTE-008`, `DEC-JNOTE-009` | TBD | Draft |
| `OBJ-JNOTE-003` — Assess learning | A timed Quiz auto-submits; source/count/duration are selected at start with 10-question/10-minute defaults; it persists across interruption under a server-authoritative timer, allows one active Quiz/account, and shows detailed saved review information. Score and recovery edges remain open. | Client / Round 1–4 decisions | Candidate Must | TBD after baseline | TBD | No production code permitted | Discovery Log: `DQ-JNOTE-R2-007`, `DEC-JNOTE-009`, `DEC-JNOTE-010` | TBD | Draft |
| `OBJ-JNOTE-004` — Protect private learning data | Verified email/password identity, user-isolated learning data, export/deletion controls, and HIGH-profile security outcomes require atomic requirements and test evidence. | Client / Round 3–4 decisions | Candidate Must | TBD after baseline | TBD | No production code permitted | Discovery Log: `DEC-JNOTE-007`, `DEC-JNOTE-009`, `DEC-JNOTE-010` | TBD | Draft |

## Coverage Summary

| Metric | Count | Missing IDs / action |
| :--- | :--- | :--- |
| Approved normative requirements | 0 | Discovery and baseline approval required. |
| Discovery objectives recorded | 4 | `OBJ-JNOTE-001..004` |
| With design links | 0 | Design is prohibited before Gate 02. |
| With implementation evidence | 0 | Production code is prohibited before approved implementation plan/work items. |
| With passing test evidence | 0 | Test specification awaits requirements. |
| Accepted / handover | 0 | Not applicable at Discovery. |

## Traceability Risks

| Risk ID | Traceability gap | Owner | Resolution gate |
| :--- | :--- | :--- | :--- |
| `RISK-JNOTE-001` | Account/data/security model is unknown, so no security/privacy requirement can yet be written or traced. | Client / AI Security Reviewer | Requirements baseline (Gate 02) |
| `RISK-JNOTE-002` | Learning interactions are described at a feature level but lack atomic acceptance rules. | Client / AI Business Analyst | Requirements baseline (Gate 02) |

## Accepted Exceptions

| Requirement | Missing link / evidence | Risk | Approver | Expiry / action |
| :--- | :--- | :--- | :--- |
| — | — | — | — | — |
