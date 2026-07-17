---
artifact_id: DOC-01-PLANNING-DISCOVERY-LOG-MD
phase: "01-Planning"
artifact_type: planning
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Stakeholder Discovery Log — {{PROJECT_NAME}}

## Interview Status

| Field | Value |
| :--- | :--- |
| Interview owner | AI Business Analyst / {{OWNER}} |
| Client decision owner | {{PRODUCT_OWNER}} |
| Core coverage | 0 / 120 applicable |
| Product coverage | 0 / applicable |
| Engineering coverage | 0 / applicable |
| Baseline | Draft / Review / Approved |

## Answer Register

| Question ID | Short Question | Answer/Evidence | Status | Source | Confidence | Owner | Follow-up/Deadline |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Q-C001 | One-sentence idea | {{ANSWER}} | Confirmed / Assumed / Unknown / Delegated / N/A | Client / Code / Doc / Test | H/M/L | {{OWNER}} | {{FOLLOW_UP}} |

## Synthesis After Each Round

### Round {{NNN}} — {{DATE}} — {{TOPIC}}

- Confirmed: {{CONFIRMED_DECISIONS}}
- Contradictions/Open Items: {{CONTRADICTIONS}}
- New Assumptions: {{ASSUMPTIONS}}
- New Requirement/Decision IDs: {{IDS}}
- Next Round Topic: {{NEXT_TOPIC}}

## Decision Log

| Decision ID | Decision | Options/Trade-Off | Decider | Date | Artifact Affected |
| :--- | :--- | :--- | :--- | :--- | :--- |
| DEC-001 | {{DECISION}} | {{OPTIONS}} | {{DECIDER}} | {{DATE}} | {{FILES}} |

## Open Questions

| ID | Content | Rationale | Owner | Deadline | Block Phase? |
| :--- | :--- | :--- | :--- | :--- | :--- |
| OQ-001 | {{QUESTION}} | {{RATIONALE}} | {{OWNER}} | {{DATE}} | Yes / No |

## Baseline Approval

| Content | Client Decision | Date | Note |
| :--- | :--- | :--- | :--- |
| Problem/outcome | Pending | {{DATE}} | {{NOTE}} |
| Scope/release boundary | Pending | {{DATE}} | {{NOTE}} |
| Autonomy for local execution | Pending | {{DATE}} | GUIDED / STANDARD / FULL-LOCAL |

---

## Change Discovery — CR-SECURITY-REFERENCE-001

| Question ID | Short Question | Answer/Evidence | Status | Source | Confidence | Owner | Follow-up/Deadline |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Q-CHG-001 | What is the autonomy goal? | AI works autonomously; requests human help only for intent, material decisions, access, manual actions, approvals, and sign-offs. | Confirmed | Client | High | Client | Implement in governance/skill |
| Q-SEC-001 | Which security sources must be used? | `E:\mb_laos_be\security` and `E:\mb_laos_be\mb-security-starter`; Client allows copying as a reference. | Confirmed | Client | High | Client | Preserve provenance; no external publish |
| Q-SEC-002 | How should non-Java projects handle this? | Refactor Java security responsibilities into native implementation of the target language. | Confirmed | Client | High | Client | Add portability/equivalence gate |
| Q-SEC-003 | Should raw secrets/unsafe defaults be copied? | No; security policy requires sanitization and quarantining known findings. | Delegated | Policy + code evidence | High | AI Security Reviewer | Verify with validator/scan |

### Round SEC-001 — 2026-07-17 — Security Reference and Autonomy

- Confirmed: Maximize AI autonomy; use two Java sources; support multi-language refactoring.
- Resolved contradiction: "copy all" does not include propagating raw secrets or unsafe defaults.
- Assumption: Reference is internal only; publishing/redistributing requires separate approval.
- IDs: `DEC-AUTO-001`, `DEC-SEC-001..003`, `NFR-SEC-REF-001`, `NFR-SEC-PORT-001`.
- Next Round Topic: Automated verification; no new stakeholder questions required.

### Baseline Decision

| Content | Decision | Date | Evidence |
| :--- | :--- | :--- | :--- |
| Security reference scope | Approved | 2026-07-17 | Client request |
| Cross-language refactor | Approved | 2026-07-17 | Client clarification |
| Full-local implementation | Approved | 2026-07-17 | Client request |

## Template Maintenance Round — 2026-07-18

| Question ID | Evidence/Answer | Decision/Owner | Impact |
| :--- | :--- | :--- | :--- |
| Q-TPL-001 | Backlog P0–P3 supplied by Client | Delivery Vendor applies locally; Client only needed for downstream product decisions | Added validator, artifacts, sample and catalogs |
| Q-TPL-002 | Java security snapshots are reference responsibilities, not a JVM lock-in | Architecture/Security must preserve contract and equivalence tests in native stack | Added portability and adoption controls |
| Q-TPL-003 | Human intervention only for stakeholder/authority/access/manual/approval triggers | AI continues local reversible work and records blocker evidence | Added gate/evidence protocol and no status-only passes |
| Q-TPL-004 | START prompts must explicitly invoke the local delivery skill | Updated Prompt A and Prompt B; no separate skill paste is required after startup | Ensures consistent workflow loading across GREENFIELD/BROWNFIELD |
| Q-TPL-005 | Client requested Vietnamese startup prompts | Added equivalent Vietnamese Prompt A/B below the English blocks in `START.md`; both retain explicit skill invocation and read order | Easier adoption for Vietnamese stakeholders without changing workflow semantics |
