---
artifact_id: DOC-00-GOVERNANCE-POLICY-GOVERNANCE-AND-RACI-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Governance, RACI & Quality Gates — {{PROJECT_NAME}}

## 1. Role directory

| Role | Person/AI role | Key Responsibilities | Backup |
| :--- | :--- | :--- | :--- |
| Client Sponsor | {{PROJECT_OWNER}} | Budget/outcome/escalation | {{BACKUP}} |
| Client Product Owner | {{PRODUCT_OWNER}} | Scope/priority/acceptance | {{BACKUP}} |
| Vendor Delivery Lead | {{PROJECT_MANAGER}} | Plan/risk/delivery | {{BACKUP}} |
| Business Analyst | AI / {{NAME}} | Discovery/requirements/RTM | {{BACKUP}} |
| Tech Lead | {{TECH_LEAD}} | Architecture/implementation | {{BACKUP}} |
| QA Lead | {{QA_LEAD}} | Test/quality gate | {{BACKUP}} |
| Security/Privacy Owner | {{SECURITY_OWNER}} | Risk/compliance sign-off | {{BACKUP}} |
| Operations Owner | {{OPS_OWNER}} | Release/run/incident | {{BACKUP}} |

## 2. RACI

`R` Responsible, `A` Accountable, `C` Consulted, `I` Informed.

| Activity | Client PO | Vendor Lead | BA | Tech | QA | Sec/Privacy | Ops |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| Discovery baseline | A | R | R | C | C | C | I |
| Scope/change | A | R | C | C | C | C | I |
| Architecture | C | A | C | R | C | C | C |
| Development | I | A | C | R | C | C | I |
| Test/UAT | A | C | C | C | R | C | I |
| Security risk treatment/recommendation | C | A | I | R | C | R | I |
| High residual security risk acceptance | C | C | I | C | C | A | I |
| Production release | A | R | I | C | C | C | R |
| Handover | A | R | C | C | C | C | R |

RACI control: Each activity must have exactly one 'A' (Accountable). For High residual security risk, the Security/Privacy Owner is accountable for the risk decision; the Client PO is consulted and records business acceptance in the decision record. Do not assign two 'A's to the same row.

## 3. Cadence

| Ceremony | Frequency | Participants | Output |
| :--- | :--- | :--- | :--- |
| Discovery interview | As needed | Client + BA | Answer/decision log |
| Delivery update | {{CADENCE}} | Client + Vendor | Status/risk/decision |
| Demo/review | {{CADENCE}} | Stakeholders | Feedback/acceptance |
| Gate review | End of phase | Approvers | Pass/conditional/fail |
| Human-assistance review | Upon trigger | Request owner + AI/Vendor | Decision/access/manual evidence and resume action |
| Incident review | Upon occurrence | Related owners | PIR/actions |

## 4. Definition of Ready

- [ ] Requirement ID, source, business value, and owner are defined.
- [ ] Acceptance criteria are testable; dependencies, data, and access are identified.
- [ ] UX/design/API/data impact is sufficiently clear based on risk.
- [ ] Security, privacy, and NFRs have been considered.
- [ ] No blocking decisions are left without an owner.

## 5. Definition of Done

- [ ] Code/config reviews completed; build, lint, and static checks passed.
- [ ] Risk-appropriate testing has passed with evidence.
- [ ] RTM, changelog, and related documentation/runbooks updated.
- [ ] No secrets or real data in inappropriate artifacts.
- [ ] Acceptance criteria met, or an approved exception is documented with a target date.

## 6. Escalation

The AI will not escalate solely because a task is difficult or time-consuming. Assistance requests must include a trigger, decision class, evidence, alternatives attempted, recommendation, confirmation deadline, timeout fallback, the minimal manual action required, and the safe services/work the AI can continue according to the `HUMAN_AI_COLLABORATION_PROTOCOL.md`.

| Severity | Example | Response SLA | Escalate to |
| :--- | :--- | :--- | :--- |
| Critical | Data loss/security breach/production blocker | {{TIME}} | Sponsor + Security + Vendor Lead |
| High | Milestone/SLA at risk of slipping | {{TIME}} | Client PO + Vendor Lead |
| Medium | Scope/quality issue with a workaround | {{TIME}} | Workstream owner |
| Low | Improvements/technical debt | {{TIME}} | Backlog owner |
