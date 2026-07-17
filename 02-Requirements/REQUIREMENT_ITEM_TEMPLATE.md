# Requirement Item Template

## Document control

| Field | Value |
| :--- | :--- |
| ID / type | `FR-XXX` / BR / FR / NFR / UC / US |
| Title | {{TITLE}} |
| Source / owner | {{SOURCE}} / {{OWNER}} |
| Priority | Must / Should / Could / Won't now |
| Status | Draft / Approved / Implemented / Verified / Deprecated |

## Statement

`The system shall {{BEHAVIOR}} for {{ACTOR}} when {{TRIGGER}} so that {{VALUE}}.`

Requirement phải **atomic**: đúng một subject và một obligation. Nếu có hai hành vi verify độc lập, tách thành hai ID. Dùng từ khóa đúng semantics:

- `SHALL / PHẢI`: mandatory.
- `SHALL NOT / KHÔNG ĐƯỢC`: mandatory prohibition.
- `SHOULD / NÊN`: recommendation, không tự động blocking.
- `MAY / CÓ THỂ`: permission/optional, không phải obligation.

## Context và rationale

{{RATIONALE}}

## Preconditions, inputs và outputs

- Preconditions: {{PRECONDITIONS}}
- Input/data rules: {{INPUT}}
- Output/side effects: {{OUTPUT}}

## Flow

1. Trigger: {{TRIGGER}}
2. Happy path: {{HAPPY_PATH}}
3. Alternate path: {{ALTERNATE_PATH}}
4. Error/recovery: {{ERROR_PATH}}

## Acceptance criteria

```gherkin
Scenario: {{SCENARIO}}
  Given {{CONTEXT}}
  When {{ACTION}}
  Then {{OBSERVABLE_RESULT}}
  And {{BUSINESS_OR_DATA_ASSERTION}}
```

## Quality attributes review

| Atomic | Unambiguous | Measurable | Feasible | Consistent | Testable | Traceable | Reviewer/evidence |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| Pass / Fail | Pass / Fail | Pass / Fail | Pass / Fail | Pass / Fail | Pass / Fail | Pass / Fail | {{EVIDENCE}} |

## Rules và NFR

| Linked ID | Áp dụng thế nào |
| :--- | :--- |
| BR-XXX | {{RULE}} |
| NFR-XXX | {{TARGET_AND_MEASURE}} |

## Trace links

| Design/ADR | Work item | Code/config | Test | Release |
| :--- | :--- | :--- | :--- | :--- |
| DES/ADR-XXX | WI-XXX | {{PATH_OR_SYMBOL}} | TC-XXX | REL-XXX |
