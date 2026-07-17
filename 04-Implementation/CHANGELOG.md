---
artifact_id: DOC-04-IMPLEMENTATION-CHANGELOG-MD
phase: "04-Implementation"
artifact_type: implementation
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Changelog — {{PROJECT_NAME}}

Ghi thay đổi đáng kể theo release. Liên kết requirement, ADR, work item và migration; không đưa secret/PII.

## [Unreleased]

### Added

- `FR-XXX` / `WI-XXX`: {{CHANGE}}
- `NFR-SEC-REF-001` / `WI-SEC-REF-001`: 41 Java security reference files, POM/template/metadata và sanitized configuration assets.
- `NFR-SEC-PORT-001` / `WI-SEC-PORT-001`: cross-language security portability/refactor matrix.
- `NFR-SEC-GATE-001` / `WI-SEC-GATE-001`: Bank Security Baseline, Adoption Record và Security Verification Matrix.

### Changed

- `ADR-XXX`: {{CHANGE_AND_REASON}}
- `DEC-AUTO-001`: default autonomy sau baseline chuyển sang `FULL-LOCAL` với evidence-first human-assistance boundary.
- `DES-VAL-001`: validator kiểm đầy đủ phase artifacts, security snapshot count và unsafe sanitized config.

### Fixed

- `DEF-XXX`: {{FIX}}

### Security

- {{SECURITY_CHANGE}}
- Raw Jasypt password, weak PBE default, JWT/DB fallback secret, schema auto-update và debug/error defaults không được copy vào sanitized assets.
- Source anti-pattern được ghi trong `assets/security-reference/SECURITY_REVIEW.md` và bị chặn bởi project-specific adoption gate.

### Migration / breaking changes

- {{MIGRATION_BREAKING_CHANGE}}

## [{{VERSION}}] — {{DATE}}

- Release report: `07-Reports/RELEASE_REPORT.md`
- Verification: `06-Testing/TEST_REPORT.md`
- Rollback: `MIGRATION_RELEASE_ROLLBACK.md`
