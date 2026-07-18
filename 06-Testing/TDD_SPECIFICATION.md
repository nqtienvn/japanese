---
artifact_id: DOC-06-TESTING-TDD-SPECIFICATION-MD
phase: "06-Testing"
artifact_type: testing
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# TDD Specification — {{MODULE_OR_RULE}}

## Test basis

| Field | Value |
| :--- | :--- |
| Requirements/design | {{IDS}} |
| Rule/risk under test | {{RULE_RISK}} |
| Owner | {{OWNER}} |

## Examples and boundaries

| Example | Input/context | Expected | Boundary/partition |
| :--- | :--- | :--- | :--- |
| EX-001 | {{INPUT}} | {{EXPECTED}} | Happy / Edge / Invalid / Permission / Concurrency |

## Red–Green–Refactor tracker

| TC | Red evidence | Minimal green change | Refactor | Regression result |
| :--- | :--- | :--- | :--- | :--- |
| TC-UNIT-001 | {{FAILURE}} | {{CHANGE}} | {{REFACTOR}} | {{RESULT}} |

## Completion

- [ ] Test failed due to actual missing/incorrect behavior, not setup errors.
- [ ] Minimum implementation makes the test pass and does not break related tests.
- [ ] Refactoring preserves existing behavior and improves code design.
- [ ] Negative, boundary, and error paths, as well as mutation/property testing, are considered.
