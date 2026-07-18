---
artifact_id: DOC-01-PLANNING-README-MD
phase: "01-Planning"
artifact_type: planning
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Phase 01 — Discovery & Planning

## Objective

Interview the Client until the problem, stakeholders, outcomes, scope, priorities, constraints, dependencies, risks, and acceptance criteria are sufficiently clear. For brownfield projects, audit the existing codebase evidence first and only ask for information that cannot be inferred.

## Artifacts

- `DISCOVERY_LOG.md`: details of each question, answer, assumption, and decision.
- `PROJECT_PLAN.md`: approach, milestones, roadmap, dependencies, and communication.
- `RISK_REGISTER.md`: risks, triggers, responses, and owners.
- `BROWNFIELD_AUDIT.md`: as-is inventory and gap analysis if inheriting an unfinished codebase.
- `COST_FINOPS_CAPACITY_LIFECYCLE.md`: cost model, FinOps, capacity forecast, and EOL/lifecycle.
- Select the question profile from [question-profiles.md](../.agents/skills/ai-project-delivery/references/question-profiles.md) and record the rationale in the Discovery Log.

## Gate 01

- [ ] Core discovery is 100% complete for applicable areas; high-risk areas have no unassigned unknowns.
- [ ] Problem description, outcomes, metrics, scope, and out-of-scope items are confirmed by the Client.
- [ ] Plan, dependencies, timeline, and risks have designated owners.
- [ ] Client has approved the baseline or provided clear delegation for local/reversible choices.
