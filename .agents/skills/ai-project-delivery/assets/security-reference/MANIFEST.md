# Security Reference Manifest

## Source records

| Snapshot | External source | Local target | Exact code count |
| :--- | :--- | :--- | :---: |
| Legacy | `E:\mb_laos_be\security` | `legacy-bank-security/` | 23 Java |
| Starter | `E:\mb_laos_be\mb-security-starter` | `mb-security-starter/` | 14 Java main + 4 Java template |

## Files copied byte-for-byte

### Legacy

- `pom.xml`
- `.gitignore`
- `src/main/java/**/*.java` (23 files)

### Starter

- `pom.xml`
- `src/main/java/**/*.java` (14 files)
- `src/main/resources/META-INF/spring-configuration-metadata.json`
- `src/main/resources/META-INF/spring/org.springframework.boot.autoconfigure.AutoConfiguration.imports`
- `templates/AuthController.java`
- `templates/CustomUserDetailsService.java`
- `templates/User.java`
- `templates/UserRepository.java`
- `templates/pom-snippet.xml`

## Files intentionally sanitized

- Legacy `src/main/resources/application-sec.yml`: committed Jasypt password and weak PBE settings replaced by required external references.
- Starter `src/main/resources/application-example.yml`: JWT/OAuth/CORS/cookie/logging defaults replaced with required secret/config references and safe defaults.
- Starter `templates/application.yml`: database password, JWT fallback, schema mutation, SQL/error/debug defaults replaced with required references and safe defaults.

## Files not copied as code

Starter `README.md`, `INTEGRATION_GUIDE.md`, `QUICK_COPY.md` and `USAGE_GUIDE.md` are source documentation, not runtime code. They contain obsolete version claims or unsafe example defaults; their usable behavior is rewritten in the template workflow and governance documents. The external source files are preserved at the original path and were not modified.

## Integrity evidence

On 2026-07-17, a source-to-target SHA-256 comparison checked 44 source/POM/template files and returned 0 mismatches. Future updates must repeat that check and append the result to `PROJECT_STATE.md` and `06-Testing/TEST_TRACEABILITY_MATRIX.md`.
