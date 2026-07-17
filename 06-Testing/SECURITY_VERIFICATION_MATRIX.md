---
artifact_id: DOC-06-TESTING-SECURITY-VERIFICATION-MATRIX-MD
phase: "06-Testing"
artifact_type: testing
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Security Verification Matrix — {{PROJECT_NAME}} / {{BUILD}}

## 1. Execution Context

| Field | Value |
| :--- | :--- |
| Security Profile | {{PROFILE}} |
| Environment/build/commit | {{ENV_BUILD_COMMIT}} |
| Test data classification | Synthetic / Masked / Approved |
| Tools/versions | {{TOOLS_VERSIONS}} |
| Executor/date | {{EXECUTOR_DATE}} |

## 2. Mandatory Security Cases

| Test ID | Requirement | Condition/input | Exact Expected Result | Automation/Evidence | Latest Result | Defect/risk |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `TC-SEC-SECRET-001` | SEC-BNK-004 | Secret scan source/config/history in scope | No verified secrets found; false positives are triaged. | {{COMMAND_REPORT}} | Not Run | — |
| `TC-SEC-SECRET-002` | SEC-BNK-005 | Start with missing required key/secret | Process exits with a non-zero code; error output does not leak secrets. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-AUTHZ-001` | SEC-BNK-006 | Call undeclared route as a standard user | HTTP 403 or policy-equivalent deny. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-AUTHZ-002` | SEC-BNK-007 | Inventory public routes against allowlist | No public routes exist outside the approved allowlist. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-AUTHZ-003` | SEC-BNK-008 | Authority matching only by prefix/substring | Access is denied. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-COOKIE-001` | SEC-BNK-009 | Successful login/OAuth flow | Access/refresh cookies have the `Secure` attribute. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-COOKIE-002` | SEC-BNK-010 | Successful login/OAuth flow | Access/refresh cookies have the `HttpOnly` attribute. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-COOKIE-003` | SEC-BNK-011 | Cross-site request matrix | Browser sends/blocks cookies in accordance with the SameSite policy. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-CORS-001` | SEC-BNK-012 | Preflight request from an origin outside allowlist | No allow-origin header is returned for that origin. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-CORS-002` | SEC-BNK-013 | Credentials=true with wildcard (*) origin | Startup/configuration validation fails or the request is denied. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-CSRF-001` | SEC-BNK-014 | POST cookie-authenticated request lacks CSRF token | HTTP 403 or policy-equivalent deny. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-CSRF-002` | SEC-BNK-014 | POST request with CSRF token of different user/session | HTTP 403 or policy-equivalent deny. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-JWT-001` | SEC-BNK-015 | JWT alg=none or unexpected algorithm | Token is rejected. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-JWT-002` | SEC-BNK-016 | JWT with missing or incorrect issuer | Token is rejected. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-JWT-003` | SEC-BNK-017 | JWT with missing or incorrect audience | Token is rejected when audience validation applies. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-JWT-004` | SEC-BNK-018 | Expired or future nbf token | Token is rejected outside the configured clock-skew tolerance. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-REFRESH-001` | SEC-BNK-019 | Expired refresh token | Refresh request is rejected. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-REFRESH-002` | SEC-BNK-020 | Replaying a rotated refresh token | Replay request is rejected; token family is processed according to policy. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-REFRESH-003` | SEC-BNK-021 | Logout, password change, or user disablement | Associated tokens are no longer valid under the policy. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-LOG-001` | SEC-BNK-022 | Executing auth success/failure/expired flows | Logs do not contain raw tokens, secrets, or authorization headers. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-OAUTH-001` | SEC-BNK-023 | Redirect URI variants or open redirects | Authorization flow is rejected. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-OAUTH-002` | SEC-BNK-024 | Missing or incorrect PKCE code verifier | Token exchange is rejected when PKCE applies. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-PWD-001` | SEC-BNK-025 | Generating a new password hash | Algorithm/parameters match the ADR; verification passes; performance benchmarks meet target. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-SBOM-001` | SEC-BNK-027 | Clean dependency resolution / SBOM / SCA | Full version/provenance is verified; severity gates are met. | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-BUILD-001` | SEC-BNK-028 | Clean build | Command exits with code 0. | {{EVIDENCE}} | Not Run | — |

## 3. Coverage Gate

| Metric | Target | Actual | Decision |
| :--- | :---: | :---: | :--- |
| In-scope Must requirements with tests | 100% | {{PERCENT}} | Pass / Fail |
| Executed cases with evidence | 100% before release | {{PERCENT}} | Pass / Fail |
| Open Critical findings | 0 | {{COUNT}} | Pass / Fail |
| Open High findings | 0 or accepted with appropriate authority/expiry | {{COUNT}} | Pass / Conditional / Fail |

Do not transition requirement status to `Verified` if the test row lacks a command, result, or evidence. Do not write `N/A` without a documented applicability rationale in the Security Adoption Record.
