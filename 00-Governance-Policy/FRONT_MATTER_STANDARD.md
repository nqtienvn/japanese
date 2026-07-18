---
artifact_id: DOC-00-GOVERNANCE-POLICY-FRONT-MATTER-STANDARD-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Machine-readable Front Matter Standard

Every project document must have a YAML front matter block at the beginning of the file. The script `scripts/normalize_front_matter.ps1` can add this block for inherited repositories; the validator checks the block before Gate 00.

```yaml
---
artifact_id: DOC-<PHASE>-<NAME>
phase: "00-Governance-Policy"
artifact_type: governance|planning|requirements|design|implementation|development|testing|report|handover
owner: "{{OWNER}}"
version: "0.1"
status: Draft|In Review|Approved|Implemented|Verified|Accepted|Deprecated
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
```

Rules:

- `artifact_id` must be unique across the entire repository.
- `phase`, `artifact_type`, `owner`, `version`, `status`, and `last_verified` must not be empty.
- `ids` lists the requirement/design/work-item/test IDs owned/defined by the document.
- `dependencies` lists the artifact IDs or paths required before reading this document.
- Secrets, credentials, real PII, and tokens must not be included in the front matter.
- Placeholders are acceptable in the template; the project handover must resolve them or record exceptions with an owner and expiry.
