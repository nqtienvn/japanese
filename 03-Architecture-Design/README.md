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

## Mục tiêu

Chuyển requirements thành thiết kế đủ để code và verify: system context, container/component, domain/data, API/event, state/sequence, UX, security/privacy, observability, capacity và failure handling. Quyết định trade-off phải có ADR.

## Artifact

- `SOFTWARE_ARCHITECTURE.md`: kiến trúc tổng thể và các quality attribute.
- `DATA_MODEL_ERD.md`: ERD, data dictionary, relationship/integrity, classification và migration.
- `API_SPECIFICATION.md`: API/event/communications contracts, errors, auth, idempotency và compatibility.
- `ADR_TEMPLATE.md`: quyết định kiến trúc có context/options/consequences.
- `ENGINEERING_DESIGN_SPEC.md`: thiết kế cho module/vertical slice.
- `DESIGN_REVIEW.md`: checklist, finding và sign-off.
- `THREAT_MODEL.md`: asset, trust boundary, threat và mitigation.
- `DOMAIN_MODEL.md`: bounded context, aggregate, invariant, state và domain event.
- `PERMISSION_MATRIX.md`: role/resource/action/scope, deny-by-default và privileged controls.
- `ASVS_MAPPING.md`: map security controls tới versioned ASVS verification items.
- `SECURITY_ADOPTION_RECORD.md`: quyết định adopt/adapt/reject/N/A cho từng snapshot component hoặc cross-language equivalent.
- `UI_UX_SPECIFICATION.md`: screen inventory, navigation, wireframe và accessibility evidence khi UI applicable.
- `PHYSICAL_DATABASE_DESIGN.md`: physical table/index/partition/security design.
- `contracts/openapi.yaml`, `contracts/asyncapi.yaml`, `CONTRACT_VALIDATION.md`: machine-readable interface contracts.

## Gate 03

- [ ] Requirement Critical/Must có design link.
- [ ] Boundary, contract, data/state/failure/security/observability đủ rõ.
- [ ] Security Profile/control mapping, threat/regulatory applicability và security verification plan đã review.
- [ ] Security Adoption Record đủ component; stack ngoài Java có native responsibility mapping và contract test plan.
- [ ] Domain Model, Permission Matrix và ASVS Mapping đã được trace tới requirement/test.
- [ ] OpenAPI/AsyncAPI contract validation đạt hoặc có N/A rationale.
- [ ] UI applicable có design system, responsive/accessibility và prototype evidence cho journey High/Critical; tool decision có rationale.
- [ ] ERD/cardinality/data dictionary và API request/response/error/permission traceable tới requirement/test.
- [ ] ADR cho quyết định khó đảo ngược hoặc ảnh hưởng cost/NFR/lock-in.
- [ ] Critical security risk đã được xử lý; High có mitigation/owner/expiry hoặc gate Fail/Conditional đúng policy.
