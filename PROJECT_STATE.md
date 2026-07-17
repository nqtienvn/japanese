---
artifact_id: DOC-PROJECT-STATE-MD
phase: "ROOT"
artifact_type: orchestration
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Trạng thái điều phối AI — {{PROJECT_NAME}}

| Trường | Giá trị |
| :--- | :--- |
| Engagement mode | GREENFIELD / BROWNFIELD / CHANGE |
| Current phase | `00` |
| Current gate | Not evaluated |
| Discovery coverage | 0 / applicable questions |
| Baseline approval | Pending |
| Security Profile | AUTO / STANDARD / HIGH / CRITICAL |
| Security gate | Not evaluated |
| Last verified | {{DATE}} |
| Next action | {{NEXT_ACTION}} |

## Phase dashboard

| Phase | Status | Gate | Evidence | Blocker/next action |
| :--- | :--- | :--- | :--- | :--- |
| 00 Governance | Not Started | — | — | — |
| 01 Planning | Not Started | — | — | — |
| 02 Requirements | Not Started | — | — | — |
| 03 Architecture & Design | Not Started | — | — | — |
| 04 Implementation | Not Started | — | — | — |
| 05 Development | Not Started | — | — | — |
| 06 Testing | Not Started | — | — | — |
| 07 Reports | Not Started | — | — | — |
| 08 Handover & References | Not Started | — | — | — |

Trạng thái hợp lệ: `Not Started`, `In Progress`, `Blocked`, `Gate Review`, `Passed`, `Reopened`.

## Evidence gần nhất

| Ngày | Loại | Lệnh/tài liệu | Kết quả | Liên kết yêu cầu |
| :--- | :--- | :--- | :--- | :--- |
| {{DATE}} | Audit / Build / Test / Review | {{EVIDENCE}} | {{RESULT}} | {{REQUIREMENT_IDS}} |

## Blocker, assistance và escalation

| ID | Trigger/mô tả | Evidence và phương án đã thử | Smallest human action/output | Owner/due | AI tiếp tục gì | Trạng thái |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| BLK/HUM-001 | {{TRIGGER_BLOCKER}} | {{EVIDENCE_ATTEMPTS}} | {{MIN_ACTION_OUTPUT}} | {{OWNER_DATE}} | {{CONTINUING_WORK}} | Open |

## Rủi ro tồn dư

| Risk ID | Mô tả | Mức | Biện pháp | Người chấp nhận |
| :--- | :--- | :--- | :--- | :--- |
| RISK-001 | {{RISK}} | Low / Medium / High / Critical | {{MITIGATION}} | {{OWNER}} |

---

## Active template-maintenance engagement — CR-SECURITY-REFERENCE-001

| Trường | Giá trị |
| :--- | :--- |
| Engagement mode | `CHANGE` |
| Current phase | `08 — Handover package` |
| Baseline approval | Approved by Client request on 2026-07-17 |
| Autonomy | `FULL-LOCAL`; human-exclusive triggers only |
| Security Profile | `CRITICAL` for reference assessment |
| Source evidence | `E:\mb_laos_be\security`; `E:\mb_laos_be\mb-security-starter` |
| Last verified | 2026-07-17 |
| Next action | Handover template; downstream project must run its own security adoption gate |

### Change evidence

| Ngày | Evidence | Kết quả | IDs |
| :--- | :--- | :--- | :--- |
| 2026-07-17 | Codebase graph index | Legacy: 373 nodes/829 edges; starter: 464 nodes/790 edges | NFR-SEC-REF-001 |
| 2026-07-17 | Source inventory | 23 legacy Java; 18 starter/template Java; không có automated tests | NFR-SEC-REF-001 |
| 2026-07-17 | `mvn -q test` tại legacy | Fail do internal parent/dependency không resolve | RISK-SEC-REF-011 |
| 2026-07-17 | `mvn -q test` tại starter | Fail do Lombok `log` và generic type compilation | RISK-SEC-REF-011 |
| 2026-07-17 | Client clarification | Java reference phải refactor được sang ngôn ngữ khác | NFR-SEC-PORT-001 / DEC-SEC-002 |
| 2026-07-17 | Source-target hash comparison | 44 files checked; 0 mismatch; 23 legacy + 18 starter/template Java | TC-TPL-SEC-001 |
| 2026-07-17 | Sanitized code/config scan | No weak PBE/JWT fallback/literal password/schema update/SQL logging/error-detail fallback; 5 known token-log hits quarantined | TC-TPL-SEC-002 / RISK-SEC-REF-003 |
| 2026-07-17 | Internal Markdown link scan | No broken internal Markdown links | TC-TPL-DOC-001 |
| 2026-07-17 | `validate_delivery.ps1` | Normal: `Errors=0`, `Valid=true`; strict intentionally fails reusable template placeholders/phase rows | TC-TPL-VAL-001 |
| 2026-07-17 | Template re-index | `E-template_BRD-AI_PROJECT_LIFECYCLE_TEMPLATE`: 946 nodes/914 edges; security assets excluded from graph indexing | NFR-SEC-REF-001 |

### Open risk/blocker

Không có assistance request. Known source findings được quarantine trong `assets/security-reference/SECURITY_REVIEW.md`; mỗi project phải xử lý tại adoption gate.
### P0-P3 template hardening evidence — 2026-07-18

| Evidence | Result | IDs |
| :--- | :--- | :--- |
| Front matter normalizer | 97 existing root/phase Markdown artifacts updated; example project uses concrete metadata | TC-TPL-FM-001 |
| Semantic linter | JSON result `Errors=0`, `Valid=true`; requirement parsing is table-row-only; template placeholders remain warnings | TC-TPL-SEM-001 |
| Contract validator | OpenAPI 3.1 and AsyncAPI 3.0 scaffold plus local component references: `Errors=0`, strict pass | TC-TPL-CONTRACT-001 |
| Readiness/gate controls | Gate evidence check rejects placeholder/empty evidence for a `Passed` phase; RACI High residual risk row has exactly one `A` | TC-TPL-GATE-001 / TC-TPL-RACI-001 |
| Readiness dashboard renderer | `render_readiness_dashboard.ps1` rendered 9 phase rows and distinguishes evidence-backed candidate from status-only state | TC-TPL-READINESS-001 |
| Generated document index | `DOCUMENT_INDEX.generated.md` generated from 111 root/phase/example front-matter artifacts with `-IncludeExampleProject` | DOC-INDEX-GENERATED |
| Normal delivery validator | `Errors=0`, `Valid=true`; warnings are expected for reusable template placeholders/sign-offs | TC-TPL-VAL-001 |

Template status remains reusable `Template`; strict delivery is intentionally not claimed until a downstream project replaces placeholders, executes tests/UAT/DR, and records approvals.
