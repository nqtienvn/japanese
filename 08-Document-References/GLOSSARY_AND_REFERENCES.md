---
artifact_id: DOC-08-DOCUMENT-REFERENCES-GLOSSARY-AND-REFERENCES-MD
phase: "08-Document-References"
artifact_type: handover
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Glossary & References — {{PROJECT_NAME}}

## Glossary

| Term/acronym | Canonical definition | Owner/source | Avoid/confused with |
| :--- | :--- | :--- | :--- |
| {{TERM}} | {{DEFINITION}} | {{OWNER_SOURCE}} | {{NOTE}} |

## Business and regulatory references

| Ref ID | Title/source | Version/date | Applies to | Owner/verified |
| :--- | :--- | :--- | :--- | :--- |
| REF-001 | {{REFERENCE}} | {{VERSION_DATE}} | {{SCOPE}} | {{OWNER_DATE}} |

## Technical/vendor references

| Ref ID | Documentation/contract | Version | Used by design/component | Availability/notes |
| :--- | :--- | :--- | :--- | :--- |
| REF-TECH-001 | {{REFERENCE}} | {{VERSION}} | {{AREA}} | {{NOTE}} |

Do not put credentials, secret URLs with tokens, or real data into references.

Mandatory governance terminology:

- `Security Profile`: STANDARD, HIGH, or CRITICAL level deciding the verification/security gate based on risk; not equivalent to certification.
- `Human-assistance trigger`: evidence-based condition permitting the AI to request the smallest decision/access/manual/approval/sign-off action; "taking too long" is not an independent trigger.
- `Critical security risk`: risk/vulnerability blocking release until resolved according to the Security Standard.

# Canonical Terminology

Use [TERM_STANDARDIZATION.md](TERM_STANDARDIZATION.md) as the canonical Vietnamese-English vocabulary. A new recurring synonym requires an explicit glossary decision before it is used across artifacts.
