# Greenfield workflow

## Table of Contents

1. Intake
2. Discovery
3. Baseline
4. Delivery
5. Handover

## 1. Intake

1. Record the raw idea in the discovery log.
2. Ask the first 5–8 questions: problem, users, outcomes, urgency, sponsor, constraints, and current workarounds.
3. Populate `PROJECT_PROFILE.md`, select the autonomy mode, and create a stakeholder map.

## 2. Discovery

1. Progress through the core bank in rounds: context → stakeholders → outcomes → scope → processes → economics → acceptance.
2. Select product/engineering questions based on the domain and risks.
3. Every 3–5 rounds, generate a synthesis: problem tree, scope, workflows, domain terminology, decisions, risks, and unknowns.
4. Use prototypes/spikes only to reduce documented uncertainties, not to bypass requirements.

## 3. Baseline

Create and review:

- Charter/governance.
- Project plan, roadmap, risk register.
- SRS and RTM with BR/FR/NFR/UC/US.
- Acceptance and release boundaries.

Request the user to approve the baseline once, unless full authority has been delegated. Record approvals and any exceptions.

## 4. Delivery

1. Design C4 models, ADRs, data structures, APIs, UX, and threat models.
2. Establish implementation plans, work items, and migration/release/rollback strategies.
3. Implement code by vertical slice with traceability IDs; perform continuous build and testing.
4. Execute a test strategy aligned with project risks.
5. Report scope/decision changes through change control; do not silently expand scope.

## 5. Handover

Complete the release report, final report, document index, user guide, operations runbook, handover checklist, and residual risk acceptance. Verify that others can install, run, test, rollback, and operate the system solely using the documentation.
