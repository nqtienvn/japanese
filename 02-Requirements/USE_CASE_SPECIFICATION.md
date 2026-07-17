---
artifact_id: DOC-02-REQUIREMENTS-USE-CASE-SPECIFICATION-MD
phase: "02-Requirements"
artifact_type: requirements
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Use Case Specification — UC-{{NNN}} / {{USE_CASE_NAME}}

| Field | Value |
| :--- | :--- |
| Feature / requirements | {{FEATURE_ID}} / {{BR_FR_NFR_IDS}} |
| Primary actor / owner | {{ACTOR}} / {{OWNER}} |
| Priority / release | {{PRIORITY}} / {{RELEASE}} |
| Version / status | {{VERSION}} / Draft / Approved / Implemented / Verified |

## 1. Goal and Business Outcome

- Actor goal: {{ACTOR_GOAL}}
- Business value/KPI: {{VALUE_KPI}}
- Trigger: {{TRIGGER}}
- Frequency/volume/context: {{CONTEXT}}

## 2. Preconditions and Guarantees

- Preconditions: {{PRECONDITIONS}}
- Success guarantee/postcondition: {{SUCCESS_POSTCONDITION}}
- Minimal/failure guarantee: {{FAILURE_GUARANTEE}}

## 3. Main Success Flow

| Step | Actor/System | Action/input | Rule/validation | Observable result/state | Trace ID |
| :---: | :--- | :--- | :--- | :--- | :--- |
| 1 | {{ACTOR_SYSTEM}} | {{ACTION_INPUT}} | {{RULE}} | {{RESULT_STATE}} | FR/BR-XXX |

## 4. Alternate Flows

| Flow ID | Branch Condition | Steps/behavior | Final state/outcome | Notification/audit |
| :--- | :--- | :--- | :--- | :--- |
| UC-{{NNN}}-A1 | {{CONDITION}} | {{BEHAVIOR}} | {{OUTCOME}} | {{AUDIT}} |

## 5. Exception and Recovery Flows

| Flow ID | Failure/Edge Case | Required response/error | Retry/idempotency/recovery | Final state | Owner Alerted |
| :--- | :--- | :--- | :--- | :--- | :--- |
| UC-{{NNN}}-E1 | Invalid/empty input | {{RESPONSE}} | {{RECOVERY}} | {{STATE}} | {{OWNER}} |
| UC-{{NNN}}-E2 | Network/dependency timeout | {{RESPONSE}} | {{RETRY_FALLBACK}} | {{STATE}} | {{OWNER}} |
| UC-{{NNN}}-E3 | Double-submit/duplicate | {{RESPONSE}} | {{IDEMPOTENCY}} | {{STATE}} | {{OWNER}} |
| UC-{{NNN}}-E4 | Concurrent update/partial failure | {{RESPONSE}} | {{CONFLICT_COMPENSATION}} | {{STATE}} | {{OWNER}} |

## 6. Data and Permission Rules

| Data/Operation | Source/validation | Read/write permission | Classification | Audit/retention |
| :--- | :--- | :--- | :--- | :--- |
| {{DATA_OPERATION}} | {{SOURCE_RULE}} | {{ROLE_PERMISSION}} | {{CLASS}} | {{AUDIT_RETENTION}} |

## 7. NFR and Service Behavior

| NFR ID | Target | Load/window/environment | Measurement/pass-fail |
| :--- | :--- | :--- | :--- |
| NFR-XXX | {{TARGET}} | {{CONTEXT}} | {{METHOD_THRESHOLD}} |

## 8. Acceptance Criteria

```gherkin
Scenario: {{SCENARIO_NAME}}
  Given {{PRECONDITION_AND_ROLE}}
  When {{ACTION_AND_INPUT}}
  Then {{OBSERVABLE_RESULT}}
  And {{STATE_DATA_AUDIT_ASSERTION}}
```

## 9. Traceability

| UI/UX | ADR/Design | API/Data | Work item/code | Test cases | Release/Handover |
| :--- | :--- | :--- | :--- | :--- | :--- |
| DES-UI-XXX | ADR/DES-XXX | API/DATA-XXX | WI-XXX / `path::symbol` | TC-XXX | REL-XXX / DOC-XXX |
