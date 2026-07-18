---
artifact_id: DOC-00-GOVERNANCE-POLICY-CR-SECURITY-REFERENCE-001-MD
phase: "00-Governance-Policy"
artifact_type: governance
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Change Request — CR-SECURITY-REFERENCE-001

| Field | Value |
| :--- | :--- |
| Requester / date | Client / 2026-07-17 |
| Type | Governance / Autonomy / Security / Technical |
| Priority | Critical |
| Status | Implemented — downstream project adoption remains conditional |

## Approved change

1. Bring code from `E:\mb_laos_be\security` and `E:\mb_laos_be\mb-security-starter` into the AI Project Delivery template as an internal security reference.
2. Force the AI to leverage evidence and execute to the maximum extent autonomously; only request human assistance for intent/material decisions/access/manual actions/approvals/sign-offs.
3. Allow Java/Spring projects to copy-adapt suitable components.
4. Allow other languages to refactor security responsibilities/controls to native implementations with equivalent tests.

## Claim and safety boundary

- The two source directories are not modified.
- Raw committed secrets and unsafe default configs must not be copied into the template.
- The snapshot maintains a `QUARANTINED_REFERENCE` state until the project-specific adoption gate is passed.
- The Client has authorized the use of the code in the internal template; publishing/redistribution rights are not implied.

## Impact analysis

| Domain | Impact | Risk | Artifact |
| :--- | :--- | :---: | :--- |
| Governance/autonomy | Default `FULL-LOCAL` after baseline; evidence-first questions | Medium | Master Prompt, Skill, Human–AI Protocol |
| Security | Add bank reference baseline, adoption gate, and known-finding blocklist | High | Security Standard, Baseline, Security Review |
| Architecture | Add per-component adoption/cross-language mapping | Medium | Security Adoption Record, portability matrix |
| Implementation | Copy 41 Java files, POM/template/metadata; sanitize config | High | Skill assets |
| Testing | Add mandatory negative/equivalence matrix and validator checks | High | Security Verification Matrix, validator |
| Handover | Add security reference index/provenance | Medium | Phase 08 index/docs |

## Decisions

| Decision ID | Decision | Decider/source | Date |
| :--- | :--- | :--- | :--- |
| `DEC-AUTO-001` | AI executes autonomously to the maximum extent; humans only participate in human-exclusive triggers | Client request | 2026-07-17 |
| `DEC-SEC-001` | The two Java codebases are mandatory security implementation references to evaluate | Client request | 2026-07-17 |
| `DEC-SEC-002` | Non-Java stacks refactor to native code according to security contract | Client clarification | 2026-07-17 |
| `DEC-SEC-003` | Do not copy raw secrets/unsafe defaults; keep sources outside template intact | Security policy | 2026-07-17 |
