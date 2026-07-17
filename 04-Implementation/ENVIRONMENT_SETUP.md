---
artifact_id: DOC-04-IMPLEMENTATION-ENVIRONMENT-SETUP-MD
phase: "04-Implementation"
artifact_type: implementation
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Environment Setup — {{PROJECT_NAME}}

## Prerequisites

| Tool/runtime | Version | Install source | Verify command |
| :--- | :--- | :--- | :--- |
| {{TOOL}} | {{VERSION}} | {{SOURCE}} | `{{COMMAND}}` |

## Configuration

- Copy environment example; never commit real secret.
- Obtain secrets through approved channel/secret manager: {{PROCESS}}.
- Required external sandbox/test accounts: {{ACCOUNTS}}.

| Variable | Required | Purpose | Safe example | Secret? |
| :--- | :--- | :--- | :--- | :---: |
| `APP_ENV` | Yes | Runtime environment | `development` | No |
| `EXTERNAL_API_KEY` | Conditional | Sandbox integration | `<from-secret-manager>` | Yes |

## Setup/run/test

```text
{{INSTALL_COMMAND}}
{{MIGRATE_OR_SEED_COMMAND}}
{{RUN_COMMAND}}
{{TEST_COMMAND}}
```

## Verification

| Check | Expected | Troubleshooting link |
| :--- | :--- | :--- |
| Health/startup | {{EXPECTED}} | `08-Document-References/OPERATIONS_RUNBOOK.md` |

## Reset/cleanup safety

Chỉ ghi lệnh reset development/test có target rõ. Không đưa lệnh destructive production vào quick start.
