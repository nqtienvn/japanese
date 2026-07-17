---
artifact_id: DOC-00-GOVERNANCE-POLICY-CHANGE-REQUEST-TEMPLATE-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Change Request — CR-{{NNN}}

| Trường | Giá trị |
| :--- | :--- |
| Requester / date | {{REQUESTER}} / {{DATE}} |
| Loại | Scope / Schedule / Cost / Quality / Technical / Governance / Autonomy / Security / Privacy / Regulatory / Emergency |
| Priority | Low / Medium / High / Critical |
| Status | Proposed / Analysing / Approved / Rejected / Implemented |

## Thay đổi được đề nghị

{{CHANGE_DESCRIPTION}}

## Lý do và giá trị

{{RATIONALE}}

## Impact analysis

| Miền | Ảnh hưởng | Estimate/risk | Artifact cần cập nhật |
| :--- | :--- | :--- | :--- |
| Scope/requirements | {{IMPACT}} | {{ESTIMATE}} | {{FILES}} |
| Architecture/data/security | {{IMPACT}} | {{ESTIMATE}} | {{FILES}} |
| Schedule/cost/resources | {{IMPACT}} | {{ESTIMATE}} | {{FILES}} |
| Test/release/operations | {{IMPACT}} | {{ESTIMATE}} | {{FILES}} |
| Governance/autonomy/human assistance | {{IMPACT}} | {{ESTIMATE}} | {{FILES}} |
| Security profile/privacy/compliance | {{IMPACT}} | {{ESTIMATE}} | {{FILES}} |

Gate cần mở lại: {{GATES}}. Baseline/evidence cũ phải được giữ; không sửa lịch sử để làm thay đổi mới trông như đã được phê duyệt từ đầu.

## Phương án

| Option | Mô tả | Ưu | Nhược | Khuyến nghị |
| :--- | :--- | :--- | :--- | :--- |
| A | {{OPTION}} | {{PROS}} | {{CONS}} | Yes / No |

## Quyết định

| Approver | Decision | Date | Conditions |
| :--- | :--- | :--- | :--- |
| Client PO | Pending | {{DATE}} | {{CONDITIONS}} |
| Vendor Lead | Pending | {{DATE}} | {{CONDITIONS}} |
