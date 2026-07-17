# Hướng dẫn sử dụng AI Project Lifecycle Template

## 1. Nguyên tắc để đạt hiệu quả cao nhất

Template hoạt động tốt nhất khi:

1. Toàn bộ folder được đặt trong cùng repository với source code.
2. AI được mở tại đúng root repository để đọc `AGENTS.md`, skill và 09 phase.
3. `PROJECT_PROFILE.md`, `PROJECT_STATE.md`, Discovery Log và RTM luôn là nguồn sự thật thay cho lịch sử chat.
4. Client trả lời theo evidence và ví dụ thật; phần chưa biết được ghi `TBD/Unknown` kèm owner/hạn.
5. Baseline được duyệt trước khi AI tự động triển khai toàn bộ.
6. Thay đổi sau baseline đi qua impact analysis/change request.
7. Không phê duyệt gate chỉ vì “trông có vẻ xong”; yêu cầu đường dẫn, lệnh test và kết quả.
8. Chọn Security Profile theo dữ liệu/exposure/risk; không dùng “bảo mật mạnh nhất” thay cho control và test cụ thể.
9. AI không chuyển việc vì khó/lâu; khi cần người hỗ trợ phải đưa assistance request có evidence và thao tác nhỏ nhất.

## 2. Quy trình tối ưu cho dự án mới — GREENFIELD

### Bước 1 — Tạo repository

- Copy toàn bộ template, gồm thư mục ẩn `.agents`.
- Không chỉ copy 09 phase rồi bỏ `AGENTS.md` hoặc skill.
- Điền tối thiểu `PROJECT_NAME`, `PROJECT_CODE`, Client owner và ý tưởng trong `PROJECT_PROFILE.md` hoặc `MASTER_PROMPT.md`.

### Bước 2 — Khởi động AI

Gửi:

```text
Đọc và thực thi toàn bộ MASTER_PROMPT.md trong repository này.
PROJECT_MODE = GREENFIELD.
Ý tưởng ban đầu của tôi: [mô tả 1–5 câu].
```

AI phải bắt đầu bằng 5–10 câu discovery, không viết code ngay.

### Bước 3 — Trả lời discovery hiệu quả

- Trả lời theo số thứ tự.
- Cung cấp ví dụ về lần gần nhất vấn đề xảy ra.
- Dùng số liệu nếu có: user, volume, latency, chi phí, deadline, tỷ lệ lỗi.
- Tách `bắt buộc`, `mong muốn`, `có thể làm sau`.
- Nêu người có quyền quyết định và người sẽ nghiệm thu.
- Với câu chưa biết, trả lời `TBD — owner — cần trước ngày`.

AI sẽ hỏi theo đợt và ghi vào `01-Planning/DISCOVERY_LOG.md`; không cần cố trả lời hàng trăm câu trong một lần.

### Bước 4 — Duyệt baseline

Trước khi code, review tối thiểu:

- Charter/SOW/RACI.
- Problem/outcome/scope/out-of-scope.
- BRD/SRS/Feature/Use Case.
- NFR/security/privacy/acceptance.
- Security Profile, regulatory applicability và security release gate.
- Roadmap/dependencies/risks.
- Autonomy mode và approval-only actions.

Chỉ duyệt khi câu chữ atomic, testable và có ID/owner. Nếu chưa chắc, cho `Conditional approval` với điều kiện/hạn rõ.

### Bước 5 — Cho AI tự động delivery

Khuyến nghị dùng `AUTONOMY_MODE = STANDARD`:

- AI tự quyết thay đổi local, reversible và theo convention.
- Client chỉ xử lý scope, business behavior, credential/access, cost, production và risk acceptance.
- Khi AI yêu cầu hỗ trợ, Client chỉ thực hiện decision/access/manual/sign-off nhỏ nhất; AI verify kết quả và tự tiếp tục.

Yêu cầu AI cập nhật status theo phase/gate/evidence và tự đi tiếp khi gate pass.

### Bước 6 — Review theo vertical slice

Review outcome chạy được thay vì chờ toàn dự án:

- requirement IDs;
- demo hoặc API/UI behavior;
- test/evidence;
- known gaps;
- impact tới release/operations.

Feedback mới ngoài baseline phải thành change request, không trộn vào work item đang chạy.

### Bước 7 — Nghiệm thu và bàn giao

Yêu cầu UAT, Test Completion Report, Release Report, Deployment/User Guide, Runbook và Handover Checklist. Chạy strict validator; thực hiện Developer newcomer và Tester derivation tests khi có nhân sự độc lập.

## 3. Quy trình tối ưu cho dự án đang dở — BROWNFIELD

### Bước 1 — Bảo vệ hiện trạng

- Commit/backup hoặc ít nhất ghi branch/HEAD và `git status` trước khi tích hợp template.
- Không xóa build/test/config cũ chỉ để khớp template.
- Copy template bằng Brownfield mode để không overwrite file hiện có.
- Nếu đã có `AGENTS.md`, giữ file cũ và merge rule từ `AGENTS.ai-project-delivery.md`.

### Bước 2 — Khởi động audit

Gửi:

```text
Đọc và thực thi toàn bộ MASTER_PROMPT.md.
PROJECT_MODE = BROWNFIELD.
Mục tiêu tiếp quản hiện tại: [mục tiêu].
Hãy audit read-only trước, chưa sửa code hoặc chạy migration.
```

AI phải đọc code/config/test/docs/git trước khi hỏi. Không chấp nhận một kế hoạch chỉ dựa trên README cũ.

