---
artifact_id: DOC-02-REQUIREMENTS-README-MD
phase: "02-Requirements"
artifact_type: requirements
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Phase 02 — Requirements

## Mục tiêu

Chuyển discovery thành yêu cầu có ID, nguồn, priority, business rule, acceptance và cách đo. Không để giải pháp kỹ thuật thay thế cho nhu cầu; không để requirement mồ côi khỏi design/code/test.

## Artifact

- `SRS.md`: scope, actors, workflow, BR/FR/NFR, data/integration/acceptance.
- `BRD.md`: business need, as-is/to-be workflow, objectives, business rules và acceptance.
- `FEATURE_CATALOG.md`: danh sách feature, complexity/risk, owner, release và trace links.
- `USE_CASE_SPECIFICATION.md`: detailed happy/alternate/exception flows và edge cases.
- `BPMN_WORKFLOW.md`: process lanes, task, gateway, message, exception và SLA.
- `CRUD_FUNCTIONAL_MATRIX.md`: entity × CRUD × actor × permission × test matrix.
- `REQUIREMENT_ITEM_TEMPLATE.md`: mẫu UC/US/FR/NFR chi tiết.
- `TRACEABILITY_MATRIX.md`: chuỗi end-to-end đến release/handover.
- `REQUIREMENTS_REVIEW.md`: checklist và sign-off.

## Gate 02

- [ ] Mỗi requirement có ID, source, owner, priority và acceptance testable.
- [ ] Requirement atomic, dùng đúng `PHẢI/NÊN/CÓ THỂ`, không có từ định tính thiếu metric.
- [ ] Version history, glossary và UI/Hardware/Software/Communications interfaces đủ hoặc có N/A rationale.
- [ ] Happy/alternate/error path, permission, data và NFR mục tiêu rõ.
- [ ] BPMN Workflow và CRUD–Functional Matrix bao phủ workflow/entity in-scope.
- [ ] Release scope và out-of-scope không mâu thuẫn.
- [ ] RTM không có requirement Critical/High thiếu owner hoặc test approach.
