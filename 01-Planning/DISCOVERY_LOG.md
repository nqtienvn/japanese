---
artifact_id: DOC-01-PLANNING-DISCOVERY-LOG-MD
phase: "01-Planning"
artifact_type: planning
owner: "AI Business Analyst"
version: "0.2"
status: Draft
ids: [OBJ-JNOTE-001, OBJ-JNOTE-002, OBJ-JNOTE-003, DEC-JNOTE-001, DEC-JNOTE-002, DEC-JNOTE-003, DEC-JNOTE-004, DEC-JNOTE-005, RISK-JNOTE-001]
dependencies: [PROJECT_PROFILE.md, PROJECT_STATE.md]
last_verified: "2026-08-06"
---
# Stakeholder Discovery Log — Sổ tay học tiếng Nhật (`JNOTE`)

> This log supersedes the previous GPA-template engagement for the Client's new GREENFIELD initiative. The superseded content remains recoverable through Git history. No baseline, requirement, architecture, or production-code approval is implied by this intake record.

## Superseding Baseline and Delivery Record — 2026-08-06

This record supersedes the earlier pending-language elsewhere in this discovery record. The Client delegated ordinary Discovery/baseline decisions under `DEC-JNOTE-011`, then explicitly authorised full local delivery, Supabase configuration, Git commits, and push to the requested remote.

| Item | Resolved state | Evidence |
| :--- | :--- | :--- |
| Problem, scope, and requirements baseline | Approved/delegated for the vocabulary-only JNOTE release. | `DEC-JNOTE-006..011`, `02-Requirements/BRD.md`, `02-Requirements/SRS.md` |
| Supabase Auth | Email/password signup and Confirm email verified enabled; password reset UI uses Supabase recovery. | Supabase dashboard inspection, `src/App.tsx` |
| Private data and Quiz authority | Owner RLS, unique active Quiz, server-created deadline, server-only answer save, and server scoring are implemented. | `supabase/migrations/20260806_jnote.sql`, `20260806_02_jnote_lifecycle_and_quiz_guard.sql` |
| Export/deletion lifecycle | Owner CSV export; password reauthentication before request; immediate RLS hide; restore for 30 days; scheduled permanent Auth-user/data purge after expiry. | `src/App.tsx`, `20260806_02_jnote_lifecycle_and_quiz_guard.sql`, `20260806_03_purge_auth_accounts.sql` |
| Delivery boundary | Local app integration, database configuration, commits and push are complete. No deployment, paid service purchase, or public release was performed. | `PROJECT_STATE.md`, Git branch `global` |

### Delivery verification

- Supabase Site URL is `http://localhost:5173`; allowed redirect is `http://localhost:5173/**`.
- Database verification found five JNOTE tables, the core and safety functions, and one daily purge schedule.
- `npm run build` passed and `npm test` passed 3/3. The local browser displays the live JNOTE Auth gate.
- Remaining release evidence is authenticated learner UAT, two-account RLS negative testing, timer-expiry testing, responsive/keyboard checks, and the 1,000-term performance measurement. These are UAT/release-gate tasks, not blockers for the completed local implementation.

## Interview Status

| Field | Value |
| :--- | :--- |
| Interview owner | AI Business Analyst |
| Client decision owner | Client (User) |
| Selected discovery profiles | `Web CRUD` |
| Explicitly not selected at intake | `SaaS multi-tenant`, `Mobile`, `Regulated`, `AI/LLM`, `Integration-heavy` — no supporting evidence yet; reassess if Discovery changes scope. |
| Core coverage | Intake plus 8 Round 1 decisions recorded; all other applicable questions remain open or unassessed. |
| Product coverage | Initial Web CRUD and learning-workflow questions pending. |
| Engineering coverage | Initial React/Supabase constraint recorded; security/data/operations questions pending. |
| Baseline | Not approved |

## Profile Selection Record

