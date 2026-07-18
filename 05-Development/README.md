---
artifact_id: DOC-05-DEVELOPMENT-README-MD
phase: "05-Development"
artifact_type: development
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Phase 05 — Development

## Objective

Implement vertical slices in accordance with approved policies and designs, keeping the repository buildable and testable at all times, maintaining traceability, and preserving existing codebase work. Source code may reside in the root or in pre-existing project folders; this phase does not dictate specific frameworks.

## Artifacts

- `PROJECT_STRUCTURE.md`: code/module/owner/entry point map.
- `DEVELOPMENT_WORKFLOW.md`: setup, branching, building, testing, CI, and evidence.
- `CODE_REVIEW_CHECKLIST.md`: correctness/security/testing/operations review checklist.
- `TECH_DEBT_REGISTER.md`: technical debt, impact, triggers, and owners.
- `PULL_REQUEST_TEMPLATE.md`: pull request description with trace links.
- `DEVOPS_IAC_AND_PIPELINE.md`: pipeline, IaC, artifact provenance, promotion, and rollback.
- `CONTAINER_SECURITY_PROFILE.md`: container/image/runtime controls and scan evidence.

## Gate 05

- [ ] In-scope code, configuration, and migrations are completed and reviewed.
- [ ] Build, lint, type-checking, static analysis, and unit checks meet targets.
- [ ] Auth, error handling, logging, observability, and secrets management follow design specifications.
- [ ] RTM, changelog, technical debt register, and documentation are updated; known limitations are documented.
- [ ] Pipeline/IaC/container controls have Apply/Tailor/N/A rationales and evidence.
