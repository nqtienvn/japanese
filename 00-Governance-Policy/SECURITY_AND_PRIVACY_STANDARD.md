# Security & Privacy Engineering Standard

## 1. Mục đích và giới hạn tuyên bố

Thiết lập security/privacy baseline theo rủi ro cho requirements, architecture, implementation, testing, release và operations. “Bảo mật mạnh nhất”, “an toàn tuyệt đối” hoặc “không thể bị tấn công” là câu không testable và bị cấm trong baseline; phải thay bằng Security Profile, threat, control và pass/fail evidence cụ thể.

Tài liệu này được thiết kế theo hướng tham chiếu, không tự tạo chứng nhận hoặc ý kiến pháp lý. ISO/IEC 27001 là chuẩn ISMS ở cấp tổ chức; project chỉ được tuyên bố `aligned` khi đã tailoring và có evidence, không được tuyên bố `certified` nếu thiếu đánh giá/chứng nhận độc lập.

## 2. Security Profile

| Profile | Điều kiện điển hình | Mức kiểm soát |
| :--- | :--- | :--- |
| `STANDARD` | Không có dữ liệu nhạy cảm/giao dịch trọng yếu; exposure thấp | Baseline secure-by-default và verification theo risk |
| `HIGH` | Account, PII, integration bên thứ ba, internet-facing hoặc tác động kinh doanh đáng kể | Baseline + kiểm tra security chuyên sâu và recovery |
| `CRITICAL` | Payment, financial, health, Sensitive/Restricted data, privileged admin hoặc hạ tầng trọng yếu | High + independent review/pentest phù hợp, kiểm soát thay đổi và release nghiêm ngặt |

Nếu chưa đủ dữ kiện, tạm dùng `HIGH` và hoàn thành risk assessment trước Gate 03. Profile được chọn không thay thế threat modeling; control `N/A` phải có rationale, replacement, risk và approver.

## 3. Mandatory engineering controls

- `SEC-001`: Dự án **PHẢI** xác định Security Profile, Security Owner và risk appetite trước khi phê duyệt requirements baseline.
- `SEC-002`: Dự án **PHẢI** hoàn thành threat model cho system boundary, asset, trust boundary, data flow và abuse case trước Gate 03.
- `SEC-003`: Mỗi loại dữ liệu **PHẢI** có classification, owner, purpose, retention và access rule.
- `SEC-004`: Hệ thống **PHẢI** áp dụng default deny và least privilege tại mọi authorization boundary.
- `SEC-005`: Authentication và authorization **PHẢI** được enforce phía server hoặc trusted enforcement point.
- `SEC-006`: Privileged/high-impact action **PHẢI** có step-up authentication, dual control hoặc compensating control khi threat model yêu cầu.
- `SEC-007`: Input không tin cậy **PHẢI** được validate tại trust boundary và output **PHẢI** được encode theo context.
- `SEC-008`: Giá trị dữ liệu không tin cậy trong database query **PHẢI** dùng parameter binding/prepared statement hoặc cơ chế ORM chứng minh parameterization.
- `SEC-009`: Dynamic identifier không thể parameterize **PHẢI** được chọn từ allowlist; nối chuỗi SQL từ input không tin cậy bị cấm.
- `SEC-010`: Dữ liệu truyền qua mạng **PHẢI** dùng protocol/cipher được Security Baseline phê duyệt; TLS 1.3 được ưu tiên khi tương thích, ngoại lệ phải có risk/owner/expiry.
- `SEC-011`: Dữ liệu lưu trữ **PHẢI** được mã hóa khi classification, threat model, hợp đồng hoặc regulatory requirement yêu cầu.
- `SEC-012`: Secret **KHÔNG ĐƯỢC** hard-code, commit, log, đưa vào prompt hoặc lưu trong tài liệu dự án.
- `SEC-013`: AI **CÓ THỂ** tạo secret reference, environment schema, Vault/secret-manager integration và safe example nhưng **KHÔNG ĐƯỢC** yêu cầu hoặc công bố secret value thật.
- `SEC-014`: Security/audit log **PHẢI** có owner, event scope, retention, access control và redaction rule.
- `SEC-015`: Dependency, build artifact và container **PHẢI** có provenance/version và được scan theo Security Profile.
- `SEC-016`: Backup/restore, rollback và incident response **PHẢI** được kiểm chứng theo impact/RTO/RPO.
- `SEC-017`: Security requirement **PHẢI** có ID, threat/control mapping, test và residual-risk owner.
- `SEC-018`: Dự án **KHÔNG ĐƯỢC** tuyên bố an toàn tuyệt đối, compliant hoặc certified khi evidence không hỗ trợ tuyên bố đó.

