---
artifact_id: DOC-00-GOVERNANCE-POLICY-CR-SECURITY-REFERENCE-001-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Change Request — CR-SECURITY-REFERENCE-001

| Trường | Giá trị |
| :--- | :--- |
| Requester / date | Client / 2026-07-17 |
| Loại | Governance / Autonomy / Security / Technical |
| Priority | Critical |
| Status | Implemented — downstream project adoption remains conditional |

## Thay đổi được phê duyệt

1. Đưa code từ `E:\mb_laos_be\security` và `E:\mb_laos_be\mb-security-starter` vào AI Project Delivery template làm security reference nội bộ.
2. Buộc AI khai thác evidence và tự thực hiện tối đa; chỉ yêu cầu con người cho intent/material decision/access/manual action/approval/sign-off.
3. Cho phép Java/Spring copy-adapt component phù hợp.
4. Cho phép ngôn ngữ khác refactor security responsibility/control sang native implementation có equivalent test.

## Claim và safety boundary

- Hai source directory không bị sửa.
- Raw committed secret và unsafe config default không được copy vào template.
- Snapshot giữ trạng thái `QUARANTINED_REFERENCE` cho đến khi project-specific adoption gate đạt.
- Client đã cho phép sử dụng code trong template nội bộ; quyền publish/redistribute chưa được suy diễn.

## Impact analysis

| Miền | Ảnh hưởng | Risk | Artifact |
| :--- | :--- | :---: | :--- |
| Governance/autonomy | Default `FULL-LOCAL` sau baseline; evidence-first questions | Medium | Master Prompt, Skill, Human–AI Protocol |
| Security | Thêm bank reference baseline, adoption gate và known-finding blocklist | High | Security Standard, Baseline, Security Review |
| Architecture | Thêm per-component adoption/cross-language mapping | Medium | Security Adoption Record, portability matrix |
| Implementation | Copy 41 Java files, POM/template/metadata; sanitize config | High | Skill assets |
| Testing | Thêm mandatory negative/equivalence matrix và validator checks | High | Security Verification Matrix, validator |
| Handover | Thêm security reference index/provenance | Medium | Phase 08 index/docs |

## Quyết định

| Decision ID | Quyết định | Decider/source | Date |
| :--- | :--- | :--- | :--- |
| `DEC-AUTO-001` | AI tự xử lý tối đa; con người chỉ tham gia human-exclusive trigger | Client request | 2026-07-17 |
| `DEC-SEC-001` | Hai Java codebase là security implementation reference bắt buộc đánh giá | Client request | 2026-07-17 |
| `DEC-SEC-002` | Stack khác Java refactor sang native code theo security contract | Client clarification | 2026-07-17 |
| `DEC-SEC-003` | Không copy raw secret/unsafe default; giữ source ngoài template nguyên trạng | Security policy | 2026-07-17 |
