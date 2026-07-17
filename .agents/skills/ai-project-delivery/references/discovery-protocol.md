# Discovery protocol

## Mục lục

1. Mục tiêu
2. Chuẩn bị
3. Cách hỏi
4. Ghi nhận và kiểm tra chéo
5. Coverage
6. Điều kiện kết thúc

## 1. Mục tiêu

Biến một ý tưởng hoặc codebase chưa rõ thành problem/scope baseline đủ để thiết kế, triển khai và kiểm thử. Discovery phải tìm ra nhu cầu thật, quyền quyết định, ràng buộc, tiêu chí đo lường và các tình huống thất bại; không chỉ thu thập danh sách tính năng.

## 2. Chuẩn bị

1. Xác định `GREENFIELD`, `BROWNFIELD` hoặc `CHANGE`.
2. Với brownfield, audit repository trước và đánh dấu câu nào đã có bằng chứng.
3. Tạo/cập nhật `01-Planning/DISCOVERY_LOG.md`.
4. Lập stakeholder map và xác định người có quyền approve từng miền.
5. Chọn nhóm câu hỏi tiếp theo dựa trên rủi ro và câu trả lời trước.

## 3. Cách hỏi

- Hỏi 5–12 câu có cùng ngữ cảnh mỗi vòng.
- Bắt đầu mở: “Hãy kể lại lần gần nhất…”, rồi thu hẹp bằng số liệu và ví dụ.
- Với từ mơ hồ như “nhanh”, “dễ”, “an toàn”, “nhiều”, yêu cầu target, đơn vị đo và ngưỡng không chấp nhận.
- Với tính năng, hỏi tiếp: ai dùng, trigger, dữ liệu vào, kết quả, quyền, lỗi, retry, audit, notification, trạng thái và tiêu chí chấp nhận.
- Với quyết định kỹ thuật do stakeholder nêu, hỏi mục tiêu/ràng buộc phía sau; không khóa giải pháp quá sớm.
- Đưa ra tối đa 2–3 phương án khi stakeholder không có chuyên môn, nêu trade-off và khuyến nghị.
- Cho phép `Unknown`, `Delegated`, `Not Applicable`, nhưng luôn ghi lý do và owner.

Không hỏi lại thông tin đã có bằng chứng trừ khi cần xác nhận mâu thuẫn. Không hỏi mật khẩu, token, khóa bí mật hoặc dữ liệu cá nhân thật trong chat/tài liệu.

## 4. Ghi nhận và kiểm tra chéo

Mỗi câu trả lời có:

| Thuộc tính | Giá trị |
| :--- | :--- |
| Question ID | ID từ question bank |
| Answer | Nội dung đã hiểu |
| Status | Confirmed / Assumed / Unknown / Delegated / N/A |
| Source | Stakeholder / Code / Config / Test / Document / Observation |
| Confidence | High / Medium / Low |
| Owner | Người xác nhận/quyết định |
| Follow-up | Câu hỏi hoặc bằng chứng cần thêm |

Sau mỗi vòng, kiểm tra:

- Câu trả lời có mâu thuẫn với code, tài liệu hoặc câu trước không?
- Mục tiêu có metric và baseline không?
- Scope có out-of-scope không?
- Mỗi workflow có happy path, alternate path và error path không?
- Mỗi dữ liệu có owner, classification, retention, delete/export và audit không?
- Mỗi integration có auth, quota, timeout, retry, idempotency và fallback không?
- Mỗi NFR có target và cách đo không?

## 5. Coverage

Đánh dấu `Applicable` trước khi tính coverage.

```text
Coverage = (Confirmed + Delegated + N/A-có-lý-do) / Applicable
```

Mức kỳ vọng cho sản phẩm không đơn giản:

- Core: 100% câu applicable, thường gần 120 câu.
- Product: 80–100% câu applicable.
- Engineering: 80–100% câu applicable.
- Critical risk domains (security, payments, PII, safety, legal): 100% applicable hoặc có owner/date rõ.

## 6. Điều kiện kết thúc

Chỉ đóng discovery khi:

- Problem, target user, outcome và success metric rõ.
- In-scope/out-of-scope, release boundary và ưu tiên rõ.
- Stakeholder, approver và escalation rõ.
- Workflow trọng yếu cùng edge cases đã được mô tả.
- Dữ liệu, integration, NFR, security/compliance và vận hành có target.
- Assumption, dependency, risk và open decision có owner/hạn.
- Acceptance và handover expectation rõ.
- Stakeholder duyệt bản tóm tắt baseline hoặc ủy quyền rõ cho AI tự chọn các quyết định có thể đảo ngược.

Sau khi chốt, chuyển câu trả lời thành BR/FR/NFR/UC/US và RTM; không để discovery log là nguồn yêu cầu duy nhất.
