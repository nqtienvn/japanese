# Document Quality Audit — Requirements/Release Baseline

## Audit identity

| Field | Value |
| :--- | :--- |
| Baseline/release | {{BASELINE_VERSION}} |
| Audit date/reviewers | {{DATE}} / {{REVIEWERS_AND_ROLES}} |
| Population | {{HIGH_COMPLEXITY_FEATURE_IDS}} |
| Selection method | All if ≤3 / Random 3 + risk stratification |
| Random timestamp/seed/tool | {{SELECTION_EVIDENCE}} |
| Selected features | {{FEATURE_IDS}} |

## Core document coverage

| Group | Required artifacts | Version/status | Required content present | Gaps/N/A rationale | Pass/Fail |
| :--- | :--- | :--- | :--- | :--- | :---: |
| BRD/SRS | BRD, SRS, Feature Catalog, Use Case, workflow | {{VALUE}} | {{EVIDENCE}} | {{GAPS}} | {{RESULT}} |
| SAD | Architecture, ERD, API, ADR/EDS | {{VALUE}} | {{EVIDENCE}} | {{GAPS}} | {{RESULT}} |
| Testing | Policy, Plan, Specification, Cases, Status/Completion, Test RTM | {{VALUE}} | {{EVIDENCE}} | {{GAPS}} | {{RESULT}} |
| Operations | Environment, Deployment, User Guide, Runbook | {{VALUE}} | {{EVIDENCE}} | {{GAPS}} | {{RESULT}} |

## Feature quality sample

| Feature / Requirement | Atomic | Unambiguous | Measurable | Feasible | Consistent | Testable | Traceable | Evidence/findings | Result |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :--- | :---: |
| FEAT/FR-XXX | P/F | P/F | P/F | P/F | P/F | P/F | P/F | {{EVIDENCE}} | Pass / Fail |

## Cross-artifact consistency

| Concept | BRD/SRS term/value | UI/SAD/API/Data | Test/Runbook | Mismatch/action |
| :--- | :--- | :--- | :--- | :--- |
| Actor/state/field/error/NFR | {{VALUE}} | {{VALUE}} | {{VALUE}} | {{ACTION}} |

## Findings and gate decision

| Finding ID | Severity | Artifact/IDs | Finding | Action/owner/due | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| DQA-001 | Critical / High / Medium / Low | {{FILES_IDS}} | {{FINDING}} | {{ACTION_OWNER_DATE}} | Open |

Decision: `Pass / Conditional Pass / Fail` — {{DECIDERS_DATE_CONDITIONS}}
