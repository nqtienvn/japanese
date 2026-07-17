---
artifact_id: DOC-00-GOVERNANCE-POLICY-DOCUMENT-QUALITY-STANDARD-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Document Quality Standard & Acceptance Rules

## 1. Purpose and Scope

This standard applies to all baselines, releases, and handovers of the project. A document is considered complete only when it **reaches full coverage, is unambiguous, measurable/testable, consistent, traceable, and has passed field verification**. Files that exist but only contain headers, placeholders, examples, or unsupported assertions will be flagged as `Incomplete`.

## 2. Four Core Document Categories

| Category | Mandatory Artifacts | Minimum Content | Pass Criteria |
| :--- | :--- | :--- | :--- |
| **Business** | `02-Requirements/BRD.md`, `SRS.md`, `FEATURE_CATALOG.md`, `USE_CASE_SPECIFICATION.md` | As-is/to-be workflows; actors; feature list; business rules; BR/FR/NFRs; use case happy/alternate/error paths; acceptance | Every feature in the release has a unique ID, owner, associated use case/requirement, and testable acceptance; workflows have no undefined steps/branches. |
| **Architecture** | `03-Architecture-Design/SOFTWARE_ARCHITECTURE.md`, `DATA_MODEL_ERD.md`, `API_SPECIFICATION.md`, EDS/ADR | System context/containers/components; ERD and data dictionary; API/event contracts; state/sequence; security/NFR/operations | Every Must/Critical requirement has an architectural design link; API/data/state/failure/permission/compatibility are defined; reviews have zero open High/Critical findings. |
| **Testing** | `06-Testing/TEST_STRATEGY_AND_PLAN.md`, `TEST_CASE_TEMPLATE.md`, test inventory/evidence, and `TEST_REPORT.md` | Test cases mapped to requirements/features; happy, invalid, empty, permission, dependency failure, retry/concurrency; UAT and NFRs | Every in-scope requirement has a test ID/evidence or approved exception; blocking defects do not exceed thresholds; environment/build/results are clear. |
| **Operations** | `04-Implementation/ENVIRONMENT_SETUP.md`, `08-Document-References/DEPLOYMENT_GUIDE.md`, `USER_GUIDE.md`, `OPERATIONS_RUNBOOK.md` | Runtime setups; configuration; secret references; deploy/migrate/smoke/rollback; user persona guides; monitoring/backup/restore/troubleshooting | A new developer/ops engineer can execute a dry run without asking the authors; the Client can complete user journeys using the User Guide. |

Lack of any core category results in a `Fail` status. If an artifact is not applicable, a `N/A rationale` approved by the owner must be provided along with equivalent evidence.

## 3. Content Quality Rules

In this template, verifying "SMART for Documentation" consists of six mandatory attributes:

| Code | Attribute | Rule | Fail Example | Pass Example |
| :--- | :--- | :--- | :--- | :--- |
| `S` | Specific / Unambiguous | An independent reader has only one reasonable interpretation; actors, triggers, inputs, states, and outcomes are clear. | "The system processes orders quickly" | "Upon receiving a valid request, the API creates the order and returns `201 Created` in p95 ≤ 2 seconds at 100 requests/sec." |
| `M` | Measurable | Objectives have units, thresholds, percentiles/windows, environment contexts, and measurement methods. | "The system is stable" | "Monthly availability ≥ 99.9%, excluding approved maintenance windows; measured via the uptime monitor." |
| `A` | Achievable / Feasible | Possesses an owner, dependencies, constraints, and feasibility evidence; difficult design decisions have spikes/ADRs. | "Supports infinite users" | "Supports 5,000 concurrent sessions in a production-like environment according to test plan PERF-01." |
| `R` | Relevant / Consistent | Linked to objectives/business value; terminology, roles, states, and rules are consistent with the glossary and other artifacts. | "Customer", "Buyer", and "User" refer to the same role without definitions. | Only use `Customer`; forbidden aliases are recorded or defined in the glossary. |
| `T` | Testable | Can be turned into tests with preconditions, actions/inputs, and observable expected results. | "Beautiful and easy-to-use user interface" | "≥ 90% of test users complete checkout in ≤ 3 minutes without assistance on the defined viewports." |
| `TR` | Traceable | Possesses a unique ID and is traced from requirement ➔ design/UI/API/data ➔ work item/code ➔ test ➔ release/handover. | `REQ-01` only appears in the SRS. | `FR-PAY-001` appears in SRS, EDS/API, work items, code evidence, `TC-PAY-001`, and the RTM. |

A sampled requirement/feature must satisfy all six attributes. Do not average scores to hide a "Fail" criterion.

