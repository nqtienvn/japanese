---
artifact_id: DOC-08-DOCUMENT-REFERENCES-SECURITY-REFERENCE-INDEX-MD
phase: "08-Document-References"
artifact_type: handover
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Security Reference Index

## Thứ tự AI phải đọc

1. `00-Governance-Policy/SECURITY_AND_PRIVACY_STANDARD.md`
2. `00-Governance-Policy/BANK_SECURITY_REFERENCE_BASELINE.md`
3. `.agents/skills/ai-project-delivery/references/security-adoption-workflow.md`
4. `.agents/skills/ai-project-delivery/references/security-portability-matrix.md` nếu stack khác Java/Spring
5. `.agents/skills/ai-project-delivery/assets/security-reference/SECURITY_REVIEW.md`
6. Code snapshot phù hợp trong `.agents/skills/ai-project-delivery/assets/security-reference/`
7. `03-Architecture-Design/THREAT_MODEL.md`
8. `03-Architecture-Design/SECURITY_ADOPTION_RECORD.md`
9. `06-Testing/SECURITY_VERIFICATION_MATRIX.md`

## Code snapshot

| Nhóm | Path | Dùng cho |
| :--- | :--- | :--- |
| Starter | `.agents/skills/ai-project-delivery/assets/security-reference/mb-security-starter/` | Java 21/Spring Boot 3+ structural starting point |
| Legacy | `.agents/skills/ai-project-delivery/assets/security-reference/legacy-bank-security/` | Behavior/compatibility/reference patterns |
| Review | `.agents/skills/ai-project-delivery/assets/security-reference/SECURITY_REVIEW.md` | Finding phải harden trước production |

## Quy tắc portable

Khi copy template sang repository khác, phải copy toàn bộ `.agents/skills/ai-project-delivery/assets/security-reference/`. Không đưa raw secret, private key hoặc machine-specific source path vào project mới. Nếu reference code không được phép phân phối, thay snapshot bằng artifact nội bộ có access control rồi cập nhật path/provenance trong Adoption Record.
