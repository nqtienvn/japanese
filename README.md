# AI Project Lifecycle Template — 09 Phase

Đây là bộ khung cho mô hình **bạn là Client/Product Owner thuê một công ty làm sản phẩm**, còn AI vận hành như Delivery Vendor gồm BA/PM/Architect/Developer/QA/DevOps: phỏng vấn stakeholder, làm rõ ý tưởng, tự động thực hiện công việc đã được ủy quyền và bàn giao kết quả có bằng chứng. Bộ khung cũng dùng được khi chép vào repository đang code dở.

## Bắt đầu nhanh

Ba tài liệu nên đọc đầu tiên:

- [START.md](START.md): chọn và sao chép prompt khởi động cho dự án mới hoặc dự án đang làm dở.
- [MASTER_PROMPT.md](MASTER_PROMPT.md): prompt điều phối duy nhất để AI khám phá yêu cầu, lập baseline, thực thi 09 phase và bàn giao.
- [USAGE_GUIDE.md](USAGE_GUIDE.md): cách vận hành hiệu quả cho dự án mới, dự án đang dở và yêu cầu thay đổi.

Sau khi đặt toàn bộ template vào root repository, mở AI tại đúng root và gửi:

```text
Đọc và thực thi toàn bộ MASTER_PROMPT.md trong repository này.
PROJECT_MODE = AUTO.
Ý tưởng hoặc mục tiêu hiện tại của tôi: [mô tả ngắn].
```

`AUTO` cho phép AI tự xác định `GREENFIELD`, `BROWNFIELD` hoặc `CHANGE` từ bằng chứng trong repository. Nếu đã biết chắc chế độ, thay `AUTO` bằng mode tương ứng. Không cần dán lại toàn bộ master prompt vào chat khi AI có quyền đọc repository.

## Mô hình phát triển được áp dụng

Bộ tài liệu sử dụng mô hình **AI-Assisted Client–Vendor Hybrid Stage-Gate Agile/DevSecOps Software Delivery**, gọi ngắn gọn là **Hybrid 9-Phase Software Delivery Model**.

### Chuẩn quốc tế được tham chiếu

Template được thiết kế theo hướng **standards-aligned**, không tự tuyên bố chứng nhận hoặc conformity chính thức. Mỗi dự án vẫn phải hoàn thành tailoring, evidence và review; nếu cần chứng nhận, phải có đánh giá độc lập.

