---
artifact_id: DOC-PROJECT-PROFILE-MD
phase: "ROOT"
artifact_type: orchestration
owner: "AI Delivery Vendor"
version: "0.2"
status: Draft
ids: [OBJ-JNOTE-001, OBJ-JNOTE-002, OBJ-JNOTE-003]
dependencies: [01-Planning/DISCOVERY_LOG.md]
last_verified: "2026-08-06"
---
# Project Profile — Sổ tay học tiếng Nhật (`JNOTE`, working code)

> This profile supersedes the previous GPA-template engagement for the new GREENFIELD initiative requested on 2026-08-06. The prior version remains recoverable in Git history. Values marked `TBD` require Discovery confirmation and are not implementation authorization.

| Field | Value |
| :--- | :--- |
| Project code | `JNOTE` (working code; Client may rename during Discovery) |
| One-sentence description | A private web notebook for recording Japanese vocabulary and practising it through tracked flashcards, immediate-feedback study, and configurable timed quizzes. |
| Project owner / Product owner | Client |
| Delivery roles | AI Delivery Vendor (BA, PM, architecture, engineering, security, QA, release, documentation) |
| Repository | `E:\DUANCANHAN\japan\AI_PROJECT_LIFECYCLE_TEMPLATE` |
| Start date | 2026-08-06 |
| Target date / budget | `TBD` — not provided |
| Delivery mode | `GREENFIELD` — explicitly selected by Client |
| Autonomy mode | `FULL-LOCAL`; Client delegated Discovery and ordinary baseline-decision authority to the AI on 2026-08-06 |
| UI scope | `WEB` — React requested by Client |
| Initial technical constraint | React client with Supabase services |
| Account / data model | Supabase email-and-password account with cross-device sync; vocabulary, mode selections, practice results, and quiz attempts are user-owned personal learning data |
| Data classification | Personal account identifier (email) and private learning data; no special-category data is intended for release one |
| Security profile | `HIGH` — selected automatically under the security standard because the product stores accounts and private data through a third-party backend platform |
| Regulatory scope | `TBD`; no legal applicability claim is made |
| Human-assistance trigger | Product intent, authority, material scope/security/privacy decisions, access/approval actions, or three materially different failed approaches |
| Explicit approval boundaries | Deployment/publishing, billing, production/shared-environment changes, real-data-destructive actions, credentials, security/control reductions, risk acceptance, and baseline approval |

## Initial Problem Statement

- **Target user:** the Client, as a personal learner of Japanese.
- **Problem:** retaining and practising new Japanese vocabulary is difficult when notes, flashcards, study exercises, and tests are disconnected.
- **Initial desired outcome:** capture Japanese–Vietnamese word pairs in a notebook-like two-column page; select marked words for three learning modes; receive immediate feedback in study mode; receive results only after submitting a configurable timed quiz.
- **Growth direction:** grammar and listening/speaking may be added in a future release; they are not yet part of the initial release boundary.

## Decisions and External Dependencies

| ID | Decision / unknown | Owner | Needed by | Impact if unresolved |
| :--- | :--- | :--- | :--- | :--- |
| `DEC-JNOTE-001` | Working name/project code is `JNOTE`. | AI Delivery Vendor under delegated authority | Confirmed 2026-08-06 | Low; can be renamed through governed change control later. |
| `DEC-JNOTE-002` | Use Supabase email/password authentication with cross-device sync. | Client | Confirmed 2026-08-06 | High; requires ownership isolation, password/session controls, and privacy requirements. |
| `DEC-JNOTE-003` | Release one is vocabulary-only; grammar and listening/speaking are future scope. | Client | Confirmed 2026-08-06 | High; prevents scope creep. |
| `DEC-JNOTE-004` | Define deadline, budget/cost guardrail, and release priority. | Client | Project-plan baseline | Medium; delivery sequencing cannot be measured. |
| `DEC-JNOTE-005` | Define measurable learning/UX success criteria and whether history/progress is in MVP. | Client | Requirements baseline | Medium; acceptance cannot be objectively tested. |
| `DEC-JNOTE-006` | Use multi-select mode labels per word; practise both Japanese→Vietnamese and Vietnamese→Japanese; normalise only whitespace and case for written MVP answers; auto-submit an expired quiz. | Client | Confirmed 2026-08-06 | High; sets the core learning interaction boundary. |
| `DEC-JNOTE-007` | Apply Security Profile `HIGH` from the supplied AUTO setting. | AI Security Reviewer | Confirmed 2026-08-06 | High; account email, private study data, and third-party backend meet the profile trigger. |
| `DEC-JNOTE-008` | Store per-word correct/wrong progress and session history; record flashcard self-rating; let users select all or mode-labelled terms and 10/20/all items; use four-choice questions; show immediate study feedback; use an approximately 50/50 mixed mode; default a configurable quiz to 10 questions/10 minutes. | Client | Confirmed 2026-08-06 | High; establishes the MVP learning-session model. |
| `DEC-JNOTE-009` | Show and retain detailed Quiz results; use only required Japanese/Vietnamese fields; prevent exact-pair duplicates while allowing alternate meanings; start mode labels off; archive/restore terms; require Vietnamese diacritics; preserve an interrupted Quiz while its timer runs; and offer self-service deletion of the account with all learning data. | Client | Confirmed 2026-08-06 | High; establishes data integrity, answer marking, session recovery, and privacy boundaries. |
| `DEC-JNOTE-010` | Require verified email and self-service password reset; invalidate other sessions on password changes; use server time and one active Quiz per account; hide deletion immediately with 30-day restoration; export notes/history as CSV; target Supabase Singapore without compliance claim; meet p95 ≤ 2 seconds at 1,000 terms/account; and prohibit paid services, deployment, or publishing without separate approval. | Client | Confirmed 2026-08-06 | High; establishes security, privacy, performance, and cost boundaries. |
| `DEC-JNOTE-011` | The Client delegates Discovery completion and ordinary baseline decisions to the AI; the AI must document its rationale and keep approval-only actions protected. | Client | Confirmed 2026-08-06 | High; permits autonomous closure of Discovery without asking further reversible product/technical questions. |
| `DEC-JNOTE-012` | Use the delegated Round 5 notebook UX: Vietnamese responsive UI, inline two-column notebook, search/filter/sort, 50-row pages, dashboard, keyboard/accessibility, recoverable online-only errors, no notifications, and the defined UAT journey. | AI Delivery Vendor | Confirmed 2026-08-06 | High; completes the initial UX boundary. |
| `DEC-JNOTE-013` | Adopt documented validation, session, retention, security, and acceptance defaults from the Discovery applicability assessment. | AI Delivery Vendor | Confirmed 2026-08-06 | High; turns remaining ordinary ambiguity into a verifiable baseline. |
| `DEP-JNOTE-001` | Client-provisioned Supabase project URL and publishable anon key are required only for real integration verification; do not send secrets in chat or commit them. | Client | Before integration verification | High; local code must use safe environment references until provisioned. |
