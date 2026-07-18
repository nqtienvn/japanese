# Nine phase gates

## Table of Contents

1. General Rules
2. Gate 00–08
3. Reopen gate

## 1. General Rules

Each gate requires a 'Pass', 'Conditional Pass' with a designated owner and deadline, or 'Fail' evaluation. The mere existence of a file is not sufficient evidence. Critical or High risks without a designated owner shall not auto-pass.

## 2. Gate 00–08

### Gate 00 — Governance ready

- Charter, sponsor, owner, approver, and escalation paths are clear.
- Autonomy and approval boundaries are clear.
- Security, privacy, and engineering policies have designated owners.
- Security Profile, risk appetite, regulatory applicability, and security release rules are clear.
- Bank Security Reference Baseline, proprietary code claim boundaries, and portability rules are clear.
- Human-assistance triggers and protocols are clear; the AI does not offload tasks simply because they are difficult or time-consuming.
- Definition of Ready, Definition of Done, and change control models are selected.
- Standards alignment/tailoring and document quality controls have designated owners; do not claim unverified certifications.

### Gate 01 — Problem and plan baseline

- Discovery coverage meets standard criteria; critical contradictions are resolved.
- Problem, users, outcomes, metrics, and scope/out-of-scope boundaries are clear.
- Roadmap, dependencies, budget/time constraints, and risk register have designated owners.
- The baseline is approved or decision rights have been delegated.

### Gate 02 — Requirements baseline

- BR/FR/NFR/UC/US items have unique IDs, priorities, sources, and acceptance criteria.
- Core workflows, edge cases, error paths, permissions, and data rules are clear.
- NFRs have targets and measurement methods; the RTM has no orphan requirements.
- Initial release scope is testable and free of contradictions.
- BRD/SRS/Feature Catalog/Use Case Specification contain complete workflows and structural controls: version history, glossary, and UI/Hardware/Software/Communications interfaces.
- Requirements are atomic, use correct imperative keywords, and are unambiguous, measurable, feasible, consistent, testable, and traceable.
- Security/privacy requirements map to profiles, data, threats, and acceptance criteria; UI/tool applicability has N/A/tailoring rationales.
- SRS does not substitute architecture, database, or API design for requirements; design constraints have documented sources/rationales.

### Gate 03 — Design ready

- C4 context, container, and component models align with the project scale.
- ADRs document trade-offs; data, API, UX, state, and integration designs are clear.
- Threat models, privacy, capacity, observability, and failure handling are considered.
- Security Profile control mapping, regulatory applicability, and Critical/High risk treatments have review evidence.
- The Security Adoption Record evaluates all snapshot components; non-Java stacks have cross-language responsibility mappings.
- For applicable UIs, design system, responsive design, accessibility, and prototype evidence for High/Critical journeys are clear; tools are not locked in without documented rationales.
- The design maps to all requirements and has review evidence.
- SAD, ERD/data dictionary, and API/event specifications have versions, exact contracts/errors/permissions/compatibility, and test links.

### Gate 04 — Implementation ready

- Work items organized by vertical slice have dependencies, acceptance criteria, and test plans.
- Environments, migrations, compatibility, feature flags, release, and rollback plans are clear.
- Critical unknowns are spiked/resolved; estimation and sequencing are feasible.
- Module contracts, dependency/blast radius, compatibility, and regression boundaries are clear; do not assume "no impact on other modules" without evidence.
- External, manual, or approval dependencies have owners and minimal assistance plans.
- No work items are missing links to requirements or design.

### Gate 05 — Build complete

- In-scope code/config is completed and reviewed.
- Build, lint, static analysis, and unit test targets are met.
- Secrets do not reside in source code; error handling, logging, and observability are implemented.
- Security scans and controls according to the profile meet severity gate requirements; database, input, and trust boundary controls have code evidence.
- Security components adopted/refactored build in the target stack; known snapshot findings are resolved or rejected with a rationale.
- Tech debt and known limitations are recorded; the RTM has code evidence.

### Gate 06 — Quality accepted

- Integration, E2E, regression, and risk-based security/performance tests passed.
- Defects exceeding severity thresholds are closed or approved.
- UAT/acceptance has evidence; migrations, rollbacks, and smoke tests are verified as applicable.
- The test report documents coverage, environments, limitations, and residual risks.
- Code coverage is tailored by risk/layer/tool/exclusion; do not use a single overall percentage to substitute for requirement/risk coverage.
- Security verification according to the profile is successful; no open Critical security risks/vulnerabilities remain, and High risks are accepted by correct owners with expiry dates.
- The Security Verification Matrix contains passing evidence for all applicable `SEC-BNK` Must requirements and cross-language equivalence contracts.
- The three tiers of test documentation are complete: Policy/Plan, Specification/Test Cases, and Status/Completion/Traceability.
- Test cases have unique IDs, separate input data, and exact expected results; the Test RTM maps SRS → TC → result → defect → retest.
- The audit of 2-3 complex features and the Tester Derivation Test passed; unresolved blocking clarifications result in a gate Failure.

### Gate 07 — Release/report complete

- Release notes, status, deviations, incidents, and KPIs are updated.
- The release artifact/version is identifiable and reproducible to the extent possible.
- Operational readiness and rollback owners are clear.
- The Final Report accurately reflects delivered vs planned outcomes.
- The Security Profile, scan/penetration test scope, exclusions, and residual risk decisions are accurately reflected.

### Gate 08 — Handover accepted

- The document index, glossary/references, user guide, and runbook are complete.
- Setup, operation, monitoring, backup/restore, troubleshooting, and rollback procedures are clear.
- Ownership, access/secret transfer needs, support/SLAs, and residual risks are clear.
- The recipient can continue the project without relying on chat history/context.
- The Deployment Guide, User Guide, and Runbook cover config, deploy, migrate, smoke, rollback, and troubleshooting.
- The New Developer/Ops Readiness Test from a clean baseline passes without requiring author queries at blocking steps.

## 3. Reopen gate

Gate 02, 03, 06 and 08 SHALL NOT be marked Passed from a `PROJECT_STATE.md` status edit alone. The reviewer must verify the required artifact set, concrete evidence paths, traceability, sign-off/approver and gate-specific conditions. A stale, placeholder or empty evidence cell is a gate failure.

Reopen the gate when requirements/scope change, testing reveals incorrect assumptions, the design is infeasible, production incidents expose gaps, or handover information is insufficient. Record the reason, downstream impact, and artifacts requiring re-verification; do not delete historical evidence.
