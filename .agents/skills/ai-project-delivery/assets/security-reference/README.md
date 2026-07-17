# Security Reference Assets

## Mục đích

Thư mục này lưu snapshot code security do Client cung cấp để AI có thể tái sử dụng kiến thức triển khai mà không phụ thuộc vào lịch sử chat hoặc đường dẫn máy cá nhân. Đây là **reference nội bộ có kiểm soát**, không phải thư viện được chứng nhận và không phải bằng chứng rằng một sản phẩm đã an toàn.

AI phải đọc `references/security-adoption-workflow.md` trước khi đưa bất kỳ phần nào của snapshot vào application code.

## Nguồn và phạm vi snapshot

| Reference | Nguồn do Client cung cấp | Nội dung đã lưu | Trạng thái |
| :--- | :--- | :--- | :--- |
| `legacy-bank-security/` | `E:\mb_laos_be\security` | 23 file Java, `pom.xml`, `.gitignore`, cấu trúc cấu hình đã khử secret | `QUARANTINED_REFERENCE` |
| `mb-security-starter/` | `E:\mb_laos_be\mb-security-starter` | 14 file Java chính, 4 Java template, 1 POM template, `pom.xml`, Spring metadata, 2 cấu hình đã harden | `QUARANTINED_REFERENCE` |

Snapshot được tạo ngày `2026-07-17`. Hai thư mục nguồn không có Git metadata cục bộ để xác nhận commit/tag/provenance. Client mô tả đây là code security chuẩn từ môi trường ngân hàng đã từng tham gia; tuyên bố quyền sở hữu, license và quyền phân phối chưa được đánh giá độc lập.

## Claim boundary

- Chỉ dùng nội bộ cho project được Client cho phép.
- Không publish, bán, open-source hoặc chuyển cho bên thứ ba nếu chưa có owner xác nhận quyền sử dụng.
- Không dùng cụm “bank-certified”, “an toàn tuyệt đối” hoặc “copy là đạt chuẩn”.
- Source reference không được ưu tiên hơn threat model, requirement hiện hành, version hỗ trợ, security advisory hoặc test evidence.

## Quy tắc sử dụng

1. AI phải chọn Security Profile và hoàn thành compatibility/security delta trước khi copy vào code đích.
2. Với Java/Spring, `mb-security-starter` là reference cấu trúc ưu tiên; module legacy chỉ dùng để khai thác pattern/behavior hoặc compatibility đã được chứng minh.
3. Với stack khác Java/Spring, AI phải chuyển dịch control/behavior; không ép phụ thuộc Java vào project.
4. Mỗi file được nhận vào production phải có requirement, design decision, work item và passing security test tương ứng.
5. Không được đưa các anti-pattern trong `SECURITY_REVIEW.md` vào production.
6. Secret phải đến từ secret manager hoặc injection an toàn; cấu hình thiếu secret phải fail fast.
7. Bất kỳ khác biệt material nào với baseline phải được ghi trong `03-Architecture-Design/SECURITY_ADOPTION_RECORD.md`.

## Sanitization đã thực hiện

- Không copy value `jasypt.encryptor.password` đã commit trong source legacy.
- Không giữ `PBEWithMD5AndTripleDES` hoặc iteration count legacy làm default.
- Không giữ fallback JWT secret, database password, `ddl-auto: update`, `show-sql: true`, error detail `always` hoặc DEBUG logging trong cấu hình mẫu.
- Không copy các guide nguồn có snippet chứa unsafe fallback; nội dung thay thế được chuẩn hóa trong `references/security-adoption-workflow.md` và các cấu hình tại snapshot.

File-level scope và sanitation rationale nằm trong [MANIFEST.md](MANIFEST.md). Chi tiết evidence, build result và finding nằm trong [SECURITY_REVIEW.md](SECURITY_REVIEW.md).
