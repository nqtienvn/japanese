# TDD Specification — {{MODULE_OR_RULE}}

## Test basis

| Field | Value |
| :--- | :--- |
| Requirements/design | {{IDS}} |
| Rule/risk under test | {{RULE_RISK}} |
| Owner | {{OWNER}} |

## Examples và boundaries

| Example | Input/context | Expected | Boundary/partition |
| :--- | :--- | :--- | :--- |
| EX-001 | {{INPUT}} | {{EXPECTED}} | Happy / Edge / Invalid / Permission / Concurrency |

## Red–Green–Refactor tracker

| TC | Red evidence | Minimal green change | Refactor | Regression result |
| :--- | :--- | :--- | :--- | :--- |
| TC-UNIT-001 | {{FAILURE}} | {{CHANGE}} | {{REFACTOR}} | {{RESULT}} |

## Completion

- [ ] Test thất bại vì đúng hành vi thiếu/sai, không vì setup.
- [ ] Implementation tối thiểu làm test pass và không phá test liên quan.
- [ ] Refactor giữ nguyên behavior và cải thiện design.
- [ ] Negative/boundary/error path và mutation/property test được cân nhắc.
