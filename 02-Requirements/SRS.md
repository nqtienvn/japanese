---
artifact_id: DOC-02-REQUIREMENTS-SRS-MD
phase: "02-Requirements"
artifact_type: requirements
owner: "AI Business Analyst"
version: "1.0"
status: Approved
ids: [FR-AUTH-001, FR-AUTH-002, FR-AUTH-003, FR-NOTE-001, FR-NOTE-002, FR-NOTE-003, FR-NOTE-004, FR-NOTE-005, FR-FLASH-001, FR-FLASH-002, FR-STUDY-001, FR-STUDY-002, FR-STUDY-003, FR-QUIZ-001, FR-QUIZ-002, FR-QUIZ-003, FR-QUIZ-004, FR-QUIZ-005, FR-PROG-001, FR-PROG-002, FR-PROG-003, FR-PROG-004, NFR-PERF-001, NFR-UX-001, NFR-A11Y-001, NFR-REL-001, SEC-JNOTE-001, SEC-JNOTE-002, SEC-JNOTE-003, PRV-JNOTE-001]
dependencies: [02-Requirements/BRD.md, 01-Planning/DISCOVERY_LOG.md]
last_verified: "2026-08-06"
---
# Software Requirements Specification — JNOTE

Each row is one testable obligation. `REL-JNOTE-1.0` is source/local only.

| ID | Atomic requirement | Priority | Acceptance criterion |
| :--- | :--- | :--- | :--- |
| `FR-AUTH-001` | The system SHALL create an account after a valid email/password registration request. | Must | One pending-verification account is created. |
| `FR-AUTH-002` | The system SHALL deny private-notebook access to an unverified account. | Must | Unverified session cannot read a protected Term. |
| `FR-AUTH-003` | The system SHALL start a password-reset flow through an account email request. | Must | Valid request returns a neutral recovery message. |
| `FR-NOTE-001` | The system SHALL create an active Term from required Japanese and Vietnamese text. | Must | Owner sees one saved pair. |
| `FR-NOTE-002` | The system SHALL reject an exact normalised owner-scoped Japanese/Vietnamese pair. | Must | Duplicate creates no second Term. |
| `FR-NOTE-003` | The system SHALL return only active Terms owned by the authenticated Learner by default. | Must | Cross-owner and archived rows are absent. |
| `FR-NOTE-004` | The system SHALL return no more than 50 Terms in one notebook page. | Must | 51 matches return 50 rows plus next-page state. |
| `FR-NOTE-005` | The system SHALL archive a Term at its owner’s request. | Must | Archived Term is absent from normal selection. |
| `FR-NOTE-006` | The system SHALL restore an archived Term at its owner’s request. | Must | Restored Term is active again. |
| `FR-FLASH-001` | The system SHALL create a Flashcard session from the requested eligible source and size. | Must | 10, 20, or all available cards are served. |
| `FR-FLASH-002` | The system SHALL present Japanese and Vietnamese content on opposite Flashcard faces. | Must | Flip reveals the opposite text. |
| `FR-FLASH-003` | The system SHALL store one self-rating for a completed Flashcard. | Must | Outcome appears in owner history. |
| `FR-STUDY-001` | The system SHALL create a Study session in the selected Japanese/Vietnamese direction. | Must | Prompts follow the selected direction. |
| `FR-STUDY-002` | The system SHALL present exactly four distinct options for an eligible multiple-choice question. | Must | Correct option and three distinct distractors exist. |
| `FR-STUDY-003` | The system SHALL fall back to a written question when a Term lacks three distractors. | Must | No duplicate option is shown. |
| `FR-STUDY-004` | The system SHALL mark a Vietnamese answer correct only after whitespace, case, and Unicode normalisation preserve diacritics. | Must | Accent-removed input is incorrect. |
| `FR-STUDY-005` | The system SHALL reveal feedback after each Study answer. | Must | Correctness and answer appear before next. |
| `FR-QUIZ-001` | The system SHALL create a Quiz from requested source, count, and duration. | Must | Default is 10 questions/10 minutes. |
| `FR-QUIZ-002` | The system SHALL allow at most one active Quiz per Learner. | Must | Second request resumes existing attempt. |
| `FR-QUIZ-003` | The system SHALL derive a Quiz deadline from server time. | Must | Client clock cannot extend time. |
| `FR-QUIZ-004` | The system SHALL persist a submitted answer while a Quiz is active. | Must | Reload returns saved answer. |
| `FR-QUIZ-005` | The system SHALL submit a Quiz when its deadline passes. | Must | Late answer is rejected. |
| `FR-QUIZ-006` | The system SHALL reveal detailed Quiz results only after submission. | Must | Score/review absent before submit. |
| `FR-PROG-001` | The system SHALL store one correct/incorrect outcome for each completed Study or Quiz answer. | Must | Owner history includes the outcome. |
| `FR-PROG-002` | The system SHALL show owner-scoped vocabulary total and recent progress on the dashboard. | Must | Summary matches owner data. |
| `FR-PROG-003` | The system SHALL export only the requester’s vocabulary and history as CSV. | Must | Export excludes second test owner. |
| `FR-PROG-004` | The system SHALL hide account learning data immediately after confirmed deletion. | Must | Deleted account cannot access data. |
| `FR-PROG-005` | The system SHALL restore deleted account data within 30 days. | Must | Restore before expiry recovers access. |
| `NFR-PERF-001` | The system SHALL complete core page load, save, and next-question actions within 2 seconds at p95 for 1,000 active Terms/account. | Must | Browser test reports p95 ≤2s. |
| `NFR-UX-001` | The system SHALL render primary journeys at 360, 768, and 1440 px without hiding required controls. | Must | Visual test passes all viewports. |
| `NFR-A11Y-001` | The system SHALL expose primary journeys through keyboard-focusable controls. | Must | Keyboard test completes them. |
| `NFR-REL-001` | The system SHALL show a recoverable Vietnamese error after an online-operation failure. | Must | Failed action supplies retry. |
| `SEC-JNOTE-001` | The system SHALL deny data access when the row owner differs from the authenticated requester. | Must | Cross-owner read/write test is rejected. |
| `SEC-JNOTE-002` | The client application SHALL NOT contain a Supabase service-role key. | Must | Secret scan has no service-role key. |
| `SEC-JNOTE-003` | The system SHALL reject an answer received after the authoritative Quiz deadline. | Must | Result remains unchanged. |
| `SEC-JNOTE-004` | The system SHALL require recent authentication before account deletion. | Must | Stale session deletion is denied. |
| `PRV-JNOTE-001` | The system SHALL permanently purge an un-restored deleted account after 30 days. | Must | Lifecycle test verifies purge contract. |

Hardware, public APIs, partner integrations, notifications, offline sync, and native mobile are N/A for this release; their rationales are in the BRD and Discovery Log.
