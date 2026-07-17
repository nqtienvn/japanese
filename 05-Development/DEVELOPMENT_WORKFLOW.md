# Development Workflow — {{PROJECT_NAME}}

## 1. Start a work item

1. Chọn `WI-XXX` đã Ready và đọc linked requirement/design/ADR.
2. Kiểm tra worktree và giữ thay đổi không liên quan.
3. Xác nhận acceptance, test approach, migration/compatibility và approval boundary.
4. Tạo thay đổi nhỏ theo vertical slice; tránh refactor ngoài scope nếu không cần.

## 2. Local loop

```text
{{INSTALL_COMMAND}}
{{FORMAT_LINT_TYPE_COMMANDS}}
{{UNIT_TEST_COMMAND}}
{{INTEGRATION_TEST_COMMAND}}
{{BUILD_COMMAND}}
```

Ghi lệnh thực tế và kết quả vào work item/test report. Không chạy migration/destructive script chưa được hiểu và phê duyệt.

## 3. Implementation rules

- Validate input tại trust boundary; enforce authorization server-side.
- Thiết kế error contract ổn định; retry/idempotency theo EDS.
- Không log secret/token/password/PII không cần thiết.
- Thêm telemetry cho journey/failure trọng yếu.
- Giữ compatibility hoặc ghi breaking change/migration/release plan.
- Test business rule, negative path và regression cùng thay đổi.

## 4. Review and merge readiness

- [ ] Acceptance của WI đạt và RTM có code/test evidence.
- [ ] Formatter/lint/type/static/build/test phù hợp đều pass.
- [ ] Migration/feature flag/config docs cập nhật.
- [ ] Security/privacy/performance/operations impact đã review.
- [ ] Changelog/tech debt/runbook cập nhật khi cần.

## 5. CI evidence

| Pipeline/check | Command/job | Target | Latest result/link |
| :--- | :--- | :--- | :--- |
| Build | {{COMMAND}} | Pass | {{EVIDENCE}} |
| Unit/integration | {{COMMAND}} | Pass | {{EVIDENCE}} |
| Security/dependency | {{COMMAND}} | No unaccepted High/Critical | {{EVIDENCE}} |
