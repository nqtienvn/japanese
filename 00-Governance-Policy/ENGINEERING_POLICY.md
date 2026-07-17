# Engineering, Security & Documentation Policy

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

## 5. Security/privacy baseline

- Default deny; least privilege; MFA/step-up cho hành động nhạy cảm khi cần.
- Encryption in transit; at rest theo classification/risk.
- Retention/delete/export/audit phải được thiết kế cho dữ liệu cá nhân.
- Dependency/security scan và threat modeling trước release phù hợp mức rủi ro.

## 6. Tài liệu và bằng chứng

- Tài liệu có owner, version/status và changelog khi là baseline.
- Diagram/source specification nên text-based và version-controlled khi khả thi.
- Lệnh test/build phải ghi môi trường, phiên bản, ngày và kết quả.
- Không xóa lịch sử quyết định; supersede bằng ADR/change record mới.

## 7. Ngoại lệ

| Exception ID | Policy | Lý do | Risk | Mitigation | Approver | Expiry |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| EXC-001 | {{POLICY}} | {{REASON}} | {{RISK}} | {{MITIGATION}} | {{APPROVER}} | {{DATE}} |
