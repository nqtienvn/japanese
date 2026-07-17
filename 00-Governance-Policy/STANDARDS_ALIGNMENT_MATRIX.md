# International Standards Alignment Matrix

## 1. Claim boundary

Bộ template này được thiết kế **tham chiếu và căn chỉnh (aligned with)** các chuẩn dưới đây. Nó không tự động tạo ra chứng nhận, không thay thế bản quyền nội dung tiêu chuẩn và không chứng minh một dự án cụ thể đã conform hoàn toàn. Mỗi dự án phải hoàn thành artifact, evidence, review và sign-off; tổ chức cần tự đánh giá hoặc thuê assessor khi cần tuyên bố conformity/certification chính thức.

## 2. Standards register

| Standard | Phiên bản tham chiếu | Phạm vi dùng trong template | Artifact/evidence chính | Trạng thái kiểm soát |
| :--- | :--- | :--- | :--- | :--- |
| ISO/IEC/IEEE 29148 | 2018, Edition 2 | Requirements engineering processes, information items, quality/attributes của requirement, lifecycle traceability | BRD, SRS, Feature Catalog, Use Case, RTM, requirement review, version/glossary/interface sections | Kiểm tra phiên bản trước mỗi dự án; ISO đã xác nhận bản 2018 trong 2024 nhưng đang có revision project |
| ISO/IEC/IEEE 29119-1 | 2022, Edition 2 | Khái niệm và từ vựng testing | Test Policy, Glossary, Test Strategy/Plan | Published |
| ISO/IEC/IEEE 29119-2 | 2021, Edition 2 | Test governance, management và implementation processes | Test Policy, Test Plan, entry/exit, monitoring/control, completion report | Published |
| ISO/IEC/IEEE 29119-3 | 2021, Edition 2 | Test documentation templates/outputs | Test Specification, Test Case, Test Status Report, Test Completion Report, Test RTM | Published |
| ISO/IEC/IEEE 29119-4 | 2021, Edition 2 | Test design techniques | Test Specification, technique/rationale, coverage design | Published |
| [ISO/IEC 27001](https://www.iso.org/standard/27001) | 2022, Edition 3 + amendment applicable | ISMS requirements/risk-management interface; không phải chứng nhận project tự động | Security Standard, risk/threat/tailoring/approval evidence | Verify organizational scope and current amendment |
| [ISO/IEC 27002](https://www.iso.org/standard/75652.html) | 2022, Edition 3 | Information-security control guidance được chọn theo risk | Security control mapping, design/test evidence | Guidance; tailor/SoA rationale |
| [OWASP Top 10](https://owasp.org/Top10/2025/0x00_2025-Introduction/) | 2025 | Web application risk awareness; không thay thế threat model | Threat Model, security requirements/tests | Verify edition before project baseline |
| [GDPR](https://eur-lex.europa.eu/eli/reg/2016/679/art_6/oj/eng) / [CCPA](https://cppa.ca.gov/faq) | Current applicable law/regulation | Chỉ áp dụng sau Regulatory Applicability Assessment | Data inventory, legal basis, rights, security/privacy evidence | Legal owner sign-off; not legal advice |

Legacy references:

- IEEE 830-1998 là chuẩn đã bị superseded; template dùng ISO/IEC/IEEE 29148 làm tham chiếu chính.
- IEEE 829-2008 là chuẩn đã bị superseded; template dùng ISO/IEC/IEEE 29119 series làm tham chiếu chính.

## 3. Requirements alignment

| Control ID | Rule áp dụng | Artifact | Evidence/owner |
| :--- | :--- | :--- | :--- |
| STD-REQ-001 | Mỗi requirement atomic, singular và có ID duy nhất | SRS/BRD/Requirement Item | BA review + RTM |
| STD-REQ-002 | Dùng `PHẢI/SHALL`, `NÊN/SHOULD`, `CÓ THỂ/MAY` đúng semantics | SRS/BRD/Use Case | Requirements lint/review |
| STD-REQ-003 | Requirement unambiguous, necessary, feasible, measurable, testable, consistent, traceable | Requirement Review/Quality Audit | BA + Tech + QA sign-off |
| STD-REQ-004 | Có source, rationale, priority, owner, risk, acceptance và trạng thái lifecycle | SRS/RTM | Baseline review |
| STD-REQ-005 | Có version history, glossary và external interface specification | BRD/SRS | Document coverage audit |
| STD-REQ-006 | Thay đổi baseline được impact analysis và giữ lịch sử | Change Request/Changelog/RTM | Client/Vendor approval |

## 4. Test documentation alignment

| Layer | Control ID | Artifact bắt buộc | Nội dung/evidence |
| :--- | :--- | :--- | :--- |
| Policy & planning | STD-TST-001 | Test Policy + Test Strategy/Plan | Scope/in-out, objectives, roles, process, risk matrix, environment/data, entry/exit, suspension/resumption |
| Design & implementation | STD-TST-002 | Test Specification + Test Case | Unique ID, test basis/condition, technique, precondition, input data tách biệt, steps, exact expected result, environment, automation/evidence |
| Monitoring & reporting | STD-TST-003 | Test Status Report + Test Completion Report | Total/planned/executed/passed/failed/blocked/skipped, defect/risk/trend, deviations, exit assessment, recommendation |
| Traceability | STD-TST-004 | Test Traceability Matrix | SRS/Requirement ID → Test Condition/Case ID → Execution Result → Defect/Bug ID → Retest/Release |

## 5. Tailoring record

Mỗi dự án ghi quyết định tailoring; không xóa control không áp dụng mà phải ghi lý do.

| Control/standard | Apply / Tailor / N/A | Lý do và replacement control | Risk | Approver | Review date |
| :--- | :--- | :--- | :--- | :--- | :--- |
| {{CONTROL}} | {{DECISION}} | {{RATIONALE}} | {{RISK}} | {{APPROVER}} | {{DATE}} |

### Security/privacy controls

| Control ID | Rule áp dụng | Artifact/evidence |
| :--- | :--- | :--- |
| `STD-SEC-001` | Chọn Security Profile và risk appetite; threat model trước Gate 03 | Project Profile, Security Standard, Threat Model |
| `STD-SEC-002` | Security requirement atomic, threat/control/test/residual-risk mapping | SRS, EDS, Test RTM |
| `STD-SEC-003` | Không còn Critical risk/vulnerability mở khi release; High acceptance time-bound đúng quyền | Test/Release Report, Risk Register |
| `STD-PRV-001` | GDPR/CCPA/law khác chỉ mandatory sau applicability assessment | SRS, Security Standard, legal sign-off |

## 6. Conformance review

| Review | Owner | Evidence | Decision |
| :--- | :--- | :--- | :--- |
| Requirements alignment | BA/Product + QA | Coverage/quality audit | Pass / Conditional / Fail |
| Test process/documentation alignment | QA Lead | Test artifact suite + RTM | Pass / Conditional / Fail |
| Project-level claim approval | Client/Vendor governance | Tailoring + residual gaps | “Aligned” / “Not yet aligned” |
