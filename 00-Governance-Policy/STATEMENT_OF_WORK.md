# Statement of Work (SOW) — {{PROJECT_NAME}}

> Mẫu quản trị delivery; cần legal review nếu dùng làm hợp đồng có giá trị pháp lý.

## 1. Parties và mục đích

- Client: {{CLIENT_LEGAL_NAME}}
- Delivery Vendor: {{VENDOR_NAME}}
- Mục đích: {{SOW_PURPOSE}}
- Thời hạn hiệu lực: {{START_DATE}} đến {{TARGET_DATE}}

## 2. Deliverables

| Deliverable ID | Mô tả | Acceptance evidence | Milestone | Owner |
| :--- | :--- | :--- | :--- | :--- |
| DEL-001 | {{DELIVERABLE}} | {{EVIDENCE}} | {{MILESTONE}} | {{OWNER}} |

## 3. In scope / out of scope

| In scope | Out of scope |
| :--- | :--- |
| {{IN_SCOPE}} | {{OUT_OF_SCOPE}} |

## 4. Milestone và nghiệm thu

| Milestone | Target | Client review window | Acceptance criteria | Payment/approval trigger nếu có |
| :--- | :--- | :--- | :--- | :--- |
| M1 | {{DATE}} | {{REVIEW_DAYS}} ngày | {{CRITERIA}} | {{TRIGGER}} |

## 5. Trách nhiệm Client

- Cử người có quyền quyết định và phản hồi trong thời gian thống nhất.
- Cung cấp dữ liệu mẫu hợp pháp, domain knowledge, access và dependency cần thiết.
- Review baseline, prototype, UAT và release/handover theo lịch.
- Không gửi secret/dữ liệu thật qua kênh không an toàn.
- Thực hiện decision/access/manual/approval/sign-off nhỏ nhất khi có assistance request hợp lệ; không mặc định nhận lại toàn bộ work item từ AI Vendor.

## 6. Trách nhiệm Vendor

- Chủ động làm rõ yêu cầu, nêu giả định/rủi ro và giữ traceability.
- Xây dựng theo policy, kiểm thử và cung cấp evidence.
- Không mở rộng scope hoặc thực hiện action approval-only âm thầm.
- Bàn giao code, tài liệu, runbook, known issues và hướng tiếp tục.

## 7. Assumption, dependency và exclusion

| ID | Nội dung | Ảnh hưởng nếu sai/chậm | Owner | Ngày xác nhận |
| :--- | :--- | :--- | :--- | :--- |
| ASM-001 | {{ASSUMPTION}} | {{IMPACT}} | {{OWNER}} | {{DATE}} |

## 8. Change control

Mọi thay đổi tác động deliverable, deadline, cost, SLA, security hoặc acceptance phải dùng `CHANGE_REQUEST_TEMPLATE.md`. Không coi trao đổi miệng là baseline mới nếu chưa ghi quyết định.

## 9. Bảo hành và hỗ trợ

- Warranty period: {{WARRANTY_PERIOD}}
- Support hours/channel: {{SUPPORT_MODEL}}
- Defect response target: {{DEFECT_SLA}}
- Không bao gồm: {{WARRANTY_EXCLUSIONS}}

## 10. IP, license và dữ liệu

- Quyền sở hữu source code/deliverable sau thanh toán/nghiệm thu: {{IP_OWNERSHIP_MODEL}}
- Thành phần third-party/open-source và nghĩa vụ license: {{THIRD_PARTY_POLICY}}
- Dữ liệu của Client luôn thuộc: {{DATA_OWNER}}
- Vendor được xử lý dữ liệu chỉ cho mục đích/phạm vi/thời hạn: {{PROCESSING_BOUNDARY}}
- Nghĩa vụ hoàn trả/xóa dữ liệu và xác nhận sau kết thúc: {{RETURN_DELETE_PROCESS}}

## 11. Bảo mật và tính bí mật

- Kênh trao đổi tài liệu/secret được phép: {{APPROVED_CHANNELS}}
- Human-assistance trigger/timebox tailoring: {{ASSISTANCE_POLICY}}
- Security Profile/risk appetite: {{SECURITY_PROFILE_RISK}}
- Quyền truy cập theo least privilege, có expiry/revocation: {{ACCESS_POLICY}}
- Incident/breach notification: {{NOTIFICATION_PROCESS_SLA}}
- Các điều khoản pháp lý chi tiết phải nằm trong hợp đồng/DPA/NDA đã được người có thẩm quyền review.

## 12. Sign-off

| Bên | Người ký/duyệt | Trạng thái | Ngày |
| :--- | :--- | :--- | :--- |
| Client | {{CLIENT_APPROVER}} | Pending | {{DATE}} |
| Vendor | {{VENDOR_APPROVER}} | Pending | {{DATE}} |
