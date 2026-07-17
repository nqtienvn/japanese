---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-DESIGN-REVIEW-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Architecture & Design Review

## Checklist

- [ ] Scope, driver và linked requirement đúng baseline.
- [ ] Context/container/component/dependency boundary rõ, không over-engineer.
- [ ] Data ownership, schema, transaction, migration và retention rõ.
- [ ] ERD có cardinality/optionality/key/constraint; data dictionary khớp SRS/API/test.
- [ ] API/event contract, versioning, idempotency, timeout/retry/fallback rõ.
- [ ] API request/response/error/permission/status/side effect cụ thể và link requirement/test.
- [ ] State, concurrency, error/recovery và reversal đã xét.
- [ ] Auth/authz, threat, privacy, secret, audit và abuse controls đủ.
- [ ] Security Profile, regulatory applicability, OWASP/project threats, scan/pentest applicability và severity gate đã tailoring.
- [ ] Không còn Critical security risk mở; High có treatment/owner/expiry hoặc gate Fail.
- [ ] Module responsibility/contract/dependency/blast radius rõ; “không ảnh hưởng module khác” được thay bằng impact/regression evidence.
- [ ] UI applicable có design system, component/state, responsive/accessibility và prototype evidence cho journey High/Critical; tool N/A có rationale.
- [ ] Performance/capacity/reliability/observability/cost có target/tactic.
- [ ] Testability, rollout, compatibility và rollback khả thi.
- [ ] ADR ghi quyết định khó đảo ngược; RTM cập nhật.

## Findings

| Finding ID | Severity | Design/requirement | Finding | Required action | Owner | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| DR-001 | Critical / High / Medium / Low | DES/ADR/REQ | {{FINDING}} | {{ACTION}} | {{OWNER}} | Open |

## Gate decision

| Reviewer | Decision | Date | Conditions/accepted risk |
| :--- | :--- | :--- | :--- |
| Tech Lead | Pending / Pass / Conditional / Fail | {{DATE}} | {{CONDITION}} |
| QA/Security/Ops | Pending / Pass / Conditional / Fail | {{DATE}} | {{CONDITION}} |
