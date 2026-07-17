# Document Quality Standard & Acceptance Rules

## 1. Mục đích và phạm vi

Chuẩn này áp dụng cho mọi baseline, release và handover của dự án. Tài liệu chỉ được coi là hoàn tất khi **đủ độ phủ, không mơ hồ, đo/kiểm thử được, nhất quán, truy vết được và đã vượt qua thử nghiệm thực địa**. File tồn tại nhưng chỉ chứa tiêu đề, placeholder, ví dụ hoặc tuyên bố không có evidence được coi là `Incomplete`.

## 2. Bốn nhóm tài liệu cốt lõi

| Nhóm | Artifact bắt buộc | Nội dung tối thiểu | Điều kiện Pass |
| :--- | :--- | :--- | :--- |
| Nghiệp vụ | `02-Requirements/BRD.md`, `SRS.md`, `FEATURE_CATALOG.md`, `USE_CASE_SPECIFICATION.md` | As-is/to-be workflow; actor; feature list; business rules; BR/FR/NFR; use case happy/alternate/error paths; acceptance | Mỗi feature trong release có ID, owner, use case/requirement và acceptance testable; workflow không có bước/nhánh quan trọng chưa định nghĩa |
| Kiến trúc | `03-Architecture-Design/SOFTWARE_ARCHITECTURE.md`, `DATA_MODEL_ERD.md`, `API_SPECIFICATION.md`, EDS/ADR | System context/container/component; ERD và data dictionary; API/event contracts; state/sequence; security/NFR/operations | Mỗi requirement Must/Critical có design link; API/data/state/failure/permission/compatibility rõ; review không còn finding High/Critical vô chủ |
| Kiểm thử | `06-Testing/TEST_STRATEGY_AND_PLAN.md`, `TEST_CASE_TEMPLATE.md`, test inventory/evidence và `TEST_REPORT.md` | Test case theo requirement/feature; happy, invalid, empty, permission, dependency failure, retry/concurrency; UAT và NFR | Mỗi requirement in-scope có test ID/evidence hoặc exception được duyệt; blocking defect không vượt ngưỡng; environment/build/result rõ |
| Vận hành | `04-Implementation/ENVIRONMENT_SETUP.md`, `08-Document-References/DEPLOYMENT_GUIDE.md`, `USER_GUIDE.md`, `OPERATIONS_RUNBOOK.md` | Cài runtime; cấu hình; secret references; deploy/migrate/smoke/rollback; hướng dẫn persona; monitor/backup/restore/troubleshoot | Developer/Ops mới thực hiện dry run không cần hỏi tác giả để vượt qua bước blocking; Client có thể hoàn thành journey trong user guide |

Thiếu bất kỳ nhóm cốt lõi nào là `Fail`. Nếu một artifact không áp dụng, phải có `N/A rationale`, approver và artifact thay thế cung cấp cùng evidence.

## 3. Quy tắc chất lượng nội dung

Trong template này, kiểm chứng “SMART cho tài liệu” gồm sáu thuộc tính bắt buộc:

