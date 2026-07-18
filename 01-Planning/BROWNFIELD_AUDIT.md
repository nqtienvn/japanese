---
artifact_id: DOC-01-PLANNING-BROWNFIELD-AUDIT-MD
phase: "01-Planning"
artifact_type: planning
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Brownfield Audit & Continuation Plan — {{PROJECT_NAME}}

## Baseline protection

| Item | Evidence |
| :--- | :--- |
| Repository/branch/HEAD | {{VALUE}} |
| Uncommitted/untracked changes | {{VALUE}} |
| Instructions read | {{FILES}} |
| Build/test commands known | {{VALUE}} |
| Destructive scripts/migrations avoided | Yes / No / N/A |

## Inventory

| Area | As-is evidence | Confidence | Owner/notes |
| :--- | :--- | :--- | :--- |
| Languages/frameworks | {{EVIDENCE}} | H/M/L | {{NOTE}} |
| Modules/entry points | {{EVIDENCE}} | H/M/L | {{NOTE}} |
| API/UI/jobs/events | {{EVIDENCE}} | H/M/L | {{NOTE}} |
| Data/migrations | {{EVIDENCE}} | H/M/L | {{NOTE}} |
| Auth/security boundaries | {{EVIDENCE}} | H/M/L | {{NOTE}} |
| CI/CD/infra | {{EVIDENCE}} | H/M/L | {{NOTE}} |
| Test/build status | {{EVIDENCE}} | H/M/L | {{NOTE}} |

## Gap analysis

| Gap ID | Category | Expected/to-be | Current evidence | Classification | Risk | Action | Phase |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| GAP-001 | {{AREA}} | {{EXPECTED}} | {{CURRENT}} | Missing / Partial / Contradictory / Obsolete / Unverified / Unsafe | {{RISK}} | {{ACTION}} | 0X |

## Continuation baseline

- Behaviors to preserve: {{BEHAVIOR}}
- Behaviors to change: {{DELTA}}
- Compatibility to maintain: {{COMPATIBILITY}}
- Characterization tests to add: {{TESTS}}
- First gate not yet met: {{GATE}}
- Critical path: {{PATH}}
- Outstanding Client decisions required: {{DECISIONS}}