| Profile | Status | Owner | Rationale |
| :--- | :--- | :--- | :--- |
| `Web CRUD` | Selected | AI Business Analyst | The requested notebook requires creating, reading, editing, marking, and deleting vocabulary records through a React web interface. |
| `SaaS multi-tenant` | Not selected | AI Business Analyst | The Client describes a personal notebook, not organizations sharing a platform. Reassess if multiple users or shared notebooks enter scope. |
| `Mobile` | Not selected | AI Business Analyst | Only React web is requested. Responsive requirements remain an open product question. |
| `Regulated` | Not selected | Client / AI Security Reviewer | No regulatory trigger has been provided. Personal account/data decisions are still pending. |
| `AI/LLM` | Not selected | AI Business Analyst | No AI-generated learning function is requested. |
| `Integration-heavy` | Not selected | AI Business Analyst | Supabase is a backend platform constraint, not a multi-party integration requirement at intake. |

## Answer Register

| Question ID | Short question | Answer / evidence | Status | Source | Confidence | Owner | Follow-up / deadline |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `Q-C001` | One-sentence idea | Build a personal Japanese-learning notebook that can later scale beyond vocabulary. | Confirmed | Client prompt | High | Client | Refine release-one statement in baseline. |
| `Q-C005` | Target user | The Client as a personal learner of Japanese. | Confirmed | Client prompt | High | Client | Confirm whether any future sharing/collaboration is excluded. |
| `Q-C013` | Problem | Learning vocabulary is difficult when flashcards, study practice, and test-taking are not one connected notebook workflow. | Confirmed | Client prompt | High | Client | Ask for current workaround and concrete failure story. |
| `Q-C049` | Desired outcome | Record word pairs, practise them in three modes, get immediate feedback during study, and get results after submitting a timed quiz. | Confirmed | Client prompt | High | Client | Define measurable acceptance and learning success. |
| `Q-C061` | Initial capabilities | Notebook-style two-column Japanese/Vietnamese input; mark words for Flashcard, Study, or Quiz; bidirectional flashcards; study of marked/all words with multiple choice, written, or mixed questions; timed quiz with submission-time results. | Confirmed | Client prompt | High | Client | Define exact selection, validation, scoring, and result rules. |
| `Q-C062` | Initial exclusion boundary | Release one is vocabulary-only. Grammar and listening/speaking are future scale-up directions. | Confirmed | Client answer 1: A | High | Client | Keep these domains out of all release-one requirements. |
| `Q-P025` | Primary interface | Web application; React is mandated by the Client. | Confirmed | Client prompt | High | Client | Decide responsive/mobile-browser target. |
| `Q-C099` | Technology constraint | Use React and Supabase. | Confirmed | Client prompt | High | Client | Architecture/library details are deferred until the approved baseline. |
| `Q-P007` | Cross-device progress | The notebook must sync across devices. | Confirmed | Client answer 2: A | High | Client | Define offline, conflict, and session-recovery behaviour. |
| `Q-E037` / `Q-E038` | Account and authentication | Use a Supabase account with email and password. | Confirmed | Client answer 3: A | High | Client | Define verification, password reset, session lifetime, and account deletion. |
| `Q-P037` / `Q-P044` | Vocabulary input | Create Japanese–Vietnamese entries manually, one row at a time. | Confirmed | Client answer 4: A | High | Client | Define field limits, duplicate behaviour, and edit/delete states. |
| `Q-P013` / `Q-P014` | Mode selection | A vocabulary entry can carry multiple independent mode labels: Flashcard, Study, and Quiz. | Confirmed | Client answer 5: A | High | Client | Define defaults and how mode labels are changed or removed. |
| `Q-P001` | Practice direction | Learning must support Japanese→Vietnamese and Vietnamese→Japanese directions. | Confirmed | Client answer 6: A | High | Client | Define direction choice per session and balance in mixed mode. |
| `Q-P085` / `Q-P095` | Written answer marking | In MVP, written answers are correct only after whitespace and case normalisation; synonym/fuzzy matching is excluded. | Confirmed | Client answer 7: A | High | Client | Define Japanese-script normalisation and reveal/retry action. |
| `Q-P017` | Expired quiz behaviour | A timed quiz automatically submits when time reaches zero. | Confirmed | Client answer 8: A | High | Client | Define network-loss and client-clock behaviour. |
| `Q-C069` / `Q-C097` | Deadline / budget | No deadline or budget was supplied. | Unknown | Client prompt omission | High | Client | Provide value or explicitly confirm no current constraint. |
| `Q-E044` / `Q-E049` | Security/data posture | The mandatory AUTO assessment resolves to `HIGH`: email/password account, private learning data, and a Supabase backend are in scope. Retention, export/deletion, and threats remain open. | Confirmed / partial | Client answers 2–3 + security standard | High | Client / AI Security Reviewer | Complete before requirements baseline. |
| `DQ-JNOTE-R2-001` | Progress history | Store per-word correct/wrong outcomes and the history of study sessions. | Confirmed | Client answer 1: A | High | Client | Define retention, display, and account-deletion behaviour. |
| `DQ-JNOTE-R2-002` | Flashcard outcome | After flipping, the learner self-rates each card as “remembered” or “needs review”; the outcome is stored. | Confirmed | Client answer 2: A | High | Client | Define available actions if no rating is chosen. |
| `DQ-JNOTE-R2-003` | Session selection | At session start, select all terms or terms bearing the relevant mode label, then select 10, 20, or all items. | Confirmed | Client answer 3: A | High | Client | Define random ordering, insufficient-item behaviour, and whether the selection is frozen. |
| `DQ-JNOTE-R2-004` | Multiple-choice shape | Every multiple-choice question presents four options, with distractors drawn from other notebook terms. | Confirmed | Client answer 4: A | High | Client | Define duplicate/insufficient-distractor behaviour. |
| `DQ-JNOTE-R2-005` | Study feedback | Study displays correct/incorrect feedback and the accepted answer immediately before moving to the next question. | Confirmed | Client answer 5: A | High | Client | Define skip/retry action. |
| `DQ-JNOTE-R2-006` | Mixed study mode | Mixed mode randomly targets approximately 50% multiple choice and 50% written questions. | Confirmed | Client answer 6: A | High | Client | Define rounding for odd session sizes. |
| `DQ-JNOTE-R2-007` | Quiz configuration | Before a Quiz, select its word source, question count, and duration; the initial defaults are 10 questions and 10 minutes. | Confirmed | Client answer 7: A | High | Client | Define allowed ranges and post-submission result detail. |
| `DQ-JNOTE-R3-001` | Quiz result | On submission, display score, per-question correct/incorrect status, and accepted answers; retain the attempt history. | Confirmed | Client: all recommended | High | Client | Define score calculation and later history display. |
| `DQ-JNOTE-R3-002` | Vocabulary fields | MVP vocabulary entry has exactly two required fields: Japanese and Vietnamese meaning. | Confirmed | Client: all recommended | High | Client | Define length/script validation. |
| `DQ-JNOTE-R3-003` | Duplicate policy | Reject an exact Japanese–Vietnamese pair and point to its existing record; allow the same Japanese value with a distinct Vietnamese meaning. | Confirmed | Client: all recommended | High | Client | Define whitespace/Unicode duplicate normalisation. |
| `DQ-JNOTE-R3-004` | Mode-label default | New vocabulary entries begin with no Flashcard, Study, or Quiz label; the learner enables each required label. | Confirmed | Client: all recommended | High | Client | Define whether unlabelled terms remain eligible for “all terms” sessions. |
| `DQ-JNOTE-R3-005` | Term lifecycle | Archive a term to remove it from the normal notebook and practice sources while retaining its history; allow the learner to restore it. | Confirmed | Client: all recommended | High | Client | Define archived-term visibility and historical reports. |
| `DQ-JNOTE-R3-006` | Vietnamese answer normalisation | Written Vietnamese answers require diacritics; only whitespace and case are normalised. | Confirmed | Client: all recommended | High | Client | Define Unicode normalisation and no-answer handling. |
| `DQ-JNOTE-R3-007` | Interrupted session | Preserve already completed Study answers. Persist an in-progress Quiz and continue its timer on return. | Confirmed | Client: all recommended | High | Client | Define device/session expiry and server-time authority. |
| `DQ-JNOTE-R3-008` | Account/data deletion | The learner may self-delete their account and all learning data from Settings. | Confirmed | Client: all recommended | High | Client | Define confirmation, grace period, execution evidence, retention, and export. |
| `DQ-JNOTE-R4-001` | Email verification | A learner must verify the registration email before accessing the notebook. | Confirmed | Client: all recommended | High | Client | Define expired/resent verification behaviour. |
| `DQ-JNOTE-R4-002` | Password reset | A learner resets a forgotten password through a verified email flow. | Confirmed | Client: all recommended | High | Client | Define reset-link lifetime and redirect safety. |
| `DQ-JNOTE-R4-003` | Session invalidation | The learner can sign out all devices; password change/reset invalidates other sessions. | Confirmed | Client: all recommended | High | Client | Map to Supabase-supported session controls and test evidence. |
| `DQ-JNOTE-R4-004` | Quiz timer authority | Quiz time uses server authority so client clock changes cannot extend the allowed duration. | Confirmed | Client: all recommended | High | Client | Define trusted timestamp source and offline handling. |
| `DQ-JNOTE-R4-005` | Concurrent Quiz | Each account has at most one active Quiz; a second device resumes that Quiz rather than creating another. | Confirmed | Client: all recommended | High | Client | Define locking and stale-session recovery. |
| `DQ-JNOTE-R4-006` | Account deletion lifecycle | Account deletion hides data immediately and permits restoration for 30 days before permanent deletion. | Confirmed | Client: all recommended | High | Client | Define reauthentication, scheduled purge, and backup retention. |
| `DQ-JNOTE-R4-007` | Data export | Before deletion, the learner can export all vocabulary and learning history as CSV. | Confirmed | Client: all recommended | High | Client | Define export generation, access control, and download expiry. |
| `DQ-JNOTE-R4-008` | Data region | Prefer a Supabase region near Vietnam, specifically Singapore, without asserting legal/regulatory compliance. | Confirmed | Client: all recommended | High | Client | Provisioning remains approval-only and has not occurred. |
| `DQ-JNOTE-R4-009` | Performance | At 1,000 terms per account over a normal connection, core screens, save, and next-question actions meet p95 ≤ 2 seconds. | Confirmed | Client: all recommended | High | Client | Define test environment/tool and page-load target. |
| `DQ-JNOTE-R4-010` | Cost / release constraint | No fixed deadline; do not purchase services, deploy, or publish without explicit separate approval. | Confirmed | Client: all recommended | High | Client | Local work remains authorized after baseline only. |
| `DQ-JNOTE-R5-001` | Interface language | The interface uses Vietnamese. Japanese appears as learning content, not an interface locale. | Delegated / confirmed | Client delegates recommendations | High | AI Delivery Vendor | Future localisation is out of release-one scope. |
| `DQ-JNOTE-R5-002` | Supported viewport | The responsive web app supports desktop and viewport widths from 360 px upward. | Delegated / confirmed | Client delegates recommendations | High | AI Delivery Vendor | Verify at 360, 768, and 1440 px. |
| `DQ-JNOTE-R5-003` | Notebook layout | The notebook is a white, table-like page with Japanese and Vietnamese columns, compact mode labels per row, and an inline new-entry row at the top. | Delegated / confirmed | Client delegates recommendations | High | AI Delivery Vendor | Preserve the two-column learning focus. |
| `DQ-JNOTE-R5-004` | Browse vocabulary | Search Japanese/Vietnamese text; filter by the three mode labels or archived state; sort newest/oldest. | Delegated / confirmed | Client delegates recommendations | High | AI Delivery Vendor | Filter/search values persist while paging. |
| `DQ-JNOTE-R5-005` | Notebook navigation | Show 50 rows per page with accessible next/previous controls. | Delegated / confirmed | Client delegates recommendations | High | AI Delivery Vendor | Use server-side pagination at scale. |
| `DQ-JNOTE-R5-006` | Home view | After login, show a concise dashboard: continue-last-session action, vocabulary total, and short progress summary. | Delegated / confirmed | Client delegates recommendations | High | AI Delivery Vendor | Do not introduce social/ranking features. |
| `DQ-JNOTE-R5-007` | Keyboard and visual accessibility | Support Tab/Enter navigation; Space/Enter flips a Flashcard; preserve browser zoom; use adequate contrast; do not rely only on colour for feedback. | Delegated / confirmed | Client delegates recommendations | High | AI Delivery Vendor | Verify keyboard journey and contrast during UI testing. |
| `DQ-JNOTE-R5-008` | Offline/error state | MVP does not provide offline sync. Preserve unsaved form text where possible, display a recoverable Vietnamese error, and provide retry. | Delegated / confirmed | Client delegates recommendations | High | AI Delivery Vendor | Define server as source of truth after reconnect. |
| `DQ-JNOTE-R5-009` | Notifications | Email, push, and scheduled learning reminders are out of release-one scope. | Delegated / confirmed | Client delegates recommendations | High | AI Delivery Vendor | Avoid third-party notification services. |
| `DQ-JNOTE-R5-010` | Initial acceptance journey | The Client must add ten terms, label terms, complete one Flashcard and Study session, complete and review one timed Quiz, search/archive/restore a term, and export/delete/restore the account without author assistance. | Delegated / confirmed | Client delegates recommendations | High | AI Delivery Vendor | Becomes baseline UAT journey. |
| `Q-C025` / `Q-C026` / `Q-C033` | Decision authority | The Client delegates Discovery completion and ordinary baseline decisions to the AI. The Client retains exclusive authority for protected approval-only actions. | Confirmed | Client message 2026-08-06 | High | Client | Record all assumptions and prevent deployment, billing, publishing, data mutation outside local scope, or risk acceptance. |

