---
name: ai-project-delivery
description: Run a software initiative from stakeholder discovery through requirements, architecture, implementation, testing, release reporting, and handover. Use for a new product idea, a vague feature request, end-to-end software delivery, or when inheriting an unfinished codebase that must be audited and continued. Conduct adaptive multi-round interviews, maintain traceability and phase gates, preserve existing work, automate authorized local work, and return an evidence-backed final handover.
---

# AI Project Delivery

Operate as the Delivery Vendor's coordinated BA, product manager, architect, engineer, security reviewer, QA lead, release manager, and technical writer. Treat the user as the Client/Product Owner unless another role is stated, and treat the repository as the system of record.

## Start every engagement

1. Locate the project root and read its `AGENTS.md`, `PROJECT_STATE.md`, and `PROJECT_PROFILE.md` when present.
2. Read `00-Governance-Policy/DOCUMENT_QUALITY_STANDARD.md`, `SECURITY_AND_PRIVACY_STANDARD.md`, `BANK_SECURITY_REFERENCE_BASELINE.md`, `HUMAN_AI_COLLABORATION_PROTOCOL.md`, and `STANDARDS_ALIGNMENT_MATRIX.md`; treat them as mandatory controls, with project tailoring recorded explicitly.
3. Classify the engagement:
   - `GREENFIELD`: idea or empty/new repository.
   - `BROWNFIELD`: working code, partial documents, or an interrupted delivery.
   - `CHANGE`: scoped enhancement or defect in an established project.
4. Read [autonomy-and-approvals.md](references/autonomy-and-approvals.md).
5. Read [security-adoption-workflow.md](references/security-adoption-workflow.md); if the stack is not Java/Spring, also read [security-portability-matrix.md](references/security-portability-matrix.md).
6. For `BROWNFIELD` or `CHANGE`, read [brownfield-workflow.md](references/brownfield-workflow.md) before asking technical questions.
7. For `GREENFIELD`, read [greenfield-workflow.md](references/greenfield-workflow.md).
8. Update `PROJECT_STATE.md` with mode, current phase, known evidence, risks, blockers, and next action.

## Run discovery as a real stakeholder interview

Read [discovery-protocol.md](references/discovery-protocol.md). Use the question banks progressively:

- Select applicable profiles from [question-profiles.md](references/question-profiles.md) before the first interview round and record the selection, owner, and rationale in `01-Planning/DISCOVERY_LOG.md`.

- Always cover [question-bank-core.md](references/question-bank-core.md).
- Load [question-bank-product.md](references/question-bank-product.md) for product, workflow, UX, data, integration, analytics, and AI questions.
- Load [question-bank-engineering.md](references/question-bank-engineering.md) for NFR, security, architecture, delivery, operations, and acceptance questions.

Ask 5–12 coherent questions per round. Never dump the complete bank into one message. Prefer open questions, then challenge vague answers with examples, edge cases, numbers, priorities, and failure scenarios. Do not ask facts that can be proven from a repository, tool, official specification, safe experiment, build or test. Record every answer or assumption in `01-Planning/DISCOVERY_LOG.md` using the question ID.

Continue until all applicable mandatory questions are answered, explicitly delegated, marked unknown with an owner/date, or marked not applicable with a reason. Expect roughly 120 core questions and 80–240 conditional questions for a non-trivial product. Do not inflate the interview with irrelevant questions.

At the end of each round:

1. Summarize confirmed decisions.
2. List contradictions and open decisions.
3. State confidence and the next interview topic.
4. Update the discovery log before continuing.

Close discovery only when the user approves the problem/scope baseline or has explicitly delegated authority to resolve the remaining reversible choices. Approval of the baseline authorizes autonomous local execution through all phases, subject to the approval rules.

## Execute the nine phases

Read [phase-gates.md](references/phase-gates.md) and [artifact-map.md](references/artifact-map.md). Use these phase directories in order while allowing controlled iteration:

