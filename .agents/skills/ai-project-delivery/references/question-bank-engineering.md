# Engineering, security and operations question bank — 120 câu có điều kiện

Dùng sau khi outcome/scope đã đủ rõ hoặc dùng evidence để pre-fill trong brownfield. Mỗi NFR phải có target và cách đo; mỗi quyết định quan trọng phải thành ADR.

## A. System context và kiến trúc (Q-E001–Q-E012)

1. `Q-E001` Hệ thống nằm trong boundary nào và điều gì nằm ngoài boundary?
2. `Q-E002` Các actor/system ngoài giao tiếp với hệ thống qua kênh nào?
3. `Q-E003` Kiến trúc hiện có hoặc pattern tổ chức ưu tiên là gì?
4. `Q-E004` Monolith, modular monolith, services hay serverless phù hợp với constraint nào?
5. `Q-E005` Thành phần nào cần deploy/scale độc lập thực sự?
6. `Q-E006` Domain/bounded context và ownership của chúng là gì?
7. `Q-E007` Dependency direction và layering rule mong muốn là gì?
8. `Q-E008` Giao tiếp sync/async nào và vì sao?
9. `Q-E009` Thành phần nào là single point of failure?
10. `Q-E010` ADR nào đã tồn tại và quyết định nào không được đảo ngược dễ dàng?
11. `Q-E011` Công nghệ nào team đủ khả năng vận hành lâu dài?
12. `Q-E012` Ngưỡng nào sẽ kích hoạt thay đổi kiến trúc trong tương lai?

## B. Hiệu năng và khả năng mở rộng (Q-E013–Q-E024)

13. `Q-E013` Số user/tenant/record hiện tại và dự báo 12–36 tháng là bao nhiêu?
14. `Q-E014` Concurrent users/requests trung bình và peak là bao nhiêu?
15. `Q-E015` Throughput target theo operation là bao nhiêu?
16. `Q-E016` Latency target p50/p95/p99 cho luồng quan trọng là gì?
17. `Q-E017` Startup, page load, batch completion hoặc report generation target là gì?
18. `Q-E018` Payload/file lớn nhất và giới hạn phân trang là bao nhiêu?
19. `Q-E019` Workload đọc/ghi và hot key/hot partition dự kiến ra sao?
20. `Q-E020` Cache được phép cũ bao lâu và invalidation trigger là gì?
21. `Q-E021` Scale theo chiều ngang/dọc và bottleneck dự kiến là gì?
22. `Q-E022` Load test scenario và production-like data sẽ lấy ở đâu?
23. `Q-E023` Performance budget nào áp dụng cho client/network/backend/database?
24. `Q-E024` Khi quá tải, hệ thống degrade ưu tiên capability nào?

## C. Reliability, availability và continuity (Q-E025–Q-E036)

25. `Q-E025` Availability SLO theo capability và lịch bảo trì là gì?
26. `Q-E026` RTO/RPO cho từng loại dữ liệu/dịch vụ là bao nhiêu?
27. `Q-E027` Error budget và cách dùng error budget là gì?
28. `Q-E028` Dependency failure nào phải được cô lập?
29. `Q-E029` Timeout/retry/backoff/jitter/circuit breaker tiêu chuẩn là gì?
30. `Q-E030` Operation nào cần idempotency key hoặc deduplication?
31. `Q-E031` Transaction boundary và consistency level cần thiết là gì?
32. `Q-E032` Backup tần suất nào, retention bao lâu và restore được test thế nào?
33. `Q-E033` Multi-zone/region hoặc disaster recovery có cần không?
34. `Q-E034` Health/readiness/liveness check phản ánh điều gì?
35. `Q-E035` Chaos/failover test nào đáng thực hiện?
36. `Q-E036` Ai tuyên bố incident và ai quyết định failover/rollback?

## D. Authentication, authorization và application security (Q-E037–Q-E048)

