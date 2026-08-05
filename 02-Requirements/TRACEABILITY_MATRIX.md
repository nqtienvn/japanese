---
artifact_id: DOC-02-REQUIREMENTS-TRACEABILITY-MATRIX-MD
phase: "02-Requirements"
artifact_type: traceability
owner: "AI Delivery Vendor"
version: "1.0"
status: In Progress
ids: [OBJ-JNOTE-001, OBJ-JNOTE-002, OBJ-JNOTE-003, OBJ-JNOTE-004]
dependencies: [02-Requirements/SRS.md, 03-Architecture-Design/SOFTWARE_ARCHITECTURE.md, 06-Testing/TEST_SPECIFICATION.md]
last_verified: "2026-08-06"
---
# Requirements Traceability Matrix — Sổ tay học tiếng Nhật (`JNOTE`)

| Objective | Approved requirements | Design / data control | Implementation evidence | Test / configuration evidence | Handover state |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `OBJ-JNOTE-001` — Capture vocabulary | `FR-NOTE-001..006` | React notebook; `vocabulary_terms`; owner-only RLS; unique owner/pair constraint | `src/App.tsx`, `src/api.ts`, `supabase/migrations/20260806_jnote.sql` | Type build passed; schema query confirms core tables/RLS; authenticated UAT pending | Implemented; UAT pending |
| `OBJ-JNOTE-002` — Practise vocabulary | `FR-FLASH-001..003`, `FR-STUDY-001..005`, `FR-PROG-001..002`, `NFR-A11Y-001` | Client session selection; `learning_outcomes`; Unicode/whitespace answer normalisation | `src/App.tsx`, `src/learning.ts`, `src/learning.test.ts` | `npm test`: 3/3 passed; local UI loads Auth gate; learner-session UAT pending | Implemented; UAT pending |
| `OBJ-JNOTE-003` — Assess learning | `FR-QUIZ-001..006`, `SEC-JNOTE-003`, `NFR-REL-001` | One-active-attempt index; server deadline; RPC-only save/submit; persisted answers | `src/App.tsx`, `src/api.ts`, `supabase/migrations/20260806_jnote.sql`, `20260806_02_jnote_lifecycle_and_quiz_guard.sql` | Supabase query confirms quiz functions; local TypeScript build passed; timed cross-device UAT pending | Implemented; UAT pending |
| `OBJ-JNOTE-004` — Protect private learning data | `FR-AUTH-001..003`, `FR-PROG-003..005`, `SEC-JNOTE-001..004`, `PRV-JNOTE-001` | Confirm-email Auth; owner RLS; account lifecycle, 30-day scheduler, export and auth-user purge | `src/App.tsx`, `src/api.ts`, `supabase/migrations/20260806_02_jnote_lifecycle_and_quiz_guard.sql`, `20260806_03_purge_auth_accounts.sql` | Dashboard confirms Email enabled/Confirm email; SQL confirms five tables, five safety functions and one purge schedule; two-account negative test pending | Implemented; security UAT pending |

## Coverage Summary

| Measure | Result | Evidence / next action |
| :--- | :--- | :--- |
| Approved atomic requirements | 37 | `02-Requirements/SRS.md` |
| Objectives with implementation evidence | 4 / 4 | Rows above |
| Local verification | Passed | `npm run build`; `npm test` (3 tests) |
| Supabase configuration verification | Passed | Email Auth enabled, Confirm email enabled, `http://localhost:5173` site URL, allowed `http://localhost:5173/**` redirect |
| Database verification | Passed | 5 JNOTE tables; server Quiz guard/lifecycle functions; one daily purge schedule |
| Acceptance / security UAT | Pending | Create two real test accounts, execute the accepted learner journey, and record p95/viewport/keyboard evidence before public release |

## Traceability Risks

| Risk ID | Gap | Owner | Closure evidence |
| :--- | :--- | :--- | :--- |
| `RISK-JNOTE-014` | No authenticated end-to-end, two-account RLS, timed-Quiz, or 1,000-term performance evidence has yet been collected. | AI Delivery Vendor / Client | UAT report and repeatable performance/security test record. |
| `RISK-JNOTE-015` | The local Publishable key is deliberately ignored by Git. A future deployed environment must set its own environment variables and redirect URLs. | Deployment owner | Deployment-specific configuration review; deployment itself remains unapproved. |
