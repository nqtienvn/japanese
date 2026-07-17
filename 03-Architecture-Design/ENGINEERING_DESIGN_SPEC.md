# Engineering Design Specification — {{MODULE_OR_SLICE}}

| Field | Value |
| :--- | :--- |
| Design ID | `DES-{{DOMAIN}}-{{NNN}}` |
| Owner / reviewers | {{OWNER}} / {{REVIEWERS}} |
| Requirements | {{REQUIREMENT_IDS}} |
| ADR | {{ADR_IDS}} |
| Status | Draft / In Review / Approved / Implemented / Verified |

## 1. Goal và non-goals

- Goal/outcome: {{GOAL}}
- In scope: {{IN_SCOPE}}
- Non-goals: {{NON_GOALS}}

## 2. Domain và static model

| Element | Responsibility/invariant | Interface/dependency |
| :--- | :--- | :--- |
| {{CLASS_MODULE_ENTITY}} | {{RESPONSIBILITY}} | {{DEPENDENCY}} |

## 3. Workflow/state/sequence

- Trigger/precondition: {{TRIGGER}}
- Happy path: {{HAPPY_PATH}}
- Alternate/error/recovery: {{ERROR_PATH}}
- Concurrency/idempotency/transaction: {{RULES}}

## 4. Data design

| Field/table/event | Type/schema | Rule/index | Classification | Migration |
| :--- | :--- | :--- | :--- | :--- |
| {{DATA}} | {{TYPE}} | {{RULE}} | {{CLASS}} | {{MIGRATION}} |

## 5. API/event/UI contract

| Contract | Input | Output/errors | Auth | Compatibility/version |
| :--- | :--- | :--- | :--- | :--- |
| {{ENDPOINT_EVENT_SCREEN}} | {{INPUT}} | {{OUTPUT}} | {{AUTH}} | {{VERSIONING}} |

```json
{
  "example": "Replace with sanitized request/response schema"
}
```

## 6. UX states

| State | User sees/does | Accessibility/content | Recovery |
| :--- | :--- | :--- | :--- |
| Loading / Empty / Success / Error / Forbidden / Offline | {{BEHAVIOR}} | {{A11Y}} | {{RECOVERY}} |

## 7. Security/privacy/threat handling

- Trust boundary and permission checks: {{DESIGN}}
- Validation/abuse/rate limit: {{DESIGN}}
- Secret/PII/logging/retention: {{DESIGN}}

## 8. NFR, observability và operations

| Requirement | Tactic | Signal/log/metric/trace | Alert/runbook |
| :--- | :--- | :--- | :--- |
| NFR-XXX | {{TACTIC}} | {{SIGNAL}} | {{ACTION}} |

## 9. Rollout và compatibility

- Feature flag/sequence: {{PLAN}}
- Migration/backfill: {{PLAN}}
- Backward/forward compatibility: {{PLAN}}
- Rollback: {{PLAN}}

## 10. Test design

| Test level | Scenario/risk | Evidence/target |
| :--- | :--- | :--- |
| Unit / Integration / Contract / E2E / Security / Performance | {{SCENARIO}} | {{EVIDENCE}} |

## 11. Work breakdown

| WI | Vertical slice/task | Dependency | Acceptance |
| :--- | :--- | :--- | :--- |
| WI-XXX | {{WORK}} | {{DEPENDENCY}} | {{ACCEPTANCE}} |
