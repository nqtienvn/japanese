---
artifact_id: DOC-00-GOVERNANCE-POLICY-STATEMENT-OF-WORK-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "AI Delivery Vendor"
version: "1.0"
status: Approved
ids: [OBJ-JNOTE-001, OBJ-JNOTE-002, OBJ-JNOTE-003, OBJ-JNOTE-004]
dependencies: [PROJECT_PROFILE.md, 00-Governance-Policy/PROJECT_CHARTER.md]
last_verified: "2026-08-06"
---
# Statement of Work — `JNOTE`

> This delivery statement governs the local software work. It is not a legally binding contract and does not replace legal review.

## Purpose, parties, and period

- **Client:** the Product Owner and sole learner/data owner.
- **Delivery Vendor:** AI Delivery Vendor.
- **Period:** starts 2026-08-06; there is no fixed end date.
- **Purpose:** deliver the scope in the Project Charter using traceable requirements, tests, operating documentation, and a Git handover.

## Deliverables

| ID | Deliverable | Acceptance evidence | Owner |
| :--- | :--- | :--- | :--- |
| `DEL-JNOTE-001` | Governance, Discovery, plan, risks, BRD/SRS, and RTM | Gate 00–02 evidence and atomic requirement review | AI Delivery Vendor |
| `DEL-JNOTE-002` | Architecture, data/RLS, UX, threat, API/contract, and implementation plan | Gate 03–04 design review and trace links | AI Delivery Vendor |
| `DEL-JNOTE-003` | React + Supabase-compatible source and local configuration templates | Build/type/lint/test evidence and committed source | AI Delivery Vendor |
| `DEL-JNOTE-004` | Test/report/runbook/user/handover documents | Test RTM, validation reports, and local newcomer instructions | AI Delivery Vendor |

## Delivery boundaries

The scope and exclusions in the Project Charter are binding for release one. A request that changes the outcome, core learning behaviour, security/privacy posture, cost, deadline, or acceptance criteria SHALL be recorded as a change request with impact analysis before implementation.

## Client inputs and protected actions

The Client provides only secure configuration references required for a real Supabase integration, if and when requested. The Client does not send secrets in chat. The Client has authorized Git commits and push to the specified GitHub repository, but deployment/public publishing, paid service activation, production/shared-environment mutation, and residual-risk acceptance require a separate approval.

## Acceptance and handover

Acceptance requires the Client to complete `DQ-JNOTE-R5-010`, the build/test/security evidence to meet exit criteria, and every in-scope requirement to have a trace or documented exception. The handover contains source, environment references, test evidence, deployment-not-authorized note, rollback/local recovery guidance, known limitations, and residual risks.
