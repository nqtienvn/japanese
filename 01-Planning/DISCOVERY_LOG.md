---
artifact_id: DOC-01-PLANNING-DISCOVERY-LOG-MD
phase: "01-Planning"
artifact_type: planning
owner: "AI Business Analyst"
version: "0.1"
status: Complete
ids: []
dependencies: []
last_verified: "2026-07-18"
---
# Stakeholder Discovery Log — GPA Calculator & Student Motivator (GPA)

## Interview Status

| Field | Value |
| :--- | :--- |
| Interview owner | AI Business Analyst |
| Client decision owner | Client (User) |
| Core coverage | 120 / 120 applicable |
| Product coverage | 100% applicable |
| Engineering coverage | 100% applicable |
| Baseline | Approved (Review Pending) |

## Profile Selection Record

- **Selected Profiles**: `Web CRUD` and `Integration-heavy`.
- **Owner**: AI Business Analyst.
- **Rationale**: React JS + Spring Boot indicates standard Web CRUD patterns for student profiles, goal-setting, and grade suggestions. A Chrome Extension crawling external Vietnamese university portals to fetch curriculum and grade data constitutes a client-side external integration component, introducing variability and security concerns.

## Answer Register

| Question ID | Short Question | Answer/Evidence | Status | Source | Confidence | Owner | Follow-up/Deadline |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `Q-C001` | One-sentence description | A platform for calculating GPA, suggesting required grades, and motivating university students in Vietnam using curriculum/grade data crawled via a Chrome extension. | Confirmed | Client | High | Client | Done |
| `Q-C005` | Target users | University students in Vietnam. | Confirmed | Client | High | Client | Done |
| `Q-C013` | Problem statement | Students do not know how GPA is calculated, leading to a lack of academic goals and motivation; they need a way to track GPA and know what grades are required to achieve target GPAs. | Confirmed | Client | High | Client | Done |
| `Q-C025` | Security profile & Auth | Basic login via Google OAuth or local registration. We do not store university portal passwords on our servers. | Confirmed | Client | High | Client | Done |
| `Q-C029` | Data ownership | Students own their grades. Scraping happens under student sessions. | Confirmed | Client | High | Client | Done |
| `Q-C040` | Device & OS | Web browser (Vite + React) & Chrome browser for the extension. | Confirmed | Client | High | Client | Done |
| `Q-C049` | Core outcomes | Students set target GPAs, view progression towards goals, see target grade suggestions per remaining course, and view anonymous major rankings. | Confirmed | Client | High | Client | Done |
| `Q-C061` | MVP Target Universities | National Economics University (NEU) and FPT University. | Confirmed | Client | High | Client | Done |
| `Q-C062` | MVP Excluded Scope | Automatic crawling on behalf of users in background (no raw credentials stored); other universities are out of scope for MVP. | Confirmed | Client | High | Client | Done |
| `Q-C073` | Tech stack constraints | React JS frontend (in-repo), Spring Boot backend, Chrome Extension scraper. | Confirmed | Client | High | Client | Done |
| `Q-C074` | Scraping flow | User logs in manually to their portal -> opens grades page -> clicks scraper button on extension -> extension parses DOM/JSON and sends to backend. | Confirmed | Client | High | Client | Done |
| `Q-C076` | GPA calculation rules | Convert scale 10, scale 4, and letter grades (A, B, C, D) following the Ministry of Education and Training (MoET) standards. | Confirmed | Client | High | Client | Done |
| `Q-P001` | Suggestion algorithm | Hybrid: (B) Allow users to tag subjects as "easy/hard" to skew recommended targets, and (C) Auto-recommend target grades based on past performance in similar subject categories. | Confirmed | Client | High | Client | Done |
| `Q-P002` | Motivation features | 3 features required: GPA trajectory graph towards goals, semester-based target setting, and anonymous major leaderboards. | Confirmed | Client | High | Client | Done |
| `OQ-GPA-009` | Grade conversion rules for FPT & NEU | **FPT**: 8.5-10 -> A (4.0); 7.0-8.4 -> B (3.0); 5.5-6.9 -> C (2.0); 4.0-5.4 -> D (1.0); <4.0 -> F (0). <br>**NEU**: 8.5-10 -> A (4.0); 8.0-8.4 -> B+ (3.5); 7.0-7.9 -> B (3.0); 6.5-6.9 -> C+ (2.5); 5.5-6.4 -> C (2.0); 4.0-5.4 -> D (1.0); <4.0 -> F (0). | Confirmed | Client | High | Client | Done |
| `OQ-GPA-010` | Extension scraping method | Hybrid: DOM parsing (HTML scraping) + API interception (capturing JSON requests). Implement validations to ensure parsing resilience. | Confirmed | Client | High | Client | Done |
| `OQ-GPA-011` | Anonymous leaderboards | Filter by Same Major + Same Intake Year. Display percentile ranking: "Your GPA is in the Top 5% of Software Engineering students of K18". | Confirmed | Client | High | Client | Done |
| `OQ-GPA-012` | Hybrid suggestion rules | Incorporate both manual difficulty selection per course and auto-weighting from category performance (e.g. IT, MA, FL). | Confirmed | Client | High | Client | Done |
| `OQ-GPA-013` | Multiple transcript storage | Supported. A single student account can store and manage multiple scraped or simulated transcripts. | Confirmed | Client | High | Client | Done |
| `OQ-GPA-015` | Extension Repo location | Chrome Extension code will be placed in the `chrome-extension/` root directory. | Confirmed | Client | High | Client | Done |
| `OQ-GPA-016` | Database technology | MySQL. | Confirmed | Client | High | Client | Done |
| `OQ-GPA-017` | Major & Intake Collection | User manually declares/selects Major & Intake Year during registration/transcript upload. | Confirmed | Client | High | Client | Done |
| `OQ-GPA-018` | Security Profile classification | Aligned on **HIGH** security profile to protect student transcripts (PII) per Decree 13/2023/ND-CP. | Confirmed | Client | High | Client | Done |
| `OQ-GPA-019` | Project deadlines & milestones | None specified ("none/not required"). | Confirmed | Client | High | Client | Done |
| `OQ-GPA-020` | Extension distribution mode | (A) Load unpacked extension in Chrome Developer Mode for local testing/deployment. | Confirmed | Client | High | Client | Done |