## 4. Application security coverage

Pin [OWASP Top 10:2025](https://owasp.org/Top10/2025/0x00_2025-Introduction/) làm awareness baseline cho web application tại thời điểm tạo template; kiểm tra phiên bản trước mỗi dự án. Top 10 không thay thế threat model hoặc security requirements riêng.

| Miền | Nội dung tối thiểu khi áp dụng |
| :--- | :--- |
| Access/authentication | Broken access control, authentication failures, session/token lifecycle, privilege change |
| Configuration/supply chain | Security misconfiguration, software supply-chain failure, dependency/provenance/secret exposure |
| Cryptography/data | Cryptographic failures, classification, key ownership, retention/redaction |
| Input/design/integrity | Injection, insecure design, software/data integrity, SSRF/XSS/CSRF/file/command abuse theo attack surface |
| Detection/recovery | Security logging/alerting failures, exceptional-condition handling, incident/recovery evidence |

## 5. Privacy và regulatory applicability

Trước khi ghi GDPR, CCPA hoặc luật khác là mandatory, phải hoàn thành Regulatory Applicability Assessment:

| Regulation | Apply / Tailor / N/A | Data subject/territory/business trigger | Obligations | Legal owner | Evidence/review date |
| :--- | :--- | :--- | :--- | :--- | :--- |
| GDPR | {{DECISION}} | {{TRIGGER}} | {{OBLIGATIONS}} | {{OWNER}} | {{EVIDENCE_DATE}} |
| CCPA as amended | {{DECISION}} | {{TRIGGER}} | {{OBLIGATIONS}} | {{OWNER}} | {{EVIDENCE_DATE}} |

- GDPR consent chỉ là một legal basis; mỗi processing purpose phải có lawful-basis decision phù hợp. Tham chiếu [GDPR Article 6/32](https://eur-lex.europa.eu/eli/reg/2016/679/art_6/oj/eng).
- CCPA applicability và consumer rights phải dựa trên phạm vi business/data subject thực tế. Tham chiếu [California Privacy Protection Agency](https://cppa.ca.gov/faq).
- Legal/compliance owner chịu trách nhiệm xác nhận áp dụng; AI hỗ trợ phân tích và evidence nhưng không thay thế legal advice/sign-off.

## 6. Verification theo profile

| Verification | STANDARD | HIGH | CRITICAL |
| :--- | :---: | :---: | :---: |
| Threat model + security requirements/RTM | Bắt buộc | Bắt buộc | Bắt buộc + independent review |
| SAST, secret scan, dependency/SCA | Theo stack/risk | Bắt buộc | Bắt buộc + severity gate |
| Authorization/input/negative tests | Bắt buộc theo attack surface | Bắt buộc | Bắt buộc + abuse/adversarial review |
| DAST/API/container/config scan | Theo exposure | Bắt buộc khi áp dụng | Bắt buộc khi áp dụng |
| Recovery/backup/incident exercise | Theo impact | Bắt buộc theo RTO/RPO | Bắt buộc + documented exercise |
| Independent penetration test | Theo risk/contract | Theo risk/contract | Bắt buộc trước initial production hoặc major exposure change, trừ exception đúng quyền |

Pentest chỉ được thực hiện với scope, Rules of Engagement, environment, authorization, data handling và remediation owner rõ.

## 7. Security release gate

- Không release khi còn vulnerability/risk `Critical` mở.
- `High` chỉ được time-bound accept bởi Security Owner và Client authority, có mitigation, owner, expiry và retest plan.
- Mọi Must/Critical security requirement phải có passing evidence trong Test RTM.
- Security Profile, threat model, scan/test scope, exclusions, findings, residual risk và incident/rollback readiness phải xuất hiện trong release recommendation.
- Control không áp dụng phải giữ `N/A rationale`; không xóa khỏi checklist để che coverage gap.

## 8. Standards register

| Reference | Phiên bản ghim | Cách dùng |
| :--- | :--- | :--- |
| [ISO/IEC 27001](https://www.iso.org/standard/27001) | 2022, Edition 3 + amendment applicable | ISMS/risk-management alignment ở cấp tổ chức/project interface |
| [ISO/IEC 27002](https://www.iso.org/standard/75652.html) | 2022, Edition 3 | Guidance/control reference; chọn theo risk và Statement of Applicability |
| [OWASP Top 10](https://owasp.org/Top10/2025/0x00_2025-Introduction/) | 2025 | Web application risk awareness, không phải checklist đầy đủ |

Kiểm tra phiên bản và applicability trước mỗi project baseline; ghi tailoring trong `STANDARDS_ALIGNMENT_MATRIX.md`.
