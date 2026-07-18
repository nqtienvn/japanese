---
artifact_id: DOC-04-IMPLEMENTATION-ENVIRONMENT-SETUP-MD
phase: "04-Implementation"
artifact_type: implementation
owner: "AI Solution Architect"
version: "1.0"
status: Complete
ids: []
dependencies: [GPA-SAD-001]
last_verified: "2026-07-18"
---
# Environment Setup — UniGPA

## Prerequisites

| Tool/runtime | Version | Install source | Verify command |
| :--- | :--- | :--- | :--- |
| Java JDK | 17 | Adoptium Temurin | `java -version` |
| Maven | 3.8+ | Apache Maven | `mvn -version` |
| Node.js | 18+ | Node.js Official | `node -v` |
| MySQL | 8.0+ | MySQL Community | `mysql --version` |

## Configuration

- Environment files: Create an `application.properties` in Spring Boot backend, and a `.env` in the React frontend.
- Do not commit real production secret values.

| Variable | Required | Purpose | Safe Example | Secret? |
| :--- | :--- | :--- | :--- | :---: |
| `SPRING_DATASOURCE_URL` | Yes | MySQL Connection URL | `jdbc:mysql://localhost:3306/unigpa` | No |
| `SPRING_DATASOURCE_USERNAME` | Yes | Database user | `gpa_user` | No |
| `SPRING_DATASOURCE_PASSWORD` | Yes | Database password | `strong_pass` | Yes |
| `GOOGLE_CLIENT_ID` | Yes | Google OAuth App ID | `12345-abcde.apps.googleusercontent.com` | No |
| `GOOGLE_CLIENT_SECRET` | Yes | Google OAuth Client Secret | `<client-secret-from-google>` | Yes |
| `JWT_SECRET_KEY` | Yes | Signing key for JWT | `min-256-bit-key-here-for-hs256-signatures` | Yes |
| `DB_ENCRYPTION_KEY` | Yes | AES-256 encryption key for PII | `32-byte-hex-key-here-for-encryption` | Yes |

## Setup/run/test

### 1. Database Initialization
```sql
CREATE DATABASE unigpa CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### 2. Backend (Spring Boot) Build & Run
```bash
mvn clean install
mvn spring-boot:run
```
To run tests:
```bash
mvn test
```

### 3. Frontend (React JS) Build & Run
```bash
npm install
npm run dev
```

### 4. Chrome Extension installation
1. Open Chrome browser and go to `chrome://extensions/`.
2. Enable "Developer mode" toggle.
3. Click "Load unpacked" and select the `/chrome-extension` directory in this repository.

## Verification

| Check | Expected | Troubleshooting Link |
| :--- | :--- | :--- |
| Backend API Health | GET `http://localhost:8080/actuator/health` returns `{"status":"UP"}` | `08-Document-References/OPERATIONS_RUNBOOK.md` |
| Frontend Web UI | `http://localhost:5173` loads the login screen | `08-Document-References/OPERATIONS_RUNBOOK.md` |

## Reset/cleanup safety
To reset local database tables during development:
```sql
DROP DATABASE unigpa;
CREATE DATABASE unigpa;
```
