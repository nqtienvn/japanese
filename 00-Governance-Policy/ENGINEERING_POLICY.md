---
artifact_id: DOC-00-GOVERNANCE-POLICY-ENGINEERING-POLICY-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Engineering, Security & Documentation Policy

Control chi tiết về security/privacy nằm tại `SECURITY_AND_PRIVACY_STANDARD.md`; cách AI yêu cầu con người hỗ trợ nằm tại `HUMAN_AI_COLLABORATION_PROTOCOL.md`. Khi có xung đột, control cụ thể/được phê duyệt trong hai tài liệu đó ưu tiên hơn hướng dẫn chung ở đây.

## 1. Nguyên tắc

- Evidence before claim; traceability before completion.
- Least privilege, secure by default, privacy by design.
- Không hard-code secret; không dùng dữ liệu thật cho test nếu chưa được phép và bảo vệ.
- Giữ thay đổi nhỏ, reviewable, có rollback; không phá compatibility âm thầm.
- Ưu tiên convention hiện có của brownfield repository.

## 2. Code quality

- Pin runtime/dependency quan trọng và giữ lockfile.
- Dùng formatter/linter/type/static analysis phù hợp stack.
- Tách business logic khỏi transport/persistence khi có lợi cho testability.
- Áp dụng SOLID, DRY, KISS, YAGNI hoặc Clean Architecture theo context và evidence; không biến tên pattern thành requirement release-blocking nếu thiếu tiêu chí đo/acceptance.
- Thiết kế module có responsibility, contract, dependency và blast radius rõ; không yêu cầu tuyệt đối “không ảnh hưởng module khác”.
- Validate tại trust boundary; xử lý lỗi có cấu trúc và không lộ thông tin nhạy cảm.
- Log có correlation ID; không log password/token/secret/PII không cần thiết.

## 3. Version control và review

- Không ghi đè thay đổi chưa rõ của Client.
- Branch/commit/PR phải liên kết `WI` và requirement ID.
- Review kiểm tra correctness, security, test, migration, observability, docs và rollback.
- Thay đổi Critical/High cần domain/security reviewer phù hợp.

## 4. Testing

- Unit test business rule; integration test boundary; contract test integration; E2E cho journey trọng yếu.
- Có negative/security test theo threat model.
- Test phải deterministic; flaky test không được coi là pass ổn định.
- Coverage là tín hiệu, không thay thế assertion chất lượng và risk coverage.
- Ngưỡng line/branch/function coverage phải được tailoring theo risk, layer, tool và exclusion; không áp một ngưỡng 90% chung nếu thiếu rationale.

## 5. Security/privacy baseline

- Default deny; least privilege; MFA/step-up cho hành động nhạy cảm khi cần.
- Encryption in transit; at rest theo classification/risk.
- Retention/delete/export/audit phải được thiết kế cho dữ liệu cá nhân.
- Dependency/security scan và threat modeling trước release phù hợp mức rủi ro.
- Chọn `STANDARD`, `HIGH` hoặc `CRITICAL`; security verification và release gate tuân theo profile đã duyệt.

## 5A. UI/UX và prototype

- Với sản phẩm có UI, xác định design-system reference, component, typography, color, responsive/accessibility target và exact interaction/error states.
- Prototype được yêu cầu trước production UI cho journey High/Critical hoặc khi acceptance phụ thuộc interaction; prototype/spike có thể được code sớm nếu được đánh dấu non-production và có learning objective.
- Figma, Penpot, MCP hoặc design-to-code chỉ là tool option; không bắt buộc nếu không khả dụng, không phù hợp hoặc dự án không có UI. Quyết định `N/A/Tailor` phải có rationale.
- Generated/design-to-code output phải qua code review, accessibility, security, performance và maintainability checks; không coi export là production-ready evidence.

## 6. Tài liệu và bằng chứng

- Tài liệu có owner, version/status và changelog khi là baseline.
- Diagram/source specification nên text-based và version-controlled khi khả thi.
- Lệnh test/build phải ghi môi trường, phiên bản, ngày và kết quả.
- Không xóa lịch sử quyết định; supersede bằng ADR/change record mới.

## 7. Ngoại lệ

| Exception ID | Policy | Lý do | Risk | Mitigation | Approver | Expiry |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| EXC-001 | {{POLICY}} | {{REASON}} | {{RISK}} | {{MITIGATION}} | {{APPROVER}} | {{DATE}} |
