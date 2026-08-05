---
artifact_id: DOC-PROJECT-STATE-MD
phase: Cross-phase
artifact_type: state
owner: "AI Delivery Vendor"
version: "1.0"
status: In Progress
ids: [OBJ-JNOTE-001, OBJ-JNOTE-002, OBJ-JNOTE-003, OBJ-JNOTE-004, RISK-JNOTE-014]
dependencies: [PROJECT_PROFILE.md, 01-Planning/DISCOVERY_LOG.md, 02-Requirements/TRACEABILITY_MATRIX.md]
last_verified: "2026-08-06"
---
# AI Orchestration State — Sổ tay học tiếng Nhật (`JNOTE`)

| Field | Value |
| :--- | :--- |
| Project mode | `GREENFIELD` |
| Autonomy mode | `FULL-LOCAL`; project configuration, commits, and the explicitly authorised GitHub push were performed. Deployment/publishing remain unapproved. |
| Security profile | `HIGH` — verified email/password accounts and private learning data. |
| Current gate | Gate 06 — local and configuration verification complete; authenticated acceptance/security/performance UAT pending. |
| Supabase project | `japanVocab` / `rgxhvskiutawhkeuylqx`; email Auth and database schema configured. Publishable client configuration exists only in ignored `.env.local`. |
| Next action | Run the accepted learner journey with real accounts, record two-account RLS and timed-Quiz evidence, then consider release/deployment approval separately. |

## Phase Dashboard

| Phase | Status | Gate | Evidence | Next action |
| :--- | :--- | :--- | :--- | :--- |
| 00 Governance | Complete | Gate 00 | Charter, SOW, RACI, security/privacy standard, risk record | Maintain controls. |
| 01 Planning | Complete | Gate 01 | Discovery closure, plan, risk register, delegated baseline decisions | Maintain assumptions. |
| 02 Requirements | Complete | Gate 02 | Approved BRD/SRS/use cases and updated traceability matrix | Trace UAT evidence. |
| 03 Architecture & Design | Complete | Gate 03 | React/Supabase architecture, data model, threat model | Review when deployment scope changes. |
| 04 Implementation | Complete | Gate 04 | React app, Supabase migrations, local environment setup | Address UAT defects only. |
| 05 Development | Complete | Gate 05 | Commits pushed through `global` to requested GitHub remote | No deployment was made. |
| 06 Testing | In Progress | Gate 06 | Build, unit tests, browser startup, Supabase schema/config verification | Complete real-account UAT and performance/security tests. |

## Evidence Ledger

| Date | Activity | Result | Linked IDs |
| :--- | :--- | :--- | :--- |
| 2026-08-06 | Discovery and baseline | Baseline approved under delegated authority `DEC-JNOTE-011`; ordinary decisions recorded. | `OBJ-JNOTE-001..004` |
| 2026-08-06 | Supabase Auth configuration | Email provider, new-user signup, and Confirm email were already enabled. Site URL set to `http://localhost:5173`; allowed redirect set to `http://localhost:5173/**`. | `FR-AUTH-001..003` |
| 2026-08-06 | Core schema migration | Four learning tables, four RLS policies, and three core Quiz functions were created and verified. | `FR-NOTE-*`, `FR-QUIZ-*`, `SEC-JNOTE-001` |
| 2026-08-06 | Safety migration | Account lifecycle, server-only Quiz answer write path, five safety functions, and daily purge schedule created and verified. | `SEC-JNOTE-003..004`, `FR-PROG-003..005`, `PRV-JNOTE-001` |
| 2026-08-06 | Local verification | `npm run build` passed; `npm test` passed 3/3; local `http://localhost:5173` shows the live Auth gate. | `NFR-REL-001`, `FR-STUDY-004` |
| 2026-08-06 | Git handover | Source and documentation commits pushed to `https://github.com/nqtienvn/japanese.git`, branch `global`. | All |

## Risks and Blockers

| ID | Description | Severity | Mitigation / next action | Status |
| :--- | :--- | :--- | :--- | :--- |
| `RISK-JNOTE-014` | No real-account UAT has yet exercised the entire learner journey, two-account RLS negative path, browser viewport/keyboard journey, timer expiry, or 1,000-term p95 target. | Medium | Execute and preserve UAT/security/performance evidence before a public release. | Open |
| `RISK-JNOTE-015` | Deployment is outside present approval; localhost redirect is the only allowed application URL. | Low | Set deployment-specific environment variables and redirect URL only after approval. | Open |
