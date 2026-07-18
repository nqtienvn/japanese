---
artifact_id: DOC-00-GOVERNANCE-POLICY-STATEMENT-OF-WORK-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Statement of Work (SOW) — {{PROJECT_NAME}}

> Delivery governance template; requires legal review if used as a legally binding contract.

## 1. Parties and purpose

- Client: {{CLIENT_LEGAL_NAME}}
- Delivery Vendor: {{VENDOR_NAME}}
- Purpose: {{SOW_PURPOSE}}
- Effective period: {{START_DATE}} to {{TARGET_DATE}}

## 2. Deliverables

| Deliverable ID | Description | Acceptance evidence | Milestone | Owner |
| :--- | :--- | :--- | :--- | :--- |
| DEL-001 | {{DELIVERABLE}} | {{EVIDENCE}} | {{MILESTONE}} | {{OWNER}} |

## 3. In scope / out of scope

| In scope | Out of scope |
| :--- | :--- |
| {{IN_SCOPE}} | {{OUT_OF_SCOPE}} |

## 4. Milestones and acceptance

| Milestone | Target | Client review window | Acceptance criteria | Payment/approval trigger if any |
| :--- | :--- | :--- | :--- | :--- |
| M1 | {{DATE}} | {{REVIEW_DAYS}} days | {{CRITERIA}} | {{TRIGGER}} |

## 5. Client responsibilities

- Appoint decision-makers and respond within the agreed timeframe.
- Provide legal sample data, domain knowledge, access, and necessary dependencies.
- Review baselines, prototypes, UAT, and release/handover according to schedule.
- Do not send secrets/real data through insecure channels.
- Perform minimal decisions/access provisioning/manual actions/approvals/sign-offs upon receiving a valid assistance request; do not assume all work items are handed back from the AI Vendor.

## 6. Vendor responsibilities

- Proactively clarify requirements, state assumptions/risks, and maintain traceability.
- Build in accordance with policy, test, and provide evidence.
- Do not expand scope or execute approval-only actions silently.
- Hand over code, documentation, runbooks, known issues, and next steps.

## 7. Assumptions, dependencies, and exclusions

| ID | Content | Impact if wrong/delayed | Owner | Confirmation date |
| :--- | :--- | :--- | :--- | :--- |
| ASM-001 | {{ASSUMPTION}} | {{IMPACT}} | {{OWNER}} | {{DATE}} |

## 8. Change control

Any change impacting deliverables, deadlines, costs, SLAs, security, or acceptance must use `CHANGE_REQUEST_TEMPLATE.md`. Verbal exchanges are not considered a new baseline until a formal decision is recorded.

## 9. Warranty and support

- Warranty period: {{WARRANTY_PERIOD}}
- Support hours/channel: {{SUPPORT_MODEL}}
- Defect response target: {{DEFECT_SLA}}
- Exclusions: {{WARRANTY_EXCLUSIONS}}

## 10. IP, licensing, and data

- Ownership of source code/deliverables post payment/acceptance: {{IP_OWNERSHIP_MODEL}}
- Third-party/open-source components and licensing obligations: {{THIRD_PARTY_POLICY}}
- Client data always belongs to: {{DATA_OWNER}}
- Vendor is permitted to process data only for the purpose/scope/duration: {{PROCESSING_BOUNDARY}}
- Data return/deletion obligations and confirmation post termination: {{RETURN_DELETE_PROCESS}}

## 11. Security and confidentiality

- Approved channels for document/secret exchanges: {{APPROVED_CHANNELS}}
- Human-assistance trigger/timebox tailoring: {{ASSISTANCE_POLICY}}. Tailoring may change the ordinary-decision window but SHALL NOT create a timeout fallback for explicit-approval actions.
- Security Profile/risk appetite: {{SECURITY_PROFILE_RISK}}
- Access rights based on least privilege, with expiry/revocation: {{ACCESS_POLICY}}
- Incident/breach notification: {{NOTIFICATION_PROCESS_SLA}}
- Detailed legal terms must reside in the contract/DPA/NDA reviewed by authorized personnel.

## 12. Sign-off

| Party | Signer/Approver | Status | Date |
| :--- | :--- | :--- | :--- |
| Client | {{CLIENT_APPROVER}} | Pending | {{DATE}} |
| Vendor | {{VENDOR_APPROVER}} | Pending | {{DATE}} |
