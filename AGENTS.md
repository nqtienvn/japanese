---
artifact_id: DOC-AGENTS-MD
phase: "ROOT"
artifact_type: orchestration
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# AI Project Delivery System

These instructions apply to the entire repository.

## Mandatory Rules

1. Before starting any request related to idea definition, business analysis, design, modification, or codebase takeover, read `MASTER_PROMPT.md`, `.agents/skills/ai-project-delivery/SKILL.md`, and all references routed by the skill. Always read the security adoption workflow; for non-Java/Spring stacks, read the portability matrix. Use `USAGE_GUIDE.md` to select the appropriate operating procedure.
2. Identify the delivery mode as `GREENFIELD`, `BROWNFIELD`, or `CHANGE`, and record it in `PROJECT_STATE.md`.
3. For greenfield projects, do not start writing production code before discovery and requirements gates are passed, unless the user explicitly requests a prototype/spike.
4. For brownfield codebases, audit the evidence in the code, configuration, tests, and git state first; do not ask the user for details that can be extracted directly from the repository.
5. Use stable IDs for end-to-end traceability: `OBJ`, `STK`, `BR`, `FR`, `NFR`, `UC`, `US`, `ADR`, `DES`, `WI`, `TC`, `DEF`, `REL`, `RISK`, `DEC`.
6. Every completion statement must be backed by evidence. Preserve unrelated user edits and do not silently overwrite existing codebase files.
7. Once the user approves the discovery baseline, execute local, reversible changes within scope autonomously. Stop only at the explicit decision/action gates defined in the skill.
8. Maintain and update `PROJECT_STATE.md`, `01-Planning/DISCOVERY_LOG.md`, and `02-Requirements/TRACEABILITY_MATRIX.md` continuously throughout the development process.
9. Deliver and handover only when code, testing, operations guides, rollback plans, residual risks, and ownership boundaries are clearly resolved.
10. Read and comply with `00-Governance-Policy/DOCUMENT_QUALITY_STANDARD.md`, `SECURITY_AND_PRIVACY_STANDARD.md`, `HUMAN_AI_COLLABORATION_PROTOCOL.md`, and `STANDARDS_ALIGNMENT_MATRIX.md`. Do not declare ISO compliance or certification without an independent audit.
11. Every normative requirement must be atomic and use strict RFC 2119 semantics: `SHALL/SHALL NOT`, `SHOULD/SHOULD NOT`, `MAY`, with unique IDs and verifiable expected results.
12. Before gates 06/08, complete the document quality sample, Test RTM, and field-validation reports; blocking questions from developers/testers are treated as document quality findings.
13. Do not offload work to humans due to difficulty or duration; request assistance only when triggered by human-exclusive actions in the Human-AI Collaboration Protocol, and resume immediately upon resolution.
14. Security requirements must align with the selected Security Profile, threat model, and test evidence; do not use vague terms like "maximum security" as an acceptance criterion.
15. Every project must evaluate `00-Governance-Policy/BANK_SECURITY_REFERENCE_BASELINE.md` and the assets under `.agents/skills/ai-project-delivery/assets/security-reference/`. Spring projects copy-adapt relevant components, while other languages refactor these security responsibilities to native code with equivalent security tests.
16. Before prompting a human, the AI must explore code graphs, configurations, documentation, official references, builds, tests, and run safe experiments. Do not ask for technical decisions that can be resolved locally.
17. The security codebase snapshot is quarantined until adoption records, threat models, builds, and security verification pass; do not copy raw secrets or anti-patterns noted in `SECURITY_REVIEW.md`.

## Stakeholder Communication

- Ask questions in batches of 5–12 grouped by theme; do not dump hundreds of questions at once.
- Summarize findings after each batch, highlighting contradictions, assumptions, and open decisions.
- Focus on verifiable metrics: user counts, SLAs, budget, deadlines, system load, data retention, and precise acceptance criteria.
- Allow "unknown" responses, but assign an owner, resolution deadline, and assess the impact.
- Do not treat subjective preferences as requirements; confirm the authorized decider.
- Only ask humans for intent, authority, material trade-offs, access/credentials, manual actions, or sign-offs; the AI independently designs and implements technical details.

## Definition of Done

A requirement is only considered `Done` when it is traced from Requirement ➔ Design ➔ Work Item ➔ Code/Configuration ➔ Test/Evidence ➔ Release/Handover, or has an approved and documented exception.
18. Every project must run `lint_delivery.ps1`, `validate_contracts.ps1 -Strict`, and generate the Document Index from front matter metadata before gate review. Gates 02, 03, 06, and 08 cannot pass simply by updating `PROJECT_STATE.md`.
