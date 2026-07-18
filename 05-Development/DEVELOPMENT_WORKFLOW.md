---
artifact_id: DOC-05-DEVELOPMENT-DEVELOPMENT-WORKFLOW-MD
phase: "05-Development"
artifact_type: development
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Development Workflow — {{PROJECT_NAME}}

## 1. Start a work item

1. Select a `WI-XXX` that is in Ready status and read the linked requirement/design/ADR.
2. Check the worktree and preserve unrelated changes.
3. Confirm acceptance criteria, test approach, migration/compatibility, and approval boundaries.
4. Create small changes along a vertical slice; avoid out-of-scope refactoring unless necessary.

## 2. Local loop

```text
{{INSTALL_COMMAND}}
{{FORMAT_LINT_TYPE_COMMANDS}}
{{UNIT_TEST_COMMAND}}
{{INTEGRATION_TEST_COMMAND}}
{{BUILD_COMMAND}}
```

Record actual commands and results in the work item/test report. Do not run migrations or destructive scripts that are not understood and approved.

## 3. Implementation rules

- Validate input at trust boundaries; enforce authorization server-side.
- Use parameter binding/prepared statements or ORM parameterization; dynamic database identifiers must be selected from an allowlist.
- Design stable error contracts; implement retry/idempotency according to the EDS.
- Do not log secrets, tokens, passwords, or PII unnecessarily.
- Add telemetry for critical journeys and failure points.
- Maintain compatibility or document breaking changes, migrations, and release plans.
- Test business rules, negative paths, and regressions alongside code changes.
- Apply SOLID, DRY, KISS, YAGNI, or Clean Architecture based on context; prioritize correctness, convention, and evidence over forcing design patterns.
- Execute changes within the repository, update tests/docs/RTM, and report paths/evidence; do not just output snippets if the engagement requires actual delivery.

## 4. Review and merge readiness

- [ ] Acceptance criteria of the WI are met and the RTM contains code/test evidence.
- [ ] Relevant formatter, linter, type-check, static analysis, build, and tests pass.
- [ ] Migrations, feature flags, and configuration documentation are updated.
- [ ] Security, privacy, performance, and operations impacts are reviewed.
- [ ] Changelog, technical debt, and runbooks are updated as needed.

## 5. CI evidence

| Pipeline/check | Command/job | Target | Latest result/link |
| :--- | :--- | :--- | :--- |
| Build | {{COMMAND}} | Pass | {{EVIDENCE}} |
| Unit/integration | {{COMMAND}} | Pass | {{EVIDENCE}} |
| Security/dependency | {{COMMAND}} | No unaccepted High/Critical | {{EVIDENCE}} |
