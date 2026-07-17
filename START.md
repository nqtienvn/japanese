---
artifact_id: DOC-START-MD
phase: "ROOT"
artifact_type: orchestration
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# START — Khởi động dự án với AI

Đây là điểm bắt đầu dành cho Client/Product Owner. Mở AI tại **root repository**, chọn đúng một chế độ, thay nội dung trong dấu `[ ... ]`, rồi gửi nguyên khối prompt tương ứng.

| Trường hợp | Chế độ | Prompt sử dụng |
| :--- | :--- | :--- |
| Mới có ý tưởng, chưa có implementation đáng kể | `GREENFIELD` | [Prompt A](#prompt-a--dự-án-mới-greenfield) |
| Đã có code, cấu hình, test hoặc tài liệu | `BROWNFIELD` | [Prompt B](#prompt-b--dự-án-đang-làm-dở-brownfield) |

> Không gửi đồng thời cả hai prompt. Nếu chưa chắc mode, dùng `PROJECT_MODE = AUTO` trong [MASTER_PROMPT.md](MASTER_PROMPT.md) để AI xác định từ repository.

## Prompt A — Dự án mới (`GREENFIELD`)

Sao chép toàn bộ khối dưới đây:

```text
Đọc và thực thi toàn bộ MASTER_PROMPT.md trong repository này.

PROJECT_MODE = GREENFIELD.
AUTONOMY_MODE = FULL-LOCAL.
SECURITY_PROFILE = AUTO.

Ý tưởng ban đầu của tôi:
[Tôi muốn xây dựng phần mềm gì?]

Người dùng mục tiêu:
[Ai sẽ sử dụng?]

Vấn đề cần giải quyết:
[Hiện tại họ đang gặp khó khăn gì?]

Kết quả tôi mong muốn:
[Thành công trông như thế nào?]

Deadline hoặc ngân sách:
[Điền nếu biết, nếu chưa biết ghi TBD]

Hãy bắt đầu Discovery. Chưa viết production code cho đến khi baseline được tôi phê duyệt.
```

Kết quả đầu tiên phải là phần tóm tắt cách hiểu ban đầu và 5–10 câu hỏi Discovery quan trọng nhất. AI chưa được thiết kế hoặc viết production code trước khi baseline được phê duyệt.

## Prompt B — Dự án đang làm dở (`BROWNFIELD`)

Trước khi gửi prompt, nên commit/backup code và ghi nhận branch, HEAD cùng `git status`. Sau đó sao chép toàn bộ khối dưới đây:

```text
Đọc và thực thi toàn bộ MASTER_PROMPT.md trong repository này.

PROJECT_MODE = BROWNFIELD.
AUTONOMY_MODE = FULL-LOCAL.
SECURITY_PROFILE = AUTO.

Mục tiêu tiếp quản:
[Phần mềm này cần được hoàn thiện, sửa chữa hoặc phát triển tiếp như thế nào?]

Tình trạng tôi đang biết:
[Đã làm được phần nào, phần nào chưa làm, lỗi hoặc vấn đề đang gặp.
Nếu không chắc, ghi TBD.]

Chức năng hoặc hành vi bắt buộc phải giữ:
[Liệt kê nếu biết. Nếu chưa biết, yêu cầu AI xác định từ code và test.]

Ưu tiên hiện tại:
[Tính năng, lỗi hoặc milestone cần xử lý trước.]

Người dùng mục tiêu:
[Ai đang hoặc sẽ sử dụng sản phẩm?]

Kết quả tôi mong muốn:
[Điều kiện để coi việc tiếp quản này thành công.]

Deadline và ngân sách:
[Điền nếu biết; nếu chưa biết ghi TBD.]

Trong giai đoạn đầu, hãy thực hiện audit read-only repository trước:

1. Đọc toàn bộ repository instructions và các AGENTS.md liên quan.
2. Kiểm tra branch, HEAD, git status và thay đổi chưa commit.
3. Đọc code, cấu hình, dependencies, migration, test, tài liệu và CI/CD.
4. Xác định stack, entry point, module, API, UI, data model, authentication và integration.
5. Kiểm tra TODO, mock, stub, disabled test, feature flag và code chưa hoàn thiện.
6. Đối chiếu tài liệu với hành vi thực tế của code.
7. Có thể chạy build/test local nếu đã kiểm tra lệnh an toàn và không tác động dữ liệu hoặc môi trường dùng chung.
8. Không reset, checkout, xóa, ghi đè, format hàng loạt hoặc sửa code trong giai đoạn audit.
9. Không chạy migration, deploy hoặc thay đổi production.
10. Không hỏi tôi các thông tin kỹ thuật có thể tự chứng minh từ repository.

Sau audit, hãy cung cấp:

- trạng thái Git và các thay đổi cần bảo vệ;
- kiến trúc và hành vi hiện tại — as-is;
- chức năng đã hoàn thành và có evidence;
- chức năng tồn tại nhưng chưa được kiểm chứng;
- chức năng còn thiếu hoặc đang lỗi;
- tình trạng build và test;
- rủi ro bảo mật, dữ liệu, migration và vận hành;
- mâu thuẫn giữa code và tài liệu;
- technical debt;
- gap analysis;
- gate đầu tiên trong 09 phase chưa đạt;
- danh sách câu hỏi nghiệp vụ không thể suy ra từ repository;
- đề xuất target delta và kế hoạch tiếp tục.

Hãy tạo hoặc cập nhật:
- PROJECT_STATE.md;
- 01-Planning/BROWNFIELD_AUDIT.md;
- 01-Planning/DISCOVERY_LOG.md;
- 02-Requirements/TRACEABILITY_MATRIX.md.

Chưa sửa production code cho đến khi tôi phê duyệt baseline tiếp quản gồm
“as-is + target delta + phạm vi bảo vệ + tiêu chí nghiệm thu”.
```

Kết quả đầu tiên phải là báo cáo audit dựa trên evidence trong repository. AI chỉ hỏi các quyết định nghiệp vụ, ưu tiên và hành vi mong muốn không thể suy ra từ code, test, cấu hình hoặc tài liệu.

## Sau Discovery hoặc Brownfield Audit

1. Kiểm tra bản tóm tắt `baseline` hoặc `as-is + target delta`.
2. Yêu cầu sửa mọi điểm sai, mơ hồ hoặc thiếu tiêu chí nghiệm thu.
3. Chỉ phê duyệt khi scope, hành vi, NFR, rủi ro, acceptance và quyền tự động hóa đã rõ.
4. Sau phê duyệt, cho AI tự động tiếp tục qua các gate; chỉ dừng ở hành động cần Client phê duyệt.
5. Trước bàn giao cuối, yêu cầu chạy validator với `-StrictDelivery`.

Hướng dẫn vận hành đầy đủ: [USAGE_GUIDE.md](USAGE_GUIDE.md).
