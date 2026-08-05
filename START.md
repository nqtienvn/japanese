---
artifact_id: DOC-START-MD
phase: "ROOT"
artifact_type: orchestration
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# START — Initiating the Project with AI

This is the starting point for the Client/Product Owner. Open the AI assistant at the **root repository**, select exactly one mode, replace the content in `[ ... ]`, and send the corresponding prompt block.

| Scenario | Mode | Prompt to Use |
| :--- | :--- | :--- |
| New idea, no significant implementation yet | `GREENFIELD` | [Prompt A](#prompt-a--new-project-greenfield) |
| Existing code, configuration, tests, or documentation | `BROWNFIELD` | [Prompt B](#prompt-b--existing-project-brownfield) |

> Do not send both prompts. If you are unsure of the mode, use `PROJECT_MODE = AUTO` in [MASTER_PROMPT.md](MASTER_PROMPT.md) and the AI will determine it from the repository content.

## Prompt A — New Project (`GREENFIELD`)

Copy the entire block below:

```text
Use the local `ai-project-delivery` skill in `.agents/skills/ai-project-delivery/SKILL.md`.
Before acting, read `AGENTS.md`, `MASTER_PROMPT.md`, `.agents/skills/ai-project-delivery/SKILL.md`, and every reference that the skill routes for this mode. Treat the skill and repository instructions as mandatory, not optional.
Then execute the entire `MASTER_PROMPT.md` workflow from this repository root.

PROJECT_MODE = GREENFIELD.
AUTONOMY_MODE = FULL-LOCAL.
SECURITY_PROFILE = AUTO.

My initial idea:
[What software do I want to build?]

Target users:
[Who will use it?]

Problems to solve:
[What difficulties are they currently facing?]

Desired outcomes:
[What does success look like?]

Deadline or budget:
[Fill in if known, otherwise write TBD]

Please start the Discovery phase. Do not write production code until the baseline is approved by me.
```

The first output must summarize the initial understanding and present 5–10 critical Discovery questions. The AI must not design or write production code before the baseline is approved.

## Prompt B — Existing Project (`BROWNFIELD`)

Before sending the prompt, it is recommended to commit/backup your code and note the branch, HEAD, and `git status`. Then copy the entire block below:

```text
Use the local `ai-project-delivery` skill in `.agents/skills/ai-project-delivery/SKILL.md`.
Before acting, read `AGENTS.md`, `MASTER_PROMPT.md`, `.agents/skills/ai-project-delivery/SKILL.md`, and every reference that the skill routes for this mode. Treat the skill and repository instructions as mandatory, not optional.
Then execute the entire `MASTER_PROMPT.md` workflow from this repository root.

PROJECT_MODE = BROWNFIELD.
AUTONOMY_MODE = FULL-LOCAL.
SECURITY_PROFILE = AUTO.

Takeover goals:
[How should this software be completed, fixed, or further developed?]

Current known status:
[What parts are done, what parts are pending, and what bugs/issues exist. Write TBD if unsure.]

Mandatory features or behaviors to retain:
[List if known. Otherwise, ask the AI to determine them from the code and tests.]

Current priorities:
[Features, bugs, or milestones that need to be addressed first.]

Target users:
[Who is currently or will be using the product?]

Desired outcomes:
[Conditions to consider this takeover successful.]

Deadline and budget:
[Fill in if known, otherwise write TBD.]

In the first phase, conduct a read-only audit of the repository first:

1. Read all repository instructions and related AGENTS.md files.
2. Check branch, HEAD, git status, and uncommitted changes.
3. Read code, config, dependencies, migrations, tests, documentation, and CI/CD.
4. Identify stack, entry point, modules, APIs, UI, data models, authentication, and integrations.
5. Check TODOs, mocks, stubs, disabled tests, feature flags, and incomplete code.
6. Verify documentation against actual code behaviors.
7. You may run local build/test commands only if you have verified they are safe and do not impact shared data or environments.
8. Do not reset, checkout, delete, overwrite, mass-format, or modify code during the audit phase.
9. Do not run migrations, deploy, or change production environments.
10. Do not ask me for technical information that can be verified directly from the repository.

After the audit, provide:

- Git state and changes that need protection;
- Current architecture and behavior — as-is;
- Completed features with evidence;
- Existing but unverified features;
- Missing or buggy features;
- Build and test status;
- Security, data, migration, and operational risks;
- Mismatches between code and documentation;
- Technical debt;
- Gap analysis;
- The first failed gate in the 09 phases;
- List of business questions that cannot be inferred from the repository;
- Proposed target delta and continuation plan.

Please create or update:
- PROJECT_STATE.md;
- 01-Planning/BROWNFIELD_AUDIT.md;
- 01-Planning/DISCOVERY_LOG.md;
- 02-Requirements/TRACEABILITY_MATRIX.md.

Do not modify production code until I approve the takeover baseline ("as-is + target delta + protection scope + acceptance criteria").
```

The first output must be the audit report based on evidence in the repository. The AI should only ask for business decisions, priorities, and desired behaviors that cannot be inferred from code, tests, configuration, or documentation.

## Prompt A — Bản tiếng Việt cho dự án mới (`GREENFIELD`)

Dùng nguyên khối dưới đây khi muốn khởi động dự án mới:

```text
Hãy sử dụng skill cục bộ `ai-project-delivery` tại `.agents/skills/ai-project-delivery/SKILL.md`.
Trước khi thực hiện, hãy đọc `AGENTS.md`, `MASTER_PROMPT.md`, `.agents/skills/ai-project-delivery/SKILL.md` và toàn bộ reference mà skill định tuyến cho chế độ này. Coi các hướng dẫn đó là bắt buộc.
Sau đó thực thi toàn bộ quy trình trong `MASTER_PROMPT.md` từ root repository này.

PROJECT_MODE = GREENFIELD.
AUTONOMY_MODE = FULL-LOCAL.
SECURITY_PROFILE = AUTO.

Ý tưởng ban đầu của tôi:
[Tôi muốn xây dựng phần mềm gì?]

Người dùng mục tiêu:
[Ai sẽ sử dụng phần mềm?]

Vấn đề cần giải quyết:
[Hiện họ đang gặp khó khăn gì?]

Kết quả mong muốn:
[Thế nào được xem là thành công?]

Deadline hoặc ngân sách:
[Điền nếu biết; nếu chưa biết ghi TBD.]

Hãy bắt đầu bằng giai đoạn Discovery. Chưa được viết production code cho đến khi tôi phê duyệt baseline problem/scope/requirements.
Mỗi vòng cần hỏi các câu mà bạn cảm thấy mơ hồ, phải lựa chọn phương án. Không hỏi lại dữ kiện có thể kiểm tra từ repository hoặc tài liệu.
Cập nhật `PROJECT_STATE.md`, `01-Planning/DISCOVERY_LOG.md` và `02-Requirements/TRACEABILITY_MATRIX.md` trong quá trình thực hiện.
```

## Prompt B — Bản tiếng Việt cho dự án đang làm dở (`BROWNFIELD`)

Nên commit/backup code, ghi lại branch, HEAD và `git status` trước khi gửi prompt:

```text
Hãy sử dụng skill cục bộ `ai-project-delivery` tại `.agents/skills/ai-project-delivery/SKILL.md`.
Trước khi thực hiện, hãy đọc `AGENTS.md`, `MASTER_PROMPT.md`, `.agents/skills/ai-project-delivery/SKILL.md` và toàn bộ reference mà skill định tuyến cho chế độ này. Coi các hướng dẫn đó là bắt buộc.
Sau đó thực thi toàn bộ quy trình trong `MASTER_PROMPT.md` từ root repository này.

PROJECT_MODE = BROWNFIELD.
AUTONOMY_MODE = FULL-LOCAL.
SECURITY_PROFILE = AUTO.

Mục tiêu tiếp quản:
[Phần mềm cần được hoàn thiện, sửa lỗi hoặc phát triển tiếp như thế nào?]

Trạng thái tôi biết:
[Phần nào đã xong, đang dở, có bug/vấn đề gì; nếu chưa biết ghi TBD.]

Tính năng hoặc hành vi bắt buộc phải giữ:
[Liệt kê nếu biết; nếu không, hãy xác định từ code và test.]

Ưu tiên hiện tại:
[Tính năng, bug hoặc milestone cần xử lý trước.]

Người dùng mục tiêu:
[Ai đang hoặc sẽ sử dụng sản phẩm?]

Kết quả mong muốn:
[Điều kiện để xem việc tiếp quản là thành công.]

Deadline và ngân sách:
[Điền nếu biết; nếu chưa biết ghi TBD.]

Trong pha đầu tiên, chỉ audit read-only repository:
1. Đọc mọi instruction của repository và các file `AGENTS.md` liên quan.
2. Kiểm tra branch, HEAD, git status và thay đổi chưa commit.
3. Đọc code, config, dependency, migration, test, tài liệu và CI/CD.
4. Xác định stack, entry point, module, API, UI, data model, authentication và integration.
5. Kiểm tra TODO, mock, stub, test bị disable, feature flag và code chưa hoàn thiện.
6. Đối chiếu tài liệu với hành vi thực tế của code.
7. Chỉ chạy build/test local sau khi xác nhận an toàn và không ảnh hưởng dữ liệu hoặc môi trường dùng chung.
8. Không reset, checkout, xóa, ghi đè, mass-format hoặc sửa code trong lúc audit.
9. Không chạy migration, deploy hoặc thay đổi production environment.
10. Không hỏi tôi các dữ kiện kỹ thuật có thể xác minh trực tiếp từ repository.

Sau audit, hãy báo cáo:
- Git state và thay đổi cần bảo vệ;
- Kiến trúc và hành vi hiện tại (as-is);
- Tính năng đã hoàn thành kèm evidence;
- Tính năng có code nhưng chưa được verify;
- Tính năng thiếu hoặc đang lỗi;
- Trạng thái build và test;
- Rủi ro security, data, migration và vận hành;
- Mâu thuẫn giữa code và tài liệu;
- Technical debt;
- Gap analysis;
- Gate đầu tiên trong 09 phase đang chưa đạt;
- Các câu hỏi nghiệp vụ không thể suy ra từ repository;
- Target delta và kế hoạch tiếp tục.

Hãy tạo hoặc cập nhật:
- `PROJECT_STATE.md`;
- `01-Planning/BROWNFIELD_AUDIT.md`;
- `01-Planning/DISCOVERY_LOG.md`;
- `02-Requirements/TRACEABILITY_MATRIX.md`.

Chưa được sửa production code cho đến khi tôi phê duyệt baseline tiếp quản gồm: as-is, target delta, phạm vi bảo vệ và acceptance criteria.
```

## After Discovery or Brownfield Audit

1. Review the summary of the `baseline` or `as-is + target delta`.
2. Ask to correct any errors, ambiguities, or missing acceptance criteria.
3. Only approve once the scope, behaviors, NFRs, risks, acceptance, and automation rights are clear.
4. After approval, let the AI automatically proceed through the gates, stopping only at actions requiring Client approval.
5. Before final handover, request to run the validator script with `-StrictDelivery`.

Complete operations guide: [USAGE_GUIDE.md](USAGE_GUIDE.md).
