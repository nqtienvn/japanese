# Phase 00 — Governance & Policy

## Mục tiêu

Thiết lập quan hệ làm việc giữa `Client` và `Delivery Vendor`, xác định quyền quyết định, trách nhiệm, phạm vi hợp đồng, cách quản lý thay đổi và chuẩn chất lượng trước khi phân tích sâu.

## Vai trò mặc định

- `Client`: cung cấp bối cảnh nghiệp vụ, quyết định ưu tiên/phạm vi, cấp dữ liệu/quyền cần thiết, tham gia review/UAT và nghiệm thu.
- `Delivery Vendor`: chủ động discovery, phân tích, thiết kế, phát triển, kiểm thử, báo cáo, release plan và bàn giao.
- AI không tự nhân danh Client để phê duyệt scope, chi phí, production deployment hoặc chấp nhận rủi ro nghiêm trọng.

## Artifact

- `PROJECT_CHARTER.md`: lý do, mục tiêu, stakeholder và quyền hạn.
- `STATEMENT_OF_WORK.md`: deliverables, in/out scope, milestone và giả định thương mại.
- `GOVERNANCE_AND_RACI.md`: RACI, decision rights, cadence, DoR/DoD.
- `ENGINEERING_POLICY.md`: chuẩn code, security, privacy, testing và evidence.
- `DOCUMENT_QUALITY_STANDARD.md`: độ phủ, atomic/unambiguous/testable/traceable và field-validation rules.
- `STANDARDS_ALIGNMENT_MATRIX.md`: mapping với ISO/IEC/IEEE 29148 và 29119 series.
- `CHANGE_REQUEST_TEMPLATE.md`: kiểm soát thay đổi scope/time/cost/risk.
- `COMMERCIAL_AND_ACCEPTANCE_MODEL.md`: estimation, nghiệm thu, warranty/support.

## Gate 00

- [ ] Client owner và vendor delivery owner rõ.
- [ ] Phạm vi discovery, autonomy và approval-only actions rõ.
- [ ] SOW/giả định/ngoại lệ ban đầu được ghi.
- [ ] RACI, escalation, change control, DoR/DoD và policy có owner.
- [ ] Standards tailoring/alignment và document quality controls đã được chọn, có owner.
- [ ] Không còn xung đột Critical/High chưa có người quyết định.
