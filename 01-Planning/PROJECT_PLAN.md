---
artifact_id: DOC-01-PLANNING-PROJECT-PLAN-MD
phase: "01-Planning"
artifact_type: planning
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Project Plan — {{PROJECT_NAME}}

## 1. Delivery approach

- Method: Iterative / Scrum / Kanban / Milestone / Hybrid
- Engagement: GREENFIELD / BROWNFIELD / CHANGE
- Autonomy: GUIDED / STANDARD / FULL-LOCAL
- Release strategy: {{RELEASE_STRATEGY}}

## 2. Milestones

| Milestone | Outcome/deliverable | Target | Dependency | Gate/acceptance |
| :--- | :--- | :--- | :--- | :--- |
| M0 | Governance + discovery baseline | {{DATE}} | Client availability | Gate 00–01 |
| M1 | Requirements + design baseline | {{DATE}} | {{DEPENDENCY}} | Gate 02–03 |
| M2 | Build complete | {{DATE}} | {{DEPENDENCY}} | Gate 04–05 |
| M3 | Quality/release ready | {{DATE}} | {{DEPENDENCY}} | Gate 06–07 |
| M4 | Handover | {{DATE}} | {{DEPENDENCY}} | Gate 08 |

## 3. Workstreams

| Workstream | Owner | Scope | Inputs | Output |
| :--- | :--- | :--- | :--- | :--- |
| Product/BA | {{OWNER}} | Discovery/SRS/RTM | Client interviews | Approved baseline |
| Architecture | {{OWNER}} | C4/ADR/data/API/UX | SRS/NFR | Design baseline |
| Engineering | {{OWNER}} | Code/migration/CI | Design/work items | Build |
| QA/Security | {{OWNER}} | Verification/UAT | Build/threat model | Evidence |
| Release/Handover | {{OWNER}} | Deploy plan/runbook/docs | Verified release | Accepted handover |

## 4. Dependency plan

| ID | Dependency | Needed by | Provider | Commitment | Fallback |
| :--- | :--- | :--- | :--- | :--- | :--- |
| DEP-001 | {{DEPENDENCY}} | {{DATE}} | {{OWNER}} | Confirmed / At Risk | {{FALLBACK}} |

## 5. Resource/capacity

| Role | Capacity | Availability | Risk/backup |
| :--- | :--- | :--- | :--- |
| Client PO | {{CAPACITY}} | {{WINDOW}} | {{BACKUP}} |
| Vendor delivery team | {{CAPACITY}} | {{WINDOW}} | {{BACKUP}} |

## 6. Reporting

- Status cadence: {{CADENCE}}
- Demo/review cadence: {{CADENCE}}
- Decision SLA: {{SLA}}
- Escalation channel: {{CHANNEL}}

## 7. Baseline changes

Post-approval, any changes impacting scope, timeline, cost, NFRs, or acceptance criteria require a Change Request (CR) and impact analysis. Simultaneously update the plan, SRS, design, tests, and RTM.
