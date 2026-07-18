# Security Reference Review

## Review context

| Field | Value |
| :--- | :--- |
| Review date | 2026-07-17 |
| Engagement | `CHANGE` — integration of security reference into the AI Project Delivery template |
| Risk context | Financial/banking reference; evaluated under CRITICAL profile for adoption purposes |
| Source mutation | None; both source directories kept intact |
| Snapshot status | `QUARANTINED_REFERENCE` until project-specific adoption gates are met |

## Evidence inventory

| Reference | Code inventory | Test inventory | Build evidence |
| :--- | :--- | :--- | :--- |
| Legacy | 23 Java + POM + 1 YAML | No src/test found | `mvn -q test` failed at dependency resolution because internal artifacts/parent `${app.version}` are unavailable |
| Starter | 14 Java main + 4 Java templates + POM/templates/resources | No src/test found | `mvn -q test` failed: Lombok-generated `log` not resolved and `SecurityUtils` generic type mismatch |

## Findings Required to Resolve Before Production

| Finding ID | Severity | Evidence Summary | Baseline Decision |
| :--- | :---: | :--- | :--- |
| `RISK-SEC-REF-001` | Critical | Legacy YAML contains committed Jasypt encryptor password | Raw value omitted from snapshot; rotate/revoke by owner if still active |
| `RISK-SEC-REF-002` | High | Legacy uses `PBEWithMD5AndTripleDES` and low iteration count | Prohibit default use; choose active secret/key management mechanism based on threat model |
| `RISK-SEC-REF-003` | Critical | Legacy cookie filters log access tokens and CSRF tokens | Prohibit logging tokens/credentials; add log-redaction tests |
| `RISK-SEC-REF-004` | Critical | Legacy has a refresh token generation path without expiration | Do not adopt; refresh tokens must have lifetimes, rotation, replay detection, and revocation |
| `RISK-SEC-REF-005` | High | Starter disables Spring CSRF while access/refresh tokens reside in cookies | Enable CSRF or prove equivalent mechanisms for all unsafe methods |
| `RISK-SEC-REF-006` | High | Starter default CORS allows origin/headers '*' with credentials | Default must deny; allowlist origin/method/headers based on environment |
| `RISK-SEC-REF-007` | High | JWT validation primarily checks signature/type/subject; does not fully enforce issuer/audience/jti/policy/rotation | Implement claims policy, key lifecycles, replay/revocation, and negative tests |
| `RISK-SEC-REF-008` | High | Refresh token starter is a reusable bearer token lacking rotation/reuse detection | Enforce one-time rotation or approved sender-constrained/compensating controls |
| `RISK-SEC-REF-009` | High | OAuth provider/redirect/cookie behaviors are hard-coded and lack PKCE/exact redirect validation | Apply RFC 9700; enforce exact redirect allowlists and PKCE based on client type |
| `RISK-SEC-REF-010` | High | Legacy permission evaluator uses startsWith + contains | Do not use for authorization decisions; enforce exact authority/permission mapping and test confusion cases |
| `RISK-SEC-REF-011` | High | Both references lack automated tests; starter does not compile independently | Adoption gate fails until build and security verification pass |
| `RISK-SEC-REF-012` | Medium | Starter uses BCrypt by default; OWASP currently prefers Argon2id for new systems | New projects prefer Argon2id; BCrypt only allowed with clear compatibility/risk rationales |
| `RISK-SEC-REF-013` | High | Spring Boot 3.2.2 and dependency sets are outdated relative to the active baseline | Run compatibility/advisory/SCA; do not upgrade blindly and do not retain "latest" claims |
| `RISK-SEC-REF-014` | High | Source templates contain DB passwords/JWT fallbacks, auto-schema updates, and unsafe SQL/error/debug logging | Snapshot retains only sanitized configs; production configs must be scanned |

## Reusable Components Post-Review

- Spring Boot auto-configuration structure and property binding.
- JWT access/CSRF token models as design inputs, not acceptance evidence.
- Spring method security integration after replacing permission matching with exact policies.
- `SecurityUtils`, auditor-aware, password encoder, and OAuth user mapping after compile/test reviews.
- Legacy token cache/invalidation concepts after adding concurrency, expiry, logout/password-change, and replay tests.

## Release rule

No component in the snapshot is considered production-ready simply because it was copied. A project can only adopt a component when the corresponding row in `SECURITY_ADOPTION_RECORD.md` is `Verified`, `SECURITY_VERIFICATION_MATRIX.md` contains passing evidence, and no Critical findings remain open.
