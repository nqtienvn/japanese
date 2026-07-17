---
artifact_id: DOC-06-TESTING-SECURITY-VERIFICATION-MATRIX-MD
phase: "06-Testing"
artifact_type: testing
owner: "{{OWNER}}"
version: "0.1"
status: Template
ids: []
dependencies: []
last_verified: "{{DATE}}"
---
# Security Verification Matrix — {{PROJECT_NAME}} / {{BUILD}}

## 1. Execution context

| Trường | Giá trị |
| :--- | :--- |
| Security Profile | {{PROFILE}} |
| Environment/build/commit | {{ENV_BUILD_COMMIT}} |
| Test data classification | Synthetic / Masked / Approved |
| Tools/versions | {{TOOLS_VERSIONS}} |
| Executor/date | {{EXECUTOR_DATE}} |

## 2. Mandatory security cases

| Test ID | Requirement | Condition/input | Exact expected result | Automation/evidence | Latest result | Defect/risk |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `TC-SEC-SECRET-001` | SEC-BNK-004 | Secret scan source/config/history in scope | Không có verified secret value; false positive có triage | {{COMMAND_REPORT}} | Not Run | — |
| `TC-SEC-SECRET-002` | SEC-BNK-005 | Start thiếu required key/secret | Process dừng non-zero; error không chứa secret | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-AUTHZ-001` | SEC-BNK-006 | Gọi route không khai báo bằng user thường | HTTP 403 hoặc policy-equivalent deny | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-AUTHZ-002` | SEC-BNK-007 | Inventory public routes so với allowlist | Không có route public ngoài allowlist đã duyệt | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-AUTHZ-003` | SEC-BNK-008 | Authority chỉ match prefix/substring | Access bị từ chối | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-COOKIE-001` | SEC-BNK-009 | Login/OAuth success | Access/refresh cookie có `Secure` | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-COOKIE-002` | SEC-BNK-010 | Login/OAuth success | Access/refresh cookie có `HttpOnly` | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-COOKIE-003` | SEC-BNK-011 | Cross-site request matrix | Browser gửi/chặn cookie đúng SameSite policy | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-CORS-001` | SEC-BNK-012 | Preflight từ origin ngoài allowlist | Không có allow-origin cho origin đó | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-CORS-002` | SEC-BNK-013 | Credentials=true với wildcard origin | Startup/config validation fail hoặc request bị deny | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-CSRF-001` | SEC-BNK-014 | POST cookie-authenticated thiếu CSRF token | HTTP 403 hoặc policy-equivalent deny | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-CSRF-002` | SEC-BNK-014 | POST với CSRF token sai user/session | HTTP 403 hoặc policy-equivalent deny | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-JWT-001` | SEC-BNK-015 | JWT `alg=none`/unexpected algorithm | Token bị từ chối | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-JWT-002` | SEC-BNK-016 | JWT thiếu/sai issuer | Token bị từ chối | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-JWT-003` | SEC-BNK-017 | JWT thiếu/sai audience | Token bị từ chối khi audience áp dụng | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-JWT-004` | SEC-BNK-018 | Expired/future `nbf` token | Token bị từ chối ngoài clock-skew đã cấu hình | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-REFRESH-001` | SEC-BNK-019 | Refresh token hết hạn | Refresh bị từ chối | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-REFRESH-002` | SEC-BNK-020 | Replay refresh token đã rotate | Replay bị từ chối; token family xử lý đúng policy | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-REFRESH-003` | SEC-BNK-021 | Logout/password change/disable user | Token thuộc policy không còn dùng được | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-LOG-001` | SEC-BNK-022 | Chạy auth success/failure/expired flow | Log không chứa raw token/secret/authorization header | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-OAUTH-001` | SEC-BNK-023 | Redirect URI biến thể/open redirect | Authorization flow bị từ chối | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-OAUTH-002` | SEC-BNK-024 | Missing/wrong PKCE verifier | Token exchange bị từ chối khi PKCE áp dụng | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-PWD-001` | SEC-BNK-025 | Tạo password hash mới | Algorithm/parameter đúng ADR; verify pass; benchmark đạt target | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-SBOM-001` | SEC-BNK-027 | Clean dependency resolution/SBOM/SCA | Version/provenance đầy đủ; severity gate đạt | {{EVIDENCE}} | Not Run | — |
| `TC-SEC-BUILD-001` | SEC-BNK-028 | Clean build | Command exit 0 | {{EVIDENCE}} | Not Run | — |

## 3. Coverage gate

| Metric | Target | Actual | Decision |
| :--- | :---: | :---: | :--- |
| In-scope Must requirements có test | 100% | {{PERCENT}} | Pass / Fail |
| Executed cases có evidence | 100% trước release | {{PERCENT}} | Pass / Fail |
| Open Critical findings | 0 | {{COUNT}} | Pass / Fail |
| Open High findings | 0 hoặc accepted đúng quyền/expiry | {{COUNT}} | Pass / Conditional / Fail |

Không đổi requirement sang `Verified` khi test row thiếu command/result/evidence. Không ghi `N/A` nếu chưa có applicability rationale trong Security Adoption Record.
