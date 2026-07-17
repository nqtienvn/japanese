# Governance, RACI & Quality Gates — {{PROJECT_NAME}}

## 1. Role directory

| Role | Người/AI role | Quyền chính | Backup |
| :--- | :--- | :--- | :--- |
| Client Sponsor | {{PROJECT_OWNER}} | Budget/outcome/escalation | {{BACKUP}} |
| Client Product Owner | {{PRODUCT_OWNER}} | Scope/priority/acceptance | {{BACKUP}} |
| Vendor Delivery Lead | {{PROJECT_MANAGER}} | Plan/risk/delivery | {{BACKUP}} |
| Business Analyst | AI / {{NAME}} | Discovery/requirements/RTM | {{BACKUP}} |
| Tech Lead | {{TECH_LEAD}} | Architecture/implementation | {{BACKUP}} |
| QA Lead | {{QA_LEAD}} | Test/quality gate | {{BACKUP}} |
| Security/Privacy Owner | {{SECURITY_OWNER}} | Risk/compliance sign-off | {{BACKUP}} |
| Operations Owner | {{OPS_OWNER}} | Release/run/incident | {{BACKUP}} |

## 2. RACI

`R` Responsible, `A` Accountable, `C` Consulted, `I` Informed.

| Hoạt động | Client PO | Vendor Lead | BA | Tech | QA | Sec/Privacy | Ops |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| Discovery baseline | A | R | R | C | C | C | I |
| Scope/change | A | R | C | C | C | C | I |
| Architecture | C | A | C | R | C | C | C |
| Development | I | A | C | R | C | C | I |
| Test/UAT | A | C | C | C | R | C | I |
| Security risk acceptance | C | C | I | R | C | A | I |
| Release production | A | R | I | C | C | C | R |
| Handover | A | R | C | C | C | C | R |

## 3. Cadence

| Nghi thức | Tần suất | Thành phần | Output |
| :--- | :--- | :--- | :--- |
| Discovery interview | Theo đợt | Client + BA | Answer/decision log |
| Delivery update | {{CADENCE}} | Client + Vendor | Status/risk/decision |
| Demo/review | {{CADENCE}} | Stakeholder | Feedback/acceptance |
| Gate review | Cuối phase | Approvers | Pass/conditional/fail |
| Incident review | Khi có | Owner liên quan | PIR/actions |

## 4. Definition of Ready

- [ ] Có requirement ID, source, business value và owner.
- [ ] Acceptance criteria testable; dependency/data/access đã biết.
- [ ] UX/design/API/data impact đủ rõ theo rủi ro.
- [ ] Security/privacy/NFR đã được xem xét.
- [ ] Không có quyết định blocking chưa có owner.

## 5. Definition of Done

- [ ] Code/config review xong, build/lint/static checks đạt.
- [ ] Test phù hợp rủi ro đạt và có evidence.
- [ ] RTM, changelog, docs/runbook liên quan được cập nhật.
- [ ] Không có secret/data thật trong artifact không phù hợp.
- [ ] Acceptance đạt hoặc exception có approver và hạn xử lý.

## 6. Escalation

| Severity | Ví dụ | Phản hồi | Escalate tới |
| :--- | :--- | :--- | :--- |
| Critical | Data loss/security breach/block production | {{TIME}} | Sponsor + Security + Vendor Lead |
| High | Milestone/SLA có nguy cơ trượt | {{TIME}} | Client PO + Vendor Lead |
| Medium | Scope/quality issue có workaround | {{TIME}} | Workstream owner |
| Low | Cải tiến/tech debt | {{TIME}} | Backlog owner |
