---
artifact_id: DOC-05-DEVELOPMENT-DEVOPS-IAC-AND-PIPELINE-MD
phase: "05-Development"
artifact_type: development
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# DevOps, IaC & Delivery Pipeline — {{PROJECT_NAME}}

## Control applicability

| Control | Apply / Tailor / N/A | Rationale/replacement | Artifact/path | Owner | Evidence |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Source/provenance | {{DECISION}} | {{RATIONALE}} | {{PATH}} | {{OWNER}} | {{EVIDENCE}} |
| Build/reproducibility | {{DECISION}} | {{RATIONALE}} | {{PATH}} | {{OWNER}} | {{EVIDENCE}} |
| SAST/secret/SCA/SBOM | {{DECISION}} | {{RATIONALE}} | {{PATH}} | {{OWNER}} | {{EVIDENCE}} |
| IaC plan/policy scan | {{DECISION}} | {{RATIONALE}} | `iac/` | {{OWNER}} | {{EVIDENCE}} |
| Container/image scan | {{DECISION}} | {{RATIONALE}} | `container/` | {{OWNER}} | {{EVIDENCE}} |
| Deployment approval | {{DECISION}} | {{RATIONALE}} | `pipeline/` | {{OWNER}} | {{EVIDENCE}} |
| Rollback/canary | {{DECISION}} | {{RATIONALE}} | {{PATH}} | {{OWNER}} | {{EVIDENCE}} |

## Pipeline stages

```text
checkout → dependency/provenance → lint/type → unit → contract → SAST/secret/SCA
→ package/SBOM → IaC/container scan → integration → deploy sandbox
→ smoke/rollback → approval gate → release artifact
```

## Environment promotion

| Environment | Provisioning | Data class | Approval | Smoke/rollback | Observability |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Sandbox | {{IAC_PATH}} | Synthetic | AI/local | {{EVIDENCE}} | {{EVIDENCE}} |
| Staging | {{IAC_PATH}} | Masked/approved | {{OWNER}} | {{EVIDENCE}} | {{EVIDENCE}} |
| Production | {{IAC_PATH}} | Real | Approval-only | {{EVIDENCE}} | {{EVIDENCE}} |