| Mã | Thuộc tính | Rule | Ví dụ Fail | Ví dụ Pass |
| :--- | :--- | :--- | :--- | :--- |
| `S` | Specific / Unambiguous | Một người đọc độc lập chỉ có một cách hiểu hợp lý; actor, trigger, input, state và outcome rõ | “Hệ thống xử lý đơn nhanh” | “Sau khi nhận request hợp lệ, API tạo đơn và trả `201` trong p95 ≤ 2 giây ở 100 request/giây” |
| `M` | Measurable | Mục tiêu có đơn vị, ngưỡng, percentile/window, môi trường và cách đo | “Hệ thống ổn định” | “Availability tháng ≥ 99,9%, loại trừ maintenance window đã duyệt; đo bằng uptime monitor” |
| `A` | Achievable / Feasible | Có owner, dependency, constraint và bằng chứng khả thi; quyết định khó có spike/ADR | “Đáp ứng vô hạn người dùng” | “Hỗ trợ 5.000 concurrent sessions trong môi trường production-like theo test plan PERF-01” |
| `R` | Relevant / Consistent | Liên kết objective/business value; dùng thuật ngữ, role, state và rule thống nhất với glossary và artifact khác | “Customer”, “Buyer”, “User” cùng chỉ một vai trò nhưng không định nghĩa | Dùng duy nhất `Customer`; alias bị cấm hoặc được định nghĩa trong glossary |
| `T` | Testable | Có thể biến thành test với precondition, action/input và observable expected result | “Giao diện đẹp, dễ dùng” | “≥ 90% người thử hoàn thành checkout trong ≤ 3 phút, không cần trợ giúp, trên viewport đã định nghĩa” |
| `TR` | Traceable | Có ID duy nhất và liên kết xuyên suốt requirement → design/UI/API/data → work item/code → test → release/handover | `REQ-01` chỉ xuất hiện trong SRS | `FR-PAY-001` xuất hiện trong SRS, EDS/API, WI, code evidence, `TC-PAY-001` và RTM |

Một requirement/feature lấy mẫu phải đạt cả sáu thuộc tính. Không tính điểm trung bình để che một tiêu chí Fail.

### Atomicity và singularity

- Mỗi requirement normative chỉ chứa **một obligation** có thể verify độc lập.
- Không nối hai hành vi độc lập bằng `và`, `hoặc`, dấu chấm phẩy hoặc danh sách ngầm. Tách thành hai ID và liên kết dependency nếu cần.
- `và` chỉ được dùng bên trong một outcome không thể tách mà không làm mất nghĩa; reviewer phải ghi rationale.
- Không trộn requirement, rationale, design solution và test procedure trong cùng một câu normative.

Ví dụ Fail:

> `FR-001`: Hệ thống PHẢI tạo tài khoản và gửi email và tự động đăng nhập người dùng.

Ví dụ Pass:

> `FR-001`: Khi dữ liệu đăng ký hợp lệ, hệ thống PHẢI tạo đúng một tài khoản ở trạng thái `PendingVerification`.
>
> `FR-002`: Sau khi `FR-001` thành công, hệ thống PHẢI gửi một email xác minh trong vòng 60 giây.
>
> `FR-003`: Hệ thống KHÔNG ĐƯỢC tạo phiên đăng nhập trước khi email được xác minh.

### Imperative keywords

| Keyword | Ý nghĩa | Rule sử dụng |
| :--- | :--- | :--- |
| `SHALL / PHẢI` | Mandatory | Dùng cho obligation bắt buộc và có pass/fail acceptance |
| `SHALL NOT / KHÔNG ĐƯỢC` | Mandatory prohibition | Dùng cho hành vi bị cấm, security/privacy/business invariant |
| `SHOULD / NÊN` | Recommendation | Phải ghi lý do và hậu quả khi không thực hiện; không dùng làm release-blocking requirement |
| `SHOULD NOT / KHÔNG NÊN` | Discouraged | Phải ghi trường hợp ngoại lệ được chấp nhận |
| `MAY / CÓ THỂ` | Permission/optional | Không tạo obligation; phải nêu ai được quyền chọn và điều kiện áp dụng |

Không dùng `will`, `sẽ`, `có khả năng`, `dự kiến` như từ khóa normative. Một câu `SHALL/PHẢI` phải có đúng một subject chịu trách nhiệm và một obligation.

## 4. Quy tắc viết requirement và specification

1. Dùng động từ chuẩn:
   - `shall`/`phải` cho yêu cầu bắt buộc;
   - `should`/`nên` cho mục tiêu không blocking;
   - tránh `có thể`, `thường`, `hợp lý`, `nhanh`, `thân thiện`, `tối ưu`, `đầy đủ`, `an toàn` nếu không có định nghĩa đo được.
