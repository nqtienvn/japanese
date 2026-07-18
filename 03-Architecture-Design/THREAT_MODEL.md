---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-THREAT-MODEL-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "AI Security Architect"
version: "1.0"
status: Complete
ids: [THR-GPA-SPOOF, THR-GPA-TAMP, THR-GPA-INFO, THR-GPA-DOS]
dependencies: [GPA-SRS-001]
last_verified: "2026-07-18"
---
# Threat Model — UniGPA

| Field | Value |
| :--- | :--- |
| Security Profile | HIGH |
| System/release scope | MVP 1.0 |
| Method/references | STRIDE + OWASP Top 10 + Decree 13/2023/ND-CP compliance |
| Risk scale/appetite | STRIDE Likelihood/Impact Matrix / Low Risk Appetite |
| Owner/review date | AI Security Architect / 2026-07-18 |

## Scope and Assets

| Asset | Value/sensitivity | Owner | Worst impact |
| :--- | :--- | :--- | :--- |
| Student User Profile | PII | Student | Privacy violation / account takeover |
| Student Academic Transcript | Confidential PII | Student | Identity theft, leaked grades |
| Leaderboard Aggregates | Internal | Platform | Reputation loss if single user grades leaked |

## Trust Boundaries and Data Flow

| Flow | Source ➔ destination | Data | Auth/encryption | Boundary |
| :--- | :--- | :--- | :--- | :--- |
| `DF-GPA-001` | Extension ➔ Backend REST API | Standardized Grades JSON | HTTPS TLS 1.3 / JWT auth | Public Network to Cloud Server |
| `DF-GPA-002` | React FE ➔ Backend REST API | Simulation Actions | HTTPS TLS 1.3 / JWT auth | Public Network to Cloud Server |
| `DF-GPA-003` | Backend API ➔ MySQL DB | Persistent grades & profiles | JDBC SSL / AES-256 at rest | Cloud VPC to Database Subnet |

## Threat Register

| Threat ID | STRIDE/abuse case | Asset/flow | Likelihood | Impact | Control | Verification | Residual risk/owner |
| :--- | :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| `THR-GPA-SPOOF` | Spoofing: Attacker acts as user to sync fake grades | `DF-GPA-001` | Medium | High | Google OAuth JWT verification on all secure routes. | `TC-SEC-AUTHZ-001` | Low / Security Lead |
| `THR-GPA-TAMP` | Tampering: User alters scraped JSON to boost GPA | `DF-GPA-001` | High | Medium | Chrome Extension signs payload client-side; backend validates version signature. | `TC-SEC-TAMP-001` | Low / Dev Lead |
| `THR-GPA-INFO` | Info Disclosure: Leaking real names on Leaderboard | Leaderboard | Low | High | Leaderboard query only returns anonymous rankings. Real names stripped. | `TC-SEC-INFO-001` | Low / QA Lead |
| `THR-GPA-DOS` | DoS: Spammed API uploads crash database | `DF-GPA-001` | Medium | Medium | Rate limiter (10 syncs/min per user) enforced on backend. | `TC-SEC-DOS-001` | Low / Ops Lead |

## Privacy Review

- **Purpose/minimization:** Transcripts are only collected to calculate GPA, display roadmaps, and rank anonymously. No background credentials or external portals logged.
- **Regulatory applicability and legal basis:** Complies with **Decree 13/2023/ND-CP** (Vietnam PDPA). Users must check consent box during signup to authorize transcript crawling and storage.
- **Retention/delete/export:** Users can export their transcripts as JSON or permanently delete their account. Account deletion triggers complete database Cascade Delete of all linked records.
- **Logging/audit/redaction:** All auth failures and syncs are logged. Raw JWT tokens, PII emails, or grade values are stripped from server logs.

## Security Profile Verification Plan

| Control/test | Apply / Tailor / N/A | Evidence target | Owner | Due |
| :--- | :--- | :--- | :--- | :--- |
| SAST / secret scan / dependency-SCA | Apply | Run git-secrets scan and OWASP Dependency-Check | Dev Lead | Gate 06 |
| DAST / API / container / config scan | Apply | Run OWASP ZAP scan on Spring Boot APIs | QA Lead | Gate 06 |
| Authorization / abuse / recovery tests | Apply | Negative tests verifying cross-user transcript access rejection | QA Lead | Gate 06 |
| Independent review / penetration test | Tailor | Conduct peer-review audit on JWT signature parsing | Tech Lead | Gate 06 |

## Sign-Off

| Reviewer | Decision | Date | Conditions |
| :--- | :--- | :--- | :--- |
| Security/Privacy Owner | Approved | 2026-07-18 | High security profile controls mapped |
