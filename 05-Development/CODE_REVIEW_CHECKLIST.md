# Code Review Checklist

## Context

| Field | Value |
| :--- | :--- |
| WI / requirements | {{WI_IDS}} / {{REQUIREMENT_IDS}} |
| Design / ADR | {{DESIGN_IDS}} |
| Reviewer | {{REVIEWER}} |
| Risk level | Low / Medium / High / Critical |

## Correctness và maintainability

- [ ] Code thực hiện đúng acceptance, không mở rộng scope âm thầm.
- [ ] Edge/error/concurrency/idempotency/transaction path đúng.
- [ ] Naming, boundary, dependency và convention phù hợp codebase.
- [ ] Module contract/blast radius/compatibility rõ; không dựa vào giả định “không ảnh hưởng module khác”.
- [ ] Không có dead/debug/generated noise hoặc duplication đáng kể.
- [ ] Error message/actionable handling không che lỗi hoặc lộ nội bộ.

## Security và privacy

- [ ] Authentication/authorization ở trust boundary, default deny.
- [ ] Input/output/file/query được validate/encode/parameterize phù hợp.
- [ ] Security Profile controls và linked threat/security requirements có code/test evidence.
- [ ] Secret/PII không hard-code, log hoặc gửi ngoài policy.
- [ ] Dependency, crypto, random, token/session và rate limit phù hợp.
- [ ] Threat/abuse case và audit requirement được test.

## Data, compatibility và operations

- [ ] Schema/migration/backfill có compatibility và rollback.
- [ ] API/event/config/feature flag version/default/expiry rõ.
- [ ] Log/metric/trace/health/alert đủ để vận hành.
- [ ] Timeout/retry/fallback/cost/capacity impact được xem xét.

## Tests và docs

- [ ] Test mới chứng minh failure trước/fix sau khi phù hợp.
- [ ] Assertions kiểm tra hành vi, gồm negative/regression path.
- [ ] Không tạo flaky/shared-state/test-data thật.
- [ ] RTM/changelog/design/runbook/user docs cập nhật.

## Review outcome

| Finding | Severity | Action | Owner | Status |
| :--- | :--- | :--- | :--- | :--- |
| {{FINDING}} | Critical / High / Medium / Low | {{ACTION}} | {{OWNER}} | Open |
