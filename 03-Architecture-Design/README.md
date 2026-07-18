---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-README-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Phase 03 — Architecture & Design

## Objective

Translate requirements into detailed designs sufficient for coding and verification: system context, container/component architecture, domain/data models, API/events, state/sequence flows, UX, security/privacy, observability, capacity, and failure handling. Trade-off decisions must have a corresponding ADR.

## Artifacts

- `SOFTWARE_ARCHITECTURE.md`: overall architecture and quality attributes.
- `DATA_MODEL_ERD.md`: ERD, data dictionary, relationship/integrity, classification, and migration.
- `API_SPECIFICATION.md`: API/event/communications contracts, errors, auth, idempotency, and compatibility.
- `ADR_TEMPLATE.md`: architecture decisions with context, options, and consequences.
- `ENGINEERING_DESIGN_SPEC.md`: design for modules/vertical slices.
- `DESIGN_REVIEW.md`: checklist, findings, and sign-off.
- `THREAT_MODEL.md`: assets, trust boundaries, threats, and mitigations.
- `DOMAIN_MODEL.md`: bounded context, aggregate, invariant, state, and domain events.
- `PERMISSION_MATRIX.md`: role/resource/action/scope, deny-by-default, and privileged controls.
- `ASVS_MAPPING.md`: map security controls to versioned ASVS verification items.
- `SECURITY_ADOPTION_RECORD.md`: decisions to adopt/adapt/reject/N/A for each snapshot component or cross-language equivalent.
- `UI_UX_SPECIFICATION.md`: screen inventory, navigation, wireframe, and accessibility evidence when UI is applicable.
- `PHYSICAL_DATABASE_DESIGN.md`: physical table/index/partition/security design.
- `contracts/openapi.yaml`, `contracts/asyncapi.yaml`, `CONTRACT_VALIDATION.md`: machine-readable interface contracts.

## Gate 03

- [ ] Critical/Must requirements have design links.
- [ ] Boundaries, contracts, data/state/failure/security/observability are sufficiently clear.
- [ ] Security Profile/control mapping, threat/regulatory applicability, and security verification plan are reviewed.
- [ ] Security Adoption Record includes all components; non-Java stacks have native responsibility mapping and contract test plans.
- [ ] Domain Model, Permission Matrix, and ASVS Mapping are traced to requirements/tests.
- [ ] OpenAPI/AsyncAPI contract validation passed or has a documented N/A rationale.
- [ ] When UI is applicable, design system, responsive/accessibility, and prototype evidence for High/Critical user journeys are defined; tool decisions have rationales.
- [ ] ERD/cardinality/data dictionary and API request/response/error/permissions are traceable to requirements/tests.
- [ ] ADRs are created for decisions that are hard to reverse or impact cost/NFRs/lock-in.
- [ ] Critical security risks are resolved; High risks have mitigations/owners/expiry or the gate is marked Fail/Conditional per policy.