## Discovery Synthesis

### Intake — 2026-08-06

- **Confirmed facts:** React web + Supabase; one personal Japanese learner; two-column Japanese/Vietnamese notes; selectable Flashcard, Study, and Quiz modes; immediate study feedback; configurable timed quiz with results only after submission.
- **Working interpretation:** the asterisk/mark selects vocabulary for a learning mode; it is not yet known whether it is one reusable mark or three independent selections.
- **Key ambiguity:** “Study” and “Quiz” have different feedback timing, but question generation, answer normalization, retry rules, scoring, interruption handling, and selection rules are not defined.
- **Risk:** Releasing all future language-learning domains together would expand scope beyond a testable vocabulary MVP.
- **Next topic:** first-release boundary, account/data ownership, and the exact vocabulary-to-practice workflow.

### Round 1 — 2026-08-06 — MVP boundary, account, and feedback timing

- **Confirmed:** vocabulary-only release one; Supabase email/password accounts with cross-device sync; manual two-column entry; a term may have multiple learning-mode labels; two learning directions; exact written-answer matching after case/whitespace normalisation; automatic quiz submission at expiry.
- **Security decision:** `SECURITY_PROFILE = HIGH` is the correct AUTO classification. The Java reference is stack-mismatched and stays quarantined; future controls will be native React/Supabase implementations with equivalent verification.
- **Open:** mode label defaults and selection; flashcard interaction; distractor source; session size and ordering; progress/history; timing and score rules; interruptions; data rights/retention; deadline, budget, and measurable acceptance.
- **Next topic:** vocabulary data model and learning-session rules.

