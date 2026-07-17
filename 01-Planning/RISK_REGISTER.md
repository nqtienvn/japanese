---
artifact_id: DOC-01-PLANNING-RISK-REGISTER-MD
phase: "01-Planning"
artifact_type: planning
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Risk, Assumption, Issue & Dependency Register

## Thang điểm

Probability và Impact: 1–5; Exposure = P × I. `15–25 Critical`, `10–14 High`, `5–9 Medium`, `1–4 Low`.

| ID | Type | Mô tả | P | I | Exposure | Trigger | Response/mitigation | Owner | Due | Status |
| :--- | :--- | :--- | :---: | :---: | :---: | :--- | :--- | :--- | :--- | :--- |
| RISK-001 | Risk | {{RISK}} | 3 | 4 | 12 | {{TRIGGER}} | {{MITIGATION}} | {{OWNER}} | {{DATE}} | Open |
| ASM-001 | Assumption | {{ASSUMPTION}} | — | — | — | Validation fails | {{ACTION}} | {{OWNER}} | {{DATE}} | Unverified |
| ISS-001 | Issue | {{ISSUE}} | — | 4 | — | Already occurred | {{RESOLUTION}} | {{OWNER}} | {{DATE}} | Open |
| DEP-001 | Dependency | {{DEPENDENCY}} | 3 | 3 | 9 | Missed commitment | {{FALLBACK}} | {{OWNER}} | {{DATE}} | At Risk |
| RISK-SEC-REF-001 | Risk | Source legacy chứa committed secret và weak PBE config | 4 | 5 | 20 | Raw source được copy/publish | Không copy value; sanitize snapshot; owner rotate nếu còn hiệu lực | Security Owner | 2026-07-17 | Mitigated in template |
| RISK-SEC-REF-011 | Issue | Cả hai source không có test; starter fail compile; legacy thiếu private dependencies | — | 5 | — | Project coi snapshot là production-ready | Quarantine; bắt buộc clean build và Security Verification Matrix tại adoption | Project Tech/Security Owner | Per project | Open per adoption |
| RISK-SEC-REF-013 | Risk | Dependency/framework baseline cũ hoặc unsupported | 4 | 4 | 16 | SCA/support check fail | Resolve current supported stack per project; compatibility test trước upgrade | Project Tech Lead | Before Gate 05 | Open per adoption |

## Review rule

- Critical/High: review mỗi delivery update; không qua gate nếu không có owner/response.
- Accepted risk phải có approver, expiry/review date và residual impact.
- Risk đã đóng vẫn giữ lịch sử và evidence.
