---
artifact_id: DOC-02-REQUIREMENTS-FEATURE-CATALOG-MD
phase: "02-Requirements"
artifact_type: requirements
owner: "AI Business Analyst"
version: "1.0"
status: Approved
ids: [FEAT-JNOTE-001, FEAT-JNOTE-002, FEAT-JNOTE-003, FEAT-JNOTE-004, FEAT-JNOTE-005, FEAT-JNOTE-006]
dependencies: [02-Requirements/BRD.md, 02-Requirements/SRS.md]
last_verified: "2026-08-06"
---
# Feature Catalog — JNOTE

| ID | Feature | Persona value | Requirements | Risk | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `FEAT-JNOTE-001` | Private account | Verified learner owns private data. | `FR-AUTH-001..003`, `SEC-JNOTE-001` | Auth/privacy | Approved |
| `FEAT-JNOTE-002` | Vocabulary notebook | Learner captures/fetches/archives terms. | `FR-NOTE-001..006` | Data integrity | Approved |
| `FEAT-JNOTE-003` | Flashcards | Learner flips and self-rates selected cards. | `FR-FLASH-001..003` | Progress | Approved |
| `FEAT-JNOTE-004` | Study | Learner gets immediate feedback in both directions. | `FR-STUDY-001..005` | Answer scoring | Approved |
| `FEAT-JNOTE-005` | Timed Quiz | Learner takes one authoritative timed attempt. | `FR-QUIZ-001..006`, `SEC-JNOTE-003` | Concurrency | Approved |
| `FEAT-JNOTE-006` | Progress/privacy | Learner reviews history and controls export/deletion. | `FR-PROG-001..005`, `PRV-JNOTE-001` | Privacy | Approved |
