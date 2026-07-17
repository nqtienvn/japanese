# Nine phase gates

## Mục lục

1. Quy tắc chung
2. Gate 00–08
3. Reopen gate

## 1. Quy tắc chung

Mỗi gate cần `Pass`, `Conditional Pass` có owner/hạn, hoặc `Fail`. File tồn tại không phải bằng chứng đủ. Critical/High risk chưa có owner không được auto-pass.

## 2. Gate 00–08

### Gate 00 — Governance ready

- Charter, sponsor, owner, approver và escalation rõ.
- Autonomy/approval boundary rõ.
- Security, privacy, engineering policy có owner.
- Security Profile, risk appetite, regulatory applicability và security release rule rõ.
- Bank Security Reference Baseline, proprietary-code claim boundary và portability rule rõ.
- Human-assistance trigger/protocol rõ; AI không offload vì khó hoặc lâu.
- Definition of Ready/Done và change control được chọn.
- Standards alignment/tailoring và document quality controls có owner; không dùng claim chứng nhận sai.

### Gate 01 — Problem and plan baseline

- Discovery coverage đạt chuẩn; contradiction trọng yếu đã xử lý.
- Problem, users, outcomes, metrics, scope/out-of-scope rõ.
- Roadmap, dependency, budget/time constraint và risk register có owner.
- Baseline được approve hoặc quyền quyết định đã delegated.

### Gate 02 — Requirements baseline

- BR/FR/NFR/UC/US có ID, priority, source và acceptance.
- Workflow chính, edge case, error path, permission và data rule rõ.
- NFR có target/cách đo; RTM không có requirement mồ côi.
- Scope release đầu tiên testable và không mâu thuẫn.
- BRD/SRS/Feature Catalog/Use Case đủ workflow và structural controls: version history, glossary, UI/Hardware/Software/Communications interfaces.
- Requirement atomic, imperative keyword đúng, unambiguous, measurable, feasible, consistent, testable và traceable.
- Security/privacy requirement map tới profile/data/threat/acceptance; UI/tool applicability có N/A/tailoring rationale.
- SRS không chứa architecture/database/API design thay cho requirement; design constraint có source/rationale.

### Gate 03 — Design ready

- C4/context/container/component phù hợp quy mô.
- ADR ghi trade-off, data/API/UX/state/integration rõ.
- Threat model, privacy, capacity, observability và failure handling được xem xét.
- Security Profile control mapping, regulatory applicability và Critical/High risk treatment có review evidence.
- Security Adoption Record đánh giá đủ snapshot component; stack ngoài Java có cross-language responsibility mapping.
- Với UI applicable, design system/responsive/accessibility và prototype evidence cho journey High/Critical rõ; tool không bị khóa cứng nếu thiếu rationale.
- Thiết kế ánh xạ đủ requirement và có review evidence.
- SAD, ERD/data dictionary và API/event specification có version, exact contracts/errors/permissions/compatibility và test links.

### Gate 04 — Implementation ready

- Work item theo vertical slice có dependency, acceptance, test plan.
- Environment, migration, compatibility, feature flag, release và rollback rõ.
- Critical unknown đã spike/resolve; estimate/sequence khả thi.
- Module contract/dependency/blast radius, compatibility và regression boundary rõ; không dùng “không ảnh hưởng module khác” như giả định.
- External/manual/approval dependency có owner và assistance plan nhỏ nhất.
- Không có work item thiếu requirement/design link.

### Gate 05 — Build complete

- In-scope code/config hoàn tất và review.
- Build/lint/static analysis/unit test đạt target.
- Secret không nằm trong source; error/log/observability được triển khai.
- Security scan/control theo profile đạt severity gate; database/input/trust-boundary controls có code evidence.
- Security component được adopt/refactor phải build trong stack đích; known snapshot finding đã được xử lý hoặc reject có rationale.
- Tech debt và known limitation được ghi; RTM có code evidence.

### Gate 06 — Quality accepted

- Integration/E2E/regression và risk-based security/performance test đạt.
- Defect severity vượt ngưỡng không còn mở hoặc được chấp nhận.
- UAT/acceptance có evidence; migration/rollback/smoke được verify phù hợp.
- Test report nêu coverage, môi trường, giới hạn và residual risk.
- Code coverage được tailoring theo risk/layer/tool/exclusion; không dùng một tỷ lệ tổng để thay thế requirement/risk coverage.
- Security verification theo profile đạt; không còn Critical security risk/vulnerability mở, High acceptance đúng owner/expiry.
- Security Verification Matrix có passing evidence cho mọi `SEC-BNK` Must applicable và cross-language equivalence contract.
- Ba tầng test documentation đủ: Policy/Plan; Specification/Test Cases; Status/Completion/Traceability.
- Test case có unique ID, input data tách riêng và exact expected result; Test RTM nối SRS → TC → result → defect → retest.
- Audit 2–3 feature phức tạp và Tester Derivation Test đạt; blocking clarification chưa xử lý làm gate Fail.

### Gate 07 — Release/report complete

- Release notes, status, deviation, incident và KPI được cập nhật.
- Release artifact/version có thể nhận diện, reproducible trong khả năng.
- Operational readiness và rollback owner rõ.
- Final report phản ánh đúng delivered vs planned.
- Security Profile, scan/pentest scope, exclusions và residual-risk decision được phản ánh đúng.

### Gate 08 — Handover accepted

- Document index, glossary/reference, user guide và runbook hoàn tất.
- Setup, operate, monitor, backup/restore, troubleshoot, rollback rõ.
- Ownership, access/secret transfer needs, support/SLA và residual risk rõ.
- Người nhận có thể tiếp tục dự án mà không phụ thuộc vào ngữ cảnh chat.
- Deployment Guide/User Guide/Runbook đủ config, deploy, migrate, smoke, rollback và troubleshooting.
- New Developer/Ops Readiness Test từ clean baseline đạt mà không cần hỏi tác giả ở bước blocking.

## 3. Reopen gate

Gate 02, 03, 06 và 08 SHALL NOT be marked Passed from a `PROJECT_STATE.md` status edit alone. The reviewer must verify the required artifact set, concrete evidence paths, traceability, sign-off/approver and gate-specific conditions. A stale, placeholder or empty evidence cell is a gate failure.

Reopen gate khi requirement/scope thay đổi, test phát hiện giả định sai, design không khả thi, production incident lộ gap hoặc handover thiếu thông tin. Ghi lý do, impact downstream và artifact cần tái xác minh; không xóa evidence cũ.