37. `Q-E037` Identity provider và account lifecycle source-of-truth là gì?
38. `Q-E038` Authentication dùng password, SSO, MFA, passkey hay service identity?
39. `Q-E039` Session/token lifetime, rotation, revocation và device policy là gì?
40. `Q-E040` Authorization là RBAC, ABAC, ReBAC hay kết hợp?
41. `Q-E041` Permission matrix và default-deny áp dụng ở lớp nào?
42. `Q-E042` Privileged action nào cần step-up auth hoặc dual control?
43. `Q-E043` Secret/key/certificate được lưu, rotate và audit bằng gì?
44. `Q-E044` Threat actors, abuse case và crown-jewel assets là gì?
45. `Q-E045` Input validation, output encoding, CSRF/CORS/CSP/file scan yêu cầu gì?
46. `Q-E046` Dependency/container/SAST/DAST scan target và severity gate là gì?
47. `Q-E047` Security logging cần gì nhưng không được lộ dữ liệu nào?
48. `Q-E048` Vulnerability disclosure, patch SLA và security contact là ai?

## E. Privacy, compliance và governance dữ liệu (Q-E049–Q-E060)

49. `Q-E049` Dữ liệu nào là personal, sensitive, financial, health hoặc confidential?
50. `Q-E050` Legal basis/purpose cho từng hoạt động xử lý là gì?
51. `Q-E051` Data minimization: trường nào thật sự cần và trường nào có thể bỏ?
52. `Q-E052` Consent/notice/version/withdrawal được ghi nhận thế nào?
53. `Q-E053` Retention và deletion schedule theo loại dữ liệu là gì?
54. `Q-E054` Export/access/correction/deletion request được xử lý theo SLA nào?
55. `Q-E055` Encryption in transit/at rest và key ownership yêu cầu gì?
56. `Q-E056` Data residency và cross-border transfer constraint là gì?
57. `Q-E057` Vendor/subprocessor nào tiếp cận dữ liệu và hợp đồng gì cần có?
58. `Q-E058` Audit evidence cần giữ bao lâu và ai truy cập được?
59. `Q-E059` Breach detection/notification timeline và owner là ai?
60. `Q-E060` DPIA, legal review hoặc regulator approval có bắt buộc không?

## F. Database, event và migration (Q-E061–Q-E072)

61. `Q-E061` Data store nào phù hợp với access pattern và consistency requirement?
62. `Q-E062` Schema ownership và migration tooling hiện có là gì?
63. `Q-E063` Migration phải zero-downtime hay có maintenance window?
64. `Q-E064` Backfill volume, duration và throttling strategy là gì?
65. `Q-E065` Rollback schema/data thực hiện được đến đâu?
66. `Q-E066` Index, partition, archive và purge strategy là gì?
67. `Q-E067` Event schema, ordering, delivery guarantee và replay policy là gì?
68. `Q-E068` Outbox/inbox hoặc CDC có cần để đảm bảo consistency không?
69. `Q-E069` Duplicate, late, poisoned event được xử lý thế nào?
70. `Q-E070` Data quality checks và reconciliation jobs nào cần có?
71. `Q-E071` Test data được tạo, mask, refresh và reset thế nào?
72. `Q-E072` Production data access cho developer/support bị giới hạn ra sao?

## G. Development, build và test engineering (Q-E073–Q-E084)

73. `Q-E073` Repository strategy, branch strategy và ownership rule là gì?
74. `Q-E074` Language/runtime/package manager version được pin thế nào?
75. `Q-E075` Local setup cần bao lâu và dependency nào khó mô phỏng?
76. `Q-E076` Formatting/lint/type/static-analysis gate nào bắt buộc?
77. `Q-E077` Unit/integration/contract/E2E test pyramid target là gì?
78. `Q-E078` Coverage metric/ngưỡng nào hữu ích theo rủi ro?
79. `Q-E079` Flaky test được phát hiện, quarantine và sửa theo SLA nào?
80. `Q-E080` Test environment và test data isolation được đảm bảo thế nào?
81. `Q-E081` Contract compatibility giữa client/service được kiểm tra bằng gì?
82. `Q-E082` Code review cần bao nhiêu approver và domain owner nào?
83. `Q-E083` Generated code, schema, artifact và dependency lock được quản lý ra sao?
84. `Q-E084` Definition of Done yêu cầu evidence kỹ thuật nào?

