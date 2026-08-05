---
artifact_id: DOC-01-PLANNING-RISK-REGISTER-MD
phase: "01-Planning"
artifact_type: planning
owner: "AI Delivery Vendor"
version: "1.0"
status: Approved
ids: [RISK-JNOTE-001, RISK-JNOTE-002, RISK-JNOTE-003, RISK-JNOTE-004, DEP-JNOTE-001]
dependencies: [01-Planning/DISCOVERY_LOG.md, PROJECT_PROFILE.md]
last_verified: "2026-08-06"
---
# Risk, Assumption, Issue, and Dependency Register — `JNOTE`

Probability/impact use 1–5; exposure is their product. `15–25` Critical, `10–14` High, `5–9` Medium, `1–4` Low.

| ID | Type | Description | P | I | Exposure | Trigger | Response/mitigation | Owner | Status |
| :--- | :--- | :--- | :---: | :---: | :---: | :--- | :--- | :--- | :--- |
| `RISK-JNOTE-001` | Risk | Misconfigured Supabase authorization could expose another learner's terms or attempts. | 3 | 5 | 15 | RLS/policy test permits cross-user access. | Default-deny RLS, owner-only policies, negative tests, no service-role key in client. | AI Security Reviewer | Open until verified |
| `RISK-JNOTE-002` | Risk | Client-clock or concurrent attempts could extend/duplicate a timed Quiz. | 3 | 4 | 12 | Two active attempts or late answers are accepted. | Server timestamps, one active attempt/user transaction, idempotent answer submission, concurrency tests. | AI Tech/QA Lead | Open until verified |
| `RISK-JNOTE-003` | Risk | Account deletion/export could expose or retain data unexpectedly. | 3 | 5 | 15 | Export lacks ownership check or purge/recovery path fails. | Reauthentication, RLS, expiring export, 30-day lifecycle, negative tests, runbook. | AI Security Reviewer | Open until verified |
| `RISK-JNOTE-004` | Risk | No credentials are available for real Supabase verification. | 4 | 3 | 12 | Build reaches integration test stage without safe environment reference. | Use `.env.example`, mocks/contracts, and request only secure references when the dependent test is ready. | Client / AI Delivery Vendor | Open |
| `RISK-JNOTE-005` | Risk | Scope grows into grammar, offline, or social functions before MVP acceptance. | 2 | 4 | 8 | New request falls outside charter. | Change-control impact analysis; preserve release-one exclusions. | AI Delivery Lead | Open |
| `RISK-JNOTE-006` | Risk | Quarantined Java reference anti-patterns are copied into the React/Supabase product. | 1 | 5 | 5 | Source/class similarity appears in target code. | Cross-language responsibility mapping only; no source copy; security verification matrix. | AI Security Reviewer | Open until Gate 06 |
| `DEP-JNOTE-001` | Dependency | Secure Supabase project configuration references. | 4 | 3 | 12 | Real integration verification is scheduled. | Client provisions URL/anon key outside chat; AI verifies configuration without recording values. | Client | Open |
| `ASM-JNOTE-001` | Assumption | The Client is the sole initial user and data owner. | — | — | — | Sharing/admin is requested. | Reopen tenant/permission model and requirements. | Client | Validated by Discovery |
