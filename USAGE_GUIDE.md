---
artifact_id: DOC-USAGE-GUIDE-MD
phase: "ROOT"
artifact_type: orchestration
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# AI Project Lifecycle Template Usage Guide

## 1. Best Practices for Maximum Efficiency

The template works best when:

1. The entire folder structure is placed in the same repository as the source code.
2. The AI assistant is opened at the root repository directory to read `AGENTS.md`, skills, and the 09 phases.
3. `PROJECT_PROFILE.md`, `PROJECT_STATE.md`, the Discovery Log, and the Requirements Traceability Matrix (RTM) always act as the single source of truth instead of chat history.
4. The Client answers questions using concrete evidence and real examples; unresolved items must be marked as `TBD/Unknown` with a assigned owner and deadline.
5. The baseline is approved before the AI automatically starts full implementation.
6. Post-baseline changes go through impact analysis and formal change requests.
7. Gates are not approved simply because they "look done"; path references, test commands, and exact results must be provided.
8. The Security Profile is chosen based on data classification, exposure, and risk; do not use vague statements like "maximum security" instead of concrete controls and tests.
9. The AI does not offload tasks to humans just because they are hard or time-consuming; assistance requests must have evidence and specify the smallest human action.
10. Use `FULL-LOCAL` mode if you want the AI to implement as much as possible after baseline; the AI only prompts on human-exclusive triggers.
11. The Security Java snapshot is an implementation reference; other stacks must refactor it into a native implementation with equivalent tests.

## 2. Optimal Workflow for New Projects — GREENFIELD

### Step 1 — Create the Repository

- Copy the entire template folder structure, including the hidden `.agents` directory.
- Do not just copy the 09 phases without the `AGENTS.md` file or skills.
- Fill in at least `PROJECT_NAME`, `PROJECT_CODE`, Client owner, and initial ideas in `PROJECT_PROFILE.md` or `MASTER_PROMPT.md`.

### Step 2 — Start the AI Assistant

Send the following prompt:

```text
Read and execute the entire MASTER_PROMPT.md in this repository.
PROJECT_MODE = GREENFIELD.
My initial idea: [1–5 sentence description].
```

The AI must start with 5–10 discovery questions and not write code immediately.

### Step 3 — Answer Discovery Questions Effectively

- Answer by question number.
- Provide examples of when the problem last occurred.
- Use metrics if available: users, volume, latency, costs, deadlines, error rates.
- Separate `mandatory`, `desired`, and `future/nice-to-have` features.
- State who has decision authority and who will perform acceptance.
- For unknown answers, write: `TBD — owner — required by [date]`.

The AI will ask questions in rounds and log them in `01-Planning/DISCOVERY_LOG.md`; there is no need to answer hundreds of questions at once.

### Step 4 — Approve the Baseline

Before coding begins, review at least:

- Charter/SOW/RACI.
- Problem/outcome/scope/out-of-scope.
- BRD/SRS/Features/Use Cases.
- NFRs/security/privacy/acceptance.
- Security Profile, regulatory applicability, and security release gates.
- Roadmap/dependencies/risks.
- Autonomy mode and approval-only actions.

Only approve when statements are atomic, testable, and have an ID and owner. If uncertain, grant `Conditional approval` with clear conditions and deadlines.

### Step 5 — Allow AI to Deliver Automatically

We recommend using `AUTONOMY_MODE = FULL-LOCAL`:

- The AI decides local, reversible, convention-following changes.
- The AI explores code graphs, configs, tests, official references, and runs safe experiments before asking.
- The Client only handles scope, business behavior, credentials/access, costs, production changes, and risk acceptance.
- When the AI requests assistance, the Client only performs the smallest decision, access provision, manual action, or sign-off; the AI verifies the result and resumes automatically.

Require the AI to update status by phase, gate, and evidence, and proceed when the gate passes.

### Step 6 — Review by Vertical Slice

Review runnable outcomes instead of waiting for the end of the project:

