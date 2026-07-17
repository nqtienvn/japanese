# Project Charter — {{PROJECT_NAME}}

| Trường | Giá trị |
| :--- | :--- |
| Document ID | `{{PROJECT_CODE}}-CHR-001` |
| Version / status | {{VERSION}} / {{STATUS}} |
| Client sponsor | {{PROJECT_OWNER}} |
| Client product owner | {{PRODUCT_OWNER}} |
| Vendor delivery lead | {{PROJECT_MANAGER}} |
| Target start / finish | {{START_DATE}} / {{TARGET_DATE}} |

## 1. Business case

- Bối cảnh: {{BUSINESS_CONTEXT}}
- Vấn đề/cơ hội: {{PROBLEM_STATEMENT}}
- Vì sao làm bây giờ: {{WHY_NOW}}
- Chi phí của việc không làm: {{COST_OF_INACTION}}

## 2. Outcomes

| Objective ID | Outcome | Baseline | Target | Deadline | Owner |
| :--- | :--- | :--- | :--- | :--- | :--- |
| OBJ-001 | {{OUTCOME}} | {{BASELINE}} | {{TARGET}} | {{DATE}} | {{OWNER}} |

## 3. Phạm vi cấp cao

| In scope | Out of scope | Có thể cân nhắc sau |
| :--- | :--- | :--- |
| {{IN_SCOPE}} | {{OUT_OF_SCOPE}} | {{FUTURE_SCOPE}} |

## 4. Stakeholder

| ID | Người/nhóm | Vai trò | Quan tâm | Quyền quyết định | Cách tham gia |
| :--- | :--- | :--- | :--- | :--- | :--- |
| STK-001 | {{STAKEHOLDER}} | {{ROLE}} | {{INTEREST}} | {{DECISION_RIGHT}} | {{CADENCE}} |

## 5. Ràng buộc và giả định

| ID | Loại | Nội dung | Cách xác minh | Owner | Hạn |
| :--- | :--- | :--- | :--- | :--- | :--- |
| CON-001 | Constraint / Assumption | {{ITEM}} | {{VALIDATION}} | {{OWNER}} | {{DATE}} |

## 6. Rủi ro ban đầu

| Risk ID | Rủi ro | Xác suất | Tác động | Ứng phó | Owner |
| :--- | :--- | :--- | :--- | :--- | :--- |
| RISK-001 | {{RISK}} | L/M/H | L/M/H | {{RESPONSE}} | {{OWNER}} |

## 7. Quyền hạn

- Client Product Owner quyết định: mục tiêu, ưu tiên, scope, acceptance và thay đổi có ảnh hưởng thương mại.
- Vendor Delivery Lead quyết định: cách tổ chức delivery và lựa chọn local/reversible trong constraint đã duyệt.
- Tech Lead quyết định: kiến trúc/kỹ thuật, nhưng phải lập ADR khi trade-off ảnh hưởng NFR/cost/lock-in.
- QA Lead có quyền chặn release khi exit criteria không đạt.
- Security/Privacy Owner có quyền chặn khi có rủi ro không được chấp nhận.

## 8. Phê duyệt charter

| Bên | Người duyệt | Quyết định | Ngày | Ghi chú |
| :--- | :--- | :--- | :--- | :--- |
| Client | {{PRODUCT_OWNER}} | Pending / Approved / Rejected | {{DATE}} | {{NOTE}} |
| Vendor | {{PROJECT_MANAGER}} | Pending / Approved / Rejected | {{DATE}} | {{NOTE}} |
