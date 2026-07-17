# Codebase & Ownership Map — {{PROJECT_NAME}}

## Repository strategy

- Repository/branch strategy: {{STRATEGY}}
- Runtime/framework: {{STACK}}
- Package/build tooling: {{TOOLS}}
- Source/test/generated/artifact boundaries: {{BOUNDARIES}}

## Directory map

```text
{{PROJECT_ROOT}}/
├── {{SOURCE_AREA}}/       # {{RESPONSIBILITY}}
├── {{TEST_AREA}}/         # {{RESPONSIBILITY}}
├── {{INFRA_AREA}}/        # {{RESPONSIBILITY}}
└── {{DOC_AREA}}/          # 09-phase delivery artifacts
```

## Module/owner map

| Module/path | Responsibility | Owner/reviewer | Entry point/public contract | Requirement/design |
| :--- | :--- | :--- | :--- | :--- |
| `{{PATH}}` | {{RESPONSIBILITY}} | {{OWNER}} | `{{ENTRY_OR_API}}` | FR/DES-XXX |

## Dependency rules

- Allowed: {{ALLOWED_DEPENDENCY}}
- Forbidden/cycle rule: {{FORBIDDEN_DEPENDENCY}}
- Shared code policy: {{POLICY}}
- Generated/vendor code policy: {{POLICY}}

## Runtime/data flow map

| Trigger | Entry point | Domain/service | Store/integration | Tests |
| :--- | :--- | :--- | :--- | :--- |
| {{TRIGGER}} | `{{SYMBOL}}` | `{{SYMBOL}}` | {{BOUNDARY}} | `{{TEST}}` |

## Brownfield confidence

| Area | Evidence | Confidence | Unknown/next audit |
| :--- | :--- | :--- | :--- |
| {{AREA}} | {{EVIDENCE}} | H/M/L | {{NEXT}} |
