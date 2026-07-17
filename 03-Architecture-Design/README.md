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

## Gate 03

- [ ] Requirement Critical/Must có design link.
- [ ] Boundary, contract, data/state/failure/security/observability đủ rõ.
- [ ] Security Profile/control mapping, threat/regulatory applicability và security verification plan đã review.
- [ ] UI applicable có design system, responsive/accessibility và prototype evidence cho journey High/Critical; tool decision có rationale.
- [ ] ERD/cardinality/data dictionary và API request/response/error/permission traceable tới requirement/test.
- [ ] ADR cho quyết định khó đảo ngược hoặc ảnh hưởng cost/NFR/lock-in.
- [ ] Critical security risk đã được xử lý; High có mitigation/owner/expiry hoặc gate Fail/Conditional đúng policy.
