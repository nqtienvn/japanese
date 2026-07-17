---
artifact_id: DOC-05-DEVELOPMENT-README-MD
phase: "05-Development"
artifact_type: development
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Phase 05 — Development

## Mục tiêu

Hiện thực hóa các vertical slice theo policy và design, giữ repository luôn có thể build/test trong khả năng, cập nhật traceability và không làm mất thay đổi hiện có. Source code có thể ở root hoặc cấu trúc sẵn của dự án; phase này không ép một framework.

## Artifact

- `PROJECT_STRUCTURE.md`: bản đồ code/module/owner/entry point.
- `DEVELOPMENT_WORKFLOW.md`: setup, branch, build, test, CI và evidence.
- `CODE_REVIEW_CHECKLIST.md`: correctness/security/test/operations review.
- `TECH_DEBT_REGISTER.md`: nợ kỹ thuật, tác động, trigger và owner.
- `PULL_REQUEST_TEMPLATE.md`: mô tả thay đổi có trace links.
- `DEVOPS_IAC_AND_PIPELINE.md`: pipeline, IaC, artifact provenance, promotion và rollback.
- `CONTAINER_SECURITY_PROFILE.md`: container/image/runtime controls và scan evidence.

## Gate 05

- [ ] In-scope code/config/migration hoàn tất và review.
- [ ] Build/lint/type/static/unit checks đạt target.
- [ ] Auth/error/log/observability/secret handling đúng design.
- [ ] RTM, changelog, tech debt và docs cập nhật; known limitation rõ.
- [ ] Pipeline/IaC/container controls có Apply/Tailor/N/A rationale và evidence.
