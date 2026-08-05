---
artifact_id: DOC-02-REQUIREMENTS-USE-CASE-SPECIFICATION-MD
phase: "02-Requirements"
artifact_type: requirements
owner: "AI Business Analyst"
version: "1.0"
status: Approved
ids: [UC-JNOTE-001, UC-JNOTE-002, UC-JNOTE-003, UC-JNOTE-004, UC-JNOTE-005, UC-JNOTE-006]
dependencies: [02-Requirements/SRS.md]
last_verified: "2026-08-06"
---
# Use Cases — JNOTE

| ID | Goal | Trigger | Happy result | Alternate/error | Requirements |
| :--- | :--- | :--- | :--- | :--- |
| `UC-JNOTE-001` | Access notebook | Register/login | Verified session opens dashboard. | Invalid/unverified user gets safe recovery. | `FR-AUTH-001..003` |
| `UC-JNOTE-002` | Maintain terms | Submit a two-column row | Owner sees unique active Term. | Duplicate/invalid/network error is recoverable. | `FR-NOTE-001..006` |
| `UC-JNOTE-003` | Learn with Flashcards | Select source/size | Flip/rate cards; history is stored. | Empty source shows guidance. | `FR-FLASH-001..003` |
| `UC-JNOTE-004` | Study | Select source/direction/type | Each question immediately yields feedback. | Insufficient distractors becomes written. | `FR-STUDY-001..005` |
| `UC-JNOTE-005` | Take Quiz | Configure/continue attempt | Server-timed attempt submits and reveals review. | Existing/late/cross-owner request is safe. | `FR-QUIZ-001..006` |
| `UC-JNOTE-006` | Control data | Export/delete/restore | Owner exports data or restores within window. | Stale/cross-owner request is denied. | `FR-PROG-002..005` |

`UC-JNOTE-005` path: verified owner selects source/count/duration → system resumes existing active attempt or freezes questions/deadline → answers persist while before server deadline → explicit/automatic submit → owner alone views detailed results. No cancellation exists after a Quiz starts.
