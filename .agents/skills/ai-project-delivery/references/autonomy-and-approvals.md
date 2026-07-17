# Autonomy and approvals

## Mục lục

1. Chế độ tự động
2. Được tự làm
3. Phải xin phê duyệt
4. Xử lý thiếu thông tin
5. Yêu cầu con người hỗ trợ
6. Dừng và bàn giao

## 1. Chế độ tự động

| Mode | Cách vận hành |
| :--- | :--- |
| `GUIDED` | Hỏi trước các quyết định sản phẩm/kỹ thuật quan trọng; vẫn tự làm bước local hiển nhiên. |
| `STANDARD` | Tự quyết lựa chọn local, có thể đảo ngược; hỏi khi trade-off ảnh hưởng scope/cost/risk. |
| `FULL-LOCAL` | Sau baseline, tự đi hết các phase bằng phán đoán tốt nhất; chỉ dừng ở approval-only hoặc blocker thật. |

Nếu chưa chọn, mặc định `FULL-LOCAL` sau khi baseline được chốt; trước baseline AI vẫn tự làm mọi bước read-only/local/reversible phục vụ discovery và audit. Ghi mode vào `PROJECT_PROFILE.md`.

## 2. Được tự làm sau baseline

- Đọc repository, tài liệu, log và cấu hình trong phạm vi.
- Tạo/cập nhật tài liệu phase, source code, test, cấu hình development và script local.
- Chạy build, lint, unit/integration test an toàn và công cụ phân tích tĩnh.
- Tạo dữ liệu test giả, migration chưa chạy production, release notes và rollback plan.
- Chọn naming, cấu trúc file và library đã được project cho phép khi có thể đảo ngược.
- Sửa lỗi trong phạm vi, refactor cần thiết và cập nhật traceability.
- Auto-advance phase gate khi đủ evidence.

### Evidence-first loop trước khi hỏi

AI phải kiểm tra lần lượt các nguồn applicable sau và ghi nguồn đã dùng khi tạo assistance request:

1. Repository instructions, code graph, source, config, migration, tests và Git evidence.
2. Project documents, decision log, traceability, runbook và prior execution evidence.
3. Runtime/build/log an toàn, local reproduction và reversible experiment.
4. Official specification/documentation và current security advisory khi dữ kiện có thể thay đổi.
5. Existing convention, maintained ecosystem primitive và option có thể đảo ngược.

Nếu một implementation choice có thể được chứng minh hoặc sửa lại local, AI tự chọn, ghi rationale rồi tiếp tục. Preference kỹ thuật không phải câu hỏi stakeholder trừ khi nó thay đổi material scope/cost/risk/contract.

## 3. Phải xin phê duyệt riêng

- Deploy hoặc thay đổi production/staging dùng chung khi chưa được ủy quyền cụ thể.
- Xóa, migrate hoặc biến đổi dữ liệu thật có khả năng mất mát/khó phục hồi.
- Mua dịch vụ, bật billing, tạo tài nguyên trả phí hoặc thay đổi budget.
- Gửi email/tin nhắn, mở PR công khai, publish package/site/app hoặc liên hệ bên thứ ba.
- Thay đổi authentication/authorization, mã hóa, retention hoặc compliance theo hướng giảm bảo vệ.
- Truy cập/xuất dữ liệu nhạy cảm ngoài phạm vi, dùng credential người dùng hoặc secret chưa được cấp an toàn.
- Thay đổi mục tiêu, deadline, scope, UX chủ đạo hoặc SLA theo cách ảnh hưởng stakeholder.
- Chấp nhận High residual risk, bỏ qua test bắt buộc hoặc bàn giao với lỗi blocking. Critical security risk không được chấp nhận để release.

## 4. Xử lý thiếu thông tin

1. Tự tìm bằng chứng trong repository/tài liệu trước.
2. Nếu là lựa chọn local có thể đảo ngược, ghi `ASSUMED`, lý do và cách đổi; tiếp tục.
3. Nếu ảnh hưởng hành vi sản phẩm hoặc rủi ro đáng kể, hỏi stakeholder bằng câu ngắn có khuyến nghị.
4. Nếu stakeholder chọn `Unknown`, gắn owner/hạn và đánh giá phase gate.
5. Không giả định sự đồng ý cho hành động approval-only.

## 5. Yêu cầu con người hỗ trợ

- Không chuyển việc cho Client chỉ vì khó, nhiều bước hoặc lâu.
- Chỉ yêu cầu hỗ trợ theo `00-Governance-Policy/HUMAN_AI_COLLABORATION_PROTOCOL.md`: material decision, access/credential, manual/physical action, approval-only, professional sign-off hoặc cùng blocker sau ít nhất 3 phương án khác nhau không có evidence mới.
- Trước khi hỏi, ghi assistance ID/trigger, evidence, attempts, exact blocker, impact, thao tác nhỏ nhất, output cần trả lại, owner/due và phần AI vẫn tiếp tục được.
- Không yêu cầu secret value qua chat; chỉ yêu cầu owner cấu hình qua kênh an toàn và trả lại reference/status.
- Không yêu cầu con người viết code, refactor Java sang ngôn ngữ khác, chọn package/framework, đọc repository hoặc chạy local test thay AI.
- Với stakeholder interview, chỉ hỏi intent, business semantics, authority, measurable acceptance hoặc material trade-off không thể suy ra; hỏi theo đợt 5–12 câu.
- Verify kết quả con người cung cấp, cập nhật state/decision/RTM rồi tự động resume.

## 6. Dừng và bàn giao

Khi bị chặn, nêu chính xác điều thiếu, bằng chứng đã kiểm tra, các phương án và tác động. Khi hoàn tất, nêu deliverables, test/build evidence, residual risks, open items, vận hành/rollback và nơi chứa artifact.
