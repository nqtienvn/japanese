---
artifact_id: DOC-00-GOVERNANCE-POLICY-BANK-SECURITY-REFERENCE-BASELINE-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Bank Security Reference Baseline

## 1. Claim boundary

Baseline này buộc mọi project đánh giá và sử dụng có kiểm soát hai security code snapshot do Client cung cấp. Từ “Bank” mô tả provenance nghiệp vụ do Client nêu, không phải chứng nhận độc lập. Security Profile, threat model, current advisory và test evidence mới quyết định khả năng release.

Source of truth:

- `.agents/skills/ai-project-delivery/assets/security-reference/`
- `.agents/skills/ai-project-delivery/references/security-adoption-workflow.md`
- `03-Architecture-Design/SECURITY_ADOPTION_RECORD.md`
- `06-Testing/SECURITY_VERIFICATION_MATRIX.md`

## 2. Applicability

| Trường hợp | Baseline áp dụng |
| :--- | :--- |
| Java/Spring tự quản lý authentication/authorization | Đánh giá toàn bộ snapshot; import component phù hợp rồi harden |
| Java/Spring đã có security module | Diff toàn bộ control; không overwrite behavior đã có evidence tốt hơn |
| Stack khác | Map requirement/control; code snapshot được ghi N/A vì stack mismatch |
| Managed identity | Map boundary và contract; không nhân bản identity service nếu không có requirement |
| Không có auth/data nhạy cảm/exposure | Tailor từng control với rationale; Security Owner review trước Gate 03 |

## 3. Normative requirements

| ID | Requirement atomic | Expected result kiểm thử được |
| :--- | :--- | :--- |
| `SEC-BNK-001` | AI **PHẢI** đọc security snapshot review trước khi thiết kế security. | Adoption Record ghi source path và review date. |
| `SEC-BNK-002` | Project Java/Spring **PHẢI** đánh giá mọi component trong hai snapshot. | Mỗi component có `Adopt/Adapt/Reject/N/A` kèm rationale. |
| `SEC-BNK-003` | AI **KHÔNG ĐƯỢC** overwrite security module hiện hữu trước impact analysis. | Git diff không có thay đổi ngoài scope; blast radius được ghi. |
| `SEC-BNK-004` | Secret **KHÔNG ĐƯỢC** có literal value trong source hoặc artifact. | Secret scan không có finding thật; example chỉ chứa reference. |
| `SEC-BNK-005` | Runtime **PHẢI** fail fast khi thiếu secret bắt buộc. | Negative startup test dừng với lỗi đã redaction. |
| `SEC-BNK-006` | Authorization boundary **PHẢI** dùng default deny. | Route/operation không khai báo nhận `401/403` phù hợp. |
| `SEC-BNK-007` | Public endpoint **PHẢI** nằm trong allowlist có owner. | Route inventory khớp allowlist; không có broad wildcard ngoài rationale. |
| `SEC-BNK-008` | Permission decision **PHẢI** match resource/action theo rule chính xác. | Prefix/substring confusion cases bị từ chối. |
| `SEC-BNK-009` | Credential cookie **PHẢI** có `Secure`. | `Set-Cookie` test xác nhận attribute. |
| `SEC-BNK-010` | Credential cookie **PHẢI** có `HttpOnly`. | `Set-Cookie` test xác nhận attribute. |
| `SEC-BNK-011` | Credential cookie **PHẢI** có `SameSite` theo threat model. | Cross-site positive/negative test đạt expected policy. |
| `SEC-BNK-012` | CORS origin **PHẢI** dùng allowlist theo environment. | Origin ngoài allowlist không nhận allow-origin response. |
| `SEC-BNK-013` | CORS credentials **KHÔNG ĐƯỢC** kết hợp wildcard origin. | Config validation hoặc integration test từ chối cấu hình. |
| `SEC-BNK-014` | Unsafe cookie-authenticated request **PHẢI** có CSRF control. | Missing/invalid CSRF token bị từ chối. |
| `SEC-BNK-015` | JWT verifier **PHẢI** pin thuật toán được phê duyệt. | Token dùng `none` hoặc algorithm khác bị từ chối. |
| `SEC-BNK-016` | JWT verifier **PHẢI** enforce issuer. | Wrong/missing issuer bị từ chối. |
| `SEC-BNK-017` | JWT verifier **PHẢI** enforce audience khi token có resource audience. | Wrong/missing audience bị từ chối. |
| `SEC-BNK-018` | JWT verifier **PHẢI** enforce thời hạn token. | Expired/not-yet-valid token bị từ chối. |
| `SEC-BNK-019` | Refresh token **PHẢI** có bounded lifetime. | Token hết hạn không refresh được. |
| `SEC-BNK-020` | Refresh token **PHẢI** có reuse detection hoặc sender constraint đã duyệt. | Replay token cũ bị từ chối; token family bị xử lý theo policy. |
| `SEC-BNK-021` | Security event **PHẢI** kích hoạt token invalidation theo policy. | Logout/password change/disable-user test làm token liên quan mất hiệu lực. |
| `SEC-BNK-022` | Application **KHÔNG ĐƯỢC** log token hoặc credential. | Log scan sau positive/negative auth flow không tìm thấy value. |
| `SEC-BNK-023` | OAuth redirect **PHẢI** match URI đã đăng ký chính xác. | URI biến thể hoặc open redirect bị từ chối. |
| `SEC-BNK-024` | OAuth authorization-code flow **PHẢI** dùng PKCE khi RFC 9700 yêu cầu. | Missing/wrong verifier bị từ chối. |
| `SEC-BNK-025` | Password mới **NÊN** dùng Argon2id theo benchmark project. | Hash format/parameter test và performance evidence đạt target. |
| `SEC-BNK-026` | BCrypt legacy **PHẢI** có compatibility rationale. | ADR ghi work factor, 72-byte handling và migration path. |
| `SEC-BNK-027` | Security dependency **PHẢI** có version provenance. | Lock/build/SBOM chứa resolved version. |
| `SEC-BNK-028` | Security build **PHẢI** compile thành công trước Gate 05. | Build command trả exit code 0 trên clean environment. |
| `SEC-BNK-029` | Security requirement **PHẢI** có passing negative test trước release. | Test RTM có case/result/evidence cho từng Must requirement. |
| `SEC-BNK-030` | Release **KHÔNG ĐƯỢC** còn Critical security finding mở. | Security report có zero open Critical finding. |
| `SEC-BNK-031` | Project ngoài Java **PHẢI** refactor security responsibility sang primitive native. | Adoption Record ghi `Adapt — cross-language`; code đích không phụ thuộc JVM ngoài architecture đã duyệt. |
| `SEC-BNK-032` | Cross-language refactor **PHẢI** chứng minh behavioral equivalence cho contract cần giữ. | Contract test chạy trên implementation đích có passing evidence. |
| `SEC-BNK-033` | Project **KHÔNG ĐƯỢC** dùng khác biệt ngôn ngữ làm lý do bỏ security outcome. | Mọi control applicable vẫn có implementation hoặc replacement control. |

## 4. Human decision boundary

AI tự chọn cách implement, test, package, refactor và version patch/minor khi compatibility evidence đủ. Con người chỉ quyết định product identity model, risk appetite, legal/regulatory applicability, quyền dùng proprietary code, production credential/reference, production change hoặc formal acceptance.

## 5. Tailoring

Mọi `N/A` phải ghi component/control, evidence, rationale, replacement control, risk owner và review date. Không xóa row để che coverage gap.
