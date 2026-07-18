# Security Reference Assets

## Purpose

This directory stores the security code snapshot provided by the Client so that the AI can reuse implementation knowledge without relying on chat history or local file paths. This is a **controlled internal reference**, not a certified library, and not proof that a product is secure.

AI must read `references/security-adoption-workflow.md` before adopting any part of the snapshot into application code.

## Snapshot Source and Scope

| Reference | Source Provided by Client | Saved Content | Status |
| :--- | :--- | :--- | :--- |
| `legacy-bank-security/` | `E:\mb_laos_be\security` | 23 Java files, `pom.xml`, `.gitignore`, sanitized configuration structures | `QUARANTINED_REFERENCE` |
| `mb-security-starter/` | `E:\mb_laos_be\mb-security-starter` | 14 core Java files, 4 Java templates, 1 POM template, `pom.xml`, Spring metadata, 2 hardened configurations | `QUARANTINED_REFERENCE` |

The snapshot was created on `2026-07-17`. The two source directories do not contain local Git metadata to verify commit/tag/provenance. The Client describes this as standard security code from a banking environment they previously worked on; ownership claims, licensing, and distribution rights have not been independently evaluated.

## Claim boundary

- For internal use only in projects authorized by the Client.
- Do not publish, sell, open-source, or transfer to third parties without owner confirmation of usage rights.
- Do not use terms like "bank-certified", "absolute security", or "copying guarantees compliance".
- Source references do not take precedence over active threat models, requirements, supported versions, security advisories, or test evidence.

## Usage Rules

1. The AI must select a Security Profile and complete compatibility/security deltas before copying code into target files.
2. For Java/Spring, `mb-security-starter` is the preferred structural reference; legacy modules are only used to leverage proven patterns/behaviors or compatibility.
3. For non-Java/Spring stacks, the AI must translate controls/behaviors; do not force Java dependencies onto the project.
4. Every file adopted into production must have corresponding requirements, design decisions, work items, and passing security tests.
5. Do not introduce anti-patterns documented in `SECURITY_REVIEW.md` into production.
6. Secrets must originate from a secret manager or secure injection; configurations lacking secrets must fail fast.
7. Any material differences from the baseline must be documented in `03-Architecture-Design/SECURITY_ADOPTION_RECORD.md`.

## Sanitization Performed

- Did not copy the committed `jasypt.encryptor.password` value from the legacy source.
- Did not retain legacy `PBEWithMD5AndTripleDES` or iteration counts as defaults.
- Did not retain fallback JWT secrets, database passwords, `ddl-auto: update`, `show-sql: true`, error details set to `always`, or DEBUG logging in configuration templates.
- Did not copy source guides containing snippets with unsafe fallbacks; replacement contents are normalized in `references/security-adoption-workflow.md` and snapshot configurations.

File-level scope and sanitization rationales are documented in [MANIFEST.md](MANIFEST.md). Details on evidence, build results, and findings are located in [SECURITY_REVIEW.md](SECURITY_REVIEW.md).