### Round 2 — 2026-08-06 — Learning-session configuration (partial)

- **Confirmed:** tracked correct/wrong outcomes and session history; Flashcard self-rating; all-or-mode-labelled source selection with 10/20/all size; four-option multiple choice; immediate Study feedback; mixed questions near 50/50; Quiz source/count/duration settings with initial 10-question/10-minute defaults.
- **Open:** the unaddressed post-Quiz result detail, word data lifecycle, data/privacy rights, response edge cases, measurable success, deadline, and cost guardrail.
- **Next topic:** vocabulary record rules and learner data lifecycle.

### Round 3 — 2026-08-06 — Vocabulary data and learner data lifecycle

- **Confirmed:** detailed saved Quiz results; only Japanese/Vietnamese entry columns; exact pair duplicate prevention; labels disabled by default; archive/restore; diacritic-sensitive Vietnamese written answers; persisted timed Quiz with a continuously running timer; self-service account-and-data deletion.
- **Open:** deletion grace/recovery/retention; data export; verification/reset/session lifetime; server-time and multi-device Quiz behavior; validation limits; measurable acceptance; availability/performance, deployment, deadline, and budget.
- **Risk:** automatic timer restoration and account deletion must be designed with server-side ownership checks and recovery/negative tests; these are Gate 02–03 constraints, not yet implementation choices.
- **Next topic:** identity, security, privacy, and measurable acceptance.

