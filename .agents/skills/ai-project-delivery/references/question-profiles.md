# Discovery question profiles

Chọn một hoặc nhiều profile trước khi bắt đầu discovery. AI dùng profile để mở đúng câu hỏi, kiểm tra rủi ro và chọn artifact; không dùng profile để suy đoán quyết định kinh doanh.

| Profile | Khi chọn | Câu hỏi bắt buộc thêm | Artifact/controls tăng cường |
| :--- | :--- | :--- | :--- |
| Web CRUD | Form, workflow, danh sách và báo cáo nội bộ | ownership dữ liệu, validation, bulk action, audit | CRUD-functional matrix, UI/UX, API contract |
| SaaS multi-tenant | Nhiều tổ chức dùng chung nền tảng | tenant isolation, plan/entitlement, noisy-neighbor, data export | tenant threat model, permission matrix, capacity model |
| Mobile | iOS/Android hoặc hybrid client | offline, push, device loss, app-store release | mobile security profile, API contract, release runbook |
| Regulated | Ngân hàng, y tế, bảo hiểm, dữ liệu pháp lý | jurisdiction, retention, audit, segregation of duties | control mapping, evidence register, DR/BCP, sign-off |
| AI/LLM | Prompt, model, RAG, agent hoặc generated content | model boundary, data leakage, evaluation, human escalation | AI risk register, eval set, prompt/version registry |
| Integration-heavy | Nhiều hệ thống, queue, webhook hoặc partner | contract ownership, retry/idempotency, versioning, reconciliation | OpenAPI/AsyncAPI, integration test, DLQ/runbook |

## Profile selection record

Ghi profile đã chọn trong `01-Planning/DISCOVERY_LOG.md`, cùng owner và lý do. Nếu profile chưa rõ, ghi `chưa biết`, deadline quyết định và tác động; không tự chọn profile chỉ vì framework quen thuộc.
