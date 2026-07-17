---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-THREAT-MODEL-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Threat Model — {{PROJECT_NAME}}

| Field | Value |
| :--- | :--- |
| Security Profile | STANDARD / HIGH / CRITICAL |
| System/release scope | {{SCOPE_VERSION}} |
| Method/references | STRIDE/abuse cases + OWASP Top 10:2025 awareness + project-specific threats |
| Risk scale/appetite | {{LIKELIHOOD_IMPACT_METHOD}} / {{APPETITE}} |
| Owner/review date | {{SECURITY_OWNER}} / {{DATE}} |

## Scope and Assets

| Asset | Value/sensitivity | Owner | Worst impact |
| :--- | :--- | :--- | :--- |
| {{ASSET}} | {{CLASSIFICATION}} | {{OWNER}} | {{IMPACT}} |

## Trust Boundaries and Data Flow

| Flow | Source ➔ destination | Data | Auth/encryption | Boundary |
| :--- | :--- | :--- | :--- | :--- |
| DF-001 | {{SOURCE_DEST}} | {{DATA}} | {{CONTROL}} | {{BOUNDARY}} |

## Threat Register

| Threat ID | STRIDE/abuse case | Asset/flow | Likelihood | Impact | Control | Verification | Residual risk/owner |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| THR-001 | Spoofing / Tampering / Repudiation / Info disclosure / DoS / Elevation | {{TARGET}} | L/M/H | L/M/H | {{CONTROL}} | TC-SEC-XXX | {{RISK_OWNER}} |

## Privacy Review

- Purpose/minimization: {{REVIEW}}
- Regulatory applicability and legal basis (consent is not assumed): {{REVIEW}}
- Retention/delete/export: {{REVIEW}}
- Vendor/cross-border: {{REVIEW}}
- Logging/audit/redaction: {{REVIEW}}

## Security Profile Verification Plan

| Control/test | Apply / Tailor / N/A | Evidence target | Owner | Due |
| :--- | :--- | :--- | :--- | :--- |
| SAST / secret scan / dependency-SCA | {{DECISION}} | {{EVIDENCE}} | {{OWNER}} | {{DATE}} |
| DAST / API / container / config scan | {{DECISION}} | {{EVIDENCE}} | {{OWNER}} | {{DATE}} |
| Authorization / abuse / recovery tests | {{DECISION}} | {{EVIDENCE}} | {{OWNER}} | {{DATE}} |
| Independent review / penetration test | {{DECISION}} | {{SCOPE_ROE_EVIDENCE}} | {{OWNER}} | {{DATE}} |

Critical risks must not remain open at release. High risk acceptance must have documented mitigation, owner, expiry, retest, and appropriate Security/Client approval.

## Sign-Off

| Reviewer | Decision | Date | Conditions |
| :--- | :--- | :--- | :--- |
| Security/Privacy Owner | Pending | {{DATE}} | {{CONDITIONS}} |
