# Artifact map and traceability

## Mục lục

1. Artifact bắt buộc
2. ID convention
3. Trace chain
4. Evidence

## 1. Artifact bắt buộc

Artifact điều phối tại root: `README.md`, `START.md`, `MASTER_PROMPT.md`, `USAGE_GUIDE.md`, `AGENTS.md`, `PROJECT_PROFILE.md`, `PROJECT_STATE.md`.

| Phase | Artifact tối thiểu |
| :--- | :--- |
| 00 | `README.md`, `PROJECT_CHARTER.md`, `GOVERNANCE_AND_RACI.md`, `ENGINEERING_POLICY.md`, `DOCUMENT_QUALITY_STANDARD.md`, `STANDARDS_ALIGNMENT_MATRIX.md` |
| 01 | `README.md`, `DISCOVERY_LOG.md`, `PROJECT_PLAN.md`, `RISK_REGISTER.md`, brownfield audit nếu áp dụng |
| 02 | `README.md`, `BRD.md`, `SRS.md`, `FEATURE_CATALOG.md`, `USE_CASE_SPECIFICATION.md`, `REQUIREMENT_ITEM_TEMPLATE.md`, `TRACEABILITY_MATRIX.md` |
| 03 | `README.md`, `SOFTWARE_ARCHITECTURE.md`, `DATA_MODEL_ERD.md`, `API_SPECIFICATION.md`, `ADR_TEMPLATE.md`, `ENGINEERING_DESIGN_SPEC.md`, `DESIGN_REVIEW.md` |
| 04 | `README.md`, `IMPLEMENTATION_PLAN.md`, `WORK_ITEM_TEMPLATE.md`, `MIGRATION_RELEASE_ROLLBACK.md`, `CHANGELOG.md` |
| 05 | `README.md`, `PROJECT_STRUCTURE.md`, `DEVELOPMENT_WORKFLOW.md`, `CODE_REVIEW_CHECKLIST.md`, `TECH_DEBT_REGISTER.md` |
| 06 | `README.md`, `TEST_POLICY.md`, `TEST_STRATEGY_AND_PLAN.md`, `TEST_SPECIFICATION.md`, `TEST_CASE_TEMPLATE.md`, `TEST_STATUS_REPORT.md`, `TEST_REPORT.md`, `TEST_TRACEABILITY_MATRIX.md`, `DEFECT_REGISTER.md`, `DOCUMENT_QUALITY_AUDIT.md`, `FIELD_VALIDATION_REPORT.md` |
| 07 | `README.md`, `STATUS_AND_SPRINT_REPORT.md`, `RELEASE_REPORT.md`, `FINAL_REPORT.md` |
| 08 | `README.md`, `DOCUMENT_INDEX.md`, `DEPLOYMENT_GUIDE.md`, `USER_GUIDE.md`, `OPERATIONS_RUNBOOK.md`, `HANDOVER_CHECKLIST.md` |

## 2. ID convention

| ID | Ý nghĩa | Ví dụ |
| :--- | :--- | :--- |
| `OBJ` | Outcome/objective | `OBJ-001` |
| `STK` | Stakeholder | `STK-003` |
| `BR` | Business rule | `BR-PAY-001` |
| `FR` | Functional requirement | `FR-AUTH-004` |
| `NFR` | Non-functional requirement | `NFR-PERF-002` |
| `UC` / `US` | Use case / user story | `UC-012`, `US-034` |
| `ADR` / `DES` | Decision / design item | `ADR-005`, `DES-API-003` |
| `WI` | Work item | `WI-042` |
| `TC` / `DEF` | Test / defect | `TC-SEC-017`, `DEF-008` |
| `REL` | Release | `REL-1.2.0` |
| `RISK` / `DEC` | Risk / decision log | `RISK-009`, `DEC-014` |

Giữ ID ổn định khi đổi tiêu đề. Không tái sử dụng ID đã bỏ; dùng trạng thái `Deprecated` và liên kết ID thay thế.

## 3. Trace chain

```text
OBJ/STK → BR/FR/NFR/UC/US → ADR/DES → WI → code/config → TC/evidence → REL → handover
```

RTM phải trả lời được hai chiều:

- Vì sao component/test này tồn tại?
- Requirement này đã được thiết kế, hiện thực, kiểm thử và bàn giao ở đâu?

## 4. Evidence

Evidence có thể là file/path, symbol, commit/PR, test name, command output, screenshot, monitoring query, approval record hoặc release artifact. Ghi ngày, môi trường, phiên bản và kết quả; không dùng “đã test” không kèm chi tiết.