| Chuẩn | Phiên bản ghim | Phạm vi áp dụng trong template |
| :--- | :--- | :--- |
| [ISO/IEC/IEEE 29148:2018](https://www.iso.org/standard/72089.html) | Edition 2, requirements engineering | BRD/SRS, requirement atomicity/quality, version control, glossary, external interfaces, lifecycle và traceability. ISO xác nhận phiên bản này trong 2024; tại thời điểm cập nhật template đang có revision project nên phải kiểm tra lại trước dự án mới. |
| [ISO/IEC/IEEE 29119-1:2022](https://www.iso.org/standard/81291.html) | Edition 2, general concepts | Test terminology, concepts và policy vocabulary. |
| [ISO/IEC/IEEE 29119-2:2021](https://www.iso.org/standard/79428.html) | Edition 2, test processes | Test governance, planning, monitoring/control, implementation và completion. |
| [ISO/IEC/IEEE 29119-3:2021](https://www.iso.org/standard/79429.html) | Edition 2, test documentation | Test Policy/Plan, Test Specification/Case, Test Status/Completion Report và test traceability outputs. |
| [ISO/IEC/IEEE 29119-4:2021](https://www.iso.org/standard/79430.html) | Edition 2, test techniques | Equivalence Partitioning, Boundary Value, Decision Table, State Transition và các kỹ thuật thiết kế test phù hợp. |
| [ISO/IEC 27001:2022](https://www.iso.org/standard/27001) | Edition 3, ISMS requirements | Risk-management/ISMS interface; không biến project checklist thành chứng nhận tổ chức. |
| [ISO/IEC 27002:2022](https://www.iso.org/standard/75652.html) | Edition 3, security controls guidance | Control reference được tailoring theo Security Profile và threat model. |
| [OWASP Top 10:2025](https://owasp.org/Top10/2025/0x00_2025-Introduction/) | Web application risk awareness | Threat/security review theo attack surface; không dùng như checklist đầy đủ duy nhất. |

`IEEE 830-1998` và `IEEE 829-2008` chỉ được coi là legacy references vì đã bị superseded. Mapping chi tiết và giới hạn tuyên bố nằm tại [Standards Alignment Matrix](00-Governance-Policy/STANDARDS_ALIGNMENT_MATRIX.md); rule kiểm soát nội dung nằm tại [Document Quality Standard](00-Governance-Policy/DOCUMENT_QUALITY_STANDARD.md).

Đây không phải Waterfall, Scrum hay V-Model thuần túy. Mô hình lấy **Stage-Gate SDLC** làm khung quản trị chính, sau đó kết hợp Agile/Iterative Delivery, traceability kiểu V-Model và DevSecOps trong từng phase.

| Thành phần | Cách áp dụng trong bộ tài liệu |
| :--- | :--- |
| **Client–Vendor Governance** | Client quyết định mục tiêu, phạm vi, ưu tiên và nghiệm thu; Delivery Vendor chịu trách nhiệm discovery, thiết kế, phát triển, kiểm thử, báo cáo và bàn giao. Quan hệ hai bên được quản lý bằng Charter, SOW, RACI, change request và acceptance. |
| **Stage-Gate SDLC** | Dự án đi qua 09 phase. Mỗi phase có đầu vào, artifact bắt buộc, evidence và gate đầu ra với kết quả `Pass`, `Conditional Pass` hoặc `Fail`. |
| **Agile/Iterative Delivery** | Công việc trong phase được chia theo vertical slice và work item nhỏ, có thể dùng Scrum, Kanban, Milestone hoặc Hybrid. Build, review, test và phản hồi diễn ra liên tục. |
| **V-Model-like Traceability** | Duy trì truy vết hai chiều từ mục tiêu/yêu cầu đến thiết kế, work item, code, test, release và handover. Một requirement chưa có evidence phù hợp không được coi là hoàn tất. |
| **DevSecOps** | Security, privacy, testing, CI, dependency scanning, migration, release, rollback, observability và operations được xem xét xuyên suốt thay vì để đến cuối dự án. |
| **Risk-based Security Profiles** | Chọn `STANDARD/HIGH/CRITICAL`; threat/control/test/release gate tăng theo data, exposure và impact, không dùng tuyên bố “bảo mật mạnh nhất” mơ hồ. |
| **Human–AI Collaboration** | AI không offload vì khó/lâu; chỉ nhờ Client cho decision/access/manual/approval/sign-off nhỏ nhất theo evidence, sau đó verify và tự resume. |
| **Brownfield Continuation** | Với dự án đang code dở, AI audit code/config/test/git trước, tái dựng hiện trạng, tạo gap analysis và tiếp tục từ gate đầu tiên chưa đạt. |

### Cách 09 phase vận hành

Các phase có thứ tự để bảo đảm kiểm soát phạm vi và chất lượng, nhưng cho phép **controlled iteration**. Khi yêu cầu thay đổi, test phát hiện giả định sai, thiết kế không khả thi hoặc production incident làm lộ khoảng trống, gate liên quan được mở lại và các artifact downstream phải được xác minh lại. Vì vậy mô hình không phải Waterfall một chiều.

Trong từng phase, team triển khai theo các vòng nhỏ:

```text
Làm rõ → Thiết kế → Hiện thực một vertical slice
→ Build/Test/Review → Nhận phản hồi → Điều chỉnh → Qua gate
```

Chuỗi truy vết bắt buộc của mô hình:

```text
Objective/Stakeholder
→ Business/Functional/Non-functional Requirement
→ ADR/Engineering Design
→ Work Item
→ Code/Configuration
→ Test/Evidence
→ Release
→ Handover
```

Tài liệu quy định chi tiết nằm tại:

- [Nine Phase Gates](.agents/skills/ai-project-delivery/references/phase-gates.md)
- [Artifact Map & Traceability](.agents/skills/ai-project-delivery/references/artifact-map.md)
- [Project Plan](01-Planning/PROJECT_PLAN.md)
- [Engineering Policy](00-Governance-Policy/ENGINEERING_POLICY.md)
- [Test Strategy & Plan](06-Testing/TEST_STRATEGY_AND_PLAN.md)
- [International Standards Alignment](00-Governance-Policy/STANDARDS_ALIGNMENT_MATRIX.md)
- [Document Quality Standard](00-Governance-Policy/DOCUMENT_QUALITY_STANDARD.md)
- [Security & Privacy Engineering Standard](00-Governance-Policy/SECURITY_AND_PRIVACY_STANDARD.md)
- [Human–AI Collaboration Protocol](00-Governance-Policy/HUMAN_AI_COLLABORATION_PROTOCOL.md)

Mô hình này phù hợp với quan hệ thuê phát triển sản phẩm vì kết hợp được khả năng kiểm soát phạm vi, trách nhiệm, chi phí giả định và nghiệm thu của mô hình truyền thống với khả năng lặp nhanh, phản hồi liên tục và tự động hóa của Agile/DevSecOps.

## Hai cách sử dụng

### 1. Dự án mới (GREENFIELD)

1. Copy toàn bộ thư mục này thành repository mới hoặc chạy script bootstrap.
2. Mở `PROJECT_PROFILE.md`, điền thông tin ban đầu nếu đã biết.
3. Nói với AI: `Đọc và thực thi toàn bộ MASTER_PROMPT.md. PROJECT_MODE = GREENFIELD. Ý tưởng của tôi: ...`
4. AI sẽ hỏi theo nhiều vòng, thường khoảng 120 câu cốt lõi và 80–240 câu có điều kiện đối với sản phẩm không đơn giản.
5. Khi baseline được chốt, AI tự đi qua 09 phase và chỉ dừng ở quyết định/hoạt động cần phê duyệt.

### 2. Dự án đang làm dở (BROWNFIELD)

1. Copy nội dung template vào root dự án mà không ghi đè file đang có; nên commit/backup trước khi tích hợp.
2. Nói với AI: `Đọc và thực thi toàn bộ MASTER_PROMPT.md. PROJECT_MODE = BROWNFIELD. Audit repository hiện tại rồi tiếp tục dự án.`
3. AI đọc code, config, test, tài liệu, git state và tái dựng hiện trạng trước khi hỏi.
4. AI tạo gap analysis, bảo vệ hành vi hiện có bằng test phù hợp, rồi tiếp tục từ gate đầu tiên chưa đạt.

Nếu repository đã có `AGENTS.md`, script brownfield giữ nguyên file đó và tạo `AGENTS.ai-project-delivery.md`; hãy yêu cầu AI hợp nhất hai bộ quy tắc thay vì ghi đè hướng dẫn cũ.

Ví dụ bootstrap:

```powershell
# Dự án mới: thư mục đích phải rỗng
powershell -ExecutionPolicy Bypass -File .\.agents\skills\ai-project-delivery\scripts\bootstrap_project.ps1 `
  -ProjectName "Tên sản phẩm" -ProjectCode "APP" -ProjectOwner "Tên Client" `
  -Destination "D:\Projects\my-product" -Mode Greenfield

# Dự án dở dang: chỉ copy file còn thiếu, giữ nguyên file hiện có
powershell -ExecutionPolicy Bypass -File .\.agents\skills\ai-project-delivery\scripts\bootstrap_project.ps1 `
  -ProjectName "Tên sản phẩm" -ProjectCode "APP" -ProjectOwner "Tên Client" `
  -Destination "D:\Projects\existing-product" -Mode Brownfield
```

## 09 phase

| Phase | Mục tiêu chính | Gate đầu ra |
| :--- | :--- | :--- |
| `00-Governance-Policy` | Charter, vai trò, quyền quyết định, policy | Governance rõ và có owner |
| `01-Planning` | Discovery, phạm vi, roadmap, rủi ro | Problem/scope baseline được chốt |
| `02-Requirements` | BR/FR/NFR/UC/US và traceability | Yêu cầu rõ, testable, ưu tiên |
| `03-Architecture-Design` | C4, ADR, data/API/UX, threat model | Thiết kế khả thi và review xong |
| `04-Implementation` | Work breakdown, migration, release, rollback | Sẵn sàng hiện thực hóa |
| `05-Development` | Code, review, CI, tech debt | Build/lint/unit test đạt |
| `06-Testing` | Integration/E2E/security/performance/UAT | Chất lượng đạt exit criteria |
| `07-Reports` | Status, release, incident, final report | Kết quả và sai lệch minh bạch |
| `08-Document-References` | Runbook, user guide, handover, archive | Người nhận có thể vận hành tiếp |

## Cơ chế phỏng vấn

Question bank nằm trong `.agents/skills/ai-project-delivery/references/`. AI không hỏi máy móc toàn bộ danh sách mà dùng câu hỏi có điều kiện, kiểm tra chéo câu trả lời, khai thác edge case và ghi lại từng quyết định trong `01-Planning/DISCOVERY_LOG.md`.

## Tự động hóa và an toàn

Sau khi baseline được duyệt, AI được phép tự làm các thay đổi local, có thể đảo ngược và trong phạm vi đã thống nhất. Các hành động như deploy production, chi tiền, thay đổi billing, xóa/migrate dữ liệu production, gửi/publish ra ngoài hoặc thay đổi bảo mật vẫn cần xác nhận riêng.

## Biến mẫu

Tìm và thay các biến dạng `{{VARIABLE}}`. Tối thiểu cần có:

| Biến | Ý nghĩa |
| :--- | :--- |
| `{{PROJECT_NAME}}` | Tên đầy đủ |
| `{{PROJECT_CODE}}` | Mã ngắn, viết hoa, không dấu |
| `{{PROJECT_OWNER}}` | Người chịu trách nhiệm cuối |
| `{{PRODUCT_OWNER}}` | Người quyết định sản phẩm |
| `{{TECH_LEAD}}` | Người quyết định kỹ thuật |
| `{{DATE}}` | Ngày theo `YYYY-MM-DD` |
| `{{VERSION}}` | Phiên bản tài liệu/sản phẩm |
| `{{STATUS}}` | Draft / In Review / Approved / Deprecated |

## Kiểm tra

Từ root dự án, chạy:

```powershell
powershell -ExecutionPolicy Bypass -File .\.agents\skills\ai-project-delivery\scripts\validate_delivery.ps1
```

Script kiểm tra đủ 09 phase, các artifact bắt buộc và trạng thái truy vết cơ bản.

Trong bản template chưa điền, cảnh báo `Unresolved template placeholders` là bình thường. Khi bàn giao thật, chạy thêm `-StrictDelivery`; mọi placeholder còn lại và phase chưa `Passed` sẽ làm validation thất bại.
