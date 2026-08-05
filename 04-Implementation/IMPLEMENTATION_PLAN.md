---
artifact_id: DOC-04-IMPLEMENTATION-IMPLEMENTATION-PLAN-MD
phase: "04-Implementation"
artifact_type: implementation
owner: "AI Delivery Vendor"
version: "1.0"
status: Approved
ids: [WI-JNOTE-001, WI-JNOTE-002, WI-JNOTE-003, WI-JNOTE-004, WI-JNOTE-005]
dependencies: [03-Architecture-Design/SOFTWARE_ARCHITECTURE.md, 03-Architecture-Design/DATA_MODEL_ERD.md, 03-Architecture-Design/THREAT_MODEL.md]
last_verified: "2026-08-06"
---
# Implementation Plan — JNOTE

The Client authorized autonomous implementation through `DEC-JNOTE-011`. Each code-changing vertical slice SHALL be committed before a subsequent code-changing slice.

| Work item | Slice / scope | Requirements | Acceptance / tests |
| :--- | :--- | :--- | :--- |
| `WI-JNOTE-001` | React TypeScript shell, configuration guard, router, auth-ready layout | `FR-AUTH-001..003`, `SEC-JNOTE-002`, `NFR-UX-001` | Build/type/lint; config guard tests; responsive shell test |
| `WI-JNOTE-002` | Notebook data domain, migrations/RLS, two-column list/create/archive/search | `FR-NOTE-001..006`, `SEC-JNOTE-001` | Unit/component tests; RLS migration inspection |
| `WI-JNOTE-003` | Flashcard and Study sessions/outcomes | `FR-FLASH-001..003`, `FR-STUDY-001..005`, `FR-PROG-001` | Question/normalisation/feedback unit tests |
| `WI-JNOTE-004` | Timed Quiz, persistence, dashboard/history | `FR-QUIZ-001..006`, `FR-PROG-002` | Deadline/state/result tests; E2E flow where environment permits |
| `WI-JNOTE-005` | Export/delete/restore integration contracts, tests, docs | `FR-PROG-003..005`, `SEC-JNOTE-004`, `PRV-JNOTE-001` | Ownership/lifecycle negative tests; user/runbook update |

Secure Supabase URL/anon key are not required to create or unit-test the source. They are required to execute real integration/RLS tests and remain a protected Client dependency.
