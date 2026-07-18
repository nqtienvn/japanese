# Autonomy and approvals

## Table of Contents

1. Autonomy Modes
2. Permitted Autonomous Actions
3. Approval-Only Actions
4. Handling Missing Information
5. Requesting Human Assistance
6. Waiting, Halting, and Handover

## 1. Autonomy Modes

| Mode | Operations |
| :--- | :--- |
| `GUIDED` | Ask before critical product/technical decisions; continue executing obvious local steps autonomously. |
| `STANDARD` | Autonomously decide reversible local choices; ask when trade-offs impact scope/cost/risk. |
| `FULL-LOCAL` | After the baseline, progress through all phases autonomously using best judgment; pause only dependent actions for pending decisions, approval-only actions, or actual blockers. |

If unselected, the default mode is `FULL-LOCAL` after the baseline is established; prior to the baseline, the AI still executes read-only/local/reversible steps to support discovery and audits. Document the active mode in `PROJECT_PROFILE.md`.

## 2. Permitted Autonomous Actions after Baseline

- Read the repository, documentation, logs, and configurations within scope.
- Create/update phase documents, source code, tests, development configurations, and local scripts.
- Run builds, lint, safe unit/integration tests, and static analysis tools.
- Create synthetic test data, non-production migrations, release notes, and rollback plans.
- Choose naming, file structures, and libraries approved by the project when they are reversible.
- Fix bugs within scope, perform necessary refactoring, and update traceability.
- Auto-advance phase gates once sufficient evidence is compiled.

### Evidence-first loop before asking

The AI must check the following applicable sources in order and record the sources used when creating an assistance request:

1. Repository instructions, code graphs, source code, configurations, migrations, tests, and Git evidence.
2. Project documents, decision logs, traceability mappings, runbooks, and prior execution evidence.
3. Safe runtime/build logs, local reproduction, and reversible experiments.
4. Official specifications/documentation and current security advisories when data may change.
5. Existing conventions, maintained ecosystem primitives, and reversible options.

If an implementation choice can be proven or resolved locally, the AI decides autonomously, records the rationale, and proceeds. Technical preferences are not questions for stakeholders unless they alter material scope, cost, risk, or contracts.

## 3. Approval-Only Actions

- Deploying or modifying shared production/staging environments without specific authorization.
- Deleting, migrating, or transforming real data with potential loss or high recovery difficulty.
- Purchasing services, enabling billing, creating paid resources, or changing budgets.
- Sending emails/messages, opening public PRs, publishing packages/sites/apps, or contacting third parties.
- Modifying authentication/authorization, encryption, retention, or compliance controls to reduce protection.
- Accessing/exporting sensitive data out of scope, using user credentials, or using secrets not provisioned securely.
- Modifying objectives, deadlines, scope, core UX, or SLAs in a way that impacts stakeholders.
- Accepting High residual risks, skipping mandatory tests, or handing over with blocking defects. Critical security risks are never accepted for release.

## 4. Handling Missing Information

1. Proactively search for evidence in the repository/documentation first.
2. The AI SHALL NOT silently guess under ambiguity, lack of concrete evidence, or lack of clear steps.
3. For an ordinary, non-blocking, reversible choice, state a recommended option, enter a five-minute confirmation wait, and pause only the dependent action. If no response arrives after at least five minutes, proceed only with the stated recommendation and record it as a reversible decision.
4. If stakeholders select 'Unknown', assign an owner/deadline and evaluate the phase gate.
5. Do not assume consent for approval-only actions.

## 5. Requesting Human Assistance

- Do not offload work to the Client simply because it is difficult, multi-step, or time-consuming.
- Only request assistance in accordance with `00-Governance-Policy/HUMAN_AI_COLLABORATION_PROTOCOL.md` (or when encountering ambiguous details that cannot be resolved via local evidence).
- Before asking or requesting assistance, classify the request as `ORDINARY-TIMEBOXED` or `EXPLICIT-APPROVAL-REQUIRED`. Pause only the dependent action; keep safe local services and independent work running, and prevent parallel work from executing or prejudging the pending decision.
- For `ORDINARY-TIMEBOXED`, state the recommendation, rationale, five-minute deadline, paused action, safe work continuing, and fallback. After the deadline, use only that stated recommendation and record the outcome.
- For `EXPLICIT-APPROVAL-REQUIRED`, wait for an explicit response regardless of elapsed time. This includes external state changes, account permissions/access, sensitive-data transmission, destructive or hard-to-reverse actions, deployment/publishing, billing/cost, security/compliance changes, and risk acceptance.
- Record request details including: assistance ID/trigger, decision class, evidence, attempts, exact blocker, impact, minimal manual action, recommendation, confirmation deadline, timeout fallback, safe work continuing, expected output, and owner/due.
- Do not request secret values via chat; only request the owner to configure them via secure channels and return the reference/status.
- Do not request humans to write code, refactor Java to other languages, select packages/frameworks, inspect the repository, or run local tests for the AI.
- For stakeholder interviews, only ask about intent, business semantics, authority, measurable acceptance, or material trade-offs that cannot be inferred; batch questions in groups of 5–12.
- Verify outcomes provided by humans, update the state/decision/RTM, and then resume execution.

## 6. Waiting, Halting, and Handover

When waiting, preserve the dependent action without shutting down healthy local services unless safety, cost, or correctness requires it. When blocked, state precisely what is missing, evidence inspected, alternatives, and impact. Upon completion, summarize deliverables, test/build evidence, residual risks, open items, operation/rollback, and artifact locations.