- Requirement IDs;
- Demos or API/UI behaviors;
- Test evidence;
- Known gaps;
- Impact on release and operations.

New feedback outside the baseline must be structured as a change request and not mixed with running work items.

### Step 7 — Acceptance and Handover

Request UAT, Test Completion Reports, Release Reports, Deployment/User Guides, Runbooks, and Handover Checklists. Run the strict validator; conduct Developer newcomer tests and Tester derivation tests when independent personnel are available.

## 3. Optimal Workflow for Existing Projects — BROWNFIELD

### Step 1 — Protect the Current State

- Commit/backup or at least record the branch, HEAD, and `git status` before integrating the template.
- Do not delete old builds, tests, or configs just to match the template.
- Copy the template in Brownfield mode to avoid overwriting existing files.
- If an `AGENTS.md` file already exists, keep it and merge rules from `AGENTS.ai-project-delivery.md`.

### Step 2 — Start the Audit

Send the following prompt:

```text
Read and execute the entire MASTER_PROMPT.md.
PROJECT_MODE = BROWNFIELD.
Current takeover goal: [goal].
Please conduct a read-only audit first; do not modify code or run migrations.
```

The AI must read code, configs, tests, docs, and git state before asking questions. Do not accept a plan based only on an outdated README.

### Step 3 — Request a Takeover Baseline

The AI must provide:

- Branch/HEAD/worktree state;
- Stack/manifests/entry points/modules;
- As-is architecture: API, UI, data, integrations, authentication;
- Actual build, test, and CI status;
- TODOs, mocks, disabled tests, and feature flags;
- Documentation mismatches with code;
- Security, secret, migration, and operational risks;
- Gap analysis and the first failed phase gate.

The Client only needs to specify target behaviors, priorities, deadlines, acceptance, and historical decisions that cannot be inferred.

### Step 4 — Align on "As-Is + Target Delta"

Do not rewrite everything for a "better architecture" without a clear business need. Define:

- Behaviors to retain;
- Behaviors to change;
- Compatibility, data, and legacy client paths to protect;
- Characterization/regression tests to add;
- Priority features/scope;
- Blocking technical debt versus backlog items.

### Step 5 — Resume from the First Failed Gate

The AI updates phase artifacts first if they are missing, but does not recreate documents that already have good evidence. All refactoring/migrations must have regression, compatibility, and rollback plans.

### Step 6 — Clear Handover Separation

The final report must separate:

- Pre-existing and verified parts;
- Newly implemented parts by the AI/vendor;
- Inferred or unverified parts;
- Known defects, technical debt, and residual risks;
- Access, data, and operational tasks the Client still needs to complete.

## 4. CHANGE Mode for Features or Defects

Send the following prompt:

```text
Read and execute MASTER_PROMPT.md.
PROJECT_MODE = CHANGE.
Target delta: [feature/defect].
Do not change code outside scope without impact analysis and approval.
```

The AI must trace from the impacted requirement to design, code, tests, and release, running appropriate regression checks and updating changelogs/runbooks.

## 5. Human-AI Collaboration Rules

### What the Client Should Do

- Provide domain context, priorities, deadlines, acceptance criteria, and decisions.
- Answer questions with examples and metrics.
- Provide access and test data via secure channels.
- Review baselines, demos, UAT, releases, and handovers on schedule.
- Accept or reject residual risks in writing.

### What the AI/Vendor Does Independently

- Repository, code, and configuration analysis.
- Requirements, design documentation, and traceability.
- Implementation, local build, test, and refactoring within scope.
- Test design, execution, reports, and release/rollback/runbook preparation.
- Keep project state, risks, changelogs, and technical debt updated.

### Actions Requiring Explicit Client Approval

- Production or shared-environment changes.
- Real production data usage or destructive migrations.
- Cost, billing, or vendor purchases.
- External communications or publishing.
- Reductions in scope, outcomes, SLAs, or security controls.
- High or Critical risk acceptance.

### Confirmation-Wait Behavior

