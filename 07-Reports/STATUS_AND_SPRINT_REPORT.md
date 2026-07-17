---
artifact_id: DOC-07-REPORTS-STATUS-AND-SPRINT-REPORT-MD
phase: "07-Reports"
artifact_type: report
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Client Delivery Status — {{PROJECT_NAME}}

| Trường | Giá trị |
| :--- | :--- |
| Period/milestone | {{PERIOD}} |
| Overall health | Green / Amber / Red |
| Current phase/gate | {{PHASE_GATE}} |
| Release target | {{VERSION_DATE}} |

## Executive summary

- Outcome/progress: {{SUMMARY}}
- Client attention needed: {{DECISIONS}}
- Forecast/change from baseline: {{FORECAST}}

## Delivered this period

| Outcome/deliverable | Requirement/WI | Evidence/demo | Acceptance status |
| :--- | :--- | :--- | :--- |
| {{OUTCOME}} | {{IDS}} | {{EVIDENCE}} | Pending / Accepted |

## Planned next period

| Outcome | Owner | Target | Dependency/decision |
| :--- | :--- | :--- | :--- |
| {{OUTCOME}} | {{OWNER}} | {{DATE}} | {{DEPENDENCY}} |

## Scope/schedule/cost

| Dimension | Baseline | Current forecast | Variance/reason | Action/CR |
| :--- | :--- | :--- | :--- | :--- |
| Scope | {{BASELINE}} | {{CURRENT}} | {{VARIANCE}} | {{ACTION}} |
| Schedule | {{BASELINE}} | {{CURRENT}} | {{VARIANCE}} | {{ACTION}} |
| Cost/capacity | {{BASELINE}} | {{CURRENT}} | {{VARIANCE}} | {{ACTION}} |

## Quality và risk

| Indicator | Current | Target | Trend/action |
| :--- | :--- | :--- | :--- |
| Build/test/coverage | {{VALUE}} | {{TARGET}} | {{TREND_ACTION}} |
| Defect by severity | {{VALUE}} | {{TARGET}} | {{TREND_ACTION}} |
| Top risk/blocker | {{VALUE}} | — | {{TREND_ACTION}} |

## Client decisions required

| Decision | Recommendation/trade-off | Needed by | Impact if delayed |
| :--- | :--- | :--- | :--- |
| DEC-XXX | {{RECOMMENDATION}} | {{DATE}} | {{IMPACT}} |
