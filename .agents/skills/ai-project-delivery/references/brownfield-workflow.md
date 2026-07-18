# Brownfield workflow

## Table of Contents

1. Preserve Current State
2. Audit
3. Reconstruct Existing Behavior
4. Gap analysis
5. Continue Delivery

## 1. Preserve Current State

- Read `AGENTS.md` and repository guidelines first.
- Check git/worktree and treat any unrecognized changes as user-originated.
- Do not perform bulk resets, deletions, overwrites, or formatting.
- Document the current commit/ref if available; do not commit/push without explicit request.
- Do not execute scripts/migrations of unknown intent without reading them first.

## 2. Audit

Gather evidence in the following order:

1. Repository structure, manifests, language/framework, and entry points.
2. README, ADRs, SRS, issue notes, CI/CD, and container/infra configs.
3. Modules, routes/APIs, data models/migrations, integrations, and authentication boundaries.
4. Build/lint/test commands and recent status.
5. TODO/FIXME, disabled/skipped tests, feature flags, mocks/stubs, and secret/config gaps.
6. Git history/recent changes when useful and authorized.
7. Safe runtime/log evidence if available.

When codebase graphs are available, index if necessary and use the graph to discover symbols, callers, dependencies, and architecture. Use text search for literals, config files, and non-code documentation.

You can run `scripts/audit_project.ps1 -ProjectRoot <path>` to obtain the initial inventory; treat the output as recommendations, not final conclusions.

## 3. Reconstruct Existing Behavior

- Describe the "as-is" state from code/tests, keeping it separate from the "to-be" specifications in documentation.
- Map modules → capabilities → routes/UIs → data → integrations → tests.
- Identify behaviors as tested, inferred, or unknown.
- Create characterization tests for critical behaviors lacking protection before refactoring.
- Do not modify behavior simply to match old documentation; raise contradictions for decisions.

## 4. Gap analysis

Record in `01-Planning/BROWNFIELD_AUDIT.md`:

| Gap | Expected | Current Evidence | Risk | Action | Phase |
| :--- | :--- | :--- | :--- | :--- | :--- |

Classification: missing, partial, contradictory, obsolete, unverified, unsafe. Determine the first unmet gate and the critical path. Only query stakeholders for aspects that cannot be proven: current objectives, priorities, desired behaviors, constraints, acceptance criteria, and historical decisions that still impact the project.

## 5. Continue Delivery

1. Establish the baseline for "as-is + target delta".
2. Retain old traceability IDs if stable; create a mapping if they must change.
3. Address Critical/High risks blocking delivery first or obtain approved risk acceptance.
4. Continue from the first unmet gate, but update missing phase artifacts before implementing code.
5. Verify regressions, migrations, rollbacks, and compatibility.
6. Hand over existing parts, newly implemented features, unverified components, and remaining technical debt.
