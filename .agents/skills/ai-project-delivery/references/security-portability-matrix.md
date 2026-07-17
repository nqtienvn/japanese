# Security Portability and Refactoring Matrix

## 1. Nguyên tắc

Hai snapshot Java là bằng chứng về responsibility và behavior đã từng được triển khai. Chúng không khóa ngôn ngữ. Khi project dùng stack khác, AI phải refactor thành implementation native nhưng giữ security invariant, contract cần tương thích và test outcome.

```text
Java reference class
→ responsibility + trust boundary + observable contract
→ native framework primitive
→ project-specific threat control
→ negative/compatibility test evidence
```

Không dịch line-by-line. Không mô phỏng annotation, servlet filter hoặc Spring bean nếu stack đích có primitive phù hợp hơn.

## 2. Responsibility mapping

| Java reference | Security responsibility | .NET | Node.js/TypeScript | Go | Python | Invariant bắt buộc |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `MbSecurityAutoConfiguration` / `JWTConfigurer` | Security pipeline, route policy, default deny | ASP.NET Core authentication/authorization middleware + policy | Framework middleware/guard + centralized policy | `net/http`/router middleware + policy layer | ASGI middleware/dependency + policy layer | Authn trước authz; public route allowlist; deny by default |
| `JwtTokenProvider` | Issue/verify token and claims policy | Native JWT bearer/token handler hoặc maintained JOSE library | Maintained JOSE/JWT library | Maintained JOSE/JWT package | Maintained JOSE/JWT package | Pin algorithm/key; validate issuer/audience/time/type; key rotation |
| `JWTCookieFilter` / `JwtAuthenticationFilter` | Extract credential, bind CSRF/session, set principal | Cookie/header handler + antiforgery middleware | Cookie/header middleware + CSRF middleware | Explicit cookie/header middleware | Cookie/header dependency + CSRF middleware | Không log credential; invalid token không tạo principal |
| `TokenService` | Token family state, invalidation, replay protection | Distributed cache/database repository | Cache/database repository | Cache/database repository | Cache/database repository | Atomic rotation; bounded TTL; logout/security-event invalidation |
| `PermissionEvaluatorImpl` | Resource/action authorization | Requirement/handler policy | Guard/policy engine | Explicit policy function/engine | Dependency/policy engine | Exact match; tenant/resource scope; no prefix/substring confusion |
| `PasswordEncoderConfig` | Password hashing/verification/migration | Platform password hasher/Argon2id provider | Argon2id provider | Argon2id provider | Argon2id provider | Per-user salt; tuned cost; rehash/migration path; no plaintext |
| OAuth2 classes | OIDC/OAuth client flow | OpenID Connect/OAuth handler | Maintained OIDC/OAuth client | Maintained OIDC/OAuth client | Maintained OIDC/OAuth client | Discovery/metadata validation; exact redirect; state; PKCE/nonce |
| `RsaProvider` | Asymmetric crypto/key loading | Platform cryptography/KMS client | Platform crypto/KMS client | `crypto` packages/KMS client | `cryptography`/KMS client | Approved algorithm/padding; key outside source; rotation/provenance |
| `SecurityUtils` / auditor | Principal access and audit attribution | Request/user context | Request context | `context.Context` | Request/dependency context | Principal immutable per request; audit identity server-derived |
| YAML properties | Typed config and secret references | Options/config providers | Schema-validated config | Typed config validation | Settings/schema validation | Required secret fail-fast; environment separation; redacted errors |

Tên package/library cụ thể phải được AI chọn từ ecosystem hiện tại của repository, tình trạng maintenance, license, compatibility và security advisory. Bảng này không pin library bên thứ ba.

## 3. Refactor workflow cho stack khác

1. Lập inventory public routes, credential channels, auth claims, permission vocabulary, token lifecycle và downstream compatibility.
2. Tạo component mapping trong `SECURITY_ADOPTION_RECORD.md`; Java source row ghi `Adapt — cross-language`.
3. Tách contract bắt buộc giữ khỏi implementation detail được phép đổi.
4. Chọn native primitive/library có maintenance evidence; pin resolved version và license.
5. Viết characterization test cho contract hiện có nếu migration/brownfield.
6. Implement vertical slice nhỏ: authenticate → authorize → audit → revoke.
7. Chạy toàn bộ case applicable trong `SECURITY_VERIFICATION_MATRIX.md`.
8. Chỉ xóa compatibility adapter sau khi consumer migration và rollback evidence đạt.

## 4. Contract có thể giữ hoặc thay

| Contract | Mặc định | Khi được thay |
| :--- | :--- | :--- |
| Cookie/header names | Giữ nếu có client đang dùng | Có versioning, migration và rollback plan |
| JWT issuer/audience/claim vocabulary | Giữ khi service federation phụ thuộc | Có coordinated consumer rollout và token invalidation plan |
| Permission/resource/action vocabulary | Giữ semantic, sửa matching unsafe | Có authorization migration matrix và negative tests |
| Token format | Không bắt buộc giữ JWT nếu architecture tốt hơn | ADR chứng minh impact, client compatibility và operations |
| OAuth provider | Chỉ giữ provider thuộc scope | Product/identity owner xác nhận removal/change |
| Package/class layout | Không giữ | AI tự refactor theo convention native |
| Legacy cryptographic algorithm | Không giữ chỉ vì compatibility | Chỉ giữ tạm với risk owner, expiry và migration control |

## 5. Equivalence gate

Cross-language refactor chỉ đạt khi:

- Mọi `SEC-BNK` applicable requirement có code/config evidence trong ngôn ngữ đích.
- Contract test chứng minh behavior cần tương thích.
- Negative security tests chứng minh deny behavior.
- Secret/SCA/SBOM/build evidence dùng tool của ecosystem đích.
- Threat model và operations runbook phản ánh implementation mới.
- Không còn Critical finding; High finding tuân theo acceptance boundary.

Số dòng code, tên class giống Java hoặc cùng thư viện không phải tiêu chí tương đương.
