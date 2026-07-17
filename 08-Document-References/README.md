---
artifact_id: DOC-08-DOCUMENT-REFERENCES-README-MD
phase: "08-Document-References"
artifact_type: handover
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Phase 08 — Documentation, Handover & Continuity

## Mục tiêu

Bàn giao sao cho Client hoặc một vendor/team khác có thể hiểu, cài đặt, vận hành, hỗ trợ, thay đổi và tiếp tục dự án mà không phụ thuộc vào lịch sử chat hay một cá nhân.

## Artifact

- `DOCUMENT_INDEX.md`: bản đồ tài liệu, owner, version và audience.
- `USER_GUIDE.md`: hướng dẫn theo persona/journey.
- `DEPLOYMENT_GUIDE.md`: environment, config/secret references, build/deploy/migrate/smoke/rollback.
- `OPERATIONS_RUNBOOK.md`: deploy, monitor, backup/restore, troubleshoot, incident.
- `HANDOVER_CHECKLIST.md`: ownership, access, knowledge transfer, acceptance.
- `MEETING_MINUTES.md`: decision/action từ họp.
- `GLOSSARY_AND_REFERENCES.md`: thuật ngữ và nguồn chuẩn.
- `SECURITY_REFERENCE_INDEX.md`: thứ tự đọc, code snapshot, portability và adoption evidence.
- `DR_BCP_AND_CRISIS_PLAN.md`: continuity, recovery, failover, crisis communication và exercise evidence.
- `TERM_STANDARDIZATION.md`: glossary canonical Việt–Anh và forbidden variants.
- `DOCUMENT_INDEX.generated.md`: index sinh tự động từ front matter bằng `generate_document_index.ps1`.
- `../09-Example-Project/`: dự án mẫu hoàn chỉnh từ idea đến sandbox và handover.

## Gate 08

- [ ] Document index không có artifact bắt buộc thiếu/obsolete vô chủ.
- [ ] Người nhận có thể setup/run/test/release/rollback/troubleshoot theo tài liệu.
- [ ] New Developer/Ops Readiness Test từ clean baseline đạt, không cần hỏi tác giả ở bước blocking.
- [ ] Ownership, support/warranty, access/secret transfer needs và residual risk rõ.
- [ ] Final handover/acceptance được Client ghi nhận.
