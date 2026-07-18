---
artifact_id: DOC-05-DEVELOPMENT-TECH-DEBT-REGISTER-MD
phase: "05-Development"
artifact_type: development
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Technical Debt Register — {{PROJECT_NAME}}

| Debt ID | Area | Description/root cause | Impact/risk | Evidence | Remediation | Trigger/due | Owner | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| TD-001 | {{AREA}} | {{DEBT}} | {{IMPACT}} | {{EVIDENCE}} | {{ACTION}} | {{TRIGGER_DATE}} | {{OWNER}} | Open |

## Rules

- Do not use "technical debt" to mask defects or security risks; classify them correctly.
- High/Critical items require remediation or accepted risk sign-off prior to the related phase gate.
- Document the cost of delay, dependencies, and conditions under which the debt becomes blocking.
- When closing, preserve resolution evidence and link to the relevant work item/release.
