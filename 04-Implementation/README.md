# Phase 04 — Implementation Planning

## Mục tiêu

Biến design thành work item có thể triển khai theo vertical slice, có dependency, estimate, test approach, migration, release và rollback. Phase này trả lời “làm theo thứ tự nào, bằng evidence gì và phục hồi ra sao”.

## Artifact

- `IMPLEMENTATION_PLAN.md`: sequence, milestone, environment và readiness.
- `WORK_ITEM_TEMPLATE.md`: task/story kỹ thuật có trace links.
- `MIGRATION_RELEASE_ROLLBACK.md`: thay đổi data/config/deploy an toàn.
- `CHANGELOG.md`: lịch sử thay đổi sản phẩm/tài liệu.
- `ENVIRONMENT_SETUP.md`: local/dev/test setup không chứa secret.

## Gate 04

- [ ] Work item phủ đủ release scope và có design/requirement/test link.
- [ ] Dependency/access/environment/spike blocking đã xử lý.
- [ ] Migration, compatibility, rollout, smoke và rollback rõ.
- [ ] Client đã duyệt thay đổi scope/time/cost nếu plan khác baseline.
