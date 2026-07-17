---
artifact_id: DOC-02-REQUIREMENTS-REQUIREMENTS-REVIEW-MD
phase: "02-Requirements"
artifact_type: requirements
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Requirements Review & Sign-Off

## Quality Checklist

- [ ] Each requirement is necessary, unambiguous, feasible, testable, and traceable.
- [ ] Each requirement is atomic: one subject, one obligation; conjunctions are split or have documented rationales.
- [ ] `SHALL`, `SHOULD`, and `MAY` use correct semantics; 'will' is not used to denote obligations.
- [ ] No qualitative terms such as fast, beautiful, smooth, friendly, or optimized are used without metrics and measurement contexts.
- [ ] Vague terms like "maximum security", "absolute safety", "takes too long", "easy to replace", or "no side effects" are not used without measurable boundaries.
- [ ] Document version history, glossary, and the four categories of external interfaces are complete or have documented N/A rationales.
- [ ] Solution details are not arbitrarily mixed with requirements; technical constraints have recorded sources/rationales.
- [ ] Actors, triggers, inputs/outputs, business rules, and state transitions are clear.
- [ ] Happy, alternate, error, retry, cancellation, and reversal paths are addressed.
- [ ] Permissions, privacy, audits, data retention, and abuse cases are addressed.
- [ ] Security Profile, data classification, regulatory applicability, and threats/sources are clear; no compliance/certification claims are made without evidence.
- [ ] The SRS only contains obligations/constraints; architecture/database/API/UI implementations reside in Phase 03 artifacts and are traced by IDs.
- [ ] NFRs have targets, percentiles/timeframes/environments, and measurement methods.
- [ ] Priority, release boundaries, out-of-scope definitions, and dependencies are clear.
- [ ] Mismatches with discovery or current code have been resolved and documented.
- [ ] Cross-artifact audits verify terminology and requirement IDs in UI, SAD, API, data schemas, and test cases.

## Review Findings

| Finding ID | Severity | Requirement | Finding | Action | Owner | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| RF-001 | High | FR-XXX | {{FINDING}} | {{ACTION}} | {{OWNER}} | Open |

## Sign-Off

| Role | Decision | Date | Conditions |
| :--- | :--- | :--- | :--- |
| Client Product Owner | Pending / Approved / Rejected | {{DATE}} | {{CONDITIONS}} |
| Vendor BA/Delivery Lead | Pending / Approved / Rejected | {{DATE}} | {{CONDITIONS}} |
| Tech/QA/Security reviewers | Pending / Approved / Rejected | {{DATE}} | {{CONDITIONS}} |
