---
artifact_id: DOC-06-TESTING-TEST-POLICY-MD
phase: "06-Testing"
artifact_type: testing
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Test Policy — {{PROJECT_NAME}}

| Field | Value |
| :--- | :--- |
| Document ID | `{{PROJECT_CODE}}-TST-POL-001` |
| Version / status | {{VERSION}} / {{STATUS}} |
| Policy owner / approver | {{QA_LEAD}} / {{PROJECT_OWNER}} |
| Standards reference | ISO/IEC/IEEE 29119-1:2022, 29119-2:2021, 29119-3:2021, 29119-4:2021 — aligned, tailored per project |

## Version history

| Version | Date | Author | Reason/change | Approver |
| :--- | :--- | :--- | :--- | :--- |
| 0.1 | {{DATE}} | {{AUTHOR}} | Initial policy | Pending |

## Purpose and principles

- Testing provides independent and proportionate evidence for risk and acceptance; it does not just verify the happy path.
- No in-scope requirement shall be marked as 'Accepted' without corresponding tests/evidence or an authorized exception.
- Tests are designed based on requirements/risks and initiated early; defects must be traceable to the test basis.
- Test results must be reproducible: build, environment, data, commands, expected/actual outcomes, and evidence must be clear.
- Do not use production secrets or real data unless authorized with appropriate data minimization and controls.

## Test governance and independence

| Activity | Responsible | Accountable/approval | Independence rule |
| :--- | :--- | :--- | :--- |
| Strategy/plan | QA Lead | Vendor Lead/Client PO | Reviewer is not the sole author |
| Unit/component | Developer | Tech Lead | Peer review |
| Integration/system/security | QA/Engineering/Security | QA/Security Lead | Risk-based independent review |
| UAT | Client representatives | Client Product Owner | Use acceptance baseline |
| Go/No-Go | QA recommends | Client/Vendor authority | Residual risks must be transparent |

## Test levels and types

Unit, component, integration, contract, system/E2E, regression, UAT; functional, security, performance, reliability/recovery, usability/accessibility, compatibility, migration/data quality, and static reviews based on risk.

### Coverage policy

- Coverage percentage is a diagnostic signal, not a substitute for requirement/risk coverage or assertion quality.
- Line/branch/function thresholds must be tailored based on layers, criticality, tools, generated-code exclusions, and failure impact.
- Do not apply a generic `≥ 90%` threshold across the entire codebase without rationale; critical business/security behaviors always require test evidence regardless of overall percentage.

### Security verification policy

- Select tests/scans/reviews according to `SECURITY_AND_PRIVACY_STANDARD.md` and the selected Security Profile.
- Penetration testing requires a clear scope, Rules of Engagement, environment, authorization, data handling, and remediation owner.
- Do not release with open Critical security risks/vulnerabilities; High risk acceptance must be time-bound and approved by correct authority.

## Defect and evidence policy

- Unique `DEF-XXX` IDs, severity based on actual impact, priority based on business decision.
- Critical/High defects or data/operational risks block release unless an authorized exception applies; Critical security risks/vulnerabilities are not accepted for release, and High risks must be time-bound per the Security Standard.
- Failed/blocked/skipped tests must retain history; 'Skipped' tests require a documented reason and approver.
- Evidence must not contain unnecessary secrets or PII and must have an owner and retention period.

## Tailoring

| Control/test type | Apply / Tailor / N/A | Rationale/replacement | Risk | Approver |
| :--- | :--- | :--- | :--- | :--- |
| {{CONTROL}} | {{DECISION}} | {{RATIONALE}} | {{RISK}} | {{APPROVER}} |
