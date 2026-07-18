---
artifact_id: DOC-PROJECT-PROFILE-MD
phase: "ROOT"
artifact_type: orchestration
owner: "AI Delivery Vendor"
version: "0.1"
status: Complete
ids: []
dependencies: []
last_verified: "2026-07-18"
---
# Project Profile — GPA Calculator & Student Motivator (GPA)

> This is the single source of truth, updated when discovery confirms new facts.

| Field | Value |
| :--- | :--- |
| Project code | `GPA` |
| One-sentence description | A platform for calculating GPA, suggesting required grades, and motivating university students in Vietnam using curriculum/grade data crawled via a Chrome extension. |
| Project owner | Client |
| Product owner | Client |
| Project manager | AI Delivery Vendor |
| Tech lead | AI Delivery Vendor |
| QA lead | AI Delivery Vendor |
| Security/Privacy owner | AI Delivery Vendor |
| Repository | Local Workspace |
| Start date | 2026-07-18 |
| Target date | TBD |
| Delivery mode | GREENFIELD |
| Autonomy mode | FULL-LOCAL |
| Data classification | PII / Academic Records |
| Security profile | HIGH |
| Regulatory scope | Decree 13/2023/ND-CP on Personal Data Protection (Vietnam) |
| UI scope | Web (React JS) & Chrome Extension |
| Human-assistance trigger | Default: approved action, external/manual dependency, or 3 materially different failed approaches |
| Ordinary confirmation timeout | 5 minutes; use only the recommendation stated before the wait |
| Explicit approval timeout fallback | None; silence never implies consent |

## Problem Statement

- Target stakeholders/users: University students in Vietnam.
- Current problem: Students struggle to calculate their GPA accurately, track progress, or understand what grades they need in remaining courses to meet their target GPA, leading to a lack of academic goals and motivation.
- Measurable impact: Low academic performance, missed scholarship opportunities, delays in graduation, or dropouts.
- Desired outcome: An intuitive platform where students view their GPA, set targets, and receive algorithmic suggestions on what grade is needed for each upcoming course to achieve their goals.
- Why now: Academic competition is high, yet university grade systems in Vietnam remain fragmented, outdated, and lack planning tools.

## Project-Level Constraints

| ID | Constraint | Source | Strictness | Note/Remarks |
| :--- | :--- | :--- | :--- | :--- |
| CON-001 | Frontend: React JS | Client | Hard | Pre-existing frontend choice. |
| CON-002 | Backend: Spring Boot | Client | Hard | Pre-existing backend choice. |
| CON-003 | Scraper: Chrome Extension | Client | Hard | Required to crawl curriculums and grades from Vietnamese university portals. |
| CON-004 | Database: MySQL | Client | Hard | Pre-existing database choice. |
| CON-005 | Security: HIGH Profile | Aligned | Hard | Enforces encryption of PII data under Decree 13/2023/ND-CP. |

## Open Decisions

| ID | Question/Decision | Owner | Deadline | Impact of Delay |
| :--- | :--- | :--- | :--- | :--- |
| — | — | — | — | — |
