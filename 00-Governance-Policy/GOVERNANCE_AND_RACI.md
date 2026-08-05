---
artifact_id: DOC-00-GOVERNANCE-POLICY-GOVERNANCE-AND-RACI-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "AI Delivery Vendor"
version: "1.0"
status: Approved
ids: [DEC-JNOTE-011, RISK-JNOTE-001]
dependencies: [00-Governance-Policy/PROJECT_CHARTER.md, PROJECT_PROFILE.md]
last_verified: "2026-08-06"
---
# Governance, RACI, and Quality Gates — `JNOTE`

## Roles

| Role | Accountable person/role | Responsibility |
| :--- | :--- | :--- |
| Client Sponsor/Product Owner/Data Owner | Client | Product outcome, protected approvals, UAT and final acceptance. |
| Delivery Lead/BA/Architect/Developer/QA/Security/Ops/Writer | AI Delivery Vendor | Delivery execution, traceability, local verification, risk management, and documentation. |
| External dependency owner | Client | Secure Supabase configuration reference when integration verification requires it. |

## RACI

| Activity | Client | AI Delivery Vendor |
| :--- | :---: | :---: |
| Discovery and ordinary baseline choices | I | A/R |
| Scope, requirements, architecture, work items, tests, reports | I | A/R |
| UAT and final acceptance | A | R |
| Security threat/control/test design | I | A/R |
| Real credentials / paid services / deployment / publishing / risk acceptance | A/R | C |
| Git commits and authorized GitHub push | I | A/R |

`A` = accountable, `R` = responsible, `C` = consulted, `I` = informed. `DEC-JNOTE-011` delegates ordinary decision authority; it does not alter protected actions.

## Gate and escalation model

| Gate | Minimum decision | Approver | Escalation |
| :--- | :--- | :--- | :--- |
| 00 | Governance, authority, security profile, and assistance rules are documented. | AI under delegated authority | Client for any protected action. |
| 01–04 | Baseline, requirements, design, and work-item/test-plan evidence is traceable. | AI under delegated authority | Client if scope/security/cost changes. |
| 05–07 | Build/quality/release readiness evidence is complete. | AI recommends; Client sees result | Client for risk acceptance or deployment. |
| 08 | Handover is evidence-backed; Client performs UAT/acceptance. | Client | No implicit acceptance. |

## Definition of Ready and Done

A work item is ready only with linked requirement/design/test, explicit owner, acceptance, and no unresolved High dependency. It is done only with implementation, passing relevant evidence, RTM links, operational/documentation impact, and no unapproved Critical risk.

## Change and assistance control

The AI records changes and makes local reversible decisions autonomously. A material ambiguity, account access, external action, legal/security acceptance, deployment, billing, or destructive operation pauses only the dependent work and requires the Client's explicit action. No secret values appear in Markdown or source control.
