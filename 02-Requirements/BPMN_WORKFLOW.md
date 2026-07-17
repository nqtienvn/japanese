---
artifact_id: DOC-02-REQUIREMENTS-BPMN-WORKFLOW-MD
phase: "02-Requirements"
artifact_type: requirements
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# BPMN Workflow & Business Process Specification — {{PROJECT_NAME}}

| Field | Value |
| :--- | :--- |
| Process ID/version | `{{PROCESS_ID}}` / `{{VERSION}}` |
| Owner/reviewer | {{OWNER}} / {{REVIEWER}} |
| Requirements | {{BR_FR_UC_IDS}} |
| Machine-readable BPMN | `{{BPMN_XML_PATH}}` |

## Process inventory

| Process ID | Name/trigger | Start/end event | Lanes/roles | SLA | Main outcome | Exception outcome | Requirements/tests |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| BPMN-001 | {{PROCESS_NAME}} / {{TRIGGER}} | {{START_END}} | {{LANES}} | {{SLA}} | {{OUTCOME}} | {{EXCEPTION}} | FR/BR/UC/TC-XXX |

## Flow model

```mermaid
flowchart LR
    Start((Start)) --> T1[Task: {{TASK_1}}]
    T1 --> G{Gateway: {{DECISION}}}
    G -->|Yes| T2[Task: {{TASK_2}}]
    G -->|No| E1[Error/compensation: {{ERROR}}]
    T2 --> End((End))
    E1 --> End
```

## Task and gateway catalog

| Element ID | BPMN type | Lane/actor | Input/output | Rule/permission | Timeout/retry | Audit/event | Requirement/test |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| TASK-001 | Task / Service Task / User Task | {{LANE}} | {{IO}} | {{RULE_PERMISSION}} | {{RESILIENCE}} | {{AUDIT_EVENT}} | FR/TC-XXX |
| GATE-001 | Exclusive / Parallel / Event gateway | {{LANE}} | {{CONDITION}} | {{RULE}} | {{TIMEOUT}} | {{AUDIT_EVENT}} | BR/TC-XXX |

## Message, data and exception flow

| Flow ID | From → to | Message/data | Trust boundary | Idempotency/correlation | Failure/compensation | Verification |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| MSG-001 | {{SOURCE}} → {{DESTINATION}} | {{DATA}} | {{BOUNDARY}} | {{IDEMPOTENCY}} | {{FAILURE}} | TC-XXX |

## Gate evidence

- [ ] Every start/end event has a measurable outcome.
- [ ] Every gateway condition maps to a business rule.
- [ ] Every user/service task maps to an actor and permission.
- [ ] Error, timeout, retry, compensation and audit paths have tests.
- [ ] BPMN XML or equivalent machine-readable artifact validates before Gate 02.
