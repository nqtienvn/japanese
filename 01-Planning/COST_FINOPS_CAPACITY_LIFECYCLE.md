---
artifact_id: PLAN-COST-FINOPS-CAPACITY-LIFECYCLE
phase: "01-Planning"
artifact_type: planning
owner: "Delivery Lead"
version: "0.1"
status: Template
ids: [NFR-COST-001, NFR-CAPACITY-001, RISK-EOL-001]
dependencies: [PROJECT_PLAN.md, PROJECT_PROFILE.md]
last_verified: "2026-07-18"
---
# Cost, FinOps, capacity and technology lifecycle

| Area | Required input | Decision/evidence |
| :--- | :--- | :--- |
| Cost model | environments, compute, storage, egress, licenses, people | monthly baseline, one-time cost, owner and variance threshold |
| FinOps | tags, budgets, forecast cadence, allocation model | budget alert and monthly review record |
| Capacity | requests/sec, concurrency, data growth, peak multiplier, SLO | load test, headroom target, scale trigger |
| Lifecycle/EOL | runtime, framework, DB, image, managed service versions | support end date, upgrade work item, compensating control |

Any estimate marked unknown gets an owner and decision date. Cost approval is separate from security risk acceptance.
