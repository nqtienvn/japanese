# Autonomy and approvals

## Mục lục

1. Chế độ tự động
2. Được tự làm
3. Phải xin phê duyệt
4. Xử lý thiếu thông tin
5. Dừng và bàn giao

## 1. Chế độ tự động

| Mode | Cách vận hành |
| :--- | :--- |
| `GUIDED` | Hỏi trước các quyết định sản phẩm/kỹ thuật quan trọng; vẫn tự làm bước local hiển nhiên. |
| `STANDARD` | Tự quyết lựa chọn local, có thể đảo ngược; hỏi khi trade-off ảnh hưởng scope/cost/risk. |
| `FULL-LOCAL` | Sau baseline, tự đi hết các phase bằng phán đoán tốt nhất; chỉ dừng ở approval-only hoặc blocker thật. |

Nếu chưa chọn, mặc định `STANDARD`. Ghi mode vào `PROJECT_PROFILE.md`.

## 2. Được tự làm sau baseline

- Đọc repository, tài liệu, log và cấu hình trong phạm vi.
- Tạo/cập nhật tài liệu phase, source code, test, cấu hình development và script local.
- Chạy build, lint, unit/integration test an toàn và công cụ phân tích tĩnh.
- Tạo dữ liệu test giả, migration chưa chạy production, release notes và rollback plan.
- Chọn naming, cấu trúc file và library đã được project cho phép khi có thể đảo ngược.
- Sửa lỗi trong phạm vi, refactor cần thiết và cập nhật traceability.
- Auto-advance phase gate khi đủ evidence.

## 3. Phải xin phê duyệt riêng

- Deploy hoặc thay đổi production/staging dùng chung khi chưa được ủy quyền cụ thể.
- Xóa, migrate hoặc biến đổi dữ liệu thật có khả năng mất mát/khó phục hồi.
- Mua dịch vụ, bật billing, tạo tài nguyên trả phí hoặc thay đổi budget.
- Gửi email/tin nhắn, mở PR công khai, publish package/site/app hoặc liên hệ bên thứ ba.
- Thay đổi authentication/authorization, mã hóa, retention hoặc compliance theo hướng giảm bảo vệ.
- Truy cập/xuất dữ liệu nhạy cảm ngoài phạm vi, dùng credential người dùng hoặc secret chưa được cấp an toàn.
- Thay đổi mục tiêu, deadline, scope, UX chủ đạo hoặc SLA theo cách ảnh hưởng stakeholder.
- Chấp nhận rủi ro High/Critical, bỏ qua test bắt buộc hoặc bàn giao với lỗi blocking.

## 4. Xử lý thiếu thông tin

1. Tự tìm bằng chứng trong repository/tài liệu trước.
2. Nếu là lựa chọn local có thể đảo ngược, ghi `ASSUMED`, lý do và cách đổi; tiếp tục.
3. Nếu ảnh hưởng hành vi sản phẩm hoặc rủi ro đáng kể, hỏi stakeholder bằng câu ngắn có khuyến nghị.
4. Nếu stakeholder chọn `Unknown`, gắn owner/hạn và đánh giá phase gate.
5. Không giả định sự đồng ý cho hành động approval-only.

## 5. Dừng và bàn giao

Khi bị chặn, nêu chính xác điều thiếu, bằng chứng đã kiểm tra, các phương án và tác động. Khi hoàn tất, nêu deliverables, test/build evidence, residual risks, open items, vận hành/rollback và nơi chứa artifact.
