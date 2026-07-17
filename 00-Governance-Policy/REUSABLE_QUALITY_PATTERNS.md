---
artifact_id: GOV-REUSABLE-QUALITY-PATTERNS
phase: "00-Governance-Policy"
artifact_type: governance
owner: "Architecture Review Board"
version: "0.1"
status: Template
ids: [NFR-PATTERN-001, SEC-PATTERN-001, TC-PATTERN-001]
dependencies: [SECURITY_AND_PRIVACY_STANDARD.md, TEST_POLICY.md]
last_verified: "2026-07-18"
---
# Reusable NFR, security and test patterns

| Pattern ID | Reusable obligation | Minimum evidence |
| :--- | :--- | :--- |
| NFR-PATTERN-001 | API latency SHALL state percentile, workload, environment, and measurement window. | benchmark command, raw result, threshold decision |
| NFR-PATTERN-002 | Data retention SHALL state legal basis, duration, purge trigger, and restore impact. | retention test and owner approval |
| SEC-PATTERN-001 | Authorization SHALL be deny-by-default and tested with a negative cross-owner case. | permission matrix, negative test, audit event |
| SEC-PATTERN-002 | Secrets SHALL be injected by approved secret manager and never committed or logged. | secret scan and runtime configuration evidence |
| SEC-PATTERN-003 | Authentication/session controls SHALL map to the selected ASVS profile. | ASVS mapping and security verification matrix |
| TC-PATTERN-001 | Every accepted requirement SHALL link to a test case and execution evidence. | RTM + Test RTM + report link |
| TC-PATTERN-002 | Every migration SHALL have up/down or restore procedure and checksum evidence. | migration registry + restore exercise |

Tailor or mark `N/A` with rationale; never copy a pattern without checking applicability.