2. Mỗi BR/FR/NFR/UC/feature/API/test có ID duy nhất; không tái sử dụng ID đã deprecated.
3. Mỗi functional requirement phải ghi actor, trigger, precondition, input validation, outcome/side effect, permission, error/recovery và acceptance.
4. Mỗi NFR phải ghi target, load/window/percentile, environment, measurement tool và pass/fail threshold.
5. Mỗi API phải ghi method/path, auth/permission, request/response schema, status/error codes, idempotency, rate limit, timeout/retry, compatibility và linked requirement/test.
6. Mỗi entity/field quan trọng phải ghi key/constraint, relationship/cardinality, owner, classification, retention và migration impact.
7. Dùng `GLOSSARY_AND_REFERENCES.md` làm nguồn thuật ngữ chuẩn. Tên role, entity, trạng thái và error code phải giống nhau trong BRD/SRS/SAD/API/UI/test/runbook.
8. Diagram phải có mô tả chữ hoặc bảng hỗ trợ; không để logic quan trọng chỉ nằm trong hình ảnh khó tìm kiếm/version-control.
9. Ví dụ, placeholder và nội dung hướng dẫn phải được thay hoặc xóa trước baseline/release sign-off.

## 4A. Structural controls cho BRD/SRS

Mọi BRD/SRS baseline phải có:

1. Document ID, owner, approver, version/status và version history gồm ngày, người thay đổi, lý do, sections/requirements affected.
2. Scope, objective, stakeholder, assumption/dependency/constraint và reference.
3. Glossary/acronym với canonical term, definition, aliases bị cấm và owner/source.
4. As-is/to-be workflow, feature catalog và detailed use cases.
5. Functional, non-functional, data, security/privacy và operational requirements.
6. External Interfaces tách riêng:
   - User Interface: persona/screen/navigation/input/error/accessibility/design-system reference;
   - Hardware Interface: device/protocol/driver/capacity/failure behavior;
   - Software Interface: provider/consumer/API/version/schema/auth/quota/SLA/fallback;
   - Communications Interface: protocol/port/TLS/certificate/network zone/timeout/retry.
7. Acceptance, traceability, open issues và sign-off.

Nếu một loại interface không áp dụng, ghi `N/A` và rationale; không xóa mục.

## 5. Kiểm chứng 2–3 tính năng phức tạp

Mỗi requirements baseline và release candidate phải audit 2–3 tính năng phức tạp bằng `06-Testing/DOCUMENT_QUALITY_AUDIT.md`.

### Cách chọn mẫu chống cherry-pick

1. Lập population từ các feature có `Complexity = High/Critical` hoặc chạm ít nhất hai miền: integration, payment, PII/security, state machine, concurrency, migration, scheduled/background processing.
2. Nếu population ≤ 3, kiểm tra tất cả.
3. Nếu population > 3, lấy ngẫu nhiên 3 feature và ghi timestamp/seed/cách chọn. Mẫu phải có ít nhất một feature cross-system hoặc data/security; nếu mẫu ngẫu nhiên không có, thay feature cuối bằng một feature thuộc nhóm đó và ghi lý do.
4. Không cho tác giả duy nhất của feature tự đánh giá và tự sign-off.

### Pass/fail từng feature

- `Unambiguous`: hai reviewer độc lập mô tả cùng actor/trigger/result/rule; không có interpretation conflict blocking.
- `Measurable`: mọi NFR/acceptance định lượng có target và measurement method.
- `Feasible`: dependency/constraint/owner và design response đã biết; không còn unknown Critical.
- `Consistent`: terminology, field, state, permission, error code khớp giữa BRD/SRS/SAD/API/UI/test.
- `Testable`: Tester viết được happy, alternate, invalid, empty, permission và system-failure cases mà không cần BA làm rõ blocking.
- `Traceable`: RTM đi đủ hai chiều; không có link “đã làm” nhưng thiếu path/symbol/test/result cụ thể.

