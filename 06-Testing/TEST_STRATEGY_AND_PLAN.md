# Test Strategy & Plan — {{PROJECT_NAME}}

| Field | Value |
| :--- | :--- |
| Document ID | `{{PROJECT_CODE}}-TST-PLAN-001` |
| Version / status | {{VERSION}} / {{STATUS}} |
| Owner / approver | {{QA_LEAD}} / {{APPROVER}} |

## Version history

| Version | Date | Author | Reason/change | Scope/cycles affected |
| :--- | :--- | :--- | :--- | :--- |
| 0.1 | {{DATE}} | {{AUTHOR}} | Initial plan | All |

## 1. Objectives và scope

- Release/build under test: {{VERSION_ARTIFACT}}
- Requirements/design: {{IDS}}
- In scope: {{IN_SCOPE}}
- Out of scope/accepted gaps: {{OUT_OF_SCOPE}}

## 2. Risk-based coverage

| Risk/requirement | Failure impact | Test levels/types | Environment/data | Exit target |
| :--- | :--- | :--- | :--- | :--- |
| FR/NFR/THR-XXX | {{IMPACT}} | Unit / Integration / Contract / E2E / Security / Performance / Recovery | {{ENV_DATA}} | {{TARGET}} |

## 3. Test levels

| Level | Mục tiêu | Owner/tool | Trigger | Evidence |
| :--- | :--- | :--- | :--- | :--- |
| Unit | Business rules/edge cases | {{OWNER_TOOL}} | Every change | {{REPORT}} |
| Integration/contract | Data and service boundaries | {{OWNER_TOOL}} | CI/release | {{REPORT}} |
| E2E/UAT | Critical journeys/outcomes | {{OWNER_TOOL}} | Candidate release | {{REPORT}} |
| Security/performance/recovery | NFR/threat/SLO | {{OWNER_TOOL}} | Risk/release | {{REPORT}} |

## 4. Environment và data

| Environment | Version/config | Data strategy | Isolation/reset | Limitation |
| :--- | :--- | :--- | :--- | :--- |
| {{ENV}} | {{VERSION}} | Synthetic / anonymized | {{RESET}} | {{LIMITATION}} |

Không ghi credential thật. Dữ liệu test phải synthetic/anonymized hoặc có phê duyệt và kiểm soát phù hợp.

## 5. Entry criteria

- [ ] Gate 05 hoặc build candidate phù hợp đã đạt.
- [ ] Requirement/RTM/test basis ổn định; environment/data/tool sẵn sàng.
- [ ] Known issues và change scope được công bố.

## 6. Exit criteria

- [ ] 100% Must/Critical requirement applicable có passing evidence.
- [ ] Planned risk coverage đạt {{TARGET}}; regression đạt.
- [ ] Không còn Critical/High defect chưa chấp nhận.
- [ ] NFR/security/migration/rollback/UAT đạt target hoặc có exception.
- [ ] Test report và RTM cập nhật.

Nếu dự án chưa tailoring ngưỡng riêng, default release gate là: 100% test Critical/Must đã chạy; pass rate ≥ 95% theo denominator được định nghĩa; không còn Blocker/Critical defect mở; High defect cần accepted risk đúng quyền.

## 7. Schedule và responsibilities

| Activity | Owner | Start/end | Dependency | Status |
| :--- | :--- | :--- | :--- | :--- |
| {{ACTIVITY}} | {{OWNER}} | {{DATES}} | {{DEPENDENCY}} | Planned |

## 8. Product and project risk matrix

| Risk ID | Product / Project | Risk/event | Likelihood | Impact | Exposure | Test/mitigation response | Owner | Residual risk |
| :--- | :--- | :--- | :---: | :---: | :---: | :--- | :--- | :--- |
| T-RISK-001 | Product / Project | {{RISK}} | 1–5 | 1–5 | P×I | {{TEST_MITIGATION}} | {{OWNER}} | {{RESIDUAL}} |

Project risks gồm tối thiểu: nhân sự, schedule, environment, data, tool/dependency và testability. Product risks gồm correctness, security/privacy, performance, reliability, compatibility, migration và user/business impact.

## 9. Suspension and resumption criteria

| Trigger | Suspend when | Resume when | Decision owner |
| :--- | :--- | :--- | :--- |
| Build/environment/data/critical defect | {{EXACT_THRESHOLD}} | {{EXACT_RECOVERY_EVIDENCE}} | {{OWNER}} |