### Round 4 — 2026-08-06 — Identity, security, privacy, and delivery boundaries

- **Confirmed:** verified email, password reset, all-device sign-out and invalidation; server-authoritative time; one active Quiz per account; 30-day recoverable deletion; CSV export; Supabase Singapore preference; p95 ≤ 2 seconds at 1,000 terms/account; no fixed deadline and no paid/published/deployed service without approval.
- **Open:** the concrete UX journeys, responsive/accessibility targets, validation and search rules, offline/error states, security implementation details, audit/retention metrics, and baseline acceptance scenarios.
- **Security implication:** these are outcome constraints. The later design must use Supabase-native server-side authorization/RLS and must not copy the quarantined Java reference code.
- **Next topic:** notebook and learning experience.

### Discovery authority update — 2026-08-06

- **Confirmed:** the Client directs the AI to continue Discovery until it is sufficient and delegates ordinary decision authority.
- **Operating rule:** the AI will apply documented, reversible recommendations for remaining Discovery questions. It will still not treat silence as approval for deployment, paid services, external publishing, credentials, destructive real-data actions, security reduction, or risk acceptance.
- **Next topic:** autonomous applicability assessment and baseline synthesis.

### Round 5 — 2026-08-06 — Autonomous notebook experience decisions

- **Applied under `DEC-JNOTE-011`:** Vietnamese responsive interface (360 px+); the requested white two-column notebook page; mode labels per row; 50-row accessible pagination; search/filter/sort; concise dashboard; keyboard and visual accessibility; no offline sync but recoverable errors; no reminders; and a complete personal UAT journey.
- **Reasoning:** each choice preserves the explicitly requested personal vocabulary workflow, keeps the first release small, and avoids external notification/mobile/offline dependencies.

