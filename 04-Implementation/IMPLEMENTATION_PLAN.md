# Implementation Plan — {{PROJECT_NAME}}

## 1. Release objective

- Release: `REL-{{VERSION}}`
- Requirements: {{REQUIREMENT_IDS}}
- Outcome/metric: {{OUTCOME}}
- Non-goals: {{NON_GOALS}}

## 2. Vertical slices

| Slice | Requirement/design | User-visible outcome | Work items | Dependency | Estimate/confidence | Verification |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| VS-001 | FR/DES-XXX | {{OUTCOME}} | WI-001.. | {{DEP}} | {{ESTIMATE}} / H-M-L | {{TEST}} |

## 3. Sequence và critical path

```mermaid
flowchart LR
    A["Foundation / contract"] --> B["Vertical slice 1"]
    B --> C["Integration / migration"]
    C --> D["Regression / release evidence"]
```

| Step | Entry | Action/output | Exit evidence | Owner |
| :--- | :--- | :--- | :--- | :--- |
| 1 | Gate 03 pass | {{ACTION}} | {{EVIDENCE}} | {{OWNER}} |

## 4. Environment/readiness

| Need | Status | Owner | Due | Fallback |
| :--- | :--- | :--- | :--- | :--- |
| Runtime/dependencies | Ready / Blocked | {{OWNER}} | {{DATE}} | {{FALLBACK}} |
| Test data/access | Ready / Blocked | {{OWNER}} | {{DATE}} | {{FALLBACK}} |

## 5. Quality plan

- Required checks: build / format / lint / type / static / dependency/security.
- Test layers: {{TEST_PLAN}}
- NFR verification: {{NFR_PLAN}}
- Review/approvers: {{REVIEWERS}}

## 6. Release controls

- Feature flags: {{FLAGS}}
- Migration/compatibility: {{PLAN}}
- Smoke/monitoring: {{PLAN}}
- Rollback trigger/owner: {{PLAN}}

## 7. Risks và open decisions

| ID | Risk/decision | Impact | Action | Owner | Blocks |
| :--- | :--- | :--- | :--- | :--- | :--- |
| RISK/WI-001 | {{ITEM}} | {{IMPACT}} | {{ACTION}} | {{OWNER}} | {{SLICE}} |
