# Test Status Report — {{PROJECT_NAME}} / {{REPORTING_PERIOD}}

| Field | Value |
| :--- | :--- |
| Build/environment | {{BUILD_ENVIRONMENT}} |
| Test cycle | {{CYCLE}} |
| Data snapshot/config | {{DATA_CONFIG}} |
| Report owner/date | {{OWNER}} / {{DATE}} |

## Execution status

| Metric | Count | % of total | Trend/notes |
| :--- | ---: | ---: | :--- |
| Total Cases | {{COUNT}} | 100% | {{NOTE}} |
| Planned in cycle | {{COUNT}} | {{PERCENT}} | {{NOTE}} |
| Executed | {{COUNT}} | {{PERCENT}} | {{NOTE}} |
| Passed | {{COUNT}} | {{PERCENT}} | {{NOTE}} |
| Failed | {{COUNT}} | {{PERCENT}} | {{NOTE}} |
| Blocked | {{COUNT}} | {{PERCENT}} | {{NOTE}} |
| Skipped | {{COUNT}} | {{PERCENT}} | {{REASON_APPROVER}} |
| Not Run | {{COUNT}} | {{PERCENT}} | {{NOTE}} |

Pass rate phải định nghĩa denominator rõ, ví dụ `Passed / Executed excluding Blocked and Skipped`; không báo phần trăm khi không ghi công thức.

## Coverage and defects

| Area/requirement/risk | Planned/run/pass | Open defects by severity | Gap/action |
| :--- | :--- | :--- | :--- |
| {{AREA_IDS}} | {{COUNTS}} | C:0 H:0 M:0 L:0 | {{ACTION}} |

## Entry/exit and forecast

| Criterion | Target | Current evidence | Pass/Fail | Forecast/action |
| :--- | :--- | :--- | :--- | :--- |
| {{CRITERION}} | {{TARGET}} | {{EVIDENCE}} | {{RESULT}} | {{ACTION}} |

## Blockers, risks and decisions

| ID | Item | Impact | Owner | Needed by | Decision/action |
| :--- | :--- | :--- | :--- | :--- | :--- |
| BLK/RISK/DEC-XXX | {{ITEM}} | {{IMPACT}} | {{OWNER}} | {{DATE}} | {{ACTION}} |
