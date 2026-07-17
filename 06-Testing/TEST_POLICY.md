---
artifact_id: DOC-06-TESTING-TEST-POLICY-MD
phase: "06-Testing"
artifact_type: testing
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Test Policy — {{PROJECT_NAME}}

| Field | Value |
| :--- | :--- |
| Document ID | `{{PROJECT_CODE}}-TST-POL-001` |
| Version / status | {{VERSION}} / {{STATUS}} |
| Policy owner / approver | {{QA_LEAD}} / {{PROJECT_OWNER}} |
| Standards reference | ISO/IEC/IEEE 29119-1:2022, 29119-2:2021, 29119-3:2021, 29119-4:2021 — aligned, tailored per project |

## Version history

| Version | Date | Author | Reason/change | Approver |
| :--- | :--- | :--- | :--- | :--- |
| 0.1 | {{DATE}} | {{AUTHOR}} | Initial policy | Pending |

## Purpose and principles

- Testing cung cấp evidence độc lập/proportionate cho risk và acceptance; không chỉ chứng minh happy path.
- Không requirement in-scope nào được `Accepted` nếu thiếu test/evidence hoặc exception đúng quyền.
- Test được thiết kế từ requirement/risk và bắt đầu sớm; defect phải truy vết ngược đến test basis.
- Test result phải reproducible: build, environment, data, command, expected/actual và evidence rõ.
- Không dùng production secret/data thật trừ khi có phê duyệt, minimization và control phù hợp.

## Test governance and independence

| Activity | Responsible | Accountable/approval | Independence rule |
| :--- | :--- | :--- | :--- |
| Strategy/plan | QA Lead | Vendor Lead/Client PO | Reviewer không phải tác giả duy nhất |
| Unit/component | Developer | Tech Lead | Peer review |
| Integration/system/security | QA/Engineering/Security | QA/Security Lead | Risk-based independent review |
| UAT | Client representatives | Client Product Owner | Dùng acceptance baseline |
| Go/No-Go | QA recommends | Client/Vendor authority | Residual risk phải công khai |

## Test levels and types

Unit, component, integration, contract, system/E2E, regression, UAT; functional, security, performance, reliability/recovery, usability/accessibility, compatibility, migration/data quality và static review tùy risk.

### Coverage policy

- Coverage percentage là diagnostic signal, không thay thế requirement/risk coverage hoặc assertion quality.
- Line/branch/function threshold phải được tailoring theo layer, criticality, tool, generated-code exclusion và failure impact.
- Không áp `≥ 90%` cho toàn codebase nếu thiếu rationale; Critical business/security behavior luôn cần test evidence dù tỷ lệ tổng đã đạt.

### Security verification policy

- Chọn test/scan/review theo `SECURITY_AND_PRIVACY_STANDARD.md` và Security Profile.
- Penetration test cần scope, Rules of Engagement, authorization, environment, data handling và remediation owner.
- Không release với Critical security risk/vulnerability mở; High acceptance phải time-bound và đúng authority.

## Defect and evidence policy

- Unique `DEF-XXX`, severity theo impact thực tế, priority theo business decision.
- Critical/High defect hoặc data/operational risk chặn release trừ khi exception đúng quyền; Critical security risk/vulnerability không được chấp nhận để release, High phải time-bound theo Security Standard.
- Failed/blocked/skipped test giữ lịch sử; `Skipped` cần reason/approver.
- Evidence không chứa secret/PII không cần thiết và có retention/owner.

## Tailoring

| Control/test type | Apply / Tailor / N/A | Rationale/replacement | Risk | Approver |
| :--- | :--- | :--- | :--- | :--- |
| {{CONTROL}} | {{DECISION}} | {{RATIONALE}} | {{RISK}} | {{APPROVER}} |
