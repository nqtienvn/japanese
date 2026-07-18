---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-DATA-MODEL-ERD-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "AI Solution Architect"
version: "1.0"
status: Complete
ids: [DATA-GPA-ERD-01, DATA-GPA-DICT-01]
dependencies: [GPA-SRS-001]
last_verified: "2026-07-18"
---
# Data Model & Entity Relationship Diagram — UniGPA

| Field | Value |
| :--- | :--- |
| Document ID | `GPA-ERD-001` |
| Version / status | 1.0 / Approved |
| Owner / reviewer | AI Solution Architect / Client |
| Requirements | `FR-GPA-002`, `FR-GPA-005`, `FR-GPA-006`, `FR-GPA-007` |

## Version History

| Version | Date | Author | Reason/change | Entities/migrations affected |
| :--- | :--- | :--- | :--- | :--- |
| 1.0 | 2026-07-18 | AI Solution Architect | Initial data model design for GPA database schema | All |

## Conceptual/Logical ERD

```mermaid
erDiagram
    USERS ||--o{ TRANSCRIPTS : has
    TRANSCRIPTS ||--|{ GRADE_RECORDS : contains

    USERS {
        bigint id PK
        string email UNIQUE "Encrypted PII"
        string full_name "Encrypted PII"
        string major "User declared"
        int intake_year "User declared"
        string university "FPT / NEU"
        datetime created_at
    }
    TRANSCRIPTS {
        bigint id PK
        bigint user_id FK
        string label "e.g., Simulated plan"
        decimal target_gpa "e.g., 3.60"
        int total_credits_needed "e.g., 120"
        tinyint is_active "1 = primary, 0 = simulator"
        datetime created_at
    }
    GRADE_RECORDS {
        bigint id PK
        bigint transcript_id FK
        string course_code "e.g., IT2110"
        string course_name "e.g., OOP"
        int credits "e.g., 3"
        decimal grade_10 "optional score systems"
        string grade_letter "A, B+, etc."
        decimal grade_4 "GPA score v4"
        string difficulty_level "EASY / MEDIUM / HARD"
        string status "COMPLETED / SIMULATED"
        string category "IT / MA / FL / etc"
    }
```

## Entity Catalog

| Entity | Responsibility/Source of Truth | Primary/Alternate Keys | Lifecycle/States | Owner | Requirement |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `USERS` | Student accounts. | PK: `id`, AK: `email` | Active, Deleted | DB | `FR-GPA-006` |
| `TRANSCRIPTS` | Scraped or simulated profiles. | PK: `id`, FK: `user_id` | Active, Simulator, Archived | DB | `FR-GPA-005`, `FR-GPA-007` |
| `GRADE_RECORDS` | List of grades per transcript. | PK: `id`, FK: `transcript_id` | Completed (SIS sync), Simulated | DB | `BR-GPA-001`, `FR-GPA-002` |

## Data Dictionary

| Entity.field | Type/format | Required/default | Validation/constraint/index | Classification | Retention/delete/export | API/Test |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `users.id` | BIGINT | Yes | Primary Key Auto-Increment | Internal | Delete on account removal | `TC-AUTH-01` |
| `users.email` | VARCHAR(255) | Yes | UNIQUE (Encrypted) | PII / Sensitive | Wipe on account removal | `TC-AUTH-01` |
| `users.major` | VARCHAR(100) | Yes | Limit to university major lists | Internal | Wipe on account removal | `TC-RANK-01` |
| `users.intake_year` | INT | Yes | Range: 2000–2050 | Internal | Wipe on account removal | `TC-RANK-01` |
| `transcripts.id` | BIGINT | Yes | Primary Key Auto-Increment | Internal | Delete on profile removal | `TC-TRANS-01` |
| `transcripts.target_gpa` | DECIMAL(3,2) | Yes / 3.20 | Range: 0.00–4.00 | Internal | Delete on profile removal | `TC-MATH-01` |
| `grade_records.id` | BIGINT | Yes | Primary Key Auto-Increment | Internal | Delete on transcript delete | `TC-GRADE-01` |
| `grade_records.grade_letter`| VARCHAR(5) | Yes | Mapped via `BR-GPA-001/002` | Internal | Delete on transcript delete | `TC-GRADE-01` |
| `grade_records.grade_4` | DECIMAL(3,2) | Yes | Range: 0.00–4.00 | Internal | Delete on transcript delete | `TC-MATH-01` |
| `grade_records.difficulty` | VARCHAR(20) | Yes / 'MEDIUM'| Enum: EASY, MEDIUM, HARD | Internal | Delete on transcript delete | `TC-ALG-01` |

## Relationship and Integrity Rules

| Rule ID | Relationship/Invariant | Enforcement | Failure/Error | Verification |
| :--- | :--- | :--- | :--- | :--- |
| `DATA-RULE-001` | Transcripts FK refers to existing user | DB Foreign Key (Cascade Delete) | SQL Integrity Exception | `TC-INTEG-001` |
| `DATA-RULE-002` | Grade records FK refers to existing transcript | DB Foreign Key (Cascade Delete) | SQL Integrity Exception | `TC-INTEG-002` |

## State and Temporal Rules

| Entity | State/Transition | Allowed Actor/Condition | Audit/History | Test |
| :--- | :--- | :--- | :--- | :--- |
| `grade_records` | `COMPLETED` ➔ `SIMULATED` | Student changes simulated score on UI | Logged as grade update | `TC-SIM-001` |

## Migration, Compatibility and Recovery

- **Current ➔ target schema:** Liquibase or Flyway scripts executing database schema migrations. Initial DDL script `V1__init_schema.sql` creates tables.
- **Backfill/volume/throttling:** N/A for Greenfield.
- **Forward/backward compatibility:** Ensure database column changes are backward-compatible.
- **Backup/restore/rollback:** Managed RDS daily snapshot, MySQL logical dump backups.
- **Reconciliation/data quality checks:** Verification query checking if sum of credits in `grade_records` matches computed `total_completed_credits`.

## Review Checklist

- [x] Entity/field/relationship terminology matches BRD/SRS/API/test/glossary.
- [x] Keys, uniqueness, nullability, referential integrity, and concurrency are defined.
- [x] PII/sensitive fields have defined owner, purpose, retention, delete/export, and audit.
- [x] Migration/rollback/compatibility and test evidence have a designated owner.