- For an ordinary, non-blocking, reversible decision, the AI states one clearly labeled recommendation, its rationale, the dependent action being paused, and an exact five-minute confirmation deadline.
- While waiting, the AI keeps healthy local services and independent safe work running. Parallel work must not execute, constrain, or prejudge the pending decision.
- If the Client does not respond after at least five minutes, the AI may proceed only with the previously stated recommendation and must record the decision and rollback path.
- Silence never authorizes external state changes, account permissions/access, sensitive-data transmission, destructive or hard-to-reverse actions, deployment/publishing, billing/cost, security/compliance changes, legal/professional sign-off, or risk acceptance. These actions remain pending until explicit approval.

### When the AI Can Request Human Assistance

The AI may only ask for help when a material decision, credentials/access, manual action, or sign-off is required, or when blocked after trying at least three different solutions without finding new evidence. The request must present the evidence, attempts, impact, smallest human action, required output/references, and parts the AI can continue working on. Do not send raw secrets in chat.

## 6. Recommended Operational Cadence

| Cadence / Step | Client Reviews | AI Updates |
| :--- | :--- | :--- |
| Each discovery round | Answers, decisions, and contradictions | Discovery Log |
| Baseline review | Problem, scope, requirements, and acceptance | Charter, BRD/SRS, RTM, Plan/Risk |
| Each vertical slice | Demo, test evidence, and gaps | Work items, code, tests, changelog, RTM |
| Gate review | Pass/Conditional/Fail evidence | Project State, findings, next gate |
| Release candidate | UAT, security, NFRs, and rollback plans | Test/Release Reports |
| Handover | Operability, ownership, and residual risks | Document Index, Deployment & User Guides, Runbook, Checklist |

## 7. Common Mistakes to Avoid

- Copying phase folders while discarding `.agents` and `AGENTS.md`.
- Demanding the AI start coding immediately while skipping discovery and baseline.
- Answering with subjective adjectives ("fast", "beautiful", "secure") without metrics.
- Allowing chat transcripts to become the sole source of truth without updating the repository.
- Changing scope through casual chat without impact analysis.
- Pasting secrets or real production data into Markdown files or prompt chat.
- Trusting "test pass" reports that lack build logs, environment details, commands, or results.
- Claiming ISO compliance simply because this template is used.
- Handing over code without deployment scripts, rollback plans, runbooks, and clear ownership.
- Forcing a .NET/Node/Go/Python project to run JVM code just to use the Java security snapshots.
- Translating Java security lines literally to other languages without preserving security contracts and negative-test evidence.
- Copying raw secrets, token logging configs, permissive CORS, reusable refresh tokens, or known security findings directly from the snapshots.

## 8. Cross-Language Security Reference

- **Java/Spring:** Import appropriate components from `.agents/skills/ai-project-delivery/assets/security-reference/`, then harden them according to the Adoption Record.
- **Other Languages:** Read `security-portability-matrix.md`, map Java classes to responsibilities/trust boundaries, and implement them using native primitives.
- **Projects with existing auth:** Design deltas; do not overwrite functioning auth modules just to align with the templates.
- **All stacks:** Run `SECURITY_VERIFICATION_MATRIX.md`; code similarity does not substitute for behavioral/security equivalence.

## 9. Verification Commands

During development:

```powershell
powershell -ExecutionPolicy Bypass -File .\.agents\skills\ai-project-delivery\scripts\validate_delivery.ps1
```

Before final handover:

```powershell
powershell -ExecutionPolicy Bypass -File .\.agents\skills\ai-project-delivery\scripts\validate_delivery.ps1 -StrictDelivery
```

Untouched templates will trigger placeholder warnings; final project handovers must not have strict errors unless approved deviations are recorded.

## Semantic and Contract Checks

Besides the presence validator, run `lint_delivery.ps1` for row-only requirement semantics, RTM/Test RTM links, sign-off, RACI, and gate evidence. Run `validate_contracts.ps1 -Strict` for OpenAPI/AsyncAPI specifications and regenerate `DOCUMENT_INDEX.generated.md` from front matter before review.
