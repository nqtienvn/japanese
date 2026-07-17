---
artifact_id: DOC-05-DEVELOPMENT-CONTAINER-SECURITY-PROFILE-MD
phase: "05-Development"
artifact_type: development
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Container Security Profile — {{PROJECT_NAME}}

| Control | Apply / Tailor / N/A | Required evidence |
| :--- | :--- | :--- |
| Minimal trusted base image | {{DECISION}} | Digest/SBOM/image scan |
| Non-root runtime | {{DECISION}} | Container test/config |
| Read-only filesystem | {{DECISION}} | Runtime evidence or rationale |
| Dropped Linux capabilities | {{DECISION}} | Runtime security context |
| No embedded secret | {{DECISION}} | Secret scan |
| Network egress allowlist | {{DECISION}} | Network policy |
| Resource limits | {{DECISION}} | CPU/memory limits and test |
| Vulnerability severity gate | {{DECISION}} | Scan report/expiry |
| Image signing/provenance | {{DECISION}} | Signature/attestation |