### Bước 3 — Yêu cầu baseline tiếp quản

AI phải cung cấp:

- branch/HEAD/worktree state;
- stack/manifests/entry points/modules;
- as-is architecture, API/UI/data/integrations/auth;
- build/test/CI status thực tế;
- TODO/mock/disabled test/feature flags;
- tài liệu mâu thuẫn code;
- security/secret/migration/operational risks;
- gap analysis và gate đầu tiên chưa đạt.

Client chỉ cần trả lời target behavior, priority, deadline, acceptance và quyết định lịch sử không thể suy ra.

### Bước 4 — Chốt `as-is + target delta`

Không rewrite toàn bộ theo “kiến trúc đẹp hơn” nếu chưa có business need. Chốt:

- hành vi phải giữ;
- hành vi cần thay đổi;
- compatibility/data/client cũ cần bảo vệ;
- characterization/regression tests cần bổ sung;
- feature/scope ưu tiên;
- tech debt nào blocking, debt nào đưa backlog.

### Bước 5 — Tiếp tục từ gate đầu tiên chưa đạt

AI cập nhật artifact phase trước nếu chúng thiếu, nhưng không yêu cầu làm lại tài liệu đã có evidence tốt. Mọi refactor/migration phải có regression, compatibility và rollback plan.

### Bước 6 — Bàn giao phân biệt rõ

Final report phải tách:

- phần đã tồn tại và đã được verify;
- phần AI/vendor mới thực hiện;
- phần chỉ được suy luận hoặc chưa thể verify;
- known defects/tech debt/residual risks;
- access/data/operations tasks Client còn phải hoàn thành.

## 4. Chế độ CHANGE cho feature hoặc defect

Gửi:

```text
Đọc và thực thi MASTER_PROMPT.md.
PROJECT_MODE = CHANGE.
Target delta: [feature/defect].
Không thay đổi ngoài phạm vi nếu không có impact analysis và approval.
```

AI phải trace từ requirement bị tác động tới design/code/test/release, chạy regression phù hợp và cập nhật changelog/runbook.

## 5. Cách phối hợp với AI

### Client nên làm

- Cung cấp domain context, priority, deadline, acceptance và quyền quyết định.
- Trả lời câu hỏi theo ví dụ/số liệu.
- Cấp access/test data qua kênh an toàn.
- Review baseline, demo, UAT, release và handover đúng lịch.
- Chấp nhận hoặc từ chối residual risk bằng văn bản.

### Để AI/Vendor tự làm

- Repository/code/config analysis.
- Requirements/design documentation và traceability.
- Implementation, local build/test/refactor trong scope.
- Test design/execution, reports, release/rollback/runbook.
- Cập nhật project state, risk, changelog và technical debt.

### Luôn cần approval riêng

- Production/shared-environment changes.
- Dữ liệu thật hoặc destructive migration.
- Chi phí/billing/vendor purchase.
- External messages/publishing.
- Scope/outcome/SLA/security reductions.
- High/Critical risk acceptance.

### Khi AI được nhờ con người

AI chỉ được hỏi khi cần quyết định material, access/credential, thao tác thủ công, approval/sign-off hoặc cùng blocker sau ít nhất ba phương án khác nhau không có evidence mới. Yêu cầu phải nêu evidence, attempts, impact, thao tác nhỏ nhất, output/reference cần trả lại và phần AI vẫn tiếp tục được. Không gửi secret value qua chat.

## 6. Nhịp vận hành khuyến nghị

| Thời điểm | Client xem gì | AI cập nhật gì |
| :--- | :--- | :--- |
| Mỗi discovery round | Answer/decision/contradiction | Discovery Log |
| Baseline review | Problem/scope/requirements/acceptance | Charter, BRD/SRS, RTM, Plan/Risk |
| Mỗi vertical slice | Demo + test evidence + gaps | WI, code, tests, changelog, RTM |
| Gate review | Pass/Conditional/Fail evidence | Project State, findings, next gate |
| Release candidate | UAT/security/NFR/rollback | Test/Release Reports |
| Handover | Operability/ownership/residual risks | Index, Deployment, User Guide, Runbook, Checklist |

## 7. Những lỗi sử dụng cần tránh

- Chỉ copy các thư mục phase mà bỏ `.agents` và `AGENTS.md`.
- Yêu cầu AI “làm luôn” rồi bỏ qua discovery/baseline.
- Trả lời bằng “nhanh, đẹp, bảo mật tốt” nhưng không có metric.
- Để chat trở thành nguồn sự thật duy nhất mà không cập nhật repository.
- Thay đổi scope bằng trao đổi miệng, không impact analysis.
- Đưa secret/data thật vào Markdown hoặc prompt.
- Tin báo cáo “test pass” không có build/environment/command/result.
- Tuyên bố ISO certified chỉ vì dùng template.
- Bàn giao code mà thiếu deployment, rollback, operations và ownership.

## 8. Lệnh kiểm tra

Trong quá trình làm:

```powershell
powershell -ExecutionPolicy Bypass -File .\.agents\skills\ai-project-delivery\scripts\validate_delivery.ps1
```

Trước bàn giao:

```powershell
powershell -ExecutionPolicy Bypass -File .\.agents\skills\ai-project-delivery\scripts\validate_delivery.ps1 -StrictDelivery
```

Untouched template sẽ có placeholder warning; dự án bàn giao thật không được bỏ qua strict errors nếu chưa có exception đúng quyền.