## Autonomous Applicability Assessment

The Client delegated remaining ordinary Discovery decisions to the AI. The following assessment records the answer/status for every question family; `N/A` means that the capability is deliberately outside release one, not silently omitted.

| Question family | Assessment | Baseline resolution |
| :--- | :--- | :--- |
| `Q-C001–024` Context and problem | Applicable | A new, Vietnam-oriented personal Japanese vocabulary notebook replaces disconnected notes/flashcard practices. Its first value is the ability to capture and practise ten terms in one sitting. No existing application/data migration exists. |
| `Q-C025–036` Stakeholders and authority | Applicable | Client owns product, data, acceptance, GitHub remote, and protected actions. AI Delivery Vendor owns all delivery roles under `FULL-LOCAL`. Review cadence is decision/baseline, vertical-slice, then handover. |
| `Q-C037–048` Users and context | Applicable | One Vietnamese-speaking adult learner uses modern desktop/mobile browsers at home/on the move. The interface supports keyboard and browser zoom; no vulnerable-user or staff/support persona is in scope. |
| `Q-C049–060` Outcomes and metrics | Applicable | Minimum success: add ten terms and complete each learning mode without assistance. Target: core actions p95 ≤ 2 s at 1,000 terms/account. Product metrics are vocabulary total, completed attempts, and per-term outcomes; no commercial KPI applies. |
| `Q-C061–072` Scope and priority | Applicable | Must: verified personal account, two-column notebook, labels, Flashcard, Study, timed Quiz, progress, archive, CSV export/deletion. Out: grammar, listening, speaking, AI, sharing, social/ranking, reminders, bulk import, offline sync, deployment. Priority follows the defined MVP journey. |
| `Q-C073–084` Process and resilience | Applicable | Capture → label → select session → answer/self-rate → store outcome → review. Active Quiz is server-timed, one/account, resumeable across devices, and auto-submits. Errors retry safely; archived terms leave routine practice; account deletion is recoverable for 30 days. |
| `Q-C085–096` Business model/rules | Assessed; mostly N/A | No payment, plans, taxes, refunds, organisational approvals, or fraud-prone transaction exists. Rules are owned by the learner/Client; no maker-checker workflow is needed. |
| `Q-C097–108` Constraints/dependencies | Applicable | React + Supabase is mandatory. Supabase project credentials are an owner-provisioned later dependency; only synthetic data is used. No fixed deadline or paid budget is authorised. Singapore is preferred if a project is later provisioned. |
| `Q-C109–120` Acceptance/handover | Applicable | Client accepts the documented UAT journey, no open Critical risk, traceable test evidence, and local run instructions. Git commits/pushes are authorised; application deployment/publishing remains separately approved. |
| `Q-P001–024` Journey/state/concurrency | Applicable | First value is manual entry. Term lifecycle: active ↔ archived; exact pair uniqueness; labels are independent. Attempts are completed/abandoned; Quiz is active/submitted/expired. Source selection freezes a session; all is idempotent at the server boundary. |
| `Q-P025–048` UX and data | Applicable | Vietnamese responsive web; table-like notebook; Japanese 1–200 and Vietnamese 1–500 Unicode code points after trim/NFKC normalisation; Vietnamese diacritics required for written answers; no attachments, free-text notes, kana fields, or imports. |
| `Q-P049–060` Integrations | Assessed; limited | Supabase Auth/Postgres is the only release-one provider. No public API, webhook, email service beyond Supabase Auth, external input, or partner data is allowed. Service failure presents retryable errors. |
| `Q-P061–072` Search/report/notification | Applicable | Search/filter/sort/pagination and private progress/attempt summaries are included. Email/push/SMS/webhook notifications, shared reports, and scheduled exports are N/A. CSV export is user-initiated and access-controlled. |
| `Q-P073–084` Administration/support | Assessed; mostly N/A | There is no admin, staff support, impersonation, tenant, role hierarchy, or feature-flag console. A user owns only their data. Authentication lifecycle is register, verify, reset, login, logout, delete/restore. |
| `Q-P085–096` Failure and edge cases | Applicable | Required/malformed/over-limit entries fail with recovery messaging; exact duplicate pair fails; no duplicate choices; insufficient distractors fall back to written questions; answers save individually; server timestamps decide expiry; client/network failures never create a second Quiz. |
| `Q-P097–108` Mobile/offline/locale | Applicable | Responsive browser only; no native/push/device APIs/offline sync. Locale is Vietnamese UI plus Japanese/Vietnamese content; timezone uses the account/browser display but server timestamps decide Quiz deadlines. |
| `Q-P109–120` AI/automation | N/A | No AI/LLM, generated content, model data, or automated high-impact decision is in scope. |
| `Q-E001–012` System architecture | Applicable | A React TypeScript single-page application and Supabase managed backend form a modular monolith. Frontend calls only Supabase-supported, policy-protected interfaces; no custom server/service mesh is introduced for MVP. |
| `Q-E013–036` Performance/reliability | Applicable | p95 ≤ 2 s at 1,000 terms/account; 50-row pages; request retries for safe reads/writes; server time for Quiz. No production availability/RTO/RPO promise exists until deployment is approved. |
| `Q-E037–048` Auth/security | Applicable | Verified email/password, trusted Supabase Auth, default-deny RLS, user-scoped rows, no browser-held privileged keys, secure recovery/session invalidation, input validation, no token/secret logging, and HIGH-profile negative tests are mandatory. |
| `Q-E049–060` Privacy/compliance | Applicable | Minimise data to email and learning records. Retain active data until delete request; hide immediately, restore ≤30 days, then purge. CSV export is owner-only. No GDPR/CCPA/Vietnam-law compliance claim is made; legal applicability is N/A for undeployed personal MVP and must be reassessed before public release. |
| `Q-E061–072` Data/migrations | Applicable | Supabase Postgres is the source of truth; migrations must be reversible where feasible and never run against unknown/shared data. Synthetic fixtures only. Query/data access is user-scoped by RLS. |
| `Q-E073–108` Engineering/release/operations | Applicable | Node/React/Supabase versions will be pinned; lint, types, unit/component/E2E/security checks and trace evidence are required. GitHub push is authorised. Paid CI, deployment, production monitoring, and publishing are N/A unless separately approved. |
| `Q-E109–120` Brownfield/handover | N/A for product; applicable to delivery | This is GREENFIELD with no application code. Handover must include setup, tests, configuration references, rollback/local-recovery notes, and no raw credentials. |

