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

## Objective

Prove that the product meets requirements and is sufficiently secure for Client acceptance. Apply risk-based testing: unit, integration, contract, E2E, security, performance, migration, recovery, and UAT matching the project scope.

## Artifacts

- `TEST_STRATEGY_AND_PLAN.md`: scope, level, environment, data, criteria.
- `TEST_POLICY.md`: governance, principles, role/independence, defect/evidence, and tailoring.
- `TEST_SPECIFICATION.md`: test basis, conditions, techniques, test data, and case inventory.
- `TEST_CASE_TEMPLATE.md`: detailed test cases with trace/evidence.
- `TEST_STATUS_REPORT.md`: Total/Executed/Passed/Failed/Blocked/Skipped metrics by cycle.
- `TEST_TRACEABILITY_MATRIX.md`: SRS ID → Test Case ID → result → Defect ID → retest/release.
- `SECURITY_VERIFICATION_MATRIX.md`: negative/security/equivalence cases for the Bank Security Reference Baseline.
- `DOCUMENT_QUALITY_AUDIT.md`: audit of 2-3 complex features and 4 core document groups.
- `FIELD_VALIDATION_REPORT.md`: Developer newcomer, Tester derivation, and peer review evidence.
- `TDD_SPECIFICATION.md`: red-green-refactor for critical logic.
- `DEFECT_REGISTER.md`: defect lifecycle/severity.
- `TEST_REPORT.md`: execution, coverage, residual risks, and recommendations.
- `UAT_AND_ACCEPTANCE.md`: Client scenarios and sign-off.
- `DR_RESTORE_FAILOVER_EXERCISE.md`: restore, failover, rollback, and crisis communication exercise evidence.

## Gate 06

- [ ] Risk/requirement coverage targets met; Must/Critical items have passing evidence.
- [ ] Policy/Plan → Specification/Case → Status/Completion/RTM covers all three tiers of test documentation.
- [ ] Input Data is separated from steps; Expected Result accurately describes UI/API/state/data/audit outcomes.
- [ ] Feature sample audit and Tester Derivation Tests passed, with no blocking clarifications.
- [ ] Blocking defects are closed, or accepted by authorized roles.
- [ ] Relevant security, performance, migration, and rollback tests passed.
- [ ] Security verification aligns with the Profile; no open Critical security risks, and High risks accepted with owner/expiry/re-test plans.
- [ ] All applicable SEC-BNK requirements have passing evidence; cross-language refactors have behavioral equivalence evidence.
- [ ] Code coverage is tailored by risk/layer/tool/exclusion and does not substitute for requirement/risk coverage.
- [ ] Client UAT/acceptance is complete; boundaries and residual risks are clear.
- [ ] DR/restore/failover evidence meets RTO/RPO targets or has an approved exception.
