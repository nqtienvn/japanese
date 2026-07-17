---
artifact_id: DOC-08-DOCUMENT-REFERENCES-DOCUMENT-INDEX-MD
phase: "08-Document-References"
artifact_type: handover
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Document & Evidence Index — {{PROJECT_NAME}}

| Artifact ID | Tài liệu/evidence | Phase | Audience | Owner | Version/status | Last verified | Replacement/notes |
| :--- | :--- | :---: | :--- | :--- | :--- | :--- | :--- |
| DOC-001 | `../PROJECT_PROFILE.md` | Root | All | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | — |
| DOC-002 | `../02-Requirements/SRS.md` | 02 | Client/Vendor | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | — |
| DOC-003 | `../03-Architecture-Design/SOFTWARE_ARCHITECTURE.md` | 03 | Engineering/Ops | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | — |
| DOC-004 | `../06-Testing/TEST_REPORT.md` | 06 | Client/QA | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | — |
| DOC-005 | `OPERATIONS_RUNBOOK.md` | 08 | Ops/Support | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | — |
| DOC-006 | `../00-Governance-Policy/STANDARDS_ALIGNMENT_MATRIX.md` | 00 | Governance/Assessor | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Verify standard editions before new project |
| DOC-007 | `../00-Governance-Policy/DOCUMENT_QUALITY_STANDARD.md` | 00 | All authors/reviewers | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Mandatory controls |
| DOC-008 | `../06-Testing/DOCUMENT_QUALITY_AUDIT.md` | 06 | Client/Vendor QA | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Baseline/release evidence |
| DOC-009 | `DEPLOYMENT_GUIDE.md` | 08 | Developer/Ops | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Field-tested |
| DOC-010 | `../MASTER_PROMPT.md` | Root | Client/AI Vendor | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | AI orchestration entry point |
| DOC-011 | `../USAGE_GUIDE.md` | Root | Client/AI Vendor | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Greenfield/Brownfield/Change operating guide |
| DOC-012 | `../START.md` | Root | Client/Product Owner | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Copy-ready Greenfield/Brownfield start prompts |
| DOC-013 | `../00-Governance-Policy/SECURITY_AND_PRIVACY_STANDARD.md` | 00 | Security/Engineering/QA/Ops | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Security Profile and release controls |
| DOC-014 | `../00-Governance-Policy/HUMAN_AI_COLLABORATION_PROTOCOL.md` | 00 | Client/AI Vendor | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Assistance trigger and resume protocol |
| DOC-015 | `../00-Governance-Policy/BANK_SECURITY_REFERENCE_BASELINE.md` | 00 | Security/Engineering/QA | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Portable security requirements |
| DOC-016 | `../03-Architecture-Design/SECURITY_ADOPTION_RECORD.md` | 03 | Architect/Security/Engineering | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Component and cross-language decisions |
| DOC-017 | `../06-Testing/SECURITY_VERIFICATION_MATRIX.md` | 06 | Security/QA | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Negative/equivalence evidence |
| DOC-018 | `SECURITY_REFERENCE_INDEX.md` | 08 | AI/Engineering/Security | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Snapshot/read-order/provenance |
| DOC-019 | `../00-Governance-Policy/FRONT_MATTER_STANDARD.md` | 00 | AI/All authors | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Machine-readable artifact metadata |
| DOC-020 | `../00-Governance-Policy/REUSABLE_QUALITY_PATTERNS.md` | 00 | Architecture/QA/Security | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Reusable NFR/security/test controls |
| DOC-021 | `../01-Planning/COST_FINOPS_CAPACITY_LIFECYCLE.md` | 01 | Product/Finance/Ops | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Cost, capacity and EOL planning |
| DOC-022 | `../02-Requirements/BPMN_WORKFLOW.md` | 02 | Product/Engineering | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Workflow and state transitions |
| DOC-023 | `../02-Requirements/CRUD_FUNCTIONAL_MATRIX.md` | 02 | Product/QA | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | CRUD-to-requirement coverage |
| DOC-024 | `../03-Architecture-Design/contracts/openapi.yaml` | 03 | Engineering/QA/Partners | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | REST contract scaffold |
| DOC-025 | `../03-Architecture-Design/contracts/asyncapi.yaml` | 03 | Integration/QA | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Event contract scaffold |
| DOC-026 | `../03-Architecture-Design/UI_UX_SPECIFICATION.md` | 03 | Product/UX/QA | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Screen, navigation and WCAG evidence |
| DOC-027 | `../05-Development/DEVOPS_IAC_AND_PIPELINE.md` | 05 | Engineering/Ops | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | IaC, pipeline and container controls |
| DOC-028 | `../06-Testing/DR_RESTORE_FAILOVER_EXERCISE.md` | 06 | QA/Ops | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Restore/failover evidence |
| DOC-029 | `READINESS_DASHBOARD.md` | 07 | Delivery/Governance | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Gate coverage and evidence readiness |
| DOC-030 | `DR_BCP_AND_CRISIS_PLAN.md` | 08 | Ops/Business/Security | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Continuity and crisis communication |
| DOC-031 | `TERM_STANDARDIZATION.md` | 08 | All authors/AI | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Canonical Vietnamese-English terms |
| DOC-032 | `../09-Example-Project/README.md` | 09 | AI/All reviewers | {{OWNER}} | {{VERSION_STATUS}} | {{DATE}} | Complete lifecycle example |

## Source-of-truth rules

- Requirement truth: approved SRS + RTM.
- Design truth: accepted ADR + current architecture/EDS.
- Behavior truth when conflict: verified code/test/runtime evidence, then open decision to reconcile docs.
- Release truth: immutable artifact/version + release/test report.
- Superseded docs remain indexed with replacement; do not silently delete decision history.

## Missing/stale register

| Item | Gap | Risk | Owner | Due |
| :--- | :--- | :--- | :--- | :--- |
| {{ARTIFACT}} | Missing / Stale / Contradictory | {{RISK}} | {{OWNER}} | {{DATE}} |
