---
artifact_id: DOC-02-REQUIREMENTS-REQUIREMENT-ITEM-TEMPLATE-MD
phase: "02-Requirements"
artifact_type: requirements
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Requirement Item Template

## Document Control

| Field | Value |
| :--- | :--- |
| ID / type | `FR-XXX` / BR / FR / NFR / UC / US |
| Title | {{TITLE}} |
| Source / owner | {{SOURCE}} / {{OWNER}} |
| Priority | Must / Should / Could / Won't now |
| Status | Draft / Approved / Implemented / Verified / Deprecated |

## Statement

`The system SHALL {{BEHAVIOR}} for {{ACTOR}} when {{TRIGGER}} so that {{VALUE}}.`

The requirement must be **atomic**: exactly one subject and one obligation. If there are two independent verification behaviors, split them into two separate IDs. Use keywords with correct semantics:

- `SHALL`: mandatory.
- `SHALL NOT`: mandatory prohibition.
- `SHOULD`: recommendation, not automatically release-blocking.
- `MAY`: permission/optional, does not constitute an obligation.

## Context and Rationale

{{RATIONALE}}

## Preconditions, Inputs, and Outputs

- Preconditions: {{PRECONDITIONS}}
- Input/data rules: {{INPUT}}
- Output/side effects: {{OUTPUT}}

## Flow

1. Trigger: {{TRIGGER}}
2. Happy path: {{HAPPY_PATH}}
3. Alternate path: {{ALTERNATE_PATH}}
4. Error/recovery: {{ERROR_PATH}}

## Acceptance Criteria

```gherkin
Scenario: {{SCENARIO}}
  Given {{CONTEXT}}
  When {{ACTION}}
  Then {{OBSERVABLE_RESULT}}
  And {{BUSINESS_OR_DATA_ASSERTION}}
```

## Quality Attributes Review

| Atomic | Unambiguous | Measurable | Feasible | Consistent | Testable | Traceable | Reviewer/evidence |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :--- |
| Pass / Fail | Pass / Fail | Pass / Fail | Pass / Fail | Pass / Fail | Pass / Fail | Pass / Fail | {{EVIDENCE}} |

## Rules and NFRs

| Linked ID | How it Applies |
| :--- | :--- |
| BR-XXX | {{RULE}} |
| NFR-XXX | {{TARGET_AND_MEASURE}} |

## Trace Links

| Design/ADR | Work item | Code/config | Test | Release |
| :--- | :--- | :--- | :--- | :--- |
| DES/ADR-XXX | WI-XXX | {{PATH_OR_SYMBOL}} | TC-XXX | REL-XXX |
