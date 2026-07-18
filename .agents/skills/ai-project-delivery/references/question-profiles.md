# Discovery question profiles

Select one or more profiles before beginning discovery. The AI uses these profiles to activate the correct question sets, evaluate risks, and select phase artifacts; do not use profiles to speculate on business decisions.

| Profile | When to Select | Mandatory Additional Questions | Enhanced Artifacts/Controls |
| :--- | :--- | :--- | :--- |
| Web CRUD | Forms, workflows, lists, and internal reports | data ownership, validation, bulk actions, auditing | CRUD-functional matrix, UI/UX, API contracts |
| SaaS multi-tenant | Multiple organizations sharing a platform | tenant isolation, plan/entitlement, noisy-neighbor, data export | tenant threat model, permission matrix, capacity model |
| Mobile | iOS/Android or hybrid clients | offline, push notifications, device loss, app store release | mobile security profile, API contracts, release runbooks |
| Regulated | Banking, healthcare, insurance, or legal data | jurisdiction, retention, audit, segregation of duties | control mapping, evidence register, DR/BCP, sign-off |
| AI/LLM | Prompts, models, RAG, agents, or generated content | model boundaries, data leakage, evaluation, human escalation | AI risk register, evaluation set, prompt/version registry |
| Integration-heavy | Multiple systems, queues, webhooks, or partners | contract ownership, retry/idempotency, versioning, reconciliation | OpenAPI/AsyncAPI, integration tests, DLQ/runbook |

## Profile selection record

Record the selected profiles in `01-Planning/DISCOVERY_LOG.md` along with the owner and rationale. If the profile is unclear, record it as `unknown`, with a decision deadline and impact assessment; do not guess profiles based solely on framework familiarity.