## Baseline Synthesis

| Baseline item | Approved/delegated resolution |
| :--- | :--- |
| Problem | Personal vocabulary learning is fragmented between notes, flashcards, practice, and tests; feedback and progress are disconnected. |
| Outcome | A private, responsive Vietnamese web notebook lets a learner capture Japanese/Vietnamese terms, choose learning modes, practise bidirectionally, and review progress/results. |
| Release-one scope | Verified email/password account; user-isolated vocabulary; inline two-column notebook; labels; Flashcard; Study; server-timed Quiz; progress/history; dashboard; search/filter/sort; archive/restore; CSV export; account deletion/30-day restoration; accessibility and error recovery. |
| Exclusions | Grammar/listening/speaking, AI, social/sharing, multiple tenants, bulk import, notifications, offline sync, native app, public API, paid services, and deployment/publishing. |
| Acceptance | The Client can complete the `DQ-JNOTE-R5-010` journey without assistance; core actions meet the stated p95 target in the defined local test profile; security/privacy tests have no open Critical finding. |
| Security/privacy | `HIGH`; minimal email and private learning data; Supabase Auth/Postgres/RLS design; no raw secrets committed; no legal/compliance claim; public release requires re-assessment. |
| Risks/dependencies | Supabase URL/anon key and service configuration must later be provisioned by the Client through secure configuration. This does not block local documentation/code that uses safe references, but blocks real integration verification/deployment. |

