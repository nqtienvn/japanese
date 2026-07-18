# Security Portability and Refactoring Matrix

## 1. Principles

The two Java snapshots serve as evidence of the responsibilities and behaviors implemented in the past. They do not restrict the project's programming language. When the project uses a different tech stack, the AI must refactor them into a native implementation while preserving security invariants, required contract compatibilities, and test outcomes.

```text
Java reference class
→ responsibility + trust boundary + observable contract
→ native framework primitive
→ project-specific threat control
→ negative/compatibility test evidence
```

Do not perform a line-by-line translation. Do not simulate Java annotations, servlet filters, or Spring beans if the target stack has more suitable native primitives.

## 2. Responsibility mapping

| Java reference | Security responsibility | .NET | Node.js/TypeScript | Go | Python | Mandatory invariant |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `MbSecurityAutoConfiguration` / `JWTConfigurer` | Security pipeline, route policy, default deny | ASP.NET Core authentication/authorization middleware + policy | Framework middleware/guard + centralized policy | `net/http`/router middleware + policy layer | ASGI middleware/dependency + policy layer | Authn before authz; public route allowlist; deny by default |
| `JwtTokenProvider` | Issue/verify token and claims policy | Native JWT bearer/token handler or maintained JOSE library | Maintained JOSE/JWT library | Maintained JOSE/JWT package | Maintained JOSE/JWT package | Pin algorithm/key; validate issuer/audience/time/type; key rotation |
| `JWTCookieFilter` / `JwtAuthenticationFilter` | Extract credential, bind CSRF/session, set principal | Cookie/header handler + antiforgery middleware | Cookie/header middleware + CSRF middleware | Explicit cookie/header middleware | Cookie/header dependency + CSRF middleware | Do not log credentials; invalid tokens do not create a principal |
| `TokenService` | Token family state, invalidation, replay protection | Distributed cache/database repository | Cache/database repository | Cache/database repository | Cache/database repository | Atomic rotation; bounded TTL; logout/security-event invalidation |
| `PermissionEvaluatorImpl` | Resource/action authorization | Requirement/handler policy | Guard/policy engine | Explicit policy function/engine | Dependency/policy engine | Exact match; tenant/resource scope; no prefix/substring confusion |
| `PasswordEncoderConfig` | Password hashing/verification/migration | Platform password hasher/Argon2id provider | Argon2id provider | Argon2id provider | Argon2id provider | Per-user salt; tuned cost; rehash/migration path; no plaintext |
| OAuth2 classes | OIDC/OAuth client flow | OpenID Connect/OAuth handler | Maintained OIDC/OAuth client | Maintained OIDC/OAuth client | Maintained OIDC/OAuth client | Discovery/metadata validation; exact redirect; state; PKCE/nonce |
| `RsaProvider` | Asymmetric crypto/key loading | Platform cryptography/KMS client | Platform crypto/KMS client | `crypto` packages/KMS client | `cryptography`/KMS client | Approved algorithm/padding; key outside source; rotation/provenance |
| `SecurityUtils` / auditor | Principal access and audit attribution | Request/user context | Request context | `context.Context` | Request/dependency context | Principal immutable per request; audit identity server-derived |
| YAML properties | Typed config and secret references | Options/config providers | Schema-validated config | Typed config validation | Settings/schema validation | Required secret fail-fast; environment separation; redacted errors |

Specific package/library names must be chosen by the AI based on the repository's active ecosystem, maintenance status, licenses, compatibility, and security advisories. This matrix does not pin specific third-party libraries.

## 3. Refactor workflow for other stacks

1. Inventory public routes, credential channels, auth claims, permission vocabulary, token lifecycle, and downstream compatibility.
2. Create component mapping in `SECURITY_ADOPTION_RECORD.md`; record the Java source row as `Adapt — cross-language`.
3. Separate mandatory contracts to preserve from implementation details allowed to change.
4. Select native primitives/libraries with maintenance evidence; pin the resolved version and license.
5. Write characterization tests for the existing contract if executing a migration or brownfield project.
6. Implement a small vertical slice: authenticate → authorize → audit → revoke.
7. Run all applicable cases in the `SECURITY_VERIFICATION_MATRIX.md`.
8. Only remove compatibility adapters after consumer migration and rollback evidence targets are achieved.

## 4. Contracts to preserve or modify

| Contract | Default | When Allowed to Change |
| :--- | :--- | :--- |
| Cookie/header names | Preserve if active clients exist | Requires versioning, migration, and a rollback plan |
| JWT issuer/audience/claim vocabulary | Preserve if service federation depends on it | Requires coordinated consumer rollout and token invalidation plans |
| Permission/resource/action vocabulary | Preserve semantics, fix unsafe matching | Requires authorization migration matrix and negative tests |
| Token format | JWT format not required if architecture is better | Requires an ADR demonstrating impact, client compatibility, and operational support |
| OAuth provider | Preserve only providers within scope | Requires confirmation from the Product/Identity Owner for removal/change |
| Package/class layout | Do not preserve | AI refactors according to native conventions |
| Legacy cryptographic algorithm | Do not preserve solely for compatibility | Keep temporarily with a designated risk owner, expiry date, and migration controls |

## 5. Equivalence gate

Cross-language refactoring is only achieved when:

- All applicable `SEC-BNK` requirements have code/config evidence in the target language.
- Contract tests verify behaviors required for compatibility.
- Negative security tests verify deny behaviors.
- Secret/SCA/SBOM/build evidence uses tools native to the target ecosystem.
- The threat model and operations runbook reflect the new implementation.
- No remaining Critical findings; High findings follow approved risk acceptance boundaries.

Lines of code, class names matching Java, or using identical library logic are not equivalence criteria.
