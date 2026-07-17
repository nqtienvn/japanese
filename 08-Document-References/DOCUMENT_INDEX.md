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
