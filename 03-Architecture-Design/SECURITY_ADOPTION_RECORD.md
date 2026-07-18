---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-SECURITY-ADOPTION-RECORD-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "AI Security Architect"
version: "1.0"
status: Complete
ids: [SEC-GPA-ADOPT-01]
dependencies: [GPA-SRS-001]
last_verified: "2026-07-18"
---
# Security Adoption Record — UniGPA

## 1. Context

| Field | Value |
| :--- | :--- |
| Security Profile | `HIGH` |
| Application stack/version | Spring Boot 3.2.x, Java 17, Spring Security 6.x |
| Identity model | Google OAuth 2.0 Identity Federation & Local User Accounts |
| Authorization model | Role-based & Resource Ownership checks (Method security) |
| Token/session model | Stateless JWT session tokens |
| Security owner | AI Security Architect |
| Review date/build | 2026-07-18 |

## 2. Reference Decision

We utilize Spring Security 6.x standards for high-security baseline controls:

| Reference Component | Source Path/Symbol | Existing Equivalent | Decision | Delta/Hardening | Requirement | Design/ADR | Work Item | Test IDs | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Security filter chain | Spring Security default | `SecurityFilterChain` bean | Adopt | Enforce stateless sessions, JWT filter, and default-deny allowlist. | `NFR-SEC-001` | `GPA-SAD-001` | WI-SEC-001 | `TC-SEC-AUTHZ-01` | Designed |
| JWT provider | Local utility | `JwtTokenProvider` class | Adopt | Signature key loading from env; set 1-hour access token expiry. | `NFR-SEC-001` | `GPA-SAD-001` | WI-SEC-002 | `TC-SEC-JWT-01` | Designed |
| CORS/CSRF configurations | Spring Security configuration | `CorsConfigurationSource` | Adopt | Allowed origins strictly limited. Disable CSRF since APIs use stateless JWT. | `NFR-SEC-001` | `GPA-SAD-001` | WI-SEC-003 | `TC-SEC-CORS-01` | Designed |
| PII Database Encryption | Spring Data / JPA Converter | `AttributeConverter` | Adopt | AES-256 database column encryption for user email and transcript logs. | `NFR-SEC-002` | `GPA-SAD-001` | WI-SEC-004 | `TC-SEC-CRYPT-01` | Designed |
| Password hashing | BCrypt encoder | `BCryptPasswordEncoder` | Adopt | Work factor set to 12 (standard for high security). | `NFR-SEC-001` | `GPA-SAD-001` | WI-SEC-005 | `TC-SEC-PWD-01` | Designed |

Valid Statuses: `Draft`, `Designed`, `Implemented`, `Verified`, `Rejected`, `N/A`.

## 3. Threat/Control Delta

| Threat/Risk ID | Asset/trust boundary | Reference gap | Project control | Verification | Residual risk/owner |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `THR-GPA-TAMP` | Scrape payload tampering | API receives user grades via HTTP client | Scraper signatures & validation | `TC-SEC-TAMP-01` | Medium / Tech Lead |
| `THR-GPA-DOS` | Database overflow via scraper | Spammed sync calls | Rate limiting per user | `TC-SEC-DOS-01` | Low / Ops Lead |

## 4. Configuration Contract

| Config/secret reference | Required | Source/owner | Rotation/reload | Missing-value behavior | Log/redaction evidence |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `JWT_SECRET_KEY` | Yes | System environment | Restart required | Application startup fails | Value redacted in configs |
| `DB_ENCRYPTION_KEY` | Yes | System environment | Restart required | Application startup fails | Value redacted in configs |

## 5. Compatibility and Blast Radius

- **API/cookie/header compatibility:** Chrome Extension includes `Authorization: Bearer <token>` in header of all scrape payloads.
- **User/session migration:** N/A for Greenfield release.
- **Downstream services/gateway:** Rate-limiting handles traffic peaks.
- **Rollout:** Canary release with internal dev extension loading before Web Store rollout.

## 6. Review Decision

| Review | Owner | Evidence | Decision/Date |
| :--- | :--- | :--- | :--- |
| Architecture/security | Security Lead | threat model and adoption checks complete | Pass / 2026-07-18 |
| QA negative-test derivation | QA Lead | test specification covers authorization edge cases | Pass / 2026-07-18 |
| Residual High risk | Client | Tampering mitigation accepted | Accepted / 2026-07-18 |
