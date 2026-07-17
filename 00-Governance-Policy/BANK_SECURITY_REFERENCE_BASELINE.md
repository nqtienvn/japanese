---
artifact_id: DOC-00-GOVERNANCE-POLICY-BANK-SECURITY-REFERENCE-BASELINE-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Bank Security Reference Baseline

## 1. Claim Boundary

This baseline requires all projects to evaluate and implement controlled adoption of the two security code snapshots provided by the Client. The term "Bank" describes the business provenance provided by the Client and does not imply independent certification. The actual Security Profile, threat model, current advisories, and test evidence determine release readiness.

Source of truth:
- `.agents/skills/ai-project-delivery/assets/security-reference/`
- `.agents/skills/ai-project-delivery/references/security-adoption-workflow.md`
- `03-Architecture-Design/SECURITY_ADOPTION_RECORD.md`
- `06-Testing/SECURITY_VERIFICATION_MATRIX.md`

## 2. Applicability

| Scenario | Applied Baseline |
| :--- | :--- |
| Java/Spring self-managed authentication/authorization | Evaluate the entire snapshot; import and harden relevant components. |
| Java/Spring with existing security module | Diff all controls; do not overwrite behaviors that already have better evidence. |
| Other stacks | Map requirements and controls; code snapshot is marked N/A due to stack mismatch. |
| Managed identity | Map boundaries and contracts; do not replicate identity services unless explicitly required. |
| No authentication, sensitive data, or exposure | Tailor each control with a clear rationale; Security Owner reviews before Gate 03. |

## 3. Normative Requirements

| ID | Atomic Requirement | Verifiable Expected Result |
| :--- | :--- | :--- |
| `SEC-BNK-001` | The AI **SHALL** read the security snapshot review before designing security. | The Adoption Record documents the source path and review date. |
| `SEC-BNK-002` | Java/Spring projects **SHALL** evaluate all components within the two snapshots. | Each component must have `Adopt / Adapt / Reject / N/A` with documented rationale. |
| `SEC-BNK-003` | The AI **SHALL NOT** overwrite existing security modules before conducting an impact analysis. | Git diff shows no changes outside scope; the blast radius is documented. |
| `SEC-BNK-004` | Secrets **SHALL NOT** have literal values in source code or artifacts. | Secret scans show zero real findings; examples contain references only. |
| `SEC-BNK-005` | Runtimes **SHALL** fail fast when mandatory secrets are missing. | Negative startup tests terminate with redacted error details. |
| `SEC-BNK-006` | Authorization boundaries **SHALL** use default deny. | Undeclared routes/operations receive appropriate `401/403` errors. |
| `SEC-BNK-007` | Public endpoints **SHALL** be explicitly allowlisted with an owner. | Route inventory matches the allowlist; no broad wildcards without documented rationales. |
| `SEC-BNK-008` | Permission decisions **SHALL** match the resource/action using exact rules. | Prefix/substring confusion cases are rejected. |
| `SEC-BNK-009` | Credential cookies **SHALL** have the `Secure` attribute. | `Set-Cookie` tests verify the presence of the attribute. |
| `SEC-BNK-010` | Credential cookies **SHALL** have the `HttpOnly` attribute. | `Set-Cookie` tests verify the presence of the attribute. |
| `SEC-BNK-011` | Credential cookies **SHALL** have the `SameSite` attribute configured according to the threat model. | Cross-site positive/negative tests verify the expected policy. |
| `SEC-BNK-012` | CORS origins **SHALL** be restricted via environment-specific allowlists. | Origins outside the allowlist do not receive access-control-allow-origin headers. |
| `SEC-BNK-013` | CORS credentials **SHALL NOT** be combined with wildcard (*) origins. | Configuration validation or integration tests reject this setup. |
| `SEC-BNK-014` | Unsafe cookie-authenticated requests **SHALL** implement CSRF controls. | Requests with missing or invalid CSRF tokens are rejected. |
| `SEC-BNK-015` | JWT verifiers **SHALL** enforce approved algorithms. | Tokens using `none` or unapproved algorithms are rejected. |
| `SEC-BNK-016` | JWT verifiers **SHALL** enforce issuer validation. | Tokens with wrong or missing issuers are rejected. |
| `SEC-BNK-017` | JWT verifiers **SHALL** enforce audience validation when the token contains resource audiences. | Tokens with wrong or missing audiences are rejected. |
| `SEC-BNK-018` | JWT verifiers **SHALL** enforce token expiration. | Expired or not-yet-valid tokens are rejected. |
| `SEC-BNK-019` | Refresh tokens **SHALL** have a bounded lifetime. | Expired tokens fail to refresh. |
| `SEC-BNK-020` | Refresh tokens **SHALL** implement reuse detection or approved sender constraints. | Token replays are rejected; token families are handled per policy. |
| `SEC-BNK-021` | Security events **SHALL** trigger token invalidation according to policy. | Logout, password change, or user disablement tests invalidate associated tokens. |
| `SEC-BNK-022` | Applications **SHALL NOT** log raw tokens or credentials. | Log scans after positive/negative authentication flows yield zero leaked values. |
| `SEC-BNK-023` | OAuth redirect URIs **SHALL** match the registered URIs exactly. | Variant URIs or open redirects are rejected. |
| `SEC-BNK-024` | OAuth authorization-code flows **SHALL** use PKCE when RFC 9700 requires it. | Requests with missing or wrong code verifiers are rejected. |
| `SEC-BNK-025` | New passwords **SHOULD** be hashed using Argon2id according to project benchmarks. | Hash format/parameter tests and performance evidence meet target metrics. |
| `SEC-BNK-026` | Legacy BCrypt usage **SHALL** have a documented compatibility rationale. | An ADR documents the work factor, 72-byte handling, and migration path. |
| `SEC-BNK-027` | Security dependencies **SHALL** have verified version provenance. | Lockfiles, build configs, or SBOMs contain resolved dependency versions. |
| `SEC-BNK-028` | Security builds **SHALL** compile successfully before Gate 05. | Build commands return exit code 0 in a clean sandbox environment. |
| `SEC-BNK-029` | Security requirements **SHALL** have passing negative test cases before release. | The Test RTM records cases, results, and evidence for each mandatory requirement. |
| `SEC-BNK-030` | Releases **SHALL NOT** have any open Critical security findings. | Security reports show zero open Critical findings. |
| `SEC-BNK-031` | Non-Java projects **SHALL** refactor security responsibilities to native language primitives. | The Adoption Record documents `Adapt — cross-language`; target code has no JVM dependencies outside approved architecture. |
| `SEC-BNK-032` | Cross-language refactoring **SHALL** prove behavioral equivalence for retained contracts. | Contract tests run against the target implementation yield passing evidence. |
| `SEC-BNK-033` | Projects **SHALL NOT** use language differences as a justification to omit security outcomes. | All applicable controls have implementations or approved replacement controls. |

## 4. Human Decision Boundary

The AI independently decides how to implement, test, package, refactor, and version patch/minor releases when compatibility evidence is sufficient. Humans exclusively decide on product identity models, risk appetite, legal/regulatory applicability, proprietary code permissions, production credentials/references, production changes, and formal acceptance sign-offs.

## 5. Tailoring

Document tailoring decisions; do not delete inapplicable controls; instead, record the reason and replacement controls.
