# Discovery protocol

## Table of Contents

1. Objective
2. Preparation
3. Inquiry Method
4. Recording and Cross-Checking
5. Coverage
6. Completion Criteria

## 1. Objective

Transform a vague idea or codebase into a problem/scope baseline sufficient for design, implementation, and testing. Discovery must uncover actual needs, decision rights, constraints, measurement criteria, and failure scenarios; it is not merely a feature list collection.

## 2. Preparation

1. Determine `GREENFIELD`, `BROWNFIELD`, or `CHANGE`.
2. For brownfield projects, audit the repository first and identify questions that already have evidence.
3. Create/update `01-Planning/DISCOVERY_LOG.md`.
4. Establish a stakeholder map and identify individuals authorized to approve each domain.
5. Select the next group of questions based on risks and previous answers.

## 3. Inquiry Method

- Ask 5–12 contextually related questions per round.
- Start broad: "Describe the last time...", then narrow down with metrics and examples.
- For vague terms like "fast", "easy", "secure", or "many", request targets, units of measure, and unacceptable thresholds.
- For features, ask: who uses it, trigger, inputs, outputs, permissions, errors, retries, audits, notifications, states, and acceptance criteria.
- For technical decisions proposed by stakeholders, ask for underlying goals/constraints; do not lock in solutions too early.
- Provide at most 2–3 options when stakeholders lack domain expertise, detailing trade-offs and recommendations.
- Allow `Unknown`, `Delegated`, and `Not Applicable` responses, but always document a reason and owner.

Do not re-ask questions that already have evidence unless resolving a contradiction. Do not request passwords, tokens, private keys, or real personal data in chats/documentation.

## 4. Recording and Cross-Checking

Each response has:

| Property | Value |
| :--- | :--- |
| Question ID | ID from the question bank |
| Answer | Understandings/Response |
| Status | Confirmed / Assumed / Unknown / Delegated / N/A |
| Source | Stakeholder / Code / Config / Test / Document / Observation |
| Confidence | High / Medium / Low |
| Owner | Approving/confirming role |
| Follow-up | Follow-up questions or needed evidence |

After each round, verify:

- Do responses conflict with code, documentation, or previous answers?
- Do objectives have defined metrics and baselines?
- Is there a corresponding out-of-scope definition?
- Does each workflow define happy paths, alternate paths, and error paths?
- Does each data item define an owner, classification, retention, delete/export policy, and audit trail?
- Does each integration define auth, quota, timeout, retry, idempotency, and fallback policies?
- Does each NFR have a target and measurement method?

## 5. Coverage

Mark items as `Applicable` before calculating coverage.

```text
Coverage = (Confirmed + Delegated + N/A-with-rationale) / Applicable
```

Target expectations for non-trivial products:

- Core: 100% applicable questions, typically around 120 questions.
- Product: 80–100% applicable questions.
- Engineering: 80–100% applicable questions.
- Critical risk domains (security, payments, PII, safety, legal): 100% applicable or have clear owner/date assignments.

## 6. Completion Criteria

Close discovery only when:

- Problem, target users, outcomes, and success metrics are clear.
- In-scope/out-of-scope definitions, release boundaries, and priorities are clear.
- Stakeholders, approvers, and escalation paths are clear.
- Core workflows and their edge cases are fully described.
- Targets are defined for data, integrations, NFRs, security/compliance, and operations.
- Assumptions, dependencies, risks, and open decisions have owners/deadlines.
- Acceptance and handover expectations are clear.
- Stakeholders approve the baseline summary or explicitly delegate authority to the AI for reversible decisions.

Once finalized, translate responses into BR/FR/NFR/UC/US items and the RTM; do not leave the discovery log as the sole source of requirements.
