# Phase 06 — Verification, Validation & UAT

## Mục tiêu

Chứng minh sản phẩm đáp ứng requirements và đủ an toàn để Client nghiệm thu. Dùng risk-based testing: unit, integration, contract, E2E, security, performance, migration, recovery và UAT theo phạm vi.

## Artifact

- `TEST_STRATEGY_AND_PLAN.md`: scope, level, environment, data, criteria.
- `TEST_POLICY.md`: governance, principles, role/independence, defect/evidence và tailoring.
- `TEST_SPECIFICATION.md`: test basis, conditions, techniques, test data và case inventory.
- `TEST_CASE_TEMPLATE.md`: test chi tiết có trace/evidence.
- `TEST_STATUS_REPORT.md`: Total/Executed/Passed/Failed/Blocked/Skipped theo chu kỳ.
- `TEST_TRACEABILITY_MATRIX.md`: SRS ID → Test Case ID → result → Defect ID → retest/release.
- `DOCUMENT_QUALITY_AUDIT.md`: audit 2–3 feature phức tạp và 4 nhóm tài liệu cốt lõi.
- `FIELD_VALIDATION_REPORT.md`: Developer newcomer, Tester derivation và peer review evidence.
- `TDD_SPECIFICATION.md`: red-green-refactor cho logic quan trọng.
- `DEFECT_REGISTER.md`: defect lifecycle/severity.
- `TEST_REPORT.md`: execution, coverage, residual risk và recommendation.
- `UAT_AND_ACCEPTANCE.md`: Client scenarios và sign-off.

## Gate 06

- [ ] Risk/requirement coverage đạt; Must/Critical có passing evidence.
- [ ] Policy/Plan → Specification/Case → Status/Completion/RTM đủ ba tầng tài liệu test.
- [ ] Input Data tách khỏi steps; Expected Result mô tả chính xác UI/API/state/data/audit.
- [ ] Audit feature sample và Tester Derivation Test đạt, không có blocking clarification.
- [ ] Blocking defect không còn mở hoặc có acceptance đúng quyền.
- [ ] Security/performance/migration/rollback test phù hợp đạt.
- [ ] Client UAT/acceptance hoàn tất; giới hạn và residual risk rõ.
