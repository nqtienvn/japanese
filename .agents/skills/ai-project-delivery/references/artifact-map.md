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
| 00 | `README.md`, `PROJECT_CHARTER.md`, `STATEMENT_OF_WORK.md`, `GOVERNANCE_AND_RACI.md`, `ENGINEERING_POLICY.md`, `SECURITY_AND_PRIVACY_STANDARD.md`, `BANK_SECURITY_REFERENCE_BASELINE.md`, `FRONT_MATTER_STANDARD.md`, `REUSABLE_QUALITY_PATTERNS.md`, `HUMAN_AI_COLLABORATION_PROTOCOL.md`, `DOCUMENT_QUALITY_STANDARD.md`, `STANDARDS_ALIGNMENT_MATRIX.md`, change/acceptance templates |
| 01 | `README.md`, `DISCOVERY_LOG.md`, `PROJECT_PLAN.md`, `RISK_REGISTER.md`, `BROWNFIELD_AUDIT.md`, `COST_FINOPS_CAPACITY_LIFECYCLE.md` nếu áp dụng |
| 02 | `README.md`, `BRD.md`, `SRS.md`, `FEATURE_CATALOG.md`, `USE_CASE_SPECIFICATION.md`, `BPMN_WORKFLOW.md`, `CRUD_FUNCTIONAL_MATRIX.md`, `REQUIREMENT_ITEM_TEMPLATE.md`, `REQUIREMENTS_REVIEW.md`, `TRACEABILITY_MATRIX.md` |
| 03 | `README.md`, `SOFTWARE_ARCHITECTURE.md`, `DOMAIN_MODEL.md`, `DATA_MODEL_ERD.md`, `PHYSICAL_DATABASE_DESIGN.md`, `API_SPECIFICATION.md`, `contracts/openapi.yaml`, `contracts/asyncapi.yaml`, `CONTRACT_VALIDATION.md`, `ADR_TEMPLATE.md`, `ENGINEERING_DESIGN_SPEC.md`, `THREAT_MODEL.md`, `PERMISSION_MATRIX.md`, `ASVS_MAPPING.md`, `SECURITY_ADOPTION_RECORD.md`, `UI_UX_SPECIFICATION.md`, `DESIGN_REVIEW.md` |
| 04 | `README.md`, `IMPLEMENTATION_PLAN.md`, `ENVIRONMENT_SETUP.md`, `MIGRATION_REGISTRY.md`, `WORK_ITEM_TEMPLATE.md`, `MIGRATION_RELEASE_ROLLBACK.md`, `CHANGELOG.md` |
| 05 | `README.md`, `PROJECT_STRUCTURE.md`, `DEVELOPMENT_WORKFLOW.md`, `DEVOPS_IAC_AND_PIPELINE.md`, `CONTAINER_SECURITY_PROFILE.md`, `CODE_REVIEW_CHECKLIST.md`, `TECH_DEBT_REGISTER.md` |
| 06 | `README.md`, `TEST_POLICY.md`, `TEST_STRATEGY_AND_PLAN.md`, `TEST_SPECIFICATION.md`, `TEST_CASE_TEMPLATE.md`, `TDD_SPECIFICATION.md`, `TEST_STATUS_REPORT.md`, `TEST_REPORT.md`, `TEST_TRACEABILITY_MATRIX.md`, `SECURITY_VERIFICATION_MATRIX.md`, `DR_RESTORE_FAILOVER_EXERCISE.md`, `DEFECT_REGISTER.md`, `UAT_AND_ACCEPTANCE.md`, `DOCUMENT_QUALITY_AUDIT.md`, `FIELD_VALIDATION_REPORT.md` |
| 07 | `README.md`, `STATUS_AND_SPRINT_REPORT.md`, `READINESS_DASHBOARD.md`, `RELEASE_REPORT.md`, `INCIDENT_AND_PIR.md`, `LESSONS_LEARNED.md`, `FINAL_REPORT.md` |
| 08 | `README.md`, `DOCUMENT_INDEX.md`, `DEPLOYMENT_GUIDE.md`, `USER_GUIDE.md`, `OPERATIONS_RUNBOOK.md`, `DR_BCP_AND_CRISIS_PLAN.md`, `HANDOVER_CHECKLIST.md`, `GLOSSARY_AND_REFERENCES.md`, `TERM_STANDARDIZATION.md`, `SECURITY_REFERENCE_INDEX.md` |

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
