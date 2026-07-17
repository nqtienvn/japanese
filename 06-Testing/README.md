---
artifact_id: DOC-06-TESTING-README-MD
phase: "06-Testing"
artifact_type: testing
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
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
- `SECURITY_VERIFICATION_MATRIX.md`: negative/security/equivalence cases cho Bank Security Reference Baseline.
- `DOCUMENT_QUALITY_AUDIT.md`: audit 2–3 feature phức tạp và 4 nhóm tài liệu cốt lõi.
- `FIELD_VALIDATION_REPORT.md`: Developer newcomer, Tester derivation và peer review evidence.
- `TDD_SPECIFICATION.md`: red-green-refactor cho logic quan trọng.
- `DEFECT_REGISTER.md`: defect lifecycle/severity.
- `TEST_REPORT.md`: execution, coverage, residual risk và recommendation.
- `UAT_AND_ACCEPTANCE.md`: Client scenarios và sign-off.
- `DR_RESTORE_FAILOVER_EXERCISE.md`: restore, failover, rollback và crisis communication exercise evidence.

## Gate 06

- [ ] Risk/requirement coverage đạt; Must/Critical có passing evidence.
- [ ] Policy/Plan → Specification/Case → Status/Completion/RTM đủ ba tầng tài liệu test.
- [ ] Input Data tách khỏi steps; Expected Result mô tả chính xác UI/API/state/data/audit.
- [ ] Audit feature sample và Tester Derivation Test đạt, không có blocking clarification.
- [ ] Blocking defect không còn mở hoặc có acceptance đúng quyền.
- [ ] Security/performance/migration/rollback test phù hợp đạt.
- [ ] Security verification đúng Profile; không còn Critical security risk mở, High acceptance có owner/expiry/retest.
- [ ] Mọi `SEC-BNK` applicable có passing evidence; cross-language refactor có behavioral equivalence evidence.
- [ ] Code coverage đã tailoring theo risk/layer/tool/exclusion và không thay thế requirement/risk coverage.
- [ ] Client UAT/acceptance hoàn tất; giới hạn và residual risk rõ.
- [ ] DR/restore/failover evidence đạt RTO/RPO hoặc có exception đúng quyền.
