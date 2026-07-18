---
artifact_id: DOC-08-DOCUMENT-REFERENCES-SECURITY-REFERENCE-INDEX-MD
phase: "08-Document-References"
artifact_type: handover
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Security Reference Index

## Mandatory AI Reading Order

1. `00-Governance-Policy/SECURITY_AND_PRIVACY_STANDARD.md`
2. `00-Governance-Policy/BANK_SECURITY_REFERENCE_BASELINE.md`
3. `.agents/skills/ai-project-delivery/references/security-adoption-workflow.md`
4. `.agents/skills/ai-project-delivery/references/security-portability-matrix.md` if stack is other than Java/Spring
5. `.agents/skills/ai-project-delivery/assets/security-reference/SECURITY_REVIEW.md`
6. Appropriate code snapshot in `.agents/skills/ai-project-delivery/assets/security-reference/`
7. `03-Architecture-Design/THREAT_MODEL.md`
8. `03-Architecture-Design/SECURITY_ADOPTION_RECORD.md`
9. `06-Testing/SECURITY_VERIFICATION_MATRIX.md`

## Code Snapshots

| Group | Path | Used For |
| :--- | :--- | :--- |
| Starter | `.agents/skills/ai-project-delivery/assets/security-reference/mb-security-starter/` | Java 21/Spring Boot 3+ structural starting point |
| Legacy | `.agents/skills/ai-project-delivery/assets/security-reference/legacy-bank-security/` | Behavior/compatibility/reference patterns |
| Review | `.agents/skills/ai-project-delivery/assets/security-reference/SECURITY_REVIEW.md` | Findings that must be hardened before production |

## Portability Rules

When copying the template to another repository, the entire `.agents/skills/ai-project-delivery/assets/security-reference/` folder must be copied. Do not introduce raw secrets, private keys, or machine-specific source paths into the new project. If reference code cannot be redistributed, replace the snapshot with an internal artifact under access control and update the path/provenance in the Adoption Record.
