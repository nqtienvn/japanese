# Threat Model — {{PROJECT_NAME}}

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
- Consent/legal basis: {{REVIEW}}
- Retention/delete/export: {{REVIEW}}
- Vendor/cross-border: {{REVIEW}}
- Logging/audit/redaction: {{REVIEW}}

## Sign-off

| Reviewer | Decision | Date | Conditions |
| :--- | :--- | :--- | :--- |
| Security/Privacy Owner | Pending | {{DATE}} | {{CONDITIONS}} |
