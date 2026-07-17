---
artifact_id: DOC-01-PLANNING-README-MD
phase: "01-Planning"
artifact_type: planning
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Phase 01 — Discovery & Planning

## Mục tiêu

Phỏng vấn Client đến khi vấn đề, stakeholder, outcome, scope, ưu tiên, constraint, dependency, risk và cách nghiệm thu đủ rõ. Với brownfield, audit evidence trước rồi chỉ hỏi phần không thể suy ra.

## Artifact

- `DISCOVERY_LOG.md`: từng câu hỏi/answer/assumption/decision.
- `PROJECT_PLAN.md`: approach, milestone, roadmap, dependency, communication.
- `RISK_REGISTER.md`: risk, trigger, response, owner.
- `BROWNFIELD_AUDIT.md`: as-is inventory và gap nếu dự án dở dang.
- `COST_FINOPS_CAPACITY_LIFECYCLE.md`: cost model, FinOps, capacity forecast và EOL/lifecycle.
- Chọn profile câu hỏi trong [question-profiles.md](../.agents/skills/ai-project-delivery/references/question-profiles.md) và ghi rationale vào Discovery Log.

## Gate 01

- [ ] Core discovery applicable đạt 100%; miền rủi ro cao không có unknown vô chủ.
- [ ] Problem/outcome/metric/scope/out-of-scope được Client xác nhận.
- [ ] Plan, dependency, timeline và risk có owner.
- [ ] Client duyệt baseline hoặc ủy quyền rõ cho lựa chọn local/reversible.
