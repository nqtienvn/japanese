---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-DOMAIN-MODEL-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "AI Solution Architect"
version: "1.0"
status: Complete
ids: [AGG-GPA-USER, AGG-GPA-TRANSCRIPT, AGG-GPA-RANKING]
dependencies: [GPA-SRS-001]
last_verified: "2026-07-18"
---
# Domain Model — UniGPA

| Field | Value |
| :--- | :--- |
| Version/status | 1.0 / Approved |
| Owner/reviewer | AI Solution Architect / Client |
| Requirements | `BR-GPA-001`, `BR-GPA-002`, `FR-GPA-003`, `FR-GPA-005` |

## Bounded Contexts

| Context ID | Context/name | Responsibility | Owned data | Upstream/downstream | Invariants | ADR/design |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `BC-AUTH` | Authentication & User | Handles login, local user profile creation, Google OAuth token exchange. | `User` profile records | Downstream to `BC-TRANSCRIPT` | User must have a valid email | `ADR-GPA-002` |
| `BC-TRANSCRIPT` | Academic Transcript | Manages course grades, transcripts, simulations, and suggest algorithms. | `Transcript`, `GradeRecord` | Upstream to `BC-RANKING` | GPA must remain between 0.00 and 4.00 | `ADR-GPA-001` |
| `BC-RANKING` | major Leaderboard | Aggregates user GPAs for anonymous Major/Intake ranking stats. | Percentile statistics | Downstream of `BC-TRANSCRIPT` | Percentiles must be between 0% and 100% | `GPA-SAD-001` |

## Aggregate and Value-Object Catalog

| Aggregate ID/root | Entities/value objects | Commands | Domain events | Invariants | Transaction boundary | Permission | Tests |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `AGG-GPA-USER` / `User` | `Email`, `Major`, `IntakeYear` | `RegisterUser`, `UpdateMajor` | `UserCreatedEvent` | Email must be unique. | Single user record | Self | `TC-DOM-USER-01` |
| `AGG-GPA-TRANS` / `Transcript` | `GradeRecord`, `Grade`, `Credits` | `ImportTranscript`, `SimulateGrade`, `SetTargetGpa` | `TranscriptSyncedEvent`, `GradeSimulatedEvent` | Completed credits cannot exceed total graduation credits | Transcript and its courses | Owner | `TC-DOM-TRANS-01` |
| `AGG-GPA-RANK` / `RankStats` | `Percentile` | `RecalculateRanks` | `RanksUpdatedEvent` | Ranking only computed for groups of >= 5 users | Full table or batch | System Admin | `TC-DOM-RANK-01` |

## Domain State and Lifecycle

| State machine ID | Entity | From → event/condition → to | Actor | Rejection/error | Audit/event | Test |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `STATE-GPA-GRADE` | `GradeRecord` | `COMPLETED` ➔ `SimulateGrade` ➔ `SIMULATED` | Student | Cannot edit historical completed SIS grades unless simulation mode active | `GradeSimulatedEvent` | `TC-STATE-GRADE-01` |

## Language/framework mapping

| Domain Concept | Target Implementation | Compatibility Rule | Owner |
| :--- | :--- | :--- | :--- |
| Aggregate Root | JPA Entities (`@Entity` in Spring Boot) | Enforces database constraints and JPA relationship cascading | Dev Lead |
| Domain Events | Spring ApplicationEvents | Stateless publishing inside Spring Boot JVM | Dev Lead |

## Gate Checklist

- [x] Every aggregate has one owner and an explicit boundary.
- [x] Every invariant has enforcement and a negative test.
- [x] Domain terminology matches glossary, API, database and UI.
- [x] Cross-language implementation preserves invariant and event contract.
