---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-API-SPECIFICATION-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "AI Solution Architect"
version: "1.0"
status: Complete
ids: [API-GPA-AUTH-01, API-GPA-TRANS-01, API-GPA-ROADMAP-01, API-GPA-RANK-01]
dependencies: [GPA-SRS-001]
last_verified: "2026-07-18"
---
# API, Event & External Interface Specification — UniGPA

| Field | Value |
| :--- | :--- |
| Document ID | `GPA-API-001` |
| Version / status | 1.0 / Approved |
| Owner / reviewers | AI Solution Architect / Client |
| Machine-readable contract | `/03-Architecture-Design/openapi-spec.json` |

## Version History

| Version | Date | Author | Reason/change | Endpoints/events affected | Compatibility |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1.0 | 2026-07-18 | AI Solution Architect | Initial API specification for Spring Boot controllers | All | New |

## Conventions

- **Base URL/versioning:** `/api/v1`
- **Authentication/session/service identity:** JWT Bearer Token in `Authorization: Bearer <token>` header.
- **Authorization/default-deny:** Enforced method-level security checking if `transcript.user_id == current_user.id`.
- **Content type/encoding/timezone/locale:** `application/json; charset=utf-8` / UTC.
- **Rate limit/quota:** 60 requests/minute per IP address for standard APIs; 10 requests/minute for transcript upload.

## Endpoint Catalog

| API ID | Method/path | Purpose/actor | Requirement/use case | Auth/permission | Request Schema | Success/status | Error codes | Test |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `API-GPA-AUTH` | `POST /api/v1/auth/google` | Exchange Google OAuth Token for App JWT. | `FR-GPA-006` | Public | `GoogleAuthRequest` | `200 JwtResponse` | ERR-AUTH-001 | `TC-API-AUTH-01` |
| `API-GPA-TRANS`| `POST /api/v1/transcripts` | Upload scraped transcript from Chrome Extension. | `FR-GPA-001`, `FR-GPA-002` | User JWT | `TranscriptUploadRequest` | `201 TranscriptResponse` | ERR-VAL-001 | `TC-API-TRANS-01` |
| `API-GPA-ROAD` | `GET /api/v1/transcripts/{id}/roadmap` | Fetch roadmap and suggested grades. | `FR-GPA-003`, `FR-GPA-008` | User JWT (Owner) | Query: `targetGpa` | `200 RoadmapResponse` | ERR-NF-001 | `TC-API-ROAD-01` |
| `API-GPA-RANK` | `GET /api/v1/ranks` | Fetch anonymous percentile rank in Major. | `FR-GPA-005` | User JWT | None | `200 RankResponse` | ERR-AUTH-002 | `TC-API-RANK-01` |

## Endpoint Detail — API-GPA-TRANS

### Contract

- **Preconditions:** User is logged in (JWT valid). Chrome Extension has successfully parsed portal page.
- **Atomic behavior/side effects:** Database transaction persists a `Transcript` and linked `GradeRecord` records.
- **Idempotency/duplicate handling:** Client generates a hash of the raw transcript payload; server rejects duplicate syncs within 5 minutes.
- **Timeout/retry/fallback:** Timeout: 10s. Client retries 3 times on 5xx.

### Request

| Field/header | Type/format | Required/default | Validation/boundary | Classification | Invalid response |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `Authorization` | Header | Yes | Must start with "Bearer " | Sensitive | `401 Unauthorized` |
| `university` | String | Yes | Enum: FPT, NEU | Internal | `400 ERR-VAL-001` |
| `major` | String | Yes | Non-empty | Internal | `400 ERR-VAL-001` |
| `intakeYear` | Integer | Yes | Range: 2000-2050 | Internal | `400 ERR-VAL-001` |
| `courses` | Array | Yes | Non-empty array of Course objects | Confidential | `400 ERR-VAL-001` |

Request Body JSON:
```json
{
  "university": "NEU",
  "major": "Software Engineering",
  "intakeYear": 2022,
  "courses": [
    {
      "code": "IT2110",
      "name": "Object-Oriented Programming",
      "credits": 3,
      "grade10": 8.5
    }
  ]
}
```

### Responses

| Status/error | Exact condition | Response schema/message code | State/side effect | Retryable? |
| :--- | :--- | :--- | :--- | :--- |
| `201` | Transcript stored successfully | `TranscriptResponse` | New database row inserted | No |
| `400 ERR-VAL-001` | Missing fields or malformed schema | `ErrorResponse` | No database changes | No |
| `401` | JWT expired or missing | `ErrorResponse` | Access Denied | Yes, after re-login |

## Endpoint Detail — API-GPA-ROAD

### Request query params:
- `targetGpa` (Decimal, Required, e.g. `3.60`)

Response JSON:
```json
{
  "transcriptId": 12345,
  "targetGpa": 3.60,
  "remainingCredits": 48,
  "requiredGpaRemaining": 3.42,
  "suggestedCourses": [
    {
      "code": "IT4442",
      "name": "Artificial Intelligence",
      "credits": 3,
      "suggestedGrade": "A",
      "suggestedGrade4": 4.0,
      "difficulty": "HARD"
    }
  ]
}
```

## Communications Interface

All APIs run over **HTTPS (Port 443)** using **TLS 1.3** and strict Let's Encrypt certificates.

## Contract Quality Checklist

- [x] Every API/event ID is linked to a requirement, use case, and test case.
- [x] Request/input data is clearly separated, with specific boundary/invalid/empty behavior defined.
- [x] Success/error status and observable state/side effects are defined, avoiding vague "error report" terms.
- [x] Permissions, idempotency, concurrency, timeout/retry/fallback, and compatibility rules are clear.
- [x] Machine-readable contracts are validated automatically where stack support is available.
