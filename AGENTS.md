# AI Project Delivery System

Các hướng dẫn này áp dụng cho toàn bộ repository.

## Quy tắc bắt buộc

1. Trước mọi yêu cầu liên quan đến ý tưởng, phân tích, xây dựng, sửa đổi hoặc tiếp quản dự án, đọc đầy đủ `MASTER_PROMPT.md`, `.agents/skills/ai-project-delivery/SKILL.md` và các reference mà skill định tuyến. Dùng `USAGE_GUIDE.md` để chọn quy trình vận hành phù hợp.
2. Xác định chế độ `GREENFIELD`, `BROWNFIELD` hoặc `CHANGE`; ghi vào `PROJECT_STATE.md`.
3. Với dự án mới, không bắt đầu code production trước khi discovery và requirements đạt gate, trừ khi người dùng yêu cầu rõ một prototype/spike.
4. Với dự án đang làm dở, phải audit evidence trong code/config/test/git trước; không hỏi người dùng các dữ kiện có thể tự đọc được.
5. Dùng ID ổn định để truy vết: `OBJ`, `STK`, `BR`, `FR`, `NFR`, `UC`, `US`, `ADR`, `DES`, `WI`, `TC`, `DEF`, `REL`, `RISK`, `DEC`.
6. Mọi phát biểu hoàn tất phải có bằng chứng. Giữ nguyên thay đổi không liên quan của người dùng và không ghi đè file hiện có một cách âm thầm.
7. Sau khi người dùng chốt baseline discovery, tự động thực hiện các công việc local, có thể đảo ngược và nằm trong phạm vi. Chỉ dừng ở các điểm cần phê duyệt được định nghĩa trong skill.
8. Luôn cập nhật `PROJECT_STATE.md`, `01-Planning/DISCOVERY_LOG.md` và `02-Requirements/TRACEABILITY_MATRIX.md` trong suốt quá trình.
9. Chỉ bàn giao khi code, kiểm thử, tài liệu vận hành, rollback, rủi ro tồn dư và ownership đều rõ ràng.
10. Đọc và tuân thủ `00-Governance-Policy/DOCUMENT_QUALITY_STANDARD.md` cùng `STANDARDS_ALIGNMENT_MATRIX.md`; không tuyên bố ISO certified/conformant khi chưa có đánh giá độc lập.
11. Mỗi requirement normative phải atomic, dùng đúng `PHẢI/SHALL`, `NÊN/SHOULD`, `CÓ THỂ/MAY`, có ID và expected result kiểm thử được.
12. Trước gate 06/08, phải hoàn thành document quality sample, Test RTM và field-validation evidence; câu hỏi blocking của Developer/Tester được coi là finding của tài liệu.

## Giao tiếp với stakeholder

- Hỏi theo đợt 5–12 câu, nhóm theo chủ đề; không dồn hàng trăm câu trong một lần.
- Tóm tắt điều đã hiểu sau mỗi đợt và chỉ ra mâu thuẫn, giả định, quyết định còn mở.
- Tìm các con số có thể kiểm chứng: số người dùng, SLA, ngân sách, deadline, tải, dữ liệu, mức rủi ro và tiêu chí chấp nhận.
- Cho phép câu trả lời `chưa biết`, nhưng phải gắn owner, hạn quyết định và ảnh hưởng.
- Không biến sở thích thành yêu cầu; xác nhận người có quyền quyết định.

## Định nghĩa hoàn tất

Một yêu cầu chỉ `Done` khi đã truy vết từ yêu cầu → thiết kế/quyết định → work item → code/config → test/evidence → release/handover, hoặc có ngoại lệ được chấp thuận và ghi rõ.
