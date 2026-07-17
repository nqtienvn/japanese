---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-DOMAIN-MODEL-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Domain Model — {{PROJECT_NAME}}

| Field | Value |
| :--- | :--- |
| Version/status | {{VERSION}} / {{STATUS}} |
| Owner/reviewer | {{OWNER}} / {{REVIEWER}} |
| Requirements | {{BR_FR_UC_IDS}} |

## Bounded contexts

| Context ID | Context/name | Responsibility | Owned data | Upstream/downstream | Invariants | ADR/design |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| BC-001 | {{CONTEXT}} | {{RESPONSIBILITY}} | {{DATA}} | {{DEPENDENCIES}} | {{INVARIANTS}} | ADR/DES-XXX |

## Aggregate and value-object catalog

| Aggregate ID/root | Entities/value objects | Commands | Domain events | Invariants | Transaction boundary | Permission | Tests |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| AGG-001 / {{ROOT}} | {{MEMBERS}} | {{COMMANDS}} | {{EVENTS}} | {{INVARIANTS}} | {{BOUNDARY}} | {{PERMISSION}} | TC-DOMAIN-XXX |

## Domain state and lifecycle

| State machine ID | Entity | From → event/condition → to | Actor | Rejection/error | Audit/event | Test |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| STATE-001 | {{ENTITY}} | {{TRANSITION}} | {{ACTOR}} | {{ERROR}} | {{AUDIT}} | TC-STATE-XXX |

## Language/framework mapping

| Domain concept | Target implementation | Compatibility rule | Owner |
| :--- | :--- | :--- | :--- |
| Aggregate | {{CLASS_MODULE}} | {{COMPATIBILITY}} | {{OWNER}} |
| Domain event | {{EVENT_SCHEMA}} | {{COMPATIBILITY}} | {{OWNER}} |

## Gate checklist

- [ ] Every aggregate has one owner and an explicit boundary.
- [ ] Every invariant has enforcement and a negative test.
- [ ] Domain terminology matches glossary, API, database and UI.
- [ ] Cross-language implementation preserves invariant and event contract.
