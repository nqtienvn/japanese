# Human–AI Collaboration & Assistance Protocol

## 1. Mục đích

Quy định khi AI Delivery Vendor phải tự tiếp tục, khi được phép yêu cầu con người hỗ trợ và evidence cần có để tránh hai cực đoan: AI dừng ở mọi unknown hoặc âm thầm vượt quyền. Cụm “làm lâu quá” không phải trigger hợp lệ nếu thiếu timebox, blocker và tiêu chí tiến triển.

## 2. Quy tắc bắt buộc

- `COL-001`: AI **PHẢI** tự thực hiện công việc local, có thể đảo ngược và thuộc phạm vi đã được phê duyệt.
- `COL-002`: AI **KHÔNG ĐƯỢC** chuyển công việc cho con người chỉ vì công việc khó, nhiều bước hoặc mất thời gian.
- `COL-003`: Trước khi hỏi, AI **PHẢI** tìm evidence trong repository, tài liệu, cấu hình và kết quả công cụ được phép dùng.
- `COL-004`: AI **CÓ THỂ** tiếp tục với assumption local, có thể đảo ngược nếu ghi rõ assumption, evidence, risk và cách thay đổi.
- `COL-005`: AI **PHẢI** yêu cầu con người quyết định khi lựa chọn ảnh hưởng material tới hành vi sản phẩm, scope, cost, deadline, dữ liệu, security/privacy, compliance hoặc acceptance.
- `COL-006`: AI **PHẢI** xác minh kết quả con người cung cấp trước khi dùng làm evidence hoàn tất.
- `COL-007`: Sau khi blocker được giải quyết, AI **PHẢI** tự động tiếp tục từ trạng thái đã ghi trong `PROJECT_STATE.md`.

## 3. Trigger được phép yêu cầu hỗ trợ

AI chỉ yêu cầu hỗ trợ khi có ít nhất một trigger:

| Trigger | Điều kiện | Ví dụ |
| :--- | :--- | :--- |
| `HUM-BUSINESS` | Quyết định nghiệp vụ/ưu tiên không thể suy ra và có impact material | Chọn rule hoàn tiền hoặc persona được quyền duyệt |
| `HUM-ACCESS` | Thiếu credential, data hoặc quyền truy cập phải do owner cấp | Tạo sandbox account, cấp secret reference |
| `HUM-MANUAL` | Cần thao tác vật lý hoặc xác minh thủ công ngoài công cụ hiện có | Quét thiết bị, kiểm tra máy in, UAT bằng hardware thật |
| `HUM-APPROVAL` | Hành động thuộc approval-only boundary | Production deploy, billing, external publish, destructive data migration |
| `HUM-BLOCKER` | Cùng blocker còn tồn tại sau ít nhất 3 phương án xử lý khác nhau mà không có evidence mới | Ba cách build độc lập đều bị chặn bởi binary private không truy cập được |
| `HUM-SIGNOFF` | Cần sign-off thuộc trách nhiệm pháp lý/chuyên môn của con người | Legal basis, residual High risk, Client acceptance |

Mỗi dự án có thể tailoring số lần thử hoặc timebox theo loại work item, nhưng phải ghi trong `PROJECT_PROFILE.md`/plan. Không dùng wall-clock làm lý do duy nhất; nếu còn việc không bị chặn, AI tiếp tục phần đó trong phạm vi.

## 4. Assistance request bắt buộc

Mọi yêu cầu hỗ trợ phải chứa:

```text
Assistance ID / Trigger:
Work item / requirement:
Outcome đang cần:
Evidence đã kiểm tra:
Các phương án đã thử và kết quả:
Blocker chính xác:
Impact nếu chưa xử lý:
Thao tác nhỏ nhất con người cần làm:
Không được gửi secret/data thật qua chat:
Kết quả/reference cần trả lại:
Owner / due date:
Việc AI vẫn tiếp tục được trong lúc chờ:
```

Không yêu cầu Client thực hiện toàn bộ work item nếu chỉ thiếu một quyết định, quyền hoặc bước thủ công nhỏ.

## 5. Xử lý kết quả và evidence

| Kết quả từ con người | AI phải làm |
| :--- | :--- |
| Quyết định nghiệp vụ | Ghi `DEC`, cập nhật baseline/RTM và impact downstream |
| Access/secret | Chỉ lưu reference/owner; không đọc lại hoặc ghi value vào artifact/log |
| Thao tác thủ công | Yêu cầu evidence tối thiểu; verify bằng test/log/state phù hợp |
| Sign-off | Ghi approver, scope, phiên bản, ngày và điều kiện |
| Không thể hỗ trợ | Đề xuất option, workaround, defer hoặc exception với impact/risk |

Human action không tự động đồng nghĩa `Done`. Gate chỉ pass sau khi evidence tương ứng được kiểm chứng hoặc exception đúng thẩm quyền được ghi.

## 6. Escalation và bảo mật

- Không yêu cầu password, token, private key, certificate private material hoặc dữ liệu nhạy cảm thật qua chat/Markdown.
- Với sự cố bảo mật đang diễn ra, ưu tiên containment và escalation theo incident process; không tiếp tục thử nghiệm có thể làm tăng tác động.
- Nếu blocker ảnh hưởng Critical path, cập nhật `PROJECT_STATE.md`, risk register và status report; không che giấu bằng assumption.

