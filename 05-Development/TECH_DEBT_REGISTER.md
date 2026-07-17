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

| Debt ID | Area | Mô tả/root cause | Impact/risk | Evidence | Remediation | Trigger/due | Owner | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| TD-001 | {{AREA}} | {{DEBT}} | {{IMPACT}} | {{EVIDENCE}} | {{ACTION}} | {{TRIGGER_DATE}} | {{OWNER}} | Open |

## Quy tắc

- Không dùng “tech debt” để che defect hoặc security risk; phân loại đúng.
- High/Critical cần remediation/accepted risk trước gate liên quan.
- Ghi cost of delay, dependency và điều kiện debt trở thành blocking.
- Khi đóng, giữ evidence và link work item/release.
