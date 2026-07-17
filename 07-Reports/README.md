---
artifact_id: DOC-07-REPORTS-README-MD
phase: "07-Reports"
artifact_type: report
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Phase 07 — Delivery & Release Reports

## Mục tiêu

Cho Client một bức tranh trung thực về planned vs delivered, tiến độ, scope change, quality, release, incident, chi phí/nguồn lực giả định và giá trị đạt được. Báo cáo phải dựa trên evidence, không chỉ mô tả hoạt động.

## Artifact

- `STATUS_AND_SPRINT_REPORT.md`: báo cáo định kỳ/milestone.
- `RELEASE_REPORT.md`: release scope, evidence, deployment/rollback và known issues.
- `FINAL_REPORT.md`: kết quả toàn dự án và recommendation.
- `INCIDENT_AND_PIR.md`: incident timeline, impact, root cause và action.
- `LESSONS_LEARNED.md`: điều nên giữ/thay đổi cho giai đoạn tiếp.
- `READINESS_DASHBOARD.md`: readiness và coverage theo gate từ machine-readable evidence.

## Gate 07

- [ ] Client thấy rõ delivered/deferred/out-of-scope và lý do.
- [ ] Release/version/evidence/known issues/rollback/owner rõ.
- [ ] KPI/outcome và deviation được báo cáo trung thực.
- [ ] Incident/action/risk tồn dư không bị che giấu.