## H. CI/CD, release và rollback (Q-E085–Q-E096)

85. `Q-E085` Môi trường dev/test/staging/prod khác nhau ở điểm nào?
86. `Q-E086` Pipeline stages, required checks và artifact provenance là gì?
87. `Q-E087` Build có reproducible và artifact có ký/checksum/SBOM không?
88. `Q-E088` Config/secret được promote giữa môi trường thế nào?
89. `Q-E089` Deployment strategy là rolling, blue-green, canary hay recreate?
90. `Q-E090` Feature flag owner, default, expiry và cleanup rule là gì?
91. `Q-E091` Pre-deploy, migration, smoke và post-deploy checks là gì?
92. `Q-E092` Rollback trigger, decision owner và thời gian tối đa là gì?
93. `Q-E093` Database/client compatibility khi rollback được đảm bảo thế nào?
94. `Q-E094` Release train, freeze window và emergency release process là gì?
95. `Q-E095` Ai có quyền deploy và separation-of-duties yêu cầu gì?
96. `Q-E096` Release evidence/approval phải lưu ở đâu?

## I. Observability, operations và cost (Q-E097–Q-E108)

97. `Q-E097` Golden signals/SLI nào phản ánh health và user outcome?
98. `Q-E098` Log format, correlation ID, retention và redaction rule là gì?
99. `Q-E099` Metric/dashboard nào dành cho dev, ops và business?
100. `Q-E100` Distributed tracing cần tới boundary nào và sampling ra sao?
101. `Q-E101` Alert nào actionable, severity và on-call routing là gì?
102. `Q-E102` Runbook cho top failure scenarios nằm ở đâu?
103. `Q-E103` Incident severity, commander, communication và PIR process là gì?
104. `Q-E104` Capacity/cost budget và alert threshold là gì?
105. `Q-E105` Cost attribution theo tenant/feature/environment có cần không?
106. `Q-E106` Maintenance jobs, certificate expiry và dependency EOL được theo dõi thế nào?
107. `Q-E107` Support escalation cần log/tool/access nào?
108. `Q-E108` Operational readiness review cần ai ký?

## J. Brownfield, compatibility và handover (Q-E109–Q-E120)

109. `Q-E109` Branch/commit nào là baseline đáng tin cậy và worktree có thay đổi gì?
110. `Q-E110` Build/test nào hiện pass, fail, skipped hoặc chưa biết?
111. `Q-E111` Hành vi nào production đang phụ thuộc dù không có tài liệu?
112. `Q-E112` Legacy client/data/integration nào phải backward-compatible?
113. `Q-E113` Tech debt nào đang gây incident hoặc làm chậm thay đổi?
114. `Q-E114` TODO/mock/feature flag nào che phần chưa hoàn tất?
115. `Q-E115` Tài liệu nào mâu thuẫn code và nguồn nào nên được coi là đúng?
116. `Q-E116` Người duy nhất hiểu module quan trọng là ai và tri thức nào cần trích xuất?
117. `Q-E117` License, credential, domain, certificate và vendor account thuộc sở hữu ai?
118. `Q-E118` Người nhận bàn giao cần tự thực hiện được tác vụ nào?
119. `Q-E119` Decommission/archive nào phải làm sau chuyển đổi?
120. `Q-E120` Bằng chứng nào chứng minh dự án có thể được tiếp tục mà không cần lịch sử chat?