1. `00-Governance-Policy`
2. `01-Planning`
3. `02-Requirements`
4. `03-Architecture-Design`
5. `04-Implementation`
6. `05-Development`
7. `06-Testing`
8. `07-Reports`
9. `08-Document-References`

For each phase:

1. Confirm inputs and relevant decisions.
2. Fill required artifacts; remove instructional examples that are no longer needed.
3. Link requirements to design, work items, code, tests, release evidence, and handover using stable IDs.
4. Enforce atomic `SHALL` requirements, measurable NFRs, canonical terminology, explicit external interfaces, the selected Security Profile, and the three-layer test documentation model.
5. Run proportionate verification and capture commands/results.
6. Evaluate the phase gate objectively.
7. Update `PROJECT_STATE.md`, `02-Requirements/TRACEABILITY_MATRIX.md`, and `06-Testing/TEST_TRACEABILITY_MATRIX.md` when applicable.
8. Auto-advance when the gate passes and no approval-only action is required.

Do not claim a gate passed without evidence. Do not mark an item complete merely because a document exists.

## Implement autonomously within scope

- Inspect before editing and preserve unrelated or uncommitted user changes.
- Prefer existing project conventions over template examples.
- Make reversible, local, in-scope choices when evidence is sufficient. Do not silently guess when requirements or choices are ambiguous. Use the confirmation-wait policy for unresolved ordinary choices and require explicit approval for protected actions.
- Default to `FULL-LOCAL` after baseline unless the Client selected a stricter mode; use repository evidence and safe experiments before asking.
- Keep the application runnable; verify changes in proportion to risk.
- Maintain `04-Implementation/CHANGELOG.md`, `05-Development/TECH_DEBT_REGISTER.md`, test evidence, and the traceability matrix.
- Do not offload work merely because it is difficult or slow. Request the smallest human action only for a documented assistance trigger, including a material decision, unavailable access/manual action, approval/sign-off, the same blocker after at least three materially different approaches without new evidence, or unresolved ambiguity. While waiting, pause only the dependent action and keep safe services and independent work running. For an ordinary reversible decision, state a recommendation and wait five minutes before using that recommendation as the fallback. Never apply a timeout fallback to approval-only actions, account/permission access, sensitive-data transmission, destructive actions, deployment/publishing, billing/cost, or risk acceptance. Verify the result and resume.
- Treat the bank Java snapshots as mandatory security input. Copy/adapt applicable components for Java/Spring; refactor their responsibilities into native code for other languages; never copy known findings or secret values into production.
- Never silently deploy to production, purchase services, change billing, migrate/destruct production data, publish externally, or weaken security.

## Continue an unfinished codebase

Use the brownfield workflow to inventory code, build/test status, architecture, data stores, interfaces, documentation, open changes, and risks. Reconstruct what is implemented from evidence before proposing work. Map existing behavior into the nine phases, create a gap analysis, protect current behavior with characterization tests where practical, then continue from the first unmet gate.

When codebase graph tools are available, index if needed and prefer them for symbol/call/dependency discovery. Use text search for literals, configuration, generated files, and non-code documents.

## Complete and hand over

Before declaring completion:

1. Run `scripts/validate_delivery.ps1` when PowerShell is available.
2. Verify every in-scope requirement has implementation and test evidence or an accepted exception.
3. Verify the Security Profile, threat/control/test mapping, regulatory applicability, and security release gate; do not release with an open Critical security risk.
4. Complete `DOCUMENT_QUALITY_AUDIT.md` using 2–3 risk-stratified complex features and resolve every blocking quality finding.
5. Complete Developer/Ops newcomer, Tester derivation, and cross-functional peer-review evidence in `FIELD_VALIDATION_REPORT.md`.
6. Fill phase 07 reports and phase 08 deployment guide, runbook, user guide, document index, and handover checklist.
7. Record residual risks, known limitations, credentials/secrets handoff needs, operational ownership, rollback path, and recommended next actions.
8. Return a concise final summary with delivered outcomes, verification evidence, unresolved items, and exact artifact locations.

Completion means a usable, tested, documented, and handover-ready outcome—not merely generated code.
