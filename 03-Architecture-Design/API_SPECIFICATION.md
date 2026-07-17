---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-API-SPECIFICATION-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# API, Event & External Interface Specification — {{PROJECT_NAME}}

| Field | Value |
| :--- | :--- |
| Document ID | `{{PROJECT_CODE}}-API-001` |
| Version / status | {{VERSION}} / {{STATUS}} |
| Owner / reviewers | {{OWNER}} / {{REVIEWERS}} |
| Machine-readable contract | `{{OPENAPI_ASYNCAPI_PROTO_PATH}}` |

## Version history

| Version | Date | Author | Reason/change | Endpoints/events affected | Compatibility |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 0.1 | {{DATE}} | {{AUTHOR}} | Initial draft | All | New |

## Conventions

- Base URL/versioning: {{BASE_URL_VERSIONING}}
- Authentication/session/service identity: {{AUTH}}
- Authorization/default-deny: {{AUTHZ}}
- Content type/encoding/timezone/locale: {{CONVENTIONS}}
- Correlation/idempotency/request IDs: {{IDS}}
- Pagination/filter/sort: {{QUERY_CONVENTIONS}}
- Rate limit/quota: {{RATE_LIMIT}}
- Deprecation/compatibility policy: {{POLICY}}

## Endpoint catalog

| API ID | Method/path | Purpose/actor | Requirement/use case | Auth/permission | Request schema | Success/status | Error codes | Test |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| API-XXX-001 | `POST /api/v1/resources` | {{PURPOSE_ACTOR}} | FR/UC-XXX | {{AUTH_PERMISSION}} | `CreateResourceRequest` | `201 ResourceResponse` | ERR-XXX | TC-API-XXX |

## Endpoint detail — API-XXX-001

### Contract

- Preconditions: {{PRECONDITIONS}}
- Atomic behavior/side effects: {{ONE_OBLIGATION_AND_SIDE_EFFECTS}}
- Idempotency/duplicate handling: {{IDEMPOTENCY}}
- Transaction/concurrency: {{TRANSACTION_CONCURRENCY}}
- Timeout/retry/fallback: {{RESILIENCE}}
- Audit/log/metric/trace: {{OBSERVABILITY}}

### Request

| Field/header | Type/format | Required/default | Validation/boundary | Classification | Invalid response |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `{{FIELD}}` | {{TYPE_FORMAT}} | {{REQUIRED_DEFAULT}} | {{VALIDATION}} | {{CLASS}} | `400 ERR-XXX` |

```json
{
  "example": "sanitized-value"
}
```

### Responses

| Status/error | Exact condition | Response schema/message code | State/side effect | Retryable? |
| :--- | :--- | :--- | :--- | :--- |
| `201` | {{SUCCESS_CONDITION}} | `ResourceResponse` | {{STATE}} | No |
| `400 ERR-VALIDATION-001` | {{EXACT_CONDITION}} | `ErrorResponse` | No mutation | No |
| `401/403` | Unauthenticated / insufficient permission | `ErrorResponse` | Audit denial | After auth/change |
| `409 ERR-CONFLICT-001` | Duplicate/version conflict | `ErrorResponse` | No duplicate | Conditional |
| `429/5xx` | Quota/dependency/internal failure | `ErrorResponse` | {{FAILURE_GUARANTEE}} | Per policy |

## Events/webhooks/files

| Interface ID | Producer → consumer | Trigger/schema/version | Delivery/order/idempotency | Auth/signature | Retry/DLQ/replay | Requirement/test |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| EVT-XXX-001 | {{PARTIES}} | {{TRIGGER_SCHEMA}} | {{SEMANTICS}} | {{SECURITY}} | {{RECOVERY}} | FR/TC-XXX |

## Communications interface

| Flow | Protocol/port/DNS | TLS/certificate | Network zone/firewall | Timeout/bandwidth | Monitoring/test |
| :--- | :--- | :--- | :--- | :--- | :--- |
| {{FLOW}} | {{PROTOCOL}} | {{TLS_CERT}} | {{ZONE_RULE}} | {{TARGET}} | {{EVIDENCE}} |

## Contract quality checklist

- [ ] Mọi API/event ID liên kết requirement/use case/test.
- [ ] Request/input data tách rõ, boundary/invalid/empty behavior cụ thể.
- [ ] Success/error status và state/side effect quan sát được, không dùng “báo lỗi” chung chung.
- [ ] Permission, idempotency, concurrency, timeout/retry/fallback và compatibility rõ.
- [ ] Contract machine-readable được validate khi stack hỗ trợ.