## Synthesis After Each Round

### Round 1 — 2026-07-18 — Kickoff and Scope Clarification

- **Confirmed**: React JS frontend, Spring Boot backend, Chrome Extension scraper, target user is Vietnamese university students, key outcome is GPA prediction/goal suggestion.
- **Open Items**: Scales, scraper payload, ranking filters, multiple profiles, DB tech.

### Round 2 — 2026-07-18 — Grade Scales & Tech Details

- **Confirmed**: FPT and NEU grade tables, hybrid scraping, major/intake leaderboards, MySQL, multi-transcript support.
- **Open Items**: Major/Intake year input, security profile, deadlines, extension distribution.

### Round 3 — 2026-07-18 — Security & Finalizing Scope

- **Confirmed**:
  - **Major & Intake collection**: Manual input.
  - **Security Profile**: Locked to `HIGH` (PII protection under Vietnam Decree 13/2023/ND-CP).
  - **Deadlines/Milestones**: None/flexible.
  - **Extension Deployment**: Load unpacked (Developer Mode).
- **Contradictions/Open Items**: None remaining.
- **New Requirement/Decision IDs**:
  - `DEC-GPA-007`: Major/Intake year input mode.
  - `DEC-GPA-008`: Security profile classified as `HIGH`.
  - `DEC-GPA-009`: Unpacked extension deployment.
- **Next Round Topic**: Discovery Baseline Approval & Requirements phase kickoff.

## Decision Log

| Decision ID | Decision | Options/Trade-Off | Decider | Date | Artifact Affected |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `DEC-GPA-001` | Target NEU and FPT for MVP | Out-of-scope for other universities. | Client | 2026-07-18 | `PROJECT_PROFILE.md` |
| `DEC-GPA-002` | User-initiated session scraping | No background credentials storage to minimize security and privacy compliance overhead. | Client | 2026-07-18 | `PROJECT_PROFILE.md` |
| `DEC-GPA-003` | Google Auth & manual login | Allows basic account creation for dashboard persistence. | Client | 2026-07-18 | `PROJECT_PROFILE.md` |
| `DEC-GPA-004` | FPT & NEU Grade Scales | Use specific conversion rules provided. | Client | 2026-07-18 | `PROJECT_PROFILE.md` |
| `DEC-GPA-005` | Multi-transcript profiles | Support multiple transcript runs per user account. | Client | 2026-07-18 | `PROJECT_PROFILE.md` |
| `DEC-GPA-006` | Unified repository with `chrome-extension/` | Simplifies code management and packaging. | Client | 2026-07-18 | `PROJECT_PROFILE.md` |
| `DEC-GPA-007` | Manual Major/Intake input | Simplifies scraping complexity. | Client | 2026-07-18 | `PROJECT_PROFILE.md` |
| `DEC-GPA-008` | Security Profile = HIGH | Required for PII/academic data protection (Decree 13/2023/ND-CP). | Client | 2026-07-18 | `PROJECT_PROFILE.md` |
| `DEC-GPA-009` | Unpacked Extension distribution | Simplifies testing without Web Store deployment. | Client | 2026-07-18 | `PROJECT_PROFILE.md` |

## Open Questions

| ID | Content | Rationale | Owner | Deadline | Block Phase? |
| :--- | :--- | :--- | :--- | :--- | :--- |
| — | — | — | — | — | — |

## Baseline Approval

| Content | Client Decision | Date | Note |
| :--- | :--- | :--- | :--- |
| Problem/outcome | Approved | 2026-07-18 | Aligned on GPA prediction & motivation |
| Scope/release boundary | Approved | 2026-07-18 | Support NEU + FPT, no background credential storage |
| Autonomy for local execution | Approved | 2026-07-18 | FULL-LOCAL requested by Client |
| Security profile HIGH | Approved | 2026-07-18 | Transcript and PII protection |
| Chrome extension unpacked | Approved | 2026-07-18 | Unpacked load |
