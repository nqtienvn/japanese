# Commercial Assumptions & Acceptance Model

> Mẫu quản trị delivery, không thay thế hợp đồng/tư vấn pháp lý.

## Estimation model

| Nội dung | Lựa chọn/giả định |
| :--- | :--- |
| Commercial model | Fixed scope / Time & materials / Milestone / Internal |
| Currency/tax | {{CURRENCY_TAX}} |
| Estimation confidence | ROM / Budgetary / Committed |
| Contingency | {{PERCENT}} |
| Client review delay treatment | {{RULE}} |
| Third-party cost treatment | {{RULE}} |

## Acceptance window

- Vendor thông báo deliverable ready và cung cấp evidence.
- Client review trong {{REVIEW_DAYS}} ngày làm việc.
- Client ghi rõ pass/fail theo acceptance criteria; feedback mới ngoài baseline đi qua change control.
- Im lặng không tự động được coi là chấp nhận trừ khi hợp đồng thật quy định và đã legal-review.

## Defect severity during acceptance

| Severity | Định nghĩa | Ảnh hưởng nghiệm thu | Target xử lý |
| :--- | :--- | :--- | :--- |
| Critical | Mất dữ liệu, breach, không dùng được chức năng lõi | Block | {{SLA}} |
| High | Chức năng lõi sai, không có workaround hợp lý | Block/conditional | {{SLA}} |
| Medium | Ảnh hưởng một phần, có workaround | Conditional/backlog | {{SLA}} |
| Low | Cosmetic/cải tiến | Không block | {{SLA}} |

## Warranty/support boundary

| Trong warranty | Ngoài warranty/change request |
| :--- | :--- |
| Sai khác so với baseline/acceptance đã duyệt | Requirement mới hoặc đổi hành vi |
| Regression do deliverable của Vendor | Thay đổi từ bên thứ ba ngoài kiểm soát |
| Security defect thuộc phạm vi thiết kế | Misconfiguration/operation ngoài hướng dẫn |
