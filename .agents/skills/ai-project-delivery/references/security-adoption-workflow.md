# Security Reference Adoption Workflow

## 1. Khi nào phải dùng

Đọc reference này trong mọi engagement. Thực thi đầy đủ khi project có authentication, authorization, session/token, secret, PII, public API, third-party identity hoặc Security Profile `HIGH/CRITICAL`.

Nguồn code nội bộ nằm tại `assets/security-reference/`. Code đó là input bắt buộc cho phân tích, không phải kết luận security.

## 2. Quy tắc chọn reference

| Project context | Hành động bắt buộc |
| :--- | :--- |
| Java 21 / Spring Boot 3+ chưa có security module | Dùng `mb-security-starter` làm starting inventory; import theo vertical slice rồi harden theo baseline |
| Spring legacy hoặc cần giữ behavior/cache contract cũ | So sánh cả hai snapshot; dùng legacy để hiểu compatibility, không giữ anti-pattern |
| Project đã có security module | Không overwrite; tạo component-by-component delta với hai snapshot và giữ convention tốt hơn có evidence |
| Stack khác Java/Spring | Đọc [security-portability-matrix.md](security-portability-matrix.md); refactor control/behavior sang native framework; ghi `N/A — stack mismatch` cho Java code copy nhưng không được ghi N/A cho security outcome |
| Managed IdP/API gateway chịu trách nhiệm security | Xác minh contract, issuer, audience, authorization boundary, token lifecycle và fallback; không tạo IdP riêng nếu không có requirement |
| Social OAuth không thuộc scope | Không import provider Google/Facebook; ghi N/A rationale |

Nếu applicability chưa rõ, AI phải tự đọc manifests, framework, routes, filters, identity integration và deployment topology trước. Chỉ hỏi stakeholder khi lựa chọn thay đổi product identity model, risk appetite hoặc contractual/regulatory boundary.

## 3. Adoption loop tự động

1. **Inventory** — index codebase; tìm auth entry point, filter chain, token/session store, permission model, secret source, public route, IdP, gateway và tests.
2. **Profile** — chọn `STANDARD/HIGH/CRITICAL`; financial/payment/privileged production mặc định `CRITICAL` cho đến khi owner quyết định khác.
3. **Compare** — điền `03-Architecture-Design/SECURITY_ADOPTION_RECORD.md` cho từng component trong snapshot.
4. **Threat model** — map asset, attacker, trust boundary, abuse case và control trước Gate 03.
5. **Import/translate** — copy applicable code vào working branch hoặc chuyển dịch sang stack đích; không copy secret hoặc unsafe config.
6. **Harden** — xử lý toàn bộ finding liên quan trong `assets/security-reference/SECURITY_REVIEW.md`.
7. **Verify** — chạy build, unit/integration/security tests, secret scan, SCA/SBOM và config validation phù hợp profile.
8. **Trace** — cập nhật requirement → design/ADR → work item → code/config → test result → residual risk.
9. **Gate** — chỉ chuyển component sang `Verified` khi exact expected result đạt; không dùng “source từng chạy ở ngân hàng” làm test evidence.

AI tự thực hiện loop này trong phạm vi local, reversible sau baseline. Không hỏi Client chọn library, package layout, test framework hoặc cách sửa compile nếu repository/evidence đủ để quyết định.

Với ngôn ngữ khác Java, “translate” nghĩa là refactor theo responsibility và security contract. AI phải tạo code native của stack đích, không dịch từng dòng Java và không đưa JVM vào kiến trúc chỉ để dùng snapshot.

## 4. Mandatory hardening delta

Mọi adoption phải xử lý tối thiểu các điểm sau:

- Secret fail-fast từ secret manager/injection; không fallback bằng literal.
- Default deny cho route và method; public endpoint là allowlist có owner.
- CORS origin/method/header explicit theo environment; credentials không đi cùng wildcard.
- Với credential trong cookie, CSRF protection phải bật hoặc có equivalent control đã threat-model/test.
- Cookie có `Secure`, `HttpOnly`, `SameSite`, path/domain tối thiểu và bounded lifetime.
- JWT parser pin algorithm/key; enforce `iss`, `aud`, `exp`, `nbf`, `iat`, token type và replay policy theo use case.
- Access token ngắn hạn; refresh token có rotation, reuse detection, expiry, revocation và security-event invalidation.
- Authorization dùng exact permission/resource/action mapping; cấm substring/prefix ambiguity nếu chưa có delimiter-safe formal grammar.
- Không log token, secret, credential, authorization header hoặc sensitive claim.
- OAuth/OIDC dùng exact redirect URI, `state`, PKCE/nonce theo client type và RFC 9700.
- Password mới ưu tiên Argon2id; BCrypt chỉ giữ cho compatibility với work factor được benchmark và migration plan.
- Dependency/framework version phải còn support phù hợp; SCA/advisory result quyết định upgrade, không dựa vào nhãn “latest” trong tài liệu cũ.
- Build/test phải pass; snapshot không có test không được xem là acceptable coverage.

## 5. Human-exclusive decisions

AI chỉ yêu cầu con người khi còn thiếu một trong các quyết định sau sau khi đã tự khai thác evidence:

- Product identity model hoặc user journey không thể suy ra.
- Risk appetite, residual High risk acceptance hoặc regulatory/legal applicability.
- Quyền dùng/publish proprietary reference code.
- Production IdP/secret reference/credential phải do owner cấp qua kênh an toàn.
- Production change, destructive migration, external penetration-test authorization hoặc formal sign-off.

Human không phải viết code, chọn implementation chi tiết, chạy local test hoặc đọc log thay AI chỉ vì công việc khó/lâu. Câu hỏi stakeholder phải theo đợt 5–12 câu, tập trung vào intent/authority/acceptance và cập nhật Discovery Log.

## 6. Evidence bắt buộc

- `03-Architecture-Design/THREAT_MODEL.md`
- `03-Architecture-Design/SECURITY_ADOPTION_RECORD.md`
- `06-Testing/SECURITY_VERIFICATION_MATRIX.md`
- Secret scan, dependency/SCA, SBOM/provenance và build result
- Negative authorization/CSRF/CORS/JWT/refresh/OAuth tests theo attack surface
- Release report ghi Security Profile, exclusions, findings, residual risk và owner

## 7. External baseline được kiểm tra ngày 2026-07-17

- [OWASP ASVS 5.0.0](https://github.com/OWASP/ASVS) — application security requirements; pin ID theo dạng `v5.0.0-x.y.z` khi map control.
- [RFC 9700 — OAuth 2.0 Security Best Current Practice](https://www.rfc-editor.org/info/rfc9700/) — redirect, PKCE, token replay và refresh-token protection.
- [OWASP Password Storage Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html) — Argon2id ưu tiên; BCrypt cho legacy khi Argon2/scrypt không khả dụng.
- [Spring Security CSRF reference](https://docs.spring.io/spring-security/reference/servlet/exploits/csrf.html) — CSRF control và test cho unsafe methods.
- [Spring Boot project](https://spring.io/projects/spring-boot/) — kiểm tra support/current version tại thời điểm adoption; không tự động nâng major mà thiếu compatibility evidence.

Các reference trên là baseline kỹ thuật, không tạo chứng nhận hoặc legal opinion.
