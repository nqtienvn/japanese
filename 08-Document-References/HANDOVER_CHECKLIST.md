# Final Handover & Acceptance — {{PROJECT_NAME}}

## Deliverables

| Deliverable | Location/version | Owner receiving | Verification | Status |
| :--- | :--- | :--- | :--- | :--- |
| Source/config/migrations | {{LOCATION}} | {{OWNER}} | Build/test evidence | Pending |
| Release artifact | {{LOCATION}} | {{OWNER}} | Checksum/version | Pending |
| Requirements/design/RTM | `../02-Requirements`, `../03-Architecture-Design` | {{OWNER}} | Index/review | Pending |
| Test/UAT/release reports | `../06-Testing`, `../07-Reports` | {{OWNER}} | Sign-off | Pending |
| User guide/runbook | This phase | {{OWNER}} | Dry run | Pending |

## Ownership and access transfer

- [ ] Repository/admin/CI/CD/cloud/domain/vendor accounts có named owner.
- [ ] Secret/key/certificate được transfer qua kênh an toàn và rotation plan rõ.
- [ ] Data ownership, backup, retention, privacy requests và audit responsibility rõ.
- [ ] Billing/license/subscription ownership và renewal dates rõ.
- [ ] IP/source ownership, third-party license/SBOM và data return/delete obligations đã đối soát với SOW.
- [ ] Không ghi credential value trong handover document.

## Knowledge transfer

| Session/topic | Audience | Date | Evidence/recording | Open questions |
| :--- | :--- | :--- | :--- | :--- |
| Architecture/setup/deploy/incident/support | {{AUDIENCE}} | {{DATE}} | {{EVIDENCE}} | {{QUESTIONS}} |

## Operational dry run

- [ ] Người nhận tự setup/build/test theo tài liệu.
- [ ] Người nhận tự deploy/smoke/monitor ở môi trường được phép.
- [ ] Developer/Ops newcomer và Tester derivation field tests đạt; blocking clarification đã chuyển thành finding và retest.
- [ ] Standards alignment/tailoring và document quality audit có sign-off, không tuyên bố certification sai.
- [ ] Security Profile, threat model, security tests/scans/pentest applicability và residual-risk decisions đã transfer; không còn Critical mở.
- [ ] Human-assistance history ghi rõ decision/manual evidence và phần đã được AI verify/resume; không để thao tác vô chủ.
- [ ] Backup/restore hoặc rollback path được diễn tập phù hợp.
- [ ] Top incident/support scenarios được đi qua.

## Open items and residual risks

| ID | Item/risk | Impact | Owner | Due/SLA | Accepted by |
| :--- | :--- | :--- | :--- | :--- | :--- |
| RISK/TD/DEF-XXX | {{ITEM}} | {{IMPACT}} | {{OWNER}} | {{DATE}} | {{APPROVER}} |

## Warranty/support transition

| Item | Agreement |
| :--- | :--- |
| Warranty window | {{WINDOW}} |
| Support channel/hours | {{MODEL}} |
| Severity/response SLA | {{SLA}} |
| Exclusions/change request | {{BOUNDARY}} |

## Final acceptance

| Party | Decision | Name | Date | Conditions |
| :--- | :--- | :--- | :--- | :--- |
| Client | Accepted / Conditional / Rejected | {{CLIENT_APPROVER}} | {{DATE}} | {{CONDITIONS}} |
| Delivery Vendor | Handover complete / Conditional | {{VENDOR_APPROVER}} | {{DATE}} | {{CONDITIONS}} |
