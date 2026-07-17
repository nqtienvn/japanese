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
# Hồ sơ dự án — {{PROJECT_NAME}}

> Đây là nguồn thông tin gốc, được cập nhật khi discovery xác nhận dữ kiện mới.

| Trường | Giá trị |
| :--- | :--- |
| Project code | `{{PROJECT_CODE}}` |
| Mô tả một câu | {{PROJECT_DESCRIPTION}} |
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
| Autonomy mode | FULL-LOCAL mặc định sau baseline / GUIDED / STANDARD |
| Data classification | Public / Internal / Confidential / PII / Sensitive |
| Security profile | STANDARD / HIGH / CRITICAL |
| Regulatory scope | {{REGULATORY_SCOPE}} |
| UI scope | None / Web / Mobile / Desktop / Embedded / Multi-channel |
| Human-assistance trigger | Default: approved action, external/manual dependency, or 3 materially different failed approaches |

## Tuyên bố vấn đề

- Người đang gặp vấn đề: {{TARGET_STAKEHOLDER}}
- Vấn đề hiện tại: {{PROBLEM_STATEMENT}}
- Tác động có thể đo: {{CURRENT_IMPACT}}
- Kết quả mong muốn: {{DESIRED_OUTCOME}}
- Tại sao phải làm bây giờ: {{WHY_NOW}}

## Ràng buộc cấp dự án

| ID | Ràng buộc | Nguồn | Độ cứng | Ghi chú |
| :--- | :--- | :--- | :--- | :--- |
| CON-001 | {{CONSTRAINT}} | {{SOURCE}} | Hard / Soft | {{NOTE}} |

## Các quyết định còn mở

| ID | Câu hỏi/quyết định | Owner | Hạn | Ảnh hưởng nếu chậm |
| :--- | :--- | :--- | :--- | :--- |
| DEC-OPEN-001 | {{OPEN_DECISION}} | {{OWNER}} | {{DATE}} | {{IMPACT}} |
