# Threat Model — {{PROJECT_NAME}}

| Field | Value |
| :--- | :--- |
| Security Profile | STANDARD / HIGH / CRITICAL |
| System/release scope | {{SCOPE_VERSION}} |
| Method/references | STRIDE/abuse cases + OWASP Top 10:2025 awareness + project-specific threats |
| Risk scale/appetite | {{LIKELIHOOD_IMPACT_METHOD}} / {{APPETITE}} |
| Owner/review date | {{SECURITY_OWNER}} / {{DATE}} |

## Scope và assets

| Asset | Value/sensitivity | Owner | Worst impact |
| :--- | :--- | :--- | :--- |
| {{ASSET}} | {{CLASSIFICATION}} | {{OWNER}} | {{IMPACT}} |

## Trust boundaries và data flow

| Flow | Source → destination | Data | Auth/encryption | Boundary |
| :--- | :--- | :--- | :--- | :--- |
| DF-001 | {{SOURCE_DEST}} | {{DATA}} | {{CONTROL}} | {{BOUNDARY}} |

## Threat register

| Threat ID | STRIDE/abuse case | Asset/flow | Likelihood | Impact | Control | Verification | Residual risk/owner |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| THR-001 | Spoofing / Tampering / Repudiation / Info disclosure / DoS / Elevation | {{TARGET}} | L/M/H | L/M/H | {{CONTROL}} | TC-SEC-XXX | {{RISK_OWNER}} |

## Privacy review

- Purpose/minimization: {{REVIEW}}
- Regulatory applicability and legal basis (consent is not assumed): {{REVIEW}}
- Retention/delete/export: {{REVIEW}}
- Vendor/cross-border: {{REVIEW}}
- Logging/audit/redaction: {{REVIEW}}

## Security Profile verification plan

| Control/test | Apply / Tailor / N/A | Evidence target | Owner | Due |
| :--- | :--- | :--- | :--- | :--- |
| SAST / secret scan / dependency-SCA | {{DECISION}} | {{EVIDENCE}} | {{OWNER}} | {{DATE}} |
| DAST / API / container / config scan | {{DECISION}} | {{EVIDENCE}} | {{OWNER}} | {{DATE}} |
| Authorization / abuse / recovery tests | {{DECISION}} | {{EVIDENCE}} | {{OWNER}} | {{DATE}} |
| Independent review / penetration test | {{DECISION}} | {{SCOPE_ROE_EVIDENCE}} | {{OWNER}} | {{DATE}} |

Critical risk không được để mở khi release. High acceptance phải có mitigation, owner, expiry, retest và đúng Security/Client authority.

## Sign-off

| Reviewer | Decision | Date | Conditions |
| :--- | :--- | :--- | :--- |
| Security/Privacy Owner | Pending | {{DATE}} | {{CONDITIONS}} |
