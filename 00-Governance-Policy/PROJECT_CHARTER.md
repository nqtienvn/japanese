---
artifact_id: DOC-00-GOVERNANCE-POLICY-PROJECT-CHARTER-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "AI Delivery Vendor"
version: "1.0"
status: Approved
ids: [OBJ-JNOTE-001, OBJ-JNOTE-002, OBJ-JNOTE-003, OBJ-JNOTE-004, DEC-JNOTE-011]
dependencies: [PROJECT_PROFILE.md, 01-Planning/DISCOVERY_LOG.md]
last_verified: "2026-08-06"
---
# Project Charter — Sổ tay học tiếng Nhật (`JNOTE`)

| Field | Value |
| :--- | :--- |
| Document ID | `JNOTE-CHR-001` |
| Sponsor / Product Owner | Client |
| Delivery Vendor | AI Delivery Vendor |
| Engagement | GREENFIELD, `FULL-LOCAL` |
| Baseline authority | Client delegated ordinary Discovery/baseline decisions through `DEC-JNOTE-011` on 2026-08-06 |
| Time and cost | No fixed deadline; no paid service, deployment, or publishing without a separate explicit Client approval |

## Purpose and objectives

The project creates a private Japanese-vocabulary learning web application. It removes the break between taking notes, using flashcards, practising answers, and taking a timed test.

| Objective | Measurable outcome |
| :--- | :--- |
| `OBJ-JNOTE-001` Capture vocabulary | A verified learner adds ten unique Japanese/Vietnamese pairs in one notebook session without assistance. |
| `OBJ-JNOTE-002` Practise vocabulary | The learner completes bidirectional Flashcard and Study sessions with saved per-term outcomes. |
| `OBJ-JNOTE-003` Assess learning | The learner completes a server-timed Quiz and reviews its detailed, saved result. |
| `OBJ-JNOTE-004` Protect learning data | Every protected record is accessible only to its owner; account export/delete/restore paths have negative and positive verification evidence. |

## Release-one scope

In scope: verified email/password account, user-isolated vocabulary, two-column inline notebook, independent Flashcard/Study/Quiz labels, dashboard, Flashcard, Study, Quiz, progress/history, search/filter/sort, archive/restore, CSV export, 30-day account-deletion restoration, responsive accessibility, and recoverable online errors.

Out of scope: grammar, listening, speaking, AI, sharing, social/ranking, multi-tenant administration, bulk import, offline sync, notifications, public APIs, native mobile apps, paid services, and application deployment/publishing.

## Constraints and success boundaries

- React and Supabase are mandatory technology constraints.
- The UI SHALL be Vietnamese and responsive from 360 px upward.
- Core screens, save, and next-question actions SHALL meet p95 ≤ 2 seconds at 1,000 terms/account in the defined test environment.
- The Security Profile is `HIGH`; no legal/compliance certification or claim is in scope.
- Secrets SHALL be environment references only. A real Supabase URL and publishable anon key remain a Client-provisioned integration dependency.

## Authority and exclusions

The AI Delivery Vendor may decide ordinary local/reversible delivery matters and record them. The Client alone approves deployment/publishing, billing, shared/production changes, access credentials, destructive real-data actions, lowered security/privacy controls, and risk acceptance. This charter does not authorize any of those actions.

## Charter acceptance

This charter is approved under the Client's explicit delegated authority recorded in `DEC-JNOTE-011`. It is a project baseline, not a legal contract or a compliance certification.
