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

Mọi tài liệu project phải có YAML front matter ở đầu file. Script `scripts/normalize_front_matter.ps1` có thể thêm block cho repository kế thừa; validator kiểm tra block trước Gate 00.

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

Quy tắc:

- `artifact_id` phải unique toàn repository.
- `phase`, `artifact_type`, `owner`, `version`, `status` và `last_verified` không được bỏ trống.
- `ids` liệt kê requirement/design/work-item/test IDs được tài liệu sở hữu.
- `dependencies` liệt kê artifact ID hoặc path cần có trước khi đọc tài liệu.
- Secret, credential, PII thật và token không được đưa vào front matter.
- Placeholder được chấp nhận trong template; project handover phải resolve hoặc ghi exception có owner/expiry.
