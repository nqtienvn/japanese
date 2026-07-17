---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-SOFTWARE-ARCHITECTURE-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Software Architecture — {{PROJECT_NAME}}

| Field | Value |
| :--- | :--- |
| Document ID | `{{PROJECT_CODE}}-SAD-001` |
| Version / status | {{VERSION}} / {{STATUS}} |
| Owner / reviewers | {{TECH_LEAD}} / {{REVIEWERS}} |

## 1. Architecture Drivers

| Driver | Linked Requirement | Target/Constraint | Design Response |
| :--- | :--- | :--- | :--- |
| Business capability | FR-XXX | {{TARGET}} | {{RESPONSE}} |
| Performance/reliability/security | NFR-XXX | {{TARGET}} | {{RESPONSE}} |

## 2. System Context (C4 L1)

```mermaid
flowchart LR
    U["Primary User"] -->|"Uses"| S["{{PROJECT_NAME}}"]
    A["Admin / Operations"] -->|"Operates"| S
    S -->|"API / event"| X["External System"]
```

| Actor/System | Responsibility | Protocol/Data | Trust/Owner |
| :--- | :--- | :--- | :--- |
| {{ACTOR_SYSTEM}} | {{RESPONSIBILITY}} | {{PROTOCOL_DATA}} | {{TRUST_OWNER}} |

## 3. Containers (C4 L2)

```mermaid
flowchart TB
    UI["Client / UI"] --> API["Application/API"]
    API --> DB[("Primary Data Store")]
    API --> Q["Queue / Background Worker"]
    API --> EXT["External Services"]
    UI -. telemetry .-> OBS["Observability"]
    API -. telemetry .-> OBS
```

| Container | Responsibility | Technology/Constraint | Data | Scale/Deploy |
| :--- | :--- | :--- | :--- | :--- |
| {{CONTAINER}} | {{RESPONSIBILITY}} | {{TECH}} | {{DATA}} | {{SCALE}} |

## 4. Components and Dependency Rules (C4 L3)

```mermaid
flowchart LR
    T["Transport/UI"] --> APP["Application / Use Cases"]
    APP --> DOM["Domain"]
    APP --> PORT["Ports / Interfaces"]
    ADP["Adapters / Infrastructure"] --> PORT
```

- Allowed dependency direction: {{RULE}}
- Module ownership/bounded contexts: {{CONTEXTS}}
- Shared-kernel rule: {{RULE}}

## 5. Runtime Views

### Critical Sequence

```mermaid
sequenceDiagram
    actor User
    participant UI
    participant API
    participant DB
    User->>UI: Trigger UC-XXX
    UI->>API: Validated request + identity
    API->>DB: Transaction/read-write
    DB-->>API: Result
    API-->>UI: Outcome/error contract
```

### State Model

```mermaid
stateDiagram-v2
    [*] --> Draft
    Draft --> Active: approve
    Active --> Closed: complete
    Active --> Cancelled: cancel/reversal
```

## 6. Data Architecture

| Entity/Store | Owner/Source of Truth | Classification | Consistency | Retention/Backup |
| :--- | :--- | :--- | :--- | :--- |
| {{ENTITY}} | {{OWNER}} | {{CLASS}} | {{CONSISTENCY}} | {{LIFECYCLE}} |

- Transaction boundaries: {{BOUNDARIES}}
- Migration/versioning: {{STRATEGY}}
- Cache/index/partition: {{STRATEGY}}
- Audit/reconciliation: {{STRATEGY}}

## 7. Interfaces

| Interface ID | Consumer/Provider | Contract/Version | Auth | Timeout/retry/idempotency | Failure/Fallback |
| :--- | :--- | :--- | :--- | :--- | :--- |
| DES-API-001 | {{PARTIES}} | {{CONTRACT}} | {{AUTH}} | {{RESILIENCE}} | {{FALLBACK}} |

## 8. Security, Privacy, and Threat Controls

- Identity/session: {{DESIGN}}
- Authorization/policy enforcement: {{DESIGN}}
- Secret/key management: {{DESIGN}}
- Encryption and data minimization: {{DESIGN}}
- Audit/abuse prevention: {{DESIGN}}
- Linked threat model: [THREAT_MODEL.md](THREAT_MODEL.md)

## 9. Quality Attributes

| NFR | Scenario | Target | Architecture Tactic | Verification |
| :--- | :--- | :--- | :--- | :--- |
| NFR-PERF-001 | {{SCENARIO}} | {{TARGET}} | {{TACTIC}} | {{TEST}} |
| NFR-REL-001 | {{SCENARIO}} | {{TARGET}} | {{TACTIC}} | {{TEST}} |

## 10. Deployment and Operations

```mermaid
flowchart LR
    DEV["Developer/CI"] --> ART["Versioned Artifact"]
    ART --> ENV["Runtime Environment"]
    ENV --> DATA[("Managed Data")]
    ENV --> MON["Logs / Metrics / Traces / Alerts"]
```

- Environment/config promotion: {{STRATEGY}}
- Health/readiness and SLI: {{STRATEGY}}
- Capacity/cost guardrails: {{TARGET}}
- Backup/restore/failover: {{STRATEGY}}

## 11. ADR and Risks

| ADR | Decision | Status | Requirement | Risk/Trade-Off |
| :--- | :--- | :--- | :--- | :--- |
| ADR-001 | {{DECISION}} | Proposed | NFR-XXX | {{TRADEOFF}} |

## 12. Open Questions

| ID | Question | Owner | Due | Blocked Design/Work Item |
| :--- | :--- | :--- | :--- | :--- |
| OQ-DES-001 | {{QUESTION}} | {{OWNER}} | {{DATE}} | {{IDS}} |
