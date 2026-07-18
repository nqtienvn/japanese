---
artifact_id: DOC-04-IMPLEMENTATION-MIGRATION-RELEASE-ROLLBACK-MD
phase: "04-Implementation"
artifact_type: implementation
owner: "AI Solution Architect"
version: "1.0"
status: Complete
ids: []
dependencies: [VS-GPA-002, VS-GPA-005]
last_verified: "2026-07-18"
---
# Migration, Release & Rollback Plan — REL-1.0

## Change Summary

| Area | Change | Compatibility risk | Owner |
| :--- | :--- | :--- | :--- |
| Database | Initial MySQL schema migrations for tables `users`, `transcripts`, and `grade_records`. | Low (New installation, no existing data to migrate) | Dev Lead |
| Backend | Spring Boot v1.0 REST API deploy. | Low (New services) | Tech Lead |
| Frontend | Vite React JS connected to Spring Boot endpoint (pointing to `http://localhost:8080/api/v1`). | Low (Updates mock local data to active APIs) | Dev Lead |
| Extension | Chrome Extension v1.0 unpacked zip distribution. | Low (Local load) | Dev Lead |

## Preconditions

- [x] Backup/snapshot/restore path verified.
- [x] Artifact/version/config/secret references are ready.
- [x] Migration forward/backward compatibility reviewed.
- [x] Monitoring, smoke tests, on-call support and communication are ready.
- [x] Client/production approval received.

## Migration Steps

| Step | Command/action | Expected | Verify | Duration/owner |
| :--- | :--- | :--- | :--- | :--- |
| 1 | Execute Flyway migrations: `mvn flyway:migrate` | Database tables created successfully | Table schema structures match `GPA-ERD-001` | 5 mins / Dev Lead |
| 2 | Start Spring Boot API: `mvn spring-boot:run` | Server starts successfully and connects to MySQL | REST API `/actuator/health` returns status `UP` | 5 mins / Tech Lead |

## Release Strategy

- **Strategy:** Manual Rolling Deployment.
- **Maintenance window:** N/A (Dev/Testing local deployment).
- **Traffic/rollout increments:** 100% immediate swap.
- **Communication:** Internal developers/QA.

## Smoke and Observability

| Check | Expected/threshold | Evidence | Owner |
| :--- | :--- | :--- | :--- |
| Health & critical journeys | Google Login works, SIS Scraper imports grades successfully, suggests grades | React browser console shows zero API HTTP errors | QA Lead |
| API Error Rates | 5xx errors = 0 | Server stdout console logs | Ops Lead |

## Rollback Triggers

| Trigger | Threshold/window | Decision Owner | Action |
| :--- | :--- | :--- | :--- |
| High API failure rate | > 5% HTTP 5xx errors on initial launch | Tech Lead | Revert deployment / Roll back Flyway migrations |
| Scraper parsing crash | Scraper fails to parse mock NEU/FPT portals | Tech Lead | Roll back extension to mock simulator mode |

## Rollback Steps

1. Stop/pause rollout and preserve evidence (JVM stack traces, container logs).
2. Revert backend server deployment to mock sandbox profile: `spring.profiles.active=mock`.
3. Drop database schemas if data corruption occurred: run `V1.0__rollback.sql` DDL drop script.
4. Verify React FE falls back to localStorage mock state if API connection is severed.
5. Notify stakeholders.

## Post-release

- [x] RTM/release report/changelog updated.
- [x] Temporary flags/jobs/access cleaned or assigned expiry.
- [x] Data reconciliation completed.
- [x] Residual risk/incident/lessons recorded.
