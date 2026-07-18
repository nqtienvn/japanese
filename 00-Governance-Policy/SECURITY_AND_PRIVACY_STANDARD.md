---
artifact_id: DOC-00-GOVERNANCE-POLICY-SECURITY-AND-PRIVACY-STANDARD-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Security & Privacy Engineering Standard

## 1. Purpose and declaration boundaries

Establish the risk-based security/privacy baseline for requirements, architecture, implementation, testing, release, and operations. Terms like "maximum security," "absolute safety," or "impenetrable" are untestable and prohibited in the baseline; they must be replaced by specific Security Profiles, threats, controls, and pass/fail evidence.

This document is designed for reference purposes and does not substitute for certification or legal advice. ISO/IEC 27001 is an ISMS standard at the organizational level; the project may only claim to be "aligned" once tailoring is completed and evidence is provided, and must not claim to be "certified" without an independent audit/certification.

## 2. Security Profile

| Profile | Typical Conditions | Control Level |
| :--- | :--- | :--- |
| `STANDARD` | No sensitive data/critical transactions; low exposure | Baseline secure-by-default and risk-based verification |
| `HIGH` | Accounts, PII, third-party integrations, internet-facing, or significant business impact | Baseline + in-depth security testing and recovery |
| `CRITICAL` | Payment, financial, health, Sensitive/Restricted data, privileged admin, or critical infrastructure | High + independent review/appropriate pentest, change control, and strict release gates |

If data is insufficient, temporarily apply the `HIGH` profile and complete the risk assessment before Gate 03. The selected profile does not substitute for threat modeling; controls marked N/A must document a rationale, alternative mitigating controls, risks, and the approver.

## 3. Mandatory engineering controls

- `SEC-001`: The project **SHALL** define the Security Profile, Security Owner, and risk appetite before approving the requirements baseline.
- `SEC-002`: The project **SHALL** complete a threat model for system boundaries, assets, trust boundaries, data flows, and abuse cases before Gate 03.
- `SEC-003`: Every data type **SHALL** have a classification, owner, purpose, retention, and access rule.
- `SEC-004`: The system **SHALL** apply default deny and least privilege at all authorization boundaries.
- `SEC-005`: Authentication and authorization **SHALL** be enforced on the server side or a trusted enforcement point.
- `SEC-006`: Privileged/high-impact actions **SHALL** require step-up authentication, dual controls, or compensating controls when required by the threat model.
- `SEC-007`: Untrusted input **SHALL** be validated at trust boundaries and output **SHALL** be encoded based on context.
- `SEC-008`: Untrusted data values in database queries **SHALL** use parameter binding/prepared statements or an ORM mechanism that proves parameterization.
- `SEC-009`: Dynamic identifiers that cannot be parameterized **SHALL** be selected from an allowlist; SQL string concatenation with untrusted input is prohibited.
- `SEC-010`: Data in transit **SHALL** use protocol/cipher suites approved by the Security Baseline; TLS 1.3 is preferred when compatible, and exceptions must have documented risk, owner, and expiry.
- `SEC-011`: Data at rest **SHALL** be encrypted when required by classification, threat models, contracts, or regulatory requirements.
- `SEC-012`: Secrets **SHALL NOT** be hard-coded, committed, logged, included in prompts, or saved in project documents.
- `SEC-013`: The AI **MAY** generate secret references, environment schemas, Vault/secret-manager integrations, and safe examples, but **SHALL NOT** request or expose actual production/secret values.
- `SEC-014`: Security/audit logs **SHALL** have an owner, event scope, retention, access controls, and redaction rules.
- `SEC-015`: Dependencies, build artifacts, and containers **SHALL** have documented provenance/versions and be scanned according to the Security Profile.
- `SEC-016`: Backup/restore, rollback, and incident response **SHALL** be verified against impact/RTO/RPO metrics.
- `SEC-017`: Security requirements **SHALL** have an ID, threat/control mapping, tests, and a residual-risk owner.
- `SEC-018`: The project **SHALL NOT** claim absolute security, compliance, or certification when evidence does not support the claim.
- `SEC-019`: The project **SHALL** evaluate the Bank Security Reference Baseline before Gate 03.
- `SEC-020`: Java/Spring security work **SHALL** compare components against the two internal code snapshots.
- `SEC-021`: Non-Java stacks **SHALL** refactor security responsibilities to native implementations with equivalent tests.
- `SEC-022`: The project **SHALL NOT** copy secrets or known anti-patterns from snapshots.
- `SEC-023`: Security adoptions **SHALL** have an Adoption Record and a Security Verification Matrix.
- `SEC-024`: OAuth/OIDC implementations **SHALL** evaluate RFC 9700 when applicable.
- `SEC-025`: Web/API projects **SHALL** map verification requirements to OWASP ASVS 5.0.0 or an approved pinned replacement.

