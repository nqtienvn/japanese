---
artifact_id: DOC-02-REQUIREMENTS-USE-CASE-SPECIFICATION-MD
phase: "02-Requirements"
artifact_type: requirements
owner: "AI Business Analyst"
version: "1.0"
status: Complete
ids: [UC-GPA-001, UC-GPA-002]
dependencies: [GPA-SRS-001]
last_verified: "2026-07-18"
---
# Use Case Specification — UC-GPA-001 / Scrape grades from portal

| Field | Value |
| :--- | :--- |
| Feature / requirements | `FEAT-GPA-001` / `FR-GPA-001`, `FR-GPA-002` |
| Primary actor / owner | Student / AI Business Analyst |
| Priority / release | Must / REL-1.0 |
| Version / status | 1.0 / Approved |

## 1. Goal and Business Outcome

- **Actor goal:** Easily import academic transcripts (completed and current semester courses, credits, grades) into the UniGPA database without manual copy-paste.
- **Business value/KPI:** Reduce transcript import time from 15 minutes (Excel copy) to < 1 minute, with 100% grade accuracy.
- **Trigger:** Student clicks "Scrape Grades" on the UniGPA Chrome Extension while logged into their university portal grade page.
- **Frequency/volume/context:** 1-5 times per semester per student.

## 2. Preconditions and Guarantees

- **Preconditions:** 
  - User has logged into UniGPA Web using Google/Local login.
  - User is logged into their FPT FAP portal or NEU portal on Chrome browser.
  - User has navigated to their transcript or curriculum display page.
- **Success guarantee/postcondition:** Grades are scraped, sent to the Spring Boot backend, mapped using university conversion rules, persisted to MySQL, and displayed on the Web UI.
- **Minimal/failure guarantee:** No data is stored if parsing fails. An explicit error message is shown to the user on the Extension popup.

## 3. Main Success Flow

| Step | Actor/System | Action/input | Rule/validation | Observable result/state | Trace ID |
| :---: | :--- | :--- | :--- | :--- | :--- |
| 1 | Student | Clicks "Scrape Grades" on Chrome Extension popup. | Check if user is logged into the backend. | Popup shows "Scraping in progress...". | `FR-GPA-001` |
| 2 | Extension | Scrapes DOM elements or intercepts portal REST API response. | Resilience validation (ensure credit numbers, course names, and grades exist). | Extracts raw grade array payload. | `FR-GPA-001` |
| 3 | Extension | Sends POST to Spring Boot backend API with payload. | JWT authentication validator. | HTTP `201 Created` returned. | `FR-GPA-002` |
| 4 | Backend | Validates grades and maps using FPT or NEU tables. | Mappings follow `BR-GPA-001` or `BR-GPA-002`. | Records persisted in MySQL under encrypted user profile. | `BR-GPA-001`, `NFR-SEC-002` |
| 5 | Web UI | Refreshes and fetches the new transcript data. | JWT authentication validator. | Displays circular GPA progress charts. | `FR-GPA-005` |

## 4. Alternate Flows

| Flow ID | Branch Condition | Steps/behavior | Final state/outcome | Notification/audit |
| :--- | :--- | :--- | :--- | :--- |
| UC-001-A1 | API intercept fails | If API interception doesn't capture JSON within 3 seconds, extension falls back to HTML DOM table parser. | Scraping finishes successfully. | Scraper log: "JSON Intercept failed, fallback to DOM Parser". |

## 5. Exception and Recovery Flows

| Flow ID | Failure/Edge Case | Required response/error | Retry/idempotency/recovery | Final state | Owner Alerted |
| :--- | :--- | :--- | :--- | :--- | :--- |
| UC-001-E1 | Portal layout changed / Parsing failed | Show: "Error: University portal layout has changed. Please update extension." | Abort transaction. No database write. | Web remains in past synced state. | Admin logs error. |
| UC-001-E2 | Network/backend offline | Show: "Error: Backend server offline. Please try again later." | Retry request up to 3 times. | No database write. | User alerted in popup. |

## 6. Data and Permission Rules

| Data/Operation | Source/validation | Read/write permission | Classification | Audit/retention |
| :--- | :--- | :--- | :--- | :--- |
| Transcript Payload Write | Sent from Extension to Backend. Credits and grades validated. | Logged-in User (ACT-GPA-001). | Confidential / PII | Logged as "User X updated transcript". Retained until account deleted. |

## 7. NFR and Service Behavior

| NFR ID | Target | Load/window/environment | Measurement/pass-fail |
| :--- | :--- | :--- | :--- |
| `NFR-PERF-001` | Server processing time ≤ 1.0s. | 100 concurrent requests. | Server logs / JMeter metric. |

## 8. Acceptance Criteria

```gherkin
Scenario: Successful FPT FAP transcript scrape
  Given student is logged in to UniGPA Web and FPT portal
  When student clicks "Scrape Grades" on FPT grade portal
  Then the Chrome extension extracts 15 subjects
  And Spring Boot saves them with correct Scale 4 GPA values
  And Web dashboard updates cumulative GPA to 3.4
```

## 9. Traceability

| UI/UX | ADR/Design | API/Data | Work item/code | Test cases | Release/Handover |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `UI-REQ-002` | TBD | `DATA-GPA-002` | TBD | TBD | TBD |
