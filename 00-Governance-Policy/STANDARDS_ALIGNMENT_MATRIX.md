---
artifact_id: DOC-00-GOVERNANCE-POLICY-STANDARDS-ALIGNMENT-MATRIX-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# International Standards Alignment Matrix

## 1. Claim Boundary

This template package is designed to reference and align with the standards listed below. It does not automatically generate certifications, replace standard copyrights, or prove absolute compliance for any specific project. Each project must complete its own artifacts, evidence, reviews, and sign-offs; organizations must self-assess or hire independent assessors when official conformity or certification is claimed.

## 2. Standards Register

| Standard | Reference Version | Scope within Template | Key Artifact/Evidence | Control Status |
| :--- | :--- | :--- | :--- | :--- |
| ISO/IEC/IEEE 29148 | 2018, Edition 2 | Requirements engineering processes, information items, quality/attributes of requirements, lifecycle traceability | BRD, SRS, Feature Catalog, Use Case Spec, RTM, requirement reviews, version/glossary/interface sections | Check versions before new projects; ISO confirmed this in 2024 but revision projects exist |
| ISO/IEC/IEEE 29119-1 | 2022, Edition 2 | General concepts and vocabulary for testing | Test Policy, Glossary, Test Strategy/Plan | Published |
| ISO/IEC/IEEE 29119-2 | 2021, Edition 2 | Test governance, management, and implementation processes | Test Policy, Test Plan, entry/exit criteria, monitoring, control, and completion report | Published |
| ISO/IEC/IEEE 29119-3 | 2021, Edition 2 | Test documentation templates and outputs | Test Specification, Test Case, Test Status Report, Test Completion Report, Test RTM | Published |
| ISO/IEC/IEEE 29119-4 | 2021, Edition 2 | Test design techniques | Test Specification, technique selection rationale, coverage designs | Published |
| [ISO/IEC 27001](https://www.iso.org/standard/27001) | 2022, Edition 3 + applicable amendments | ISMS requirements and risk-management interface; not an automatic project-level certification | Security Standard, risk/threat/tailoring reviews, and approval evidence | Verify organizational scope and current amendments |
| [ISO/IEC 27002](https://www.iso.org/standard/75652.html) | 2022, Edition 3 | Information security control guidance tailored by risk | Security control mapping, design and test evidence | Guidance; tailor/SoA rationale required |
| [OWASP Top 10](https://owasp.org/Top10/2025/0x00_2025-Introduction/) | 2025 | Web application risk awareness; does not replace threat modeling | Threat Model, security requirements and tests | Verify edition before project baseline |
| [OWASP ASVS](https://github.com/OWASP/ASVS) | 5.0.0, May 2025 | Application security verification requirements | Security Baseline, Adoption Record, Security Verification Matrix | Pin ASVS requirement IDs with versions |
| [RFC 9700](https://www.rfc-editor.org/info/rfc9700/) | BCP 240, January 2025 | OAuth 2.0 security best current practices | OAuth/OIDC design, redirect validation, PKCE, and token tests | Apply when OAuth/OIDC is in scope |
| GDPR / CCPA | Current applicable laws/regulations | Mandatory only after Regulatory Applicability Assessment | Data inventory, legal basis, user rights, security/privacy evidence | Legal owner sign-off required; not legal advice |

Legacy references:
- IEEE 830-1998 is superseded; the template uses ISO/IEC/IEEE 29148 as the primary requirements engineering reference.
- IEEE 829-2008 is superseded; the template uses the ISO/IEC/IEEE 29119 series as the primary testing reference.

## 3. Requirements Alignment

| Control ID | Applied Rule | Artifact | Evidence/Owner |
| :--- | :--- | :--- | :--- |
| STD-REQ-001 | Each requirement must be atomic, singular, and have a unique ID | SRS/BRD/Requirement Item | BA review + RTM |
| STD-REQ-002 | Use `SHALL/SHALL NOT`, `SHOULD/SHOULD NOT`, and `MAY` with correct semantics | SRS/BRD/Use Case Spec | Requirements linting / reviews |
| STD-REQ-003 | Requirements must be unambiguous, necessary, feasible, measurable, testable, consistent, and traceable | Requirement Review / Quality Audit | BA + Tech + QA sign-off |
| STD-REQ-004 | Requirements must have a source, rationale, priority, owner, risk, acceptance, and lifecycle status | SRS/RTM | Baseline review |
| STD-REQ-005 | Documents must have a version history, glossary, and external interface specifications | BRD/SRS | Document coverage audit |
| STD-REQ-006 | Baseline changes must undergo impact analysis and preserve historical records | Change Request / Changelog / RTM | Client/Vendor approval |

## 4. Test Documentation Alignment

| Layer | Control ID | Mandatory Artifact | Content/Evidence |
| :--- | :--- | :--- | :--- |
| Policy & Planning | STD-TST-001 | Test Policy + Test Strategy/Plan | Scope in/out, objectives, roles, processes, risk matrix, environment/data, entry/exit criteria, suspension/resumption |
| Design & Implementation | STD-TST-002 | Test Specification + Test Case | Unique ID, test basis/condition, technique, separated input data, steps, exact expected result, environment, automation/evidence |
| Monitoring & Reporting | STD-TST-003 | Test Status Report + Test Completion Report | Total/planned/executed/passed/failed/blocked/skipped, defect/risk trends, deviations, exit assessment, recommendations |
| Traceability | STD-TST-004 | Test Traceability Matrix | SRS/Requirement ID ➔ Test Condition/Case ID ➔ Execution Result ➔ Defect/Bug ID ➔ Retest/Release |

## 5. Tailoring Record

Each project must document tailoring decisions; do not delete inapplicable controls; instead, record the reason, risks, and replacement controls.

| Control/Standard | Apply / Tailor / N/A | Reason & Replacement Control | Risk | Approver | Review Date |
| :--- | :--- | :--- | :--- | :--- | :--- |
| {{CONTROL}} | {{DECISION}} | {{RATIONALE}} | {{RISK}} | {{APPROVER}} | {{DATE}} |

### Security/Privacy Controls

| Control ID | Applied Rule | Artifact/Evidence |
| :--- | :--- | :--- |
| `STD-SEC-001` | Choose Security Profile and risk appetite; perform threat modeling before Gate 03 | Project Profile, Security Standard, Threat Model |
| `STD-SEC-002` | Security requirements must be atomic, with threat/control/test/residual-risk mapping | SRS, EDS, Test RTM |
| `STD-SEC-003` | No open Critical risks/vulnerabilities at release; High risk acceptance is time-bound with appropriate authority | Test/Release Report, Risk Register |
| `STD-SEC-004` | Bank Java snapshots are adopted, adapted, or refactored cross-language with verified evidence | Security Adoption Record, Security Verification Matrix |
| `STD-SEC-005` | Known findings within snapshots must not reach production | Security Review, code/config diff, negative tests |
| `STD-PRV-001` | GDPR/CCPA/other regulations are mandatory only after regulatory applicability assessment | SRS, Security Standard, legal sign-off |

## 6. Conformance Review

| Review | Owner | Evidence | Decision |
| :--- | :--- | :--- | :--- |
| Requirements alignment | BA/Product + QA | Coverage/quality audit | Pass / Conditional / Fail |
| Test process/documentation alignment | QA Lead | Test artifact suite + RTM | Pass / Conditional / Fail |
| Project-level claim approval | Client/Vendor governance | Tailoring + residual gaps | "Aligned" / "Not yet aligned" |