## 4. Application security coverage

Pin [OWASP Top 10:2025](https://owasp.org/Top10/2025/0x00_2025-Introduction/) as the awareness baseline for web applications at the time of template creation; verify the active version before each project. The Top 10 does not substitute for threat modeling or specific security requirements.

| Domain | Minimum Content When Applicable |
| :--- | :--- |
| Access/authentication | Broken access control, authentication failures, session/token lifecycle, privilege change |
| Configuration/supply chain | Security misconfiguration, software supply-chain failure, dependency/provenance/secret exposure |
| Cryptography/data | Cryptographic failures, classification, key ownership, retention/redaction |
| Input/design/integrity | Injection, insecure design, software/data integrity, SSRF/XSS/CSRF/file/command abuse by attack surface |
| Detection/recovery | Security logging/alerting failures, exceptional-condition handling, incident/recovery evidence |

## 5. Privacy and regulatory applicability

Before designating GDPR, CCPA, or other laws as mandatory, a Regulatory Applicability Assessment must be completed:

| Regulation | Apply / Tailor / N/A | Data subject/territory/business trigger | Obligations | Legal owner | Evidence/review date |
| :--- | :--- | :--- | :--- | :--- | :--- |
| GDPR | {{DECISION}} | {{TRIGGER}} | {{OBLIGATIONS}} | {{OWNER}} | {{EVIDENCE_DATE}} |
| CCPA as amended | {{DECISION}} | {{TRIGGER}} | {{OBLIGATIONS}} | {{OWNER}} | {{EVIDENCE_DATE}} |

- GDPR consent is only one legal basis; each processing purpose must have a corresponding lawful-basis decision. Refer to [GDPR Article 6/32](https://eur-lex.europa.eu/eli/reg/2016/679/art_6/oj/eng).
- CCPA applicability and consumer rights must be based on the actual business and data subject scope. Refer to the [California Privacy Protection Agency](https://cppa.ca.gov/faq).
- The Legal/Compliance Owner is responsible for confirming applicability; the AI assists with analysis and evidence compiling but does not replace legal advice/sign-off.

## 6. Verification by profile

| Verification | STANDARD | HIGH | CRITICAL |
| :--- | :---: | :---: | :---: |
| Threat model + security requirements/RTM | Mandatory | Mandatory | Mandatory + independent review |
| SAST, secret scan, dependency/SCA | Based on stack/risk | Mandatory | Mandatory + severity gate |
| Authorization/input/negative tests | Mandatory by attack surface | Mandatory | Mandatory + abuse/adversarial review |
| DAST/API/container/config scan | Based on exposure | Mandatory when applicable | Mandatory when applicable |
| Recovery/backup/incident exercise | Based on impact | Mandatory by RTO/RPO | Mandatory + documented exercise |
| Independent penetration test | Based on risk/contract | Based on risk/contract | Mandatory before initial production or major exposure change, unless authorized exception applies |

Pentesting must only be executed with a clear scope, Rules of Engagement, environment, authorization, data handling, and designated remediation owner.

## 7. Security release gates

- Do not release while any Critical vulnerability/risk remains open.
- High risks must only be accepted on a time-bound basis by the Security Owner and Client authority, with documented mitigations, owner, expiry, and re-testing plans.
- All Must/Critical security requirements must have passing evidence in the Test RTM.
- The Security Profile, threat model, scan/test scope, exclusions, findings, residual risk, and incident/rollback readiness must be documented in the release recommendation.
- Controls that are not applicable must retain their N/A rationale; do not remove them from the checklist to hide coverage gaps.

## 8. Standards register

| Reference | Pinned Version | Usage |
| :--- | :--- | :--- |
| [ISO/IEC 27001](https://www.iso.org/standard/27001) | 2022, Edition 3 + amendment applicable | ISMS/risk-management alignment at the organization level/project interface |
| [ISO/IEC 27002](https://www.iso.org/standard/75652.html) | 2022, Edition 3 | Guidance/control reference; select based on risk and Statement of Applicability |
| [OWASP Top 10](https://owasp.org/Top10/2025/0x00_2025-Introduction/) | 2025 | Web application risk awareness, not a complete checklist |
| [OWASP ASVS](https://github.com/OWASP/ASVS) | 5.0.0 | Application security requirement/verification baseline; pin requirement ID by version |
| [RFC 9700](https://www.rfc-editor.org/info/rfc9700/) | BCP 240, January 2025 | OAuth 2.0 security best current practice |
| [OWASP Password Storage Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html) | Verify on project baseline date | Argon2id preferred; BCrypt compatibility for legacy systems |

Verify version and applicability before each project baseline; record tailoring in `STANDARDS_ALIGNMENT_MATRIX.md`.
