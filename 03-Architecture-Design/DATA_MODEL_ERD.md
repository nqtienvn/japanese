---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-DATA-MODEL-ERD-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "AI Solution Architect"
version: "1.0"
status: Approved
ids: [DES-JNOTE-002]
dependencies: [02-Requirements/SRS.md]
last_verified: "2026-08-06"
---
# Data Model / ERD — JNOTE

```text
auth.users 1---* vocabulary_terms 1---* learning_outcomes
auth.users 1---* quiz_attempts 1---* quiz_questions 1---* quiz_answers
auth.users 1---* account_deletions
```

| Entity | Key fields | Owner/security | Retention |
| :--- | :--- | :--- | :--- |
| `vocabulary_terms` | id, user_id, japanese, vietnamese, labels, archived_at, timestamps | `user_id = auth.uid()`; normalised unique active pair | Until account deletion purge |
| `learning_outcomes` | id, user_id, term_id, mode, correct, rated_at | Owner RLS; append-only by owner operation | Until account deletion purge |
| `quiz_attempts` | id, user_id, mode/source, started_at, deadline_at, status, submitted_at | Owner RLS; one active attempt/user via partial unique index | Until account deletion purge |
| `quiz_questions` / `quiz_answers` | attempt_id, frozen prompt/answer, selected/written answer | Owner via parent attempt; no post-submit mutation | Until account deletion purge |
| `account_deletions` | user_id, requested_at, purge_after | Owner/service job boundary | 30 days then purge |

All tables require RLS. Database functions for create/resume Quiz, submit answer, and expire Quiz use `now()` and verify `auth.uid()` before mutating state.