Vague terms like "maximum security", "absolute safety", "takes too long", "easy to replace", "no side effects", "best practice", and "clean architecture" SHALL NOT be used in requirements/acceptance criteria without a specific subject, scope, metric, verification method, and exception boundary.

### Atomicity and Singularity

- Each normative requirement must contain **exactly one obligation** that can be verified independently.
- Do not combine two independent behaviors using "and", "or", semicolons, or implicit lists. Split them into separate IDs and link dependencies if necessary.
- "And" is only permitted within an outcome that cannot be separated without losing its meaning; reviewers must document the rationale.
- Do not mix requirements, rationales, design solutions, and test procedures in the same normative sentence.
- The SRS describes **what** the system must do and its constraints; the SAD/ERD/API/EDS describes **how** it is designed. Do not move architectural/database/API design details into the SRS.

Fail Example:
> `FR-001`: The system SHALL create the account and send an email and automatically log in the user.

Pass Example:
> `FR-001`: Upon receiving valid registration data, the system SHALL create exactly one account in the `PendingVerification` state.
>
> `FR-002`: After `FR-001` completes successfully, the system SHALL send a verification email within 60 seconds.
>
> `FR-003`: The system SHALL NOT create a login session before the email is verified.

### Imperative Keywords

| Keyword | Meaning | Usage Rule |
| :--- | :--- | :--- |
| `SHALL` | Mandatory | Used for mandatory obligations with pass/fail acceptance criteria. |
| `SHALL NOT` | Mandatory prohibition | Used for forbidden behaviors, security/privacy/business invariants. |
| `SHOULD` | Recommendation | Must document the rationale and consequences of non-implementation; not release-blocking. |
| `SHOULD NOT` | Discouraged | Must document the accepted exceptions. |
| `MAY` | Permission/optional | Does not create an obligation; must state who has the option and the conditions. |

Do not use "will", "would", "expected", or "planned" as normative keywords. A `SHALL` sentence must have exactly one responsible subject and one obligation.

## 4. Requirements & Specification Writing Rules

1. Use standard verbs:
   - `shall` for mandatory requirements;
   - `should` for non-blocking targets;
   - avoid "can", "often", "reasonable", "fast", "friendly", "optimized", "complete", "secure" unless a measurable definition is provided.
2. Every BR/FR/NFR/UC/feature/API/test has a unique ID; do not reuse deprecated IDs.
3. Each functional requirement must record the actor, trigger, precondition, input validation, outcome/side effect, permission, error/recovery, and acceptance.
4. Each NFR must record the target, load/window/percentile, environment, measurement tool, and pass/fail threshold.
5. Each API must record the method/path, auth/permission, request/response schema, status/error codes, idempotency, rate limit, timeout/retry, compatibility, and linked requirement/test.
6. Each entity/field must record the key/constraint, relationship/cardinality, owner, classification, retention, and migration impact.
7. Use [GLOSSARY_AND_REFERENCES.md](../08-Document-References/GLOSSARY_AND_REFERENCES.md) as the terminology source. Role names, entities, states, and error codes must match across BRD/SRS/SAD/API/UI/test/runbook.
8. Diagrams must have accompanying text or supporting tables; do not leave critical logic only inside images.
9. Examples, placeholders, and instruction guides must be replaced or deleted before baseline/release sign-off.

## 4A. Structural Controls for BRD/SRS

Every BRD/SRS baseline must contain:

1. Document ID, owner, approver, version/status, and version history detailing dates, authors, reasons, and sections affected.
2. Scope, objectives, stakeholders, assumptions, dependencies, constraints, and references.
3. Glossary/acronyms containing canonical terms, definitions, forbidden aliases, and owners.
4. As-is/to-be workflows, feature catalog, and detailed use cases.
5. Functional, non-functional, data, security/privacy, and operational requirements.
6. Separated External Interfaces:
   - User Interface: personas, screens, navigation, input validation, errors, accessibility, design system references.
   - Hardware Interface: device, protocol, driver, capacity, failure behavior.
   - Software Interface: provider, consumer, API version, schema, auth, quota, SLA, fallback.
   - Communications Interface: protocol, port, TLS, certificate, network zone, timeout, retry.
7. Acceptance, traceability, open issues, and sign-off.

If an interface category is not applicable, write `N/A` and specify the rationale; do not delete the section header.

## 5. Verification of 2–3 Complex Features

Each requirements baseline and release candidate must be audited using [DOCUMENT_QUALITY_AUDIT.md](../06-Testing/DOCUMENT_QUALITY_AUDIT.md).

### Sample Selection to Avoid Cherry-Picking

