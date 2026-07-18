# Security Reference Adoption Workflow

## 1. When to use

Read this reference in every engagement. Fully execute it when the project involves authentication, authorization, sessions/tokens, secrets, PII, public APIs, third-party identity providers, or a `HIGH/CRITICAL` Security Profile.

The internal source code is located in `assets/security-reference/`. This code serves as a mandatory input for analysis, not a final security conclusion.

## 2. Reference selection rules

| Project context | Mandatory Action |
| :--- | :--- |
| Java 21 / Spring Boot 3+ hasn't had a security module | Use `mb-security-starter` as the starting inventory; import along vertical slices and then harden according to the baseline |
| Spring legacy or needs to preserve old behavior/cache contracts | Compare both snapshots; use legacy to understand compatibility, but do not retain anti-patterns |
| Project already has a security module | Do not overwrite; create a component-by-component delta with both snapshots and preserve better conventions that have evidence |
| Stack other than Java/Spring | Read [security-portability-matrix.md](security-portability-matrix.md); refactor controls/behaviors to the native framework; record `N/A — stack mismatch` for Java code copies, but do not record N/A for security outcomes |
| Managed IdP/API gateway holds security responsibility | Verify contracts, issuers, audiences, authorization boundaries, token lifecycles, and fallbacks; do not build a custom IdP unless explicitly required |
| Social OAuth outside scope | Do not import Google/Facebook providers; record a N/A rationale |

If applicability is unclear, the AI must first inspect manifests, frameworks, routes, filters, identity integrations, and deployment topologies. Only query stakeholders when changes impact the product identity model, risk appetite, or contractual/regulatory boundaries.

## 3. Automated adoption loop

1. **Inventory** — index codebase; locate authentication entry points, filter chains, token/session stores, permission models, secret sources, public routes, IdPs, gateways, and tests.
2. **Profile** — select `STANDARD/HIGH/CRITICAL`; financial/payment/privileged production defaults to `CRITICAL` unless the owner decides otherwise.
3. **Compare** — populate `03-Architecture-Design/SECURITY_ADOPTION_RECORD.md` for each component in the snapshot.
4. **Threat model** — map assets, attackers, trust boundaries, abuse cases, and controls prior to Gate 03.
5. **Import/translate** — copy applicable code into the working branch or translate it to the target stack; do not copy secrets or unsafe configurations.
6. **Harden** — address all related findings documented in `assets/security-reference/SECURITY_REVIEW.md`.
7. **Verify** — run builds, unit/integration/security tests, secret scans, SCA/SBOM, and config validation corresponding to the profile.
8. **Trace** — update requirement → design/ADR → work item → code/config → test result → residual risk mappings.
9. **Gate** — only mark a component as `Verified` when the exact expected result is achieved; do not use "source previously ran at a bank" as test evidence.

The AI executes this loop autonomously within the local, reversible scope after the baseline is established. Do not ask the Client to select libraries, package layouts, test frameworks, or how to resolve compilation errors if repository evidence is sufficient to decide.

For non-Java languages, "translate" means refactoring according to responsibility and security contracts. The AI must create native code for the target stack; do not perform a line-by-line translation of Java and do not introduce a JVM into the architecture simply to run the snapshot.

## 4. Every adoption must resolve at least the following points:

- Secret fail-fast using a secret manager/injection; do not fallback to literals.
- Default deny for routes and methods; public endpoints must reside on an allowlist with a designated owner.
- CORS origin/method/headers must be explicit by environment; credentials must not be sent with wildcards.
- For credentials in cookies, CSRF protection must be enabled or have an equivalent control that has been threat-modeled/tested.
- Cookies must have `Secure`, `HttpOnly`, `SameSite`, minimal path/domain scope, and bounded lifetime.
- JWT parser pins algorithm/keys; enforce `iss`, `aud`, `exp`, `nbf`, `iat`, token type, and replay policies per use case.
- Access tokens must be short-lived; refresh tokens require rotation, reuse detection, expiry, revocation, and security-event invalidation.
- Authorization uses exact permission/resource/action mapping; prohibit substring/prefix ambiguity unless a delimiter-safe formal grammar is in place.
- Do not log tokens, secrets, credentials, authorization headers, or sensitive claims.
- OAuth/OIDC uses exact redirect URIs, `state`, PKCE/nonce based on client type and RFC 9700.
- New passwords prefer Argon2id; BCrypt is only retained for compatibility with a benchmarked work factor and a migration plan.
- Dependency/framework versions must be actively supported; SCA/advisory results dictate upgrades, do not rely on "latest" labels in old documentation.
- Build/testing must pass; snapshots lacking tests are not considered acceptable coverage.

## 5. Human-exclusive decisions

The AI only requests human assistance when one of the following decisions is missing after attempting to extract evidence:

- Product identity model or user journeys cannot be inferred.
- Risk appetite, residual High risk acceptance, or regulatory/legal applicability.
- Rights to use/publish proprietary reference code.
- Production IdP/secret references/credentials must be provisioned by the owner via secure channels.
- Production changes, destructive migrations, external penetration test authorizations, or formal sign-offs.

Humans are not required to write code, select implementation details, run local tests, or read logs for the AI simply because a task is difficult or slow. Stakeholder questions must be batched (5-12 questions), focusing on intent, authority, or acceptance, and update the Discovery Log.

## 6. Mandatory evidence

- `03-Architecture-Design/THREAT_MODEL.md`
- `03-Architecture-Design/SECURITY_ADOPTION_RECORD.md`
- `06-Testing/SECURITY_VERIFICATION_MATRIX.md`
- Secret scans, dependency/SCA, SBOM/provenance, and build results
- Negative authorization/CSRF/CORS/JWT/refresh/OAuth tests by attack surface
- Release report documenting the Security Profile, exclusions, findings, residual risk, and owners

## 7. External baseline verified on 2026-07-17

- [OWASP ASVS 5.0.0](https://github.com/OWASP/ASVS) — application security requirements; pin IDs in `v5.0.0-x.y.z` format when mapping controls.
- [RFC 9700 — OAuth 2.0 Security Best Current Practice](https://www.rfc-editor.org/info/rfc9700/) — redirects, PKCE, token replay, and refresh token protection.
- [OWASP Password Storage Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html) — Argon2id preferred; BCrypt for legacy systems when Argon2/scrypt is unavailable.
- [Spring Security CSRF reference](https://docs.spring.io/spring-security/reference/servlet/exploits/csrf.html) — CSRF controls and testing for unsafe methods.
- [Spring Boot project](https://spring.io/projects/spring-boot/) — verify active/current versions at the time of adoption; do not automatically upgrade major versions without compatibility evidence.

The above references are technical baselines, not certifications or legal opinions.
