---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-CONTRACT-VALIDATION-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# API/Event Contract Validation — {{PROJECT_NAME}}

## Contract inventory

| Contract | Format/version | Validator | Compatibility policy | Owner | Evidence |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `contracts/openapi.yaml` | OpenAPI 3.1 | `scripts/validate_contracts.ps1` + ecosystem validator | {{OPENAPI_POLICY}} | {{OWNER}} | {{EVIDENCE}} |
| `contracts/asyncapi.yaml` | AsyncAPI 3.0 | `scripts/validate_contracts.ps1` + AsyncAPI CLI when available | {{ASYNCAPI_POLICY}} | {{OWNER}} | {{EVIDENCE}} |

## Required checks

- Syntax parses as YAML.
- OpenAPI/AsyncAPI version is declared.
- Every operation has an ID, security decision, response/error contract and requirement/test link.
- `$ref` targets resolve.
- Breaking change detection runs against the previous released contract.
- Examples contain synthetic values only.

## Execution record

| Date | Command/job | Result | Version/environment | Evidence path | Approver |
| :--- | :--- | :--- | :--- | :--- | :--- |
| {{DATE}} | `powershell -File .agents/skills/ai-project-delivery/scripts/validate_contracts.ps1` | Pass / Fail | {{ENV}} | {{PATH}} | {{APPROVER}} |