1. Establish the population of features with `Complexity = High/Critical` or those that touch at least two domains: integration, payment, PII/security, state machines, concurrency, migration, scheduled/background processing.
2. If the population is ≤ 3, audit all of them.
3. If the population is > 3, randomly select 3 features and record the timestamp, seed, and selection method. The sample must contain at least one cross-system or data/security feature; if the random sample does not, replace the last feature with one from that domain and record the reason.
4. The primary author of a feature is not allowed to self-assess or self-sign-off.

### Pass/Fail Criteria Per Feature

- `Unambiguous`: Two independent reviewers describe the same actor/trigger/result/rules without conflict.
- `Measurable`: Every quantitative NFR/acceptance has a defined target and measurement method.
- `Feasible`: Dependencies, constraints, owners, and design responses are resolved; no open Critical unknowns.
- `Consistent`: Terminology, fields, states, permissions, and error codes match across BRD/SRS/SAD/API/UI/test.
- `Testable`: Testers can write happy, alternate, invalid, empty, permission, and failure cases without blocking clarifications.
- `Traceable`: The RTM goes both directions; no "done" links without concrete paths, symbols, tests, or results.

A single "Fail" on any criterion fails the feature audit, and the corresponding gate must be marked `Fail` or `Conditional Pass` with an owner, deadline, and approver.

## 6. Mandatory Field Verification

### 6.1 New Developer Readiness Test

Provide the SAD, ERD, API Specs, environment setup, and deployment guides to a developer/ops engineer who has not participated in this part of the project.

Minimum Tasks:
1. Identify the system boundaries, modules, and critical flows.
2. Set up the local environment from a clean machine/repository.
3. Build the code and run designated tests/smoke checks.
4. Call an API or complete a vertical slice demo using test data.
5. Describe deployment, rollback, and where to find logs/metrics.

Pass: Tasks are completed within the agreed timebox without asking the authors for blocking issues, and without using undocumented secrets. All questions raised must be recorded in the field-test report as document quality findings.

### 6.2 Tester Derivation Test

Provide the BRD/SRS/feature/use case definitions to a tester who did not write them. The tester must create a test inventory covering:
- happy path;
- alternate path;
- invalid formats and boundary values;
- empty, null, or missing inputs;
- permissions and roles;
- duplicates, double-submits, and idempotency;
- network/dependency timeouts and retries;
- concurrency, partial failures, and recovery;
- audit logs and data side effects;
- linked NFR/security cases.

Pass: No blocking clarifications with the BA; each test case has a linked requirement ID and an observable expected result. Clarifications must be logged as requirement findings, not resolved silently outside the documentation.

### 6.3 Technical Peer Review

Composed at minimum of the BA/Product Owner, Lead Developer/Architect, and Lead QA; Security/Ops participate when the feature impacts their domain. Reviewers must ask:
- What happens if the network drops or a dependency goes down mid-flow?
- What happens if there is a double-click/double-submit, retry, or duplicate event?
- What happens if the input is malformed, too long, empty, or malicious?
- What happens if the session/token expires or roles change mid-flow?
- What happens if two users update concurrently or a transaction partially fails?
- What happens if timezone, clock drift, timeouts, batching, scheduler, or callbacks arrive late?
- How do migrations, rollbacks, and compatibility with legacy clients/data work?
- Which logs, metrics, or audits prove the outcome and support troubleshooting?

Any open High/Critical findings without a mitigation plan or owner sign-off will block the gate.

## 7. Evidence and Sign-Off

| Evidence | Required Records |
| :--- | :--- |
| **Document Coverage** | Artifact path, owner, version/status, pending sections/N/A rationales |
| **Feature Quality Audit** | Feature IDs, selection method/seed, six criteria scores, findings/actions/reviewers |
| **Developer Field Test** | Participant role, clean baseline configuration, timebox, steps/results, blocking questions, evidence |
| **Tester Derivation** | Feature/use case IDs, derived test IDs/categories, clarification count/findings |
| **Peer Review** | Participants, roles, edge cases reviewed, findings, severity, decisions/actions |

Minimum sign-off: BA/Product verifies business intent, Tech Lead verifies architectural feasibility, QA Lead verifies testability/coverage, and the Client Product Owner signs off on baseline/acceptance. Security/Ops sign off when within their scope.

## 8. Phase Gate Enforcement

- **Gate 02:** BRD/SRS/Feature/Use Cases are complete and pass the SMART review at the requirement level.
- **Gate 03:** SAD/ERD/API Specs are complete, consistent, and traceable; design peer review passes.
- **Gate 06:** Test coverage matches requirements; feature audit and Tester Derivation Test pass.
- **Gate 08:** Deployment, user guides, and runbooks are complete; New Developer Readiness Test and dry-run handover pass.
