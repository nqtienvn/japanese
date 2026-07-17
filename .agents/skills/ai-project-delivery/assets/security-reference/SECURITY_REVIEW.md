# Security Reference Review

## Review context

| Trường | Giá trị |
| :--- | :--- |
| Review date | 2026-07-17 |
| Engagement | `CHANGE` — tích hợp security reference vào AI Project Delivery template |
| Risk context | Financial/banking reference; đánh giá theo `CRITICAL` cho mục đích adoption |
| Source mutation | Không; hai thư mục nguồn giữ nguyên |
| Snapshot status | `QUARANTINED_REFERENCE` cho đến khi project-specific adoption gate đạt |

## Evidence inventory

| Reference | Code inventory | Test inventory | Build evidence |
| :--- | :--- | :--- | :--- |
| Legacy | 23 Java + POM + 1 YAML | Không thấy `src/test` | `mvn -q test` thất bại ở dependency resolution do internal artifacts/parent `${app.version}` không khả dụng |
| Starter | 14 Java chính + 4 Java template + POM/template/resources | Không thấy `src/test` | `mvn -q test` thất bại: Lombok-generated `log` không được resolve và `SecurityUtils` sai generic type |

## Findings bắt buộc xử lý trước production

| Finding ID | Mức | Evidence tóm tắt | Quyết định baseline |
| :--- | :---: | :--- | :--- |
| `RISK-SEC-REF-001` | Critical | Legacy YAML chứa committed Jasypt encryptor password | Raw value không được đưa vào snapshot; rotate/revoke theo owner nếu còn hiệu lực |
| `RISK-SEC-REF-002` | High | Legacy dùng `PBEWithMD5AndTripleDES` và iteration thấp | Cấm dùng làm default; chọn cơ chế quản lý secret/key hiện hành theo threat model |
| `RISK-SEC-REF-003` | Critical | Legacy cookie filters log access token và CSRF token | Cấm log token/credential; thêm test log-redaction |
| `RISK-SEC-REF-004` | Critical | Legacy có đường tạo refresh token không gắn expiration | Không adopt; refresh token phải có lifetime, rotation, replay detection và revocation |
| `RISK-SEC-REF-005` | High | Starter tắt Spring CSRF trong khi access/refresh token được đặt trong cookie | Phải bật CSRF hoặc chứng minh cơ chế tương đương cho mọi unsafe method |
| `RISK-SEC-REF-006` | High | Starter default CORS cho phép origin/header `*` cùng credentials | Default phải deny; allowlist origin/method/header theo environment |
| `RISK-SEC-REF-007` | High | JWT validation chủ yếu kiểm signature/type/subject; chưa enforce đầy đủ issuer/audience/jti/policy/rotation | Bổ sung claims policy, key lifecycle, replay/revocation và negative tests |
| `RISK-SEC-REF-008` | High | Refresh token starter là reusable bearer token, không có rotation/reuse detection | Bắt buộc one-time rotation hoặc sender-constrained/compensating control đã duyệt |
| `RISK-SEC-REF-009` | High | OAuth provider/redirect/cookie behavior hard-code và chưa chứng minh PKCE/exact redirect validation | Áp dụng RFC 9700; redirect allowlist chính xác và PKCE theo client type |
| `RISK-SEC-REF-010` | High | Permission evaluator legacy dùng `startsWith` + `contains` | Không dùng cho authorization decision; ánh xạ authority/permission exact và test confusion cases |
| `RISK-SEC-REF-011` | High | Cả hai reference không có automated test; starter không compile độc lập | Adoption gate fail cho đến khi build và security verification đạt |
| `RISK-SEC-REF-012` | Medium | Starter dùng BCrypt mặc định; OWASP hiện ưu tiên Argon2id cho system mới | Project mới ưu tiên Argon2id; BCrypt chỉ dùng khi compatibility/risk rationale rõ |
| `RISK-SEC-REF-013` | High | Spring Boot 3.2.2 và dependency set đã cũ so với baseline hiện hành | Chạy compatibility/advisory/SCA; không nâng version mù và không giữ claim “latest” |
| `RISK-SEC-REF-014` | High | Template nguồn có DB password/JWT fallback, schema auto-update, SQL/error/debug logging unsafe | Snapshot chỉ giữ cấu hình đã sanitize; production config phải được scan |

## Thành phần có thể tái sử dụng sau review

- Cấu trúc Spring Boot auto-configuration và property binding.
- JWT access/CSRF token model như input cho design, không phải acceptance evidence.
- Spring method security integration sau khi thay permission matching bằng exact policy.
- `SecurityUtils`, auditor-aware, password encoder và OAuth user mapping sau compile/test review.
- Legacy token cache/invalidation concept sau khi bổ sung concurrency, expiry, logout/password-change và replay tests.

## Release rule

Không component nào trong snapshot được xem là production-ready chỉ vì đã được copy. Project chỉ được nhận component khi row tương ứng trong `SECURITY_ADOPTION_RECORD.md` có trạng thái `Verified`, `SECURITY_VERIFICATION_MATRIX.md` có passing evidence và không còn Critical finding mở.
