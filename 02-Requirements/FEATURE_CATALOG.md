---
artifact_id: DOC-02-REQUIREMENTS-FEATURE-CATALOG-MD
phase: "02-Requirements"
artifact_type: requirements
owner: "AI Business Analyst"
version: "1.0"
status: Complete
ids: [FEAT-GPA-001, FEAT-GPA-002, FEAT-GPA-003, FEAT-GPA-004]
dependencies: [GPA-SRS-001]
last_verified: "2026-07-18"
---
# Feature Catalog — UniGPA

## Feature Inventory

| Feature ID | Name | Outcome/persona | BR/FR/UC | Priority | Complexity | Risk domains | Release | Owner | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `FEAT-GPA-001` | SIS Scraper (Chrome Extension) | Students scrape portal grades automatically. | `FR-GPA-001`, `UC-GPA-001` | Must | Medium | Integration / Layout shifts | REL-1.0 | Tech Lead | Designed |
| `FEAT-GPA-002` | GPA Planner & Simulator | Target suggestions and simulated scores. | `FR-GPA-002`, `FR-GPA-003`, `UC-GPA-002`, `UC-GPA-003` | Must | High | Concurrency / Math precision | REL-1.0 | Tech Lead | Designed |
| `FEAT-GPA-003` | Major Percentile Leaderboard | Motivates students with anonymous major rankings. | `FR-GPA-005`, `UC-GPA-004` | Must | Medium | Concurrency / PII leakage | REL-1.0 | Dev Lead | Designed |
| `FEAT-GPA-004` | Multi-Transcript Storage | Allows users to track multiple grade scenarios. | `FR-GPA-007` | Must | Low | State synchronization | REL-1.0 | Dev Lead | Designed |

## Feature Detail

### `FEAT-GPA-001` — SIS Scraper (Chrome Extension)

- **Business outcome and KPI:** Average grade import time reduced from 15 minutes to < 1 minute; zero manual entry errors.
- **Primary/secondary actors:** Student.
- **Trigger and preconditions:** User is logged into portal grades page and clicks "Scrape" on popup extension.
- **In scope / out of scope:** In-scope: FPT and NEU portals; JSON catching and DOM parsing. Out-of-scope: password storage.
- **Data/entities and classification:** Grades, credits, subject codes, user identifier. Classified as **Confidential / PII**.
- **Integrations/interfaces:** REST API exchange with Spring Boot.
- **State transitions/business rules:** Validate fields are non-empty and numbers match ranges.
- **Permission/audit/privacy:** Student must be logged in. No credentials recorded.
- **NFR targets and measurement:** Parse completes in < 3 seconds client-side.
- **Use cases:** `UC-GPA-001`.
- **Design/API/UI/Test links:** `UI-REQ-002`, `SW-REQ-001`.
- **Release/rollback/operations impact:** Layour changes in school portals will trigger extension update deployment.

### `FEAT-GPA-002` — GPA Planner & Simulator

- **Business outcome and KPI:** Accurate math showing exactly what grade is needed on remaining courses to achieve target GPA.
- **Primary/secondary actors:** Student.
- **Trigger and preconditions:** Student sets target GPA or overrides course grade.
- **In scope / out of scope:** Suggestions using course difficulty skewing (B) and subject historic performance (C).
- **Data/entities and classification:** Simulation grades, target GPA. Classified as **Confidential**.
- **Integrations/interfaces:** Local calculation engine (React) and Spring Boot REST API for persistent plans.
- **NFR targets and measurement:** Calculation latency < 100ms on client-side.
- **Use cases:** `UC-GPA-002`, `UC-GPA-003`.

---

### `FEAT-GPA-003` — Major Percentile Leaderboard

- **Business outcome and KPI:** Student motivation through anonymous competition.
- **Primary/secondary actors:** Student.
- **In scope / out of scope:** Percentile ranks within same major and intake year. Out-of-scope: names or personal identifiers shown.
- **Data/entities and classification:** GPA aggregate statistics. Classified as **Internal**.
- **Integrations/interfaces:** Spring Boot SQL query.
- **Permission/audit/privacy:** HIGH profile. Strict anonymization.

## Readiness Checklist

- [x] ID, owner, outcome, priority, release, and linked requirements are clear.
- [x] Complexity/risk domains are assessed to select quality audit samples.
- [x] Happy/alternate/error/recovery and edge cases have associated use cases.
- [x] NFRs use measurable targets, avoiding vague terms.
- [x] Design/API/data/UI/test trace links have an owner or additions plan.
