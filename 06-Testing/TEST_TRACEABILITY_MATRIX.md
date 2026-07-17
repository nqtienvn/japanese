# Test Traceability Matrix — {{PROJECT_NAME}} / REL-{{VERSION}}

| SRS/Requirement ID | Feature/Use Case | Risk/condition | Test Case ID | Build/environment | Latest result/evidence | Defect/Bug ID | Retest result | Release/acceptance |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| FR-XXX | FEAT/UC-XXX | TCOND/RISK-XXX | TC-XXX-001 | {{BUILD_ENV}} | Pass / `{{EVIDENCE}}` | DEF-XXX / — | {{RESULT}} | REL/UAT-XXX |

## Coverage controls

| Control | Count | Missing IDs | Owner/action |
| :--- | ---: | :--- | :--- |
| In-scope requirements | {{COUNT}} | — | — |
| Requirements with ≥1 test condition | {{COUNT}} | {{IDS}} | {{ACTION}} |
| Requirements with positive + negative cases | {{COUNT}} | {{IDS}} | {{ACTION}} |
| Requirements with latest executed evidence | {{COUNT}} | {{IDS}} | {{ACTION}} |
| Failed tests linked to defect | {{COUNT}} | {{IDS}} | {{ACTION}} |
| Closed defects with passing retest | {{COUNT}} | {{IDS}} | {{ACTION}} |

Không đánh dấu requirement `Verified/Accepted` nếu row thiếu Test Case ID hoặc result/evidence. Failed test phải có defect ID hoặc documented triage decision.
