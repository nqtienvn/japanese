---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-PERMISSION-MATRIX-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Permission Matrix — {{PROJECT_NAME}}

Default rule: **deny**. Every allow row must name a role/principal, resource, action, scope and condition. Exact permission semantics are required; substring/prefix matching is not accepted without a formal delimiter-safe grammar.

| Permission ID | Role/principal | Resource | Action | Scope/tenant | Condition/ABAC | Allow/deny | Separation-of-duty | Requirement/test |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| PERM-001 | {{ROLE}} | {{RESOURCE}} | create/read/update/delete/approve | {{SCOPE}} | {{CONDITION}} | Allow / Deny | {{SOD}} | BR/FR/TC-SEC-XXX |

## Privileged actions

| Action | Step-up/MFA | Dual control | Approval owner | Audit event | Break-glass expiry | Test |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| {{HIGH_IMPACT_ACTION}} | Required / N/A rationale | Required / N/A rationale | {{OWNER}} | {{EVENT}} | {{EXPIRY}} | TC-AUTHZ-XXX |

## Permission verification

- [ ] Unauthenticated request is denied.
- [ ] Authenticated user without exact permission is denied.
- [ ] Tenant/resource ownership cannot be bypassed by ID substitution.
- [ ] Privileged operation records actor, decision and correlation ID.
- [ ] Matrix has no orphan permission or undocumented public action.
