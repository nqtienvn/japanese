---
artifact_id: DOC-02-REQUIREMENTS-BRD-MD
phase: "02-Requirements"
artifact_type: requirements
owner: "AI Business Analyst"
version: "1.0"
status: Approved
ids: [OBJ-JNOTE-001, OBJ-JNOTE-002, OBJ-JNOTE-003, OBJ-JNOTE-004, BR-JNOTE-001, BR-JNOTE-002, BR-JNOTE-003]
dependencies: [01-Planning/DISCOVERY_LOG.md, 00-Governance-Policy/PROJECT_CHARTER.md]
last_verified: "2026-08-06"
---
# Business Requirements Document — JNOTE

## Control

`JNOTE-BRD-001` is approved under the Client's delegated authority `DEC-JNOTE-011`. It defines a local/source MVP; it is not deployment approval or a legal/compliance claim.

## Need, scope, and outcomes

The Learner needs one private Vietnamese-language web notebook that joins Japanese/Vietnamese capture, Flashcards, immediate Study feedback, and timed Quiz results.

| Objective | Observable outcome |
| :--- | :--- |
| `OBJ-JNOTE-001` | The Learner adds ten unique word pairs without assistance. |
| `OBJ-JNOTE-002` | The Learner completes bidirectional Flashcard and Study sessions with saved outcomes. |
| `OBJ-JNOTE-003` | The Learner completes a server-timed Quiz and reviews detailed results. |
| `OBJ-JNOTE-004` | Only the owner can access/export/delete their private learning data. |

In scope: verified email/password account, two-column notebook, independent mode labels, dashboard, search/filter/sort, Flashcard, Study, Quiz, progress/history, archive/restore, CSV export, recoverable deletion, responsive/accessibility, and recoverable online errors.

Out of scope: grammar, listening, speaking, AI, sharing, teams, social features, import, notifications, offline sync, native mobile, public APIs, paid services, deployment, and publishing.

## Terms and rules

| Term | Definition |
| :--- | :--- |
| Learner | Authenticated owner of a private notebook. |
| Term | Owner-scoped Japanese text and Vietnamese meaning. |
| Mode label | Independent Flashcard, Study, or Quiz selector. |
| Quiz attempt | Frozen question set in `active`, `submitted`, or `expired` state. |

| ID | Business rule |
| :--- | :--- |
| `BR-JNOTE-001` | A Term is unique by owner plus normalised Japanese/Vietnamese pair. |
| `BR-JNOTE-002` | An archived Term is excluded from normal learning selections. |
| `BR-JNOTE-003` | A Quiz deadline is determined by server time. |

## Workflows

1. Learner creates a pair, then optionally assigns any mode labels.
2. Learner selects all eligible or label-selected terms and a 10/20/all size for Flashcard or Study.
3. Learner configures a Quiz, answers a frozen set, then only sees results after submit/expiry.
4. Learner searches/archives/restores records or exports/deletes/restores their account.

## Interfaces and acceptance

| Interface | Requirement |
| :--- | :--- |
| User interface | Vietnamese responsive browser interface from 360 px with keyboard and browser zoom support. |
| Hardware | N/A: no specialised hardware/device integration. |
| Software | Supabase Auth/Postgres only; real URL/key are external secure configuration references. |
| Communications | Browser HTTPS to Supabase when configured; no deployed environment is authorised. |

Acceptance is completion of the Discovery Log UAT journey, requirement-linked tests, no Critical security finding, and complete handover evidence.
