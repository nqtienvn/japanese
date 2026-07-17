---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-SECURITY-ADOPTION-RECORD-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Security Adoption Record — {{PROJECT_NAME}}

## 1. Context

| Trường | Giá trị |
| :--- | :--- |
| Security Profile | `STANDARD / HIGH / CRITICAL` |
| Application stack/version | {{STACK_VERSION}} |
| Identity model | {{IDENTITY_MODEL}} |
| Authorization model | {{AUTHORIZATION_MODEL}} |
| Token/session model | {{TOKEN_SESSION_MODEL}} |
| Security owner | {{SECURITY_OWNER}} |
| Review date/build | {{DATE_BUILD}} |

## 2. Reference decision

| Reference component | Source path/symbol | Existing equivalent | Decision | Delta/hardening | Requirement | Design/ADR | Work item | Test IDs | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Security filter chain | `assets/security-reference/mb-security-starter/.../MbSecurityAutoConfiguration.java` | {{PATH_SYMBOL}} | Adopt / Adapt / Reject / N/A | {{DELTA}} | SEC-BNK-006 | ADR-SEC-001 | WI-SEC-001 | TC-SEC-AUTH-001 | Draft |
| JWT provider | `assets/security-reference/mb-security-starter/.../JwtTokenProvider.java` | {{PATH_SYMBOL}} | {{DECISION}} | {{DELTA}} | SEC-BNK-015..020 | {{ADR}} | {{WI}} | {{TC_IDS}} | Draft |
| JWT/cookie filters | `assets/security-reference/*/.../*CookieFilter.java` | {{PATH_SYMBOL}} | {{DECISION}} | {{DELTA}} | SEC-BNK-009..014 | {{ADR}} | {{WI}} | {{TC_IDS}} | Draft |
| Token store/invalidation | `assets/security-reference/legacy-bank-security/.../TokenService.java` | {{PATH_SYMBOL}} | {{DECISION}} | {{DELTA}} | SEC-BNK-019..021 | {{ADR}} | {{WI}} | {{TC_IDS}} | Draft |
| Method authorization | `assets/security-reference/legacy-bank-security/.../PermissionEvaluatorImpl.java` | {{PATH_SYMBOL}} | {{DECISION}} | {{DELTA}} | SEC-BNK-006..008 | {{ADR}} | {{WI}} | {{TC_IDS}} | Draft |
| Password hashing | `assets/security-reference/mb-security-starter/.../PasswordEncoderConfig.java` | {{PATH_SYMBOL}} | {{DECISION}} | {{DELTA}} | SEC-BNK-025..026 | {{ADR}} | {{WI}} | {{TC_IDS}} | Draft |
| OAuth2/OIDC | `assets/security-reference/mb-security-starter/.../oauth2/` | {{PATH_SYMBOL}} | {{DECISION}} | {{DELTA}} | SEC-BNK-023..024 | {{ADR}} | {{WI}} | {{TC_IDS}} | Draft |
| RSA/crypto helper | `assets/security-reference/legacy-bank-security/.../RsaProvider.java` | {{PATH_SYMBOL}} | {{DECISION}} | {{DELTA}} | {{SEC_ID}} | {{ADR}} | {{WI}} | {{TC_IDS}} | Draft |
| Secret/config | `assets/security-reference/*/application*.yml` | {{PATH_SYMBOL}} | {{DECISION}} | {{DELTA}} | SEC-BNK-004..005 | {{ADR}} | {{WI}} | {{TC_IDS}} | Draft |

Trạng thái hợp lệ: `Draft`, `Designed`, `Implemented`, `Verified`, `Rejected`, `N/A`.

## 3. Threat/control delta

| Threat/Risk ID | Asset/trust boundary | Reference gap | Project control | Verification | Residual risk/owner |
| :--- | :--- | :--- | :--- | :--- | :--- |
| RISK-SEC-REF-003 | Token/log sink | Legacy logs token | Structured redaction policy | TC-SEC-LOG-001 | {{RISK_OWNER}} |

## 4. Configuration contract

| Config/secret reference | Required | Source/owner | Rotation/reload | Missing-value behavior | Log/redaction evidence |
| :--- | :---: | :--- | :--- | :--- | :--- |
| `JWT_SECRET` / key reference | Yes | {{SECRET_MANAGER_OWNER}} | {{ROTATION}} | Startup fail | {{TC_EVIDENCE}} |

## 5. Compatibility and blast radius

- API/cookie/header compatibility: {{COMPATIBILITY}}
- User/session migration: {{MIGRATION}}
- Downstream services/gateway: {{DEPENDENCIES}}
- Feature flag/canary: {{ROLLOUT}}
- Rollback and token invalidation: {{ROLLBACK}}

## 6. Review decision

| Review | Owner | Evidence | Decision/date |
| :--- | :--- | :--- | :--- |
| Architecture/security | {{OWNER}} | {{EVIDENCE}} | Pass / Conditional / Fail |
| QA negative-test derivation | {{OWNER}} | `06-Testing/SECURITY_VERIFICATION_MATRIX.md` | Pass / Conditional / Fail |
| Residual High risk | {{AUTHORIZED_OWNER}} | {{RISK_ACCEPTANCE}} | Accepted / Rejected / N/A |