Chỉ cần một tiêu chí Fail là feature audit Fail và gate liên quan phải `Fail` hoặc `Conditional Pass` có owner/hạn/approver.

## 6. Thử nghiệm thực địa bắt buộc

### 6.1 New Developer Readiness Test

Đưa SAD, ERD, API Specs, environment setup và deployment guide cho một Developer/Ops chưa tham gia phần việc.

Nhiệm vụ tối thiểu:

1. Xác định system boundary, module và luồng critical.
2. Setup environment từ máy/repository sạch.
3. Build và chạy test/smoke được chỉ định.
4. Gọi một API hoặc hoàn thành một vertical slice demo bằng dữ liệu test.
5. Mô tả deployment, rollback và nơi tìm log/metric.

Pass mặc định: hoàn thành trong timebox đã thống nhất, không cần hỏi tác giả để giải quyết bước blocking, không dùng secret không được tài liệu hóa an toàn. Mọi câu hỏi phát sinh phải ghi vào field-test report và chuyển thành document finding.

### 6.2 Tester Derivation Test

Đưa BRD/SRS/feature/use case cho Tester chưa viết tài liệu đó. Tester phải tự tạo test inventory gồm:

- happy path;
- alternate path;
- invalid format/boundary;
- empty/null/missing input;
- permission/role;
- duplicate/double-submit/idempotency;
- network/dependency timeout và retry;
- concurrency/partial failure/recovery;
- audit/data side effects;
- linked NFR/security cases khi áp dụng.

Pass: không có blocking clarification với BA; mỗi case có requirement ID và expected result quan sát được. Câu hỏi cần làm rõ là finding của requirement, không được âm thầm giải thích ngoài tài liệu.

### 6.3 Technical Peer Review

Tối thiểu có BA/Product, Lead Developer/Architect và Lead QA; thêm Security/Ops khi feature chạm risk tương ứng. Review bắt buộc hỏi:

- Mất mạng hoặc dependency downtime giữa luồng thì sao?
- Bấm/gửi hai lần, retry hoặc event trùng thì sao?
- Input sai định dạng, quá dài, rỗng hoặc độc hại thì sao?
- Session/token hết hạn hoặc role đổi giữa luồng thì sao?
- Hai người sửa cùng lúc hoặc transaction chỉ thành công một phần thì sao?
- Timezone, clock, timeout, batch, scheduler hoặc callback đến muộn thì sao?
- Migration/rollback/compatibility với client/data cũ thì sao?
- Log/metric/audit nào chứng minh outcome và hỗ trợ chẩn đoán?

Finding High/Critical chưa đóng hoặc chưa được đúng owner chấp nhận sẽ chặn gate.

## 7. Evidence và sign-off

| Evidence | Bắt buộc ghi |
| :--- | :--- |
| Document coverage | Artifact/path, owner, version/status, phần còn thiếu/N/A rationale |
| Feature quality audit | Feature IDs, selection method/seed, sáu tiêu chí, finding/action/reviewer |
| Developer field test | Participant role, clean baseline, timebox, steps/result, blocking questions, evidence |
| Tester derivation | Feature/use case IDs, derived test IDs/categories, clarification count/findings |
| Peer review | Participants/roles, edge cases, findings/severity, decisions/actions |

Sign-off tối thiểu: BA/Product xác nhận nghiệp vụ, Tech Lead xác nhận kiến trúc/khả thi, QA Lead xác nhận testability/coverage, Client Product Owner xác nhận baseline/acceptance. Security/Ops sign-off khi phạm vi liên quan.

## 8. Enforcement theo gate

- Gate 02: BRD/SRS/Feature/Use Case đủ và vượt qua review SMART ở mức requirement.
- Gate 03: SAD/ERD/API Specs hoàn chỉnh, consistent và traceable; peer review thiết kế đạt.
- Gate 06: test coverage theo requirement; feature audit và Tester Derivation Test đạt.
- Gate 08: Deployment/User/Runbook đủ; New Developer Readiness Test và handover dry run đạt.
