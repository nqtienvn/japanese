---
artifact_id: DOC-00-GOVERNANCE-POLICY-CHANGE-REQUEST-TEMPLATE-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Change Request — CR-{{NNN}}

| Field | Value |
| :--- | :--- |
| Requester / date | {{REQUESTER}} / {{DATE}} |
| Type | Scope / Schedule / Cost / Quality / Technical / Governance / Autonomy / Security / Privacy / Regulatory / Emergency |
| Priority | Low / Medium / High / Critical |
| Status | Proposed / Analysing / Approved / Rejected / Implemented |

## Proposed change

{{CHANGE_DESCRIPTION}}

## Rationale and value

{{RATIONALE}}

## Impact analysis

| Domain | Impact | Estimate/risk | Affected artifacts |
| :--- | :--- | :--- | :--- |
| Scope/requirements | {{IMPACT}} | {{ESTIMATE}} | {{FILES}} |
| Architecture/data/security | {{IMPACT}} | {{ESTIMATE}} | {{FILES}} |
| Schedule/cost/resources | {{IMPACT}} | {{ESTIMATE}} | {{FILES}} |
| Test/release/operations | {{IMPACT}} | {{ESTIMATE}} | {{FILES}} |
| Governance/autonomy/human assistance | {{IMPACT}} | {{ESTIMATE}} | {{FILES}} |
| Security profile/privacy/compliance | {{IMPACT}} | {{ESTIMATE}} | {{FILES}} |

Gates to reopen: {{GATES}}. The previous baseline/evidence must be preserved; do not modify history to make new changes look as if they were approved from the beginning.

## Options

| Option | Description | Pros | Cons | Recommendation |
| :--- | :--- | :--- | :--- | :--- |
| A | {{OPTION}} | {{PROS}} | {{CONS}} | Yes / No |

## Approval decision

| Approver | Decision | Date | Conditions |
| :--- | :--- | :--- | :--- |
| Client PO | Pending | {{DATE}} | {{CONDITIONS}} |
| Vendor Lead | Pending | {{DATE}} | {{CONDITIONS}} |
