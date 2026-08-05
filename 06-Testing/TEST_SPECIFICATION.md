---
artifact_id: DOC-06-TESTING-TEST-SPECIFICATION-MD
phase: "06-Testing"
artifact_type: testing
owner: "AI QA Lead"
version: "1.0"
status: Approved
ids: [TC-JNOTE-001, TC-JNOTE-002, TC-JNOTE-003, TC-JNOTE-004, TC-JNOTE-005, TC-JNOTE-006, TC-JNOTE-007, TC-JNOTE-008]
dependencies: [02-Requirements/SRS.md, 04-Implementation/IMPLEMENTATION_PLAN.md]
last_verified: "2026-08-06"
---
# Test Specification — JNOTE

| Test ID | Basis | Condition/input | Expected observable result |
| :--- | :--- | :--- | :--- |
| `TC-JNOTE-001` | `FR-NOTE-001..002` | Create pair then create exact normalised pair. | First succeeds; second creates no record and gives recovery message. |
| `TC-JNOTE-002` | `FR-NOTE-005..006` | Archive then restore owned Term. | Default list/source excludes then includes it. |
| `TC-JNOTE-003` | `FR-STUDY-002..004` | Eligible/ineligible distractors; accent-removed Vietnamese answer. | Four unique options or written fallback; accent-removed answer is wrong. |
| `TC-JNOTE-004` | `FR-QUIZ-002..005` | Create two attempts; submit answer after deadline. | One active attempt; late answer rejected. |
| `TC-JNOTE-005` | `FR-QUIZ-004..006` | Persist then reload active answer; submit attempt. | Saved answer returns; review appears only after submit. |
| `TC-JNOTE-006` | `SEC-JNOTE-001` | Second authenticated test owner reads/writes/export first owner data. | Every request is denied or returns no protected row. |
| `TC-JNOTE-007` | `FR-PROG-003..005`, `SEC-JNOTE-004` | Export/delete with owner and stale session. | Export is owner-scoped; stale deletion is denied; restore/purge contract works. |
| `TC-JNOTE-008` | `NFR-UX-001`, `NFR-A11Y-001`, `NFR-REL-001` | Primary journeys at three viewports, keyboard-only, and failed request. | Controls remain usable; keyboard completes journey; retryable Vietnamese error appears. |
