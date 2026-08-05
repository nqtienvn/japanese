---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-SOFTWARE-ARCHITECTURE-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "AI Solution Architect"
version: "1.0"
status: Approved
ids: [DES-JNOTE-001, ADR-JNOTE-001, ADR-JNOTE-002]
dependencies: [02-Requirements/SRS.md]
last_verified: "2026-08-06"
---
# Software Architecture — JNOTE

## Decision summary

`ADR-JNOTE-001`: Use a React TypeScript SPA with feature modules and a Supabase JavaScript client. `ADR-JNOTE-002`: Use Supabase Auth/Postgres with default-deny RLS as the trusted enforcement point; React holds only the publishable anon key.

## Context and containers

```text
Learner browser
  -> React SPA (views, feature services, local draft/error state)
  -> Supabase Auth (email/password, verification, recovery)
  -> Supabase Postgres/RPC (terms, attempts, outcomes, owner RLS)
```

No custom backend, partner API, message queue, notification provider, or public API is introduced for release one.

## Modules and contracts

| Module | Responsibility | Depends on |
| :--- | :--- | :--- |
| `auth` | Session, account pages, access guard, recovery/delete entry points | Supabase Auth |
| `notebook` | Term list, draft input, label/archive/search state | vocabulary data service |
| `practice` | Flashcard/Study session generation and outcome recording | terms/outcomes service |
| `quiz` | Active-attempt fetch/create, answer persistence, server deadline/result view | transactional RPC/data service |
| `dashboard` | Owner-scoped summary/history | data service |
| `shared` | Router, error boundary, accessibility primitives, configuration validation | browser/Supabase client |

## Cross-cutting decisions

- Client validates for usability; RLS and database functions enforce ownership and Quiz invariants.
- Server timestamps are authoritative for expiry; UI timers only display remaining time.
- All writes are owner-scoped and idempotent where duplicate submit is possible.
- Environment validation fails visibly without configuration; no secret fallback is allowed.
- Supabase integration is contract-tested with mocks until secure configuration is provisioned.
