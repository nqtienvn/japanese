# Engineering Design Specification — {{MODULE_OR_SLICE}}

| Field | Value |
| :--- | :--- |
| Design ID | `DES-{{DOMAIN}}-{{NNN}}` |
| Owner / reviewers | {{OWNER}} / {{REVIEWERS}} |
| Requirements | {{REQUIREMENT_IDS}} |
| ADR | {{ADR_IDS}} |
| Status | Draft / In Review / Approved / Implemented / Verified |
| Security Profile / UI applicability | STANDARD / HIGH / CRITICAL / {{UI_SCOPE_OR_NA}} |

## 1. Goal và non-goals

- Goal/outcome: {{GOAL}}
- In scope: {{IN_SCOPE}}
- Non-goals: {{NON_GOALS}}

## 2. Domain và static model

| Element | Responsibility/invariant | Contract/interface | Dependency | Blast radius/replaceability evidence |
| :--- | :--- | :--- | :--- | :--- |
| {{CLASS_MODULE_ENTITY}} | {{RESPONSIBILITY}} | {{CONTRACT}} | {{DEPENDENCY}} | {{IMPACT_TEST_MIGRATION}} |

Không tuyên bố module “độc lập/không ảnh hưởng module khác” nếu thiếu contract, dependency graph, compatibility, regression và rollback evidence.

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

- UI applicability: {{APPLY_TAILOR_NA_REASON}}
- Prototype/design tool decision: Figma / Penpot / MCP / code prototype / N/A — {{RATIONALE}}
- Design system/tokens/components: {{REFERENCE}}
- Responsive breakpoints/devices: {{TARGETS}}
- Accessibility standard/target: {{TARGET}}

Journey UI High/Critical cần prototype được review trước production UI; spike/prototype code phải được đánh dấu non-production. Design-to-code output không được coi production-ready trước code/security/accessibility/performance review.

| State | User sees/does | Accessibility/content | Recovery |
| :--- | :--- | :--- | :--- |
| Loading / Empty / Success / Error / Forbidden / Offline | {{BEHAVIOR}} | {{A11Y}} | {{RECOVERY}} |

## 7. Security/privacy/threat handling

- Security Profile/risk appetite: {{PROFILE_RISK}}
- Trust boundary and permission checks: {{DESIGN}}
- Validation/abuse/rate limit: {{DESIGN}}
- Secret/PII/logging/retention: {{DESIGN}}

| Security requirement/threat | Control/design | Verification | Residual risk/owner |
| :--- | :--- | :--- | :--- |
| NFR-SEC/THR-XXX | {{CONTROL}} | TC-SEC-XXX / {{SCAN}} | {{RISK_OWNER}} |

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