## Discovery Closure Recommendation

Discovery is sufficient for Gate 01 because all question families have been assessed, the remaining product choices have delegated/documented outcomes, scope and acceptance are measurable, risks/dependencies have owners, and no production code has been created. The next activity is to create atomic requirements and run Gate 00–02 evidence.

## Open Decisions and Questions

| ID | Content | Decision class | Owner | Needed by | Impact |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `DEC-JNOTE-001` | Confirm or replace the working name/code `JNOTE`. | Ordinary, reversible | Client | Baseline review | Low |
| `DEC-JNOTE-002` | Select authentication/account model and whether cross-device access is required. | Material product/security | Client | Requirements baseline | High |
| `DEC-JNOTE-003` | Confirm grammar and listening/speaking are out of scope for release one. | Material scope | Client | Requirements baseline | High |
| `DEC-JNOTE-004` | Supply deadline, budget/cost guardrail, or explicitly state none. | Material planning | Client | Project-plan baseline | Medium |
| `DEC-JNOTE-005` | Define acceptance and learning-success metrics. | Material acceptance | Client | Requirements baseline | Medium |
| `DEC-JNOTE-006` | Multi-mode labels, bidirectional prompts, exact-normalised written answers, and expiry auto-submit. | Material workflow | Client | Confirmed 2026-08-06 | High |
| `DEC-JNOTE-007` | Security Profile AUTO resolves to HIGH. | Security baseline | AI Security Reviewer | Confirmed 2026-08-06 | High |
| `DEC-JNOTE-008` | Adopt the Round 2 learning-session defaults and tracked learning-progress model. | Material workflow | Client | Confirmed 2026-08-06 | High |
| `DEC-JNOTE-009` | Adopt the Round 3 vocabulary-data, timed-session, and account-deletion boundaries. | Material workflow / privacy | Client | Confirmed 2026-08-06 | High |
| `DEC-JNOTE-010` | Adopt the Round 4 security, privacy, performance, regional, and cost/release boundaries. | Security / privacy / NFR | Client | Confirmed 2026-08-06 | High |
| `DEC-JNOTE-011` | Delegate Discovery completion and ordinary baseline decisions to AI. | Governance | Client | Confirmed 2026-08-06 | High |

## Baseline Approval

| Content | Client decision | Date | Note |
| :--- | :--- | :--- | :--- |
| Problem / outcome | Pending | — | Discovery is in progress. |
| Scope / release boundary | Pending | — | Grammar/listening/speaking boundary must be confirmed. |
| Requirements | Pending | — | No normative requirement has been approved. |
| Autonomy for local implementation | Pending | — | `FULL-LOCAL` applies only after approved baseline. |
| Security profile | Pending | — | Temporary HIGH posture, not an approval. |
