---
artifact_id: DOC-03-ARCHITECTURE-DESIGN-THREAT-MODEL-MD
phase: "03-Architecture-Design"
artifact_type: design
owner: "AI Security Reviewer"
version: "1.0"
status: Approved
ids: [RISK-JNOTE-001, RISK-JNOTE-002, RISK-JNOTE-003, SEC-JNOTE-001, SEC-JNOTE-002, SEC-JNOTE-003, SEC-JNOTE-004]
dependencies: [02-Requirements/SRS.md, 01-Planning/RISK_REGISTER.md]
last_verified: "2026-08-06"
---
# Threat Model — JNOTE (`HIGH`)

| Asset/threat | Trust boundary/abuse | Control | Verification |
| :--- | :--- | :--- | :--- |
| Private terms/history | Attacker alters `user_id` or queries another owner | Default-deny RLS and owner checks | Cross-user read/write negative tests (`SEC-JNOTE-001`) |
| Auth session | Unverified/stale session accesses data/deletion | Auth guard, verified account, recent reauthentication before deletion | Unverified/stale-session tests |
| Quiz integrity | Browser clock/replay/concurrent device extends attempt | Server `now()`, one-active-attempt index/RPC, immutable submitted state | Clock/late/concurrency tests (`SEC-JNOTE-003`) |
| Export | Export request leaks another owner data | Owner RLS and server-side scoped export | Two-owner export negative test |
| Secrets | Service-role or real key committed/logged | Anon key only in client environment; scan/redaction | Secret/log scan (`SEC-JNOTE-002`) |
| Account lifecycle | Accidental/destructive delete or premature purge | Reauthentication, soft-delete state, 30-day server job | Delete/restore/purge contract tests (`SEC-JNOTE-004`) |

The bank Java reference is `N/A — stack mismatch` as code. Its security outcomes are adapted through Supabase RLS, native session/configuration validation, and negative tests. No snapshot source or secret is copied.
