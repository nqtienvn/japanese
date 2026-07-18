---
artifact_id: DOC-04-IMPLEMENTATION-CHANGELOG-MD
phase: "04-Implementation"
artifact_type: implementation
owner: "AI Solution Architect"
version: "1.0"
status: Complete
ids: []
dependencies: []
last_verified: "2026-07-18"
---
# Changelog — UniGPA

All notable changes to the UniGPA project will be documented in this file.

## [Unreleased]

### Added

- `FR-GPA-001` to `FR-GPA-008`: Core functional requirements, use cases, and feature catalogs for GPA calculation, scraper, simulation, and major leaderboards.
- `DES-GPA-001` to `DES-GPA-004`: Software architecture context, container diagrams, and component models.
- `DATA-GPA-ERD-01`: Data model entity relationship diagram and data dictionary catalog.
- `API-GPA-AUTH-01` to `API-GPA-RANK-01`: Spring Boot backend API controllers contract specifications.
- `THR-GPA-SPOOF` to `THR-GPA-DOS`: STRIDE threat model register and privacy review guidelines.
- `MIG-GPA-001`: Flyway schema migration DDL setup scripts.

### Changed
- Aligned project security profile to **HIGH** for Decree 13/2023/ND-CP compliance.
- Configured **FULL-LOCAL** autonomy model.

### Security
- Locked database column-level encryption (AES-256) for PII fields.
- JWT stateless security validation for private endpoints.
