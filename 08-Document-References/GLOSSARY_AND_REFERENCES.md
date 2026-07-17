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

Không đưa credential, secret URL có token hoặc dữ liệu thật vào references.

Thuật ngữ governance bắt buộc:

- `Security Profile`: mức `STANDARD`, `HIGH` hoặc `CRITICAL` quyết định verification/security gate theo risk; không đồng nghĩa chứng nhận.
- `Human-assistance trigger`: điều kiện evidence-based cho phép AI yêu cầu decision/access/manual/approval/sign-off nhỏ nhất; “làm lâu quá” không phải trigger độc lập.
- `Critical security risk`: risk/vulnerability chặn release cho đến khi được xử lý theo Security Standard.
# Canonical terminology

Use [TERM_STANDARDIZATION.md](TERM_STANDARDIZATION.md) as the canonical Vietnamese-English vocabulary. A new recurring synonym requires an explicit glossary decision before it is used across artifacts.
