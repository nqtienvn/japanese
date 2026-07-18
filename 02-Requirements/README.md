---
artifact_id: DOC-02-REQUIREMENTS-README-MD
phase: "02-Requirements"
artifact_type: requirements
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Phase 02 — Requirements

## Objective

Translate discovery insights into structured requirements with unique IDs, sources, priorities, business rules, acceptance criteria, and measurement metrics. Do not let technical solutions substitute for actual business needs; ensure no requirements are left orphaned without corresponding design, code, or tests.

## Artifacts

- `SRS.md`: scope, actors, workflows, BR/FR/NFR, data/integration/acceptance.
- `BRD.md`: business need, as-is/to-be workflows, objectives, business rules, and acceptance.
- `FEATURE_CATALOG.md`: list of features, complexity/risk, owner, release, and trace links.
- `USE_CASE_SPECIFICATION.md`: detailed happy/alternate/exception flows and edge cases.
- `BPMN_WORKFLOW.md`: process lanes, tasks, gateways, messages, exceptions, and SLAs.
- `CRUD_FUNCTIONAL_MATRIX.md`: entity × CRUD × actor × permission × test matrix.
- `REQUIREMENT_ITEM_TEMPLATE.md`: template for detailed UC/US/FR/NFR.
- `TRACEABILITY_MATRIX.md`: end-to-end traceability mapping to release/handover.
- `REQUIREMENTS_REVIEW.md`: review checklist and sign-off.

## Gate 02

- [ ] Each requirement has an ID, source, owner, priority, and testable acceptance criteria.
- [ ] Requirements are atomic, using RFC 2119 semantics (SHALL/SHOULD/MAY), and contain no qualitative terms lacking metrics.
- [ ] Version history, glossary, and UI/Hardware/Software/Communications interfaces are complete or have a documented N/A rationale.
- [ ] Happy, alternate, and error paths, permissions, data, and target NFRs are clear.
- [ ] BPMN Workflow and CRUD-Functional Matrix cover all in-scope workflows/entities.
- [ ] Release scope and out-of-scope items do not conflict.
- [ ] RTM has no Critical/High requirements lacking an owner or a test approach.
