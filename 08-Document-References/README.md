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

## Gate 08

- [ ] Document index không có artifact bắt buộc thiếu/obsolete vô chủ.
- [ ] Người nhận có thể setup/run/test/release/rollback/troubleshoot theo tài liệu.
- [ ] New Developer/Ops Readiness Test từ clean baseline đạt, không cần hỏi tác giả ở bước blocking.
- [ ] Ownership, support/warranty, access/secret transfer needs và residual risk rõ.
- [ ] Final handover/acceptance được Client ghi nhận.
