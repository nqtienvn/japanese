# WI-{{NNN}} — {{WORK_ITEM_TITLE}}

| Field | Value |
| :--- | :--- |
| Type | Feature / Defect / Refactor / Migration / Spike / Documentation |
| Owner / reviewer | {{OWNER}} / {{REVIEWER}} |
| Requirement/design | {{REQUIREMENT_IDS}} / {{DESIGN_IDS}} |
| Priority / estimate | {{PRIORITY}} / {{ESTIMATE_CONFIDENCE}} |
| Status | Ready / In Progress / Review / Verified / Done / Blocked |

## Outcome và scope

- User/business outcome: {{OUTCOME}}
- In scope: {{IN_SCOPE}}
- Out of scope: {{OUT_OF_SCOPE}}

## Implementation notes

- Components/files likely affected: {{AREAS}}
- Contract/data/migration: {{IMPACT}}
- Security/privacy/observability: {{IMPACT}}
- Compatibility/feature flag: {{PLAN}}
- Module/dependency blast radius và regression boundary: {{IMPACT_EVIDENCE}}
- Human/manual/approval dependency (nếu có): {{ASSISTANCE_ID_TRIGGER_MIN_ACTION}}

## Acceptance / verification

- [ ] {{FUNCTIONAL_ACCEPTANCE}}
- [ ] {{NEGATIVE_EDGE_ACCEPTANCE}}
- [ ] Build/lint/static/unit checks phù hợp đạt.
- [ ] `TC-XXX` đạt và evidence được ghi.
- [ ] RTM/changelog/docs/runbook cập nhật nếu ảnh hưởng.

## Execution log

| Date | Action/command | Result/evidence | Decision/follow-up |
| :--- | :--- | :--- | :--- |
| {{DATE}} | {{ACTION}} | {{RESULT}} | {{FOLLOW_UP}} |

Nếu status `Blocked`, ghi ít nhất ba phương án materially different đã thử trước khi dùng `HUM-BLOCKER`, trừ khi blocker thuộc access/manual/approval/sign-off rõ ràng.
