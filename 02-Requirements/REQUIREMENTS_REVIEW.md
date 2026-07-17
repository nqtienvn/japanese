# Requirements Review & Sign-off

## Quality checklist

- [ ] Mỗi requirement cần thiết, đơn nghĩa, khả thi, testable và truy vết được.
- [ ] Mỗi requirement atomic: một subject, một obligation; conjunction đã tách hoặc có rationale.
- [ ] `PHẢI/SHALL`, `NÊN/SHOULD`, `CÓ THỂ/MAY` dùng đúng semantics; không dùng “sẽ/will” làm obligation.
- [ ] Không có từ định tính như nhanh/đẹp/mượt/thân thiện/tối ưu nếu thiếu metric và measurement context.
- [ ] Document version history, glossary và bốn nhóm external interfaces đầy đủ hoặc có N/A rationale.
- [ ] Không trộn solution tùy ý vào nhu cầu; constraint kỹ thuật có nguồn/lý do.
- [ ] Actor, trigger, input/output, business rule và state transition rõ.
- [ ] Happy/alternate/error/retry/cancel/reversal path đã xét.
- [ ] Permission, privacy, audit, retention và abuse case đã xét.
- [ ] NFR có target, percentile/thời gian/môi trường và cách đo.
- [ ] Priority/release boundary/out-of-scope và dependency rõ.
- [ ] Mâu thuẫn với discovery/code hiện tại đã được quyết định.
- [ ] Audit cross-artifact kiểm tra terminology và requirement ID trong UI/SAD/API/data/test.

## Review findings

| Finding ID | Severity | Requirement | Finding | Action | Owner | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| RF-001 | High | FR-XXX | {{FINDING}} | {{ACTION}} | {{OWNER}} | Open |

## Sign-off

| Role | Decision | Date | Conditions |
| :--- | :--- | :--- | :--- |
| Client Product Owner | Pending / Approved / Rejected | {{DATE}} | {{CONDITIONS}} |
| Vendor BA/Delivery Lead | Pending / Approved / Rejected | {{DATE}} | {{CONDITIONS}} |
| Tech/QA/Security reviewers | Pending / Approved / Rejected | {{DATE}} | {{CONDITIONS}} |
