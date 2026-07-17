# Risk, Assumption, Issue & Dependency Register

## Thang điểm

Probability và Impact: 1–5; Exposure = P × I. `15–25 Critical`, `10–14 High`, `5–9 Medium`, `1–4 Low`.

| ID | Type | Mô tả | P | I | Exposure | Trigger | Response/mitigation | Owner | Due | Status |
| :--- | :--- | :--- | :---: | :---: | :---: | :--- | :--- | :--- | :--- | :--- |
| RISK-001 | Risk | {{RISK}} | 3 | 4 | 12 | {{TRIGGER}} | {{MITIGATION}} | {{OWNER}} | {{DATE}} | Open |
| ASM-001 | Assumption | {{ASSUMPTION}} | — | — | — | Validation fails | {{ACTION}} | {{OWNER}} | {{DATE}} | Unverified |
| ISS-001 | Issue | {{ISSUE}} | — | 4 | — | Already occurred | {{RESOLUTION}} | {{OWNER}} | {{DATE}} | Open |
| DEP-001 | Dependency | {{DEPENDENCY}} | 3 | 3 | 9 | Missed commitment | {{FALLBACK}} | {{OWNER}} | {{DATE}} | At Risk |

## Review rule

- Critical/High: review mỗi delivery update; không qua gate nếu không có owner/response.
- Accepted risk phải có approver, expiry/review date và residual impact.
- Risk đã đóng vẫn giữ lịch sử và evidence.
