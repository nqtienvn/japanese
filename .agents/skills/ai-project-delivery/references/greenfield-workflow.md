# Greenfield workflow

## Mục lục

1. Intake
2. Discovery
3. Baseline
4. Delivery
5. Handover

## 1. Intake

1. Ghi nguyên văn ý tưởng vào discovery log.
2. Hỏi 5–8 câu đầu: vấn đề, người dùng, outcome, urgency, sponsor, giới hạn và hiện trạng thay thế.
3. Điền `PROJECT_PROFILE.md`, chọn autonomy mode và tạo stakeholder map.

## 2. Discovery

1. Đi qua core bank theo các vòng: bối cảnh → stakeholder → outcome → scope → process → economics → acceptance.
2. Chọn product/engineering questions theo domain và rủi ro.
3. Sau mỗi 3–5 vòng, tạo một synthesis: problem tree, scope, workflow, domain terms, decisions, risks và unknowns.
4. Dùng prototype/spike chỉ để giảm bất định đã được ghi, không dùng để né requirements.

## 3. Baseline

Tạo và review:

- Charter/governance.
- Project plan, roadmap, risk register.
- SRS và RTM với BR/FR/NFR/UC/US.
- Acceptance và release boundary.

Yêu cầu user duyệt baseline một lần, trừ khi user đã ủy quyền đầy đủ. Ghi approval và mọi ngoại lệ.

## 4. Delivery

1. Thiết kế C4/ADR/data/API/UX/threat model.
2. Lập implementation plan, work items, migration/release/rollback.
3. Code theo vertical slice có trace ID; build/test liên tục.
4. Chạy test strategy phù hợp rủi ro.
5. Báo thay đổi scope/decision qua change control, không âm thầm mở rộng.

## 5. Handover

Hoàn thiện release report, final report, document index, user guide, operations runbook, handover checklist và residual risk acceptance. Xác minh người khác có thể cài, chạy, test, rollback và vận hành bằng tài liệu.
