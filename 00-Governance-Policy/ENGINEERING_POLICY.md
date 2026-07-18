---
artifact_id: DOC-00-GOVERNANCE-POLICY-ENGINEERING-POLICY-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Engineering, Security & Documentation Policy

Detailed controls regarding security/privacy are located in `SECURITY_AND_PRIVACY_STANDARD.md`; the protocol for how the AI requests human assistance is located in `HUMAN_AI_COLLABORATION_PROTOCOL.md`. In case of conflict, the specific/approved controls in those two documents take precedence over the general guidelines here.

## 1. Principles

- Evidence before claim; traceability before completion.
- Least privilege, secure by default, privacy by design.
- Do not hard-code secrets; do not use real data for testing without authorization and protection.
- Keep changes small, reviewable, and rollbackable; do not break compatibility silently.
- Prioritize existing conventions of the brownfield repository.

## 2. Code quality

- Pin critical runtimes/dependencies and maintain the lockfile.
- Use formatters/linters/types/static analysis suitable for the stack.
- Separate business logic from transport/persistence when beneficial for testability.
- Apply SOLID, DRY, KISS, YAGNI, or Clean Architecture based on context and evidence; do not turn pattern names into release-blocking requirements if measurement or acceptance criteria are missing.
- Design modules with clear responsibilities, contracts, dependencies, and blast radius; do not absolutely require "no impact on other modules".
- Validate at trust boundaries; handle errors in a structured manner and do not expose sensitive information.
- Log with correlation IDs; do not log passwords/tokens/secrets/PII unnecessarily.

## 3. Version control and review

- Do not overwrite unexplained changes from the Client.
- Branches/commits/PRs must link to work items (`WI`) and requirement IDs.
- Reviews must verify correctness, security, testing, migrations, observability, documentation, and rollbacks.
- Critical/High changes require appropriate domain/security reviewers.

## 4. Testing

- Unit test business rules; integration test boundaries; contract test integrations; E2E test critical user journeys.
- Implement negative/security tests based on the threat model.
- Tests must be deterministic; flaky tests are not considered stable passes.
- Coverage is a signal, not a substitute for quality assertions and risk coverage.
- Line/branch/function coverage thresholds must be tailored by risk, layer, tool, and exclusion; do not apply a generic 90% threshold without rationale.

## 5. Security/privacy baseline

- Default deny; least privilege; MFA/step-up for sensitive actions when needed.
- Encryption in transit and at rest based on classification/risk.
- Retention, deletion, export, and auditing must be designed for personal data (PII).
- Dependency/security scans and threat modeling prior to release based on risk level.
- Select `STANDARD`, `HIGH`, or `CRITICAL` profile; security verification and release gates follow the approved profile.

## 5A. UI/UX and prototype

- For products with a UI, define the design system reference, components, typography, colors, responsive/accessibility targets, and exact interaction/error states.
- A prototype is required before production UI for High/Critical journeys or when acceptance depends on interaction; prototypes/spikes can be coded early if marked as non-production and having learning objectives.
- Figma, Penpot, MCP, or design-to-code are tool options; not required if unavailable, unsuitable, or if the project has no UI. The decision to mark as N/A or tailor must have a rationale.
- Generated/design-to-code output must pass code reviews, accessibility, security, performance, and maintainability checks; do not treat exports as production-ready evidence.

## 6. Documentation and evidence

- Documents must have an owner, version/status, and a changelog once they are baselined.
- Diagrams and source specifications should be text-based and version-controlled where feasible.
- Test/build execution logs must record environment, version, date, and results.
- Do not delete decision history; supersede with a new ADR/change record.

## 7. Exceptions

| Exception ID | Policy | Reason | Risk | Mitigation | Approver | Expiry |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| EXC-001 | {{POLICY}} | {{REASON}} | {{RISK}} | {{MITIGATION}} | {{APPROVER}} | {{DATE}} |
