# Brownfield workflow

## Mục lục

1. Bảo vệ hiện trạng
2. Audit
3. Tái dựng hành vi
4. Gap analysis
5. Tiếp tục delivery

## 1. Bảo vệ hiện trạng

- Đọc `AGENTS.md` và hướng dẫn repository trước.
- Kiểm tra git/worktree và coi mọi thay đổi chưa rõ là của người dùng.
- Không reset, xóa, overwrite hoặc format hàng loạt.
- Ghi commit/ref hiện tại nếu có; không tự commit/push khi chưa được yêu cầu.
- Không chạy script/migration không rõ tác dụng trước khi đọc.

## 2. Audit

Thu thập bằng chứng theo thứ tự:

1. Cấu trúc repository, manifest, language/framework, entry point.
2. README, ADR, SRS, issue notes, CI/CD, container/infra config.
3. Module, route/API, data model/migration, integration và auth boundary.
4. Build/lint/test commands và trạng thái gần nhất.
5. TODO/FIXME, disabled/skipped tests, feature flags, mock/stub, secret/config gaps.
6. Git history/recent changes khi có ích và được phép đọc.
7. Runtime/log evidence an toàn nếu có.

Khi graph codebase khả dụng, index nếu cần rồi dùng graph để tìm symbol, caller, dependency và architecture. Dùng text search cho literal/config/non-code.

Có thể chạy `scripts/audit_project.ps1 -ProjectRoot <path>` để lấy inventory ban đầu; xem output như gợi ý, không phải kết luận.

## 3. Tái dựng hành vi

- Mô tả “as-is” từ code/test, tách khỏi “to-be” trong tài liệu.
- Lập bản đồ module → capability → route/UI → data → integration → test.
- Đánh dấu hành vi có test, chỉ được suy luận, hoặc chưa biết.
- Tạo characterization test cho hành vi quan trọng thiếu bảo vệ trước khi refactor.
- Không đổi hành vi chỉ để khớp tài liệu cũ; đưa mâu thuẫn ra quyết định.

## 4. Gap analysis

Ghi vào `01-Planning/BROWNFIELD_AUDIT.md`:

| Gap | Expected | Evidence hiện tại | Risk | Hành động | Phase |
| :--- | :--- | :--- | :--- | :--- | :--- |

Phân loại: missing, partial, contradictory, obsolete, unverified, unsafe. Xác định gate đầu tiên chưa đạt và critical path. Chỉ hỏi stakeholder các phần không thể chứng minh: mục tiêu hiện tại, ưu tiên, hành vi mong muốn, constraint, acceptance và quyết định lịch sử còn tác động.

## 5. Tiếp tục delivery

1. Chốt baseline “as-is + target delta”.
2. Giữ trace ID cũ nếu ổn định; tạo mapping khi phải đổi.
3. Sửa rủi ro Critical/High cản trở delivery trước hoặc xin chấp nhận.
4. Tiếp tục từ gate đầu tiên chưa đạt, nhưng cập nhật artifact phase trước khi code nếu chúng thiếu.
5. Verify regression, migration, rollback và compatibility.
6. Bàn giao cả phần đã có, phần mới làm, phần chưa xác minh và tech debt còn lại.
