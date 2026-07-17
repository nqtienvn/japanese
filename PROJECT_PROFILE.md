---
artifact_id: DOC-PROJECT-PROFILE-MD
phase: "ROOT"
artifact_type: orchestration
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Project Profile — {{PROJECT_NAME}}

> This is the single source of truth, updated when discovery confirms new facts.

| Field | Value |
| :--- | :--- |
| Project code | `{{PROJECT_CODE}}` |
| One-sentence description | {{PROJECT_DESCRIPTION}} |
| Project owner | {{PROJECT_OWNER}} |
| Product owner | {{PRODUCT_OWNER}} |
| Project manager | {{PROJECT_MANAGER}} |
| Tech lead | {{TECH_LEAD}} |
| QA lead | {{QA_LEAD}} |
| Security/Privacy owner | {{SECURITY_OWNER}} |
| Repository | {{REPOSITORY_URL}} |
| Start date | {{START_DATE}} |
| Target date | {{TARGET_DATE}} |
| Delivery mode | GREENFIELD / BROWNFIELD / CHANGE |
| Autonomy mode | FULL-LOCAL by default after baseline / GUIDED / STANDARD |
| Data classification | Public / Internal / Confidential / PII / Sensitive |
| Security profile | STANDARD / HIGH / CRITICAL |
| Regulatory scope | {{REGULATORY_SCOPE}} |
| UI scope | None / Web / Mobile / Desktop / Embedded / Multi-channel |
| Human-assistance trigger | Default: approved action, external/manual dependency, or 3 materially different failed approaches |

## Problem Statement

- Target stakeholders/users: {{TARGET_STAKEHOLDER}}
- Current problem: {{PROBLEM_STATEMENT}}
- Measurable impact: {{CURRENT_IMPACT}}
- Desired outcome: {{DESIRED_OUTCOME}}
- Why now: {{WHY_NOW}}

## Project-Level Constraints

| ID | Constraint | Source | Strictness | Note/Remarks |
| :--- | :--- | :--- | :--- | :--- |
| CON-001 | {{CONSTRAINT}} | {{SOURCE}} | Hard / Soft | {{NOTE}} |

## Open Decisions

| ID | Question/Decision | Owner | Deadline | Impact of Delay |
| :--- | :--- | :--- | :--- | :--- |
| DEC-OPEN-001 | {{OPEN_DECISION}} | {{OWNER}} | {{DATE}} | {{IMPACT}} |
