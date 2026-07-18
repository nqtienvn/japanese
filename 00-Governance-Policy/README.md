---
artifact_id: DOC-00-GOVERNANCE-POLICY-README-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Phase 00 — Governance & Policy

## Objective

Establish the working relationship between the `Client` and the `Delivery Vendor`, defining decision rights, responsibilities, contract scope, change management, and quality standards before in-depth analysis.

## Default Roles

- `Client`: provides business context, decides priorities/scope, provisions necessary data/access, participates in reviews/UAT, and accepts deliverables.
- `Delivery Vendor`: proactively conducts discovery, analysis, design, development, testing, reporting, release planning, and handover.
- The AI shall not approve scope, cost, production deployments, or accept critical risks on behalf of the Client.

## Artifacts

- `PROJECT_CHARTER.md`: business case, objectives, stakeholders, and authorities.
- `STATEMENT_OF_WORK.md`: deliverables, in/out of scope, milestones, and commercial assumptions.
- `GOVERNANCE_AND_RACI.md`: RACI, decision rights, cadence, DoR/DoD.
- `ENGINEERING_POLICY.md`: coding standards, security, privacy, testing, and evidence.
- `SECURITY_AND_PRIVACY_STANDARD.md`: Security Profile, controls, regulatory applicability, verification, and security release gates.
- `BANK_SECURITY_REFERENCE_BASELINE.md`: adoption/refactor rules for the two Java snapshots, portability, and exact security outcomes.
- `FRONT_MATTER_STANDARD.md`: machine-readable owner, version, status, IDs, and dependencies for all artifacts.
- `REUSABLE_QUALITY_PATTERNS.md`: catalog of NFR, security, and test patterns for reuse and tailoring.
- `HUMAN_AI_COLLABORATION_PROTOCOL.md`: triggers, evidence, and the protocol for the AI to request human assistance.
- `DOCUMENT_QUALITY_STANDARD.md`: coverage, atomic/unambiguous/testable/traceable requirements, and field-validation rules.
- `STANDARDS_ALIGNMENT_MATRIX.md`: mapping to requirements, testing, security, and privacy references, versions, tailoring, and claim boundaries.
- `CHANGE_REQUEST_TEMPLATE.md`: change control for scope, schedule, cost, and risk.
- `COMMERCIAL_AND_ACCEPTANCE_MODEL.md`: estimation, acceptance criteria, warranty, and support.

## Gate 00

- [ ] Client owner and Vendor delivery owner are identified.
- [ ] Scope of discovery, autonomy, and approval-only actions is clear.
- [ ] SOW, commercial assumptions, and initial exceptions are recorded.
- [ ] RACI, escalation, change control, DoR/DoD, and policies have designated owners.
- [ ] Standards tailoring/alignment and document quality controls are selected and have owners.
- [ ] Security Profile, risk appetite, regulatory applicability, and security owner are defined.
- [ ] Bank security snapshot applicability, proprietary-code boundaries, and cross-language refactor rules are documented.
- [ ] Human-assistance triggers, escalations, and approval-only boundaries are tailored.
- [ ] No outstanding Critical/High conflicts without a designated decision maker.
