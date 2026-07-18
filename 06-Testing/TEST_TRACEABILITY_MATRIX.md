---
artifact_id: DOC-06-TESTING-TEST-TRACEABILITY-MATRIX-MD
phase: "06-Testing"
artifact_type: testing
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Test Traceability Matrix — {{PROJECT_NAME}} / REL-{{VERSION}}

| SRS/Requirement ID | Feature/Use Case | Risk/condition | Test Case ID | Build/environment | Latest result/evidence | Defect/Bug ID | Retest result | Release/acceptance |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| FR-XXX | FEAT/UC-XXX | TCOND/RISK-XXX | TC-XXX-001 | {{BUILD_ENV}} | Pass / `{{EVIDENCE}}` | DEF-XXX / — | {{RESULT}} | REL/UAT-XXX |

## Coverage controls

| Control | Count | Missing IDs | Owner/action |
| :--- | ---: | :--- | :--- |
| In-scope requirements | {{COUNT}} | — | — |
| Requirements with ≥1 test condition | {{COUNT}} | {{IDS}} | {{ACTION}} |
| Requirements with positive + negative cases | {{COUNT}} | {{IDS}} | {{ACTION}} |
| Requirements with latest executed evidence | {{COUNT}} | {{IDS}} | {{ACTION}} |
| Failed tests linked to defect | {{COUNT}} | {{IDS}} | {{ACTION}} |
| Closed defects with passing retest | {{COUNT}} | {{IDS}} | {{ACTION}} |

Do not mark a requirement as Verified/Accepted if the row is missing a Test Case ID or result/evidence. Failed tests must be linked to a defect ID or a documented triage decision.

---

## Template-maintenance verification — CR-SECURITY-REFERENCE-001

| SRS/Requirement ID | Feature/Use Case | Risk/condition | Test Case ID | Build/environment | Latest result/evidence | Defect/Bug ID | Retest result | Release/acceptance |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| BR-AUTO-001 | Evidence-first autonomy | Missing human trigger/evidence loop | TC-TPL-DOC-001 | Windows/PowerShell | Pass — internal Markdown link scan returned `NO_BROKEN_INTERNAL_MARKDOWN_LINKS` on 2026-07-17 | — | Pass | CR-SECURITY-REFERENCE-001 |
| NFR-SEC-REF-001 | Snapshot completeness | Missing/changed Java files | TC-TPL-SEC-001 | Local filesystem | Pass — 44 source/POM/template hashes checked; 0 mismatch; 23 legacy + 18 starter/template Java | — | Pass | CR-SECURITY-REFERENCE-001 |
| NFR-SEC-GATE-001 | Sanitized config | Raw secret/unsafe fallback copied | TC-TPL-SEC-002 | Validator + pattern scan | Pass — no weak PBE, JWT fallback, literal password, schema update, SQL logging or error-detail fallback in asset code/config; known token-log source findings remain quarantined and documented | — | Pass | CR-SECURITY-REFERENCE-001 |
| NFR-SEC-PORT-001 | Cross-language refactor docs | Java-only lock-in | TC-TPL-PORT-001 | Documentation review | Pass — portability matrix, SEC-BNK-031..033 and Gate 03/05/06 mapping present | — | Pass | CR-SECURITY-REFERENCE-001 |
| FR-VAL-001 | Delivery validator | Required artifact/false-positive regression | TC-TPL-VAL-001 | PowerShell/Windows | Pass — normal validator `Errors=0`, `Valid=true`; strict failure is expected for reusable placeholders and 0/9 passed phase rows | — | Pass | CR-SECURITY-REFERENCE-001 |
| FR-VAL-002 | Semantic row-only lint | Duplicate/orphan IDs, RTM/Test RTM, sign-off, RACI and gate evidence | TC-TPL-SEM-001 | PowerShell/Windows | Pass - linter returns JSON, ignores prose, and reports template duplicate/orphan findings as warnings | - | Pass | CR-SECURITY-REFERENCE-001 |
| FR-CONTRACT-001 | Contract scaffold | OpenAPI/AsyncAPI structure and local refs | TC-TPL-CONTRACT-001 | PowerShell/Windows | Pass - validate_contracts.ps1 -Strict returns Errors=0 | - | Pass | CR-SECURITY-REFERENCE-001 |
| FR-FM-001 | Machine-readable front matter | Missing owner/version/status/IDs/dependencies | TC-TPL-FM-001 | PowerShell/Windows | Pass - normalizer updated 97 phase/root Markdown artifacts | - | Pass | CR-SECURITY-REFERENCE-001 |
| FR-GATE-001 | Gate evidence | Status-only Gate 02/03/06/08 bypass | TC-TPL-GATE-001 | PowerShell/Windows | Pass - linter checks concrete evidence cell and gate headings independently of PROJECT_STATE.md | - | Pass | CR-SECURITY-REFERENCE-001 |
| SEC-RACI-001 | High residual risk acceptance | Two accountable owners | TC-TPL-RACI-001 | PowerShell/Windows | Pass - RACI row has exactly one A and Security/Privacy Owner is accountable | - | Pass | CR-SECURITY-REFERENCE-001 |
| NFR-READINESS-001 | Readiness dashboard | Gate coverage must reflect evidence, not status alone | TC-TPL-READINESS-001 | PowerShell/Windows | Pass - `render_readiness_dashboard.ps1` renders 9 phase rows and marks status-only Passed as blocked | - | Pass | CR-SECURITY-REFERENCE-001 |
| FR-TPL-005 | START skill invocation | Prompt A/B must name local skill and mandatory read order | TC-TPL-START-001 | Repository review | Pass - both startup blocks explicitly invoke `ai-project-delivery` and routed references | - | Pass | CR-SECURITY-REFERENCE-001 |
| FR-TPL-006 | Vietnamese startup prompts | Prompt A/B must preserve mode, skill, autonomy, security and gate rules | TC-TPL-START-002 | Repository review | Pass - Vietnamese GREENFIELD/BROWNFIELD blocks added below English prompts | - | Pass | CR-SECURITY-REFERENCE-001 |
