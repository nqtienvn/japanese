# Test Case — TC-{{TYPE}}-{{NNN}}

| Field | Value |
| :--- | :--- |
| Title / type | {{TITLE}} / Unit / Integration / Contract / E2E / Security / Performance / Recovery / UAT |
| Requirement/risk | {{REQUIREMENT_RISK_IDS}} |
| Priority | Critical / High / Medium / Low |
| Environment/build | {{ENVIRONMENT_BUILD}} |
| Automation/evidence | {{PATH_JOB_REPORT}} |
| Status | Not Run / Pass / Fail / Blocked / Skipped |

Test Case ID phải unique trong toàn dự án và không được tái sử dụng cho scenario khác. Khi thay thế, giữ ID cũ ở trạng thái `Deprecated` và liên kết ID mới.

## Goal

{{WHAT_RISK_OR_BEHAVIOR_THIS_PROVES}}

## Preconditions và test data

- Preconditions: {{PRECONDITIONS}}
- Synthetic/anonymized data IDs: {{DATA_IDS}}
- Mocks/stubs/clock/network conditions: {{CONDITIONS}}

### Input data

| Data ID | Field/source | Exact input/setup | Boundary/partition | Expected classification |
| :--- | :--- | :--- | :--- | :--- |
| TD-XXX | {{FIELD_SOURCE}} | {{EXACT_VALUE_SETUP}} | Valid / Invalid / Min / Max / Empty / Null | Synthetic / anonymized |

## Steps

| # | Action | Input Data ID | Exact expected observable result/state/message | Evidence |
| :---: | :--- | :--- | :--- | :--- |
| 1 | {{ACTION}} | TD-XXX | {{EXACT_UI_API_DATA_AUDIT_RESULT}} | {{EVIDENCE}} |

## Assertions

- UI/API output: {{ASSERTION}}
- State/database/event/side effect: {{ASSERTION}}
- Auth/audit/log/no-sensitive-data: {{ASSERTION}}
- Retry/idempotency/error/recovery: {{ASSERTION}}

## Execution

| Date | Tester/runner | Build/commit | Actual result | Evidence | Defect |
| :--- | :--- | :--- | :--- | :--- | :--- |
| {{DATE}} | {{TESTER}} | {{VERSION}} | {{RESULT}} | {{LINK_OR_COMMAND}} | DEF-XXX / — |
