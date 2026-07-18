---
artifact_id: DOC-00-GOVERNANCE-POLICY-PROJECT-CHARTER-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Project Charter — {{PROJECT_NAME}}

| Field | Value |
| :--- | :--- |
| Document ID | `{{PROJECT_CODE}}-CHR-001` |
| Version / status | {{VERSION}} / {{STATUS}} |
| Client sponsor | {{PROJECT_OWNER}} |
| Client product owner | {{PRODUCT_OWNER}} |
| Vendor delivery lead | {{PROJECT_MANAGER}} |
| Target start / finish | {{START_DATE}} / {{TARGET_DATE}} |

## 1. Business case

- Context: {{BUSINESS_CONTEXT}}
- Problem/Opportunity: {{PROBLEM_STATEMENT}}
- Why now: {{WHY_NOW}}
- Cost of inaction: {{COST_OF_INACTION}}

## 2. Outcomes

| Objective ID | Outcome | Baseline | Target | Deadline | Owner |
| :--- | :--- | :--- | :--- | :--- | :--- |
| OBJ-001 | {{OUTCOME}} | {{BASELINE}} | {{TARGET}} | {{DATE}} | {{OWNER}} |

## 3. High-level scope

| In scope | Out of scope | Future consideration |
| :--- | :--- | :--- |
| {{IN_SCOPE}} | {{OUT_OF_SCOPE}} | {{FUTURE_SCOPE}} |

## 4. Stakeholders

| ID | Person/Group | Role | Interest | Decision Right | Engagement Method |
| :--- | :--- | :--- | :--- | :--- | :--- |
| STK-001 | {{STAKEHOLDER}} | {{ROLE}} | {{INTEREST}} | {{DECISION_RIGHT}} | {{CADENCE}} |

## 5. Constraints and assumptions

| ID | Type | Content | Verification Method | Owner | Due Date |
| :--- | :--- | :--- | :--- | :--- | :--- |
| CON-001 | Constraint / Assumption | {{ITEM}} | {{VALIDATION}} | {{OWNER}} | {{DATE}} |

## 6. Initial risks

| Risk ID | Risk | Probability | Impact | Response | Owner |
| :--- | :--- | :--- | :--- | :--- | :--- |
| RISK-001 | {{RISK}} | L/M/H | L/M/H | {{RESPONSE}} | {{OWNER}} |

## 7. Authorities

- Client Product Owner decides: objectives, priorities, scope, acceptance, and changes with commercial impact.
- Vendor Delivery Lead decides: delivery organization and local/reversible choices within approved constraints.
- Tech Lead decides: architecture/technical decisions, but must create an ADR when trade-offs impact NFR/cost/lock-in.
- QA Lead has the authority to block release when exit criteria are not met.
- Security/Privacy Owner has the authority to block release when there is an unacceptable risk.
- Security Profile/risk appetite and Human–AI assistance boundary can only be changed through appropriate governance decision/change control.

## 8. Charter approval

| Party | Approver | Decision | Date | Notes |
| :--- | :--- | :--- | :--- | :--- |
| Client | {{PRODUCT_OWNER}} | Pending / Approved / Rejected | {{DATE}} | {{NOTE}} |
| Vendor | {{PROJECT_MANAGER}} | Pending / Approved / Rejected | {{DATE}} | {{NOTE}} |
