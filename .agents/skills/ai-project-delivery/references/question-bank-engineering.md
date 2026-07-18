# Engineering, Security, and Operations Question Bank — 120 Conditional Questions

Use after outcomes/scope are sufficiently clear, or pre-fill using evidence in brownfield projects. Each NFR must have a target and measurement method; each critical decision must become an ADR.

## A. System Context and Architecture (Q-E001–Q-E012)

1. `Q-E001` What boundaries define the system, and what lies outside them?
2. `Q-E002` Through what channels do external actors or systems communicate with the system?
3. `Q-E003` What is the existing architecture or preferred organizational patterns?
4. `Q-E004` Monolith, modular monolith, services, or serverless — which matches the constraints best?
5. `Q-E005` Which components require true independent deployment or scaling?
6. `Q-E006` What are the domains/bounded contexts and their ownership?
7. `Q-E007` What is the desired dependency direction and layering rules?
8. `Q-E008` What synchronous vs. asynchronous communication patterns are used, and why?
9. `Q-E009` Which components constitute single points of failure?
10. `Q-E010` What ADRs currently exist, and which decisions cannot be easily reversed?
11. `Q-E011` What technologies is the team capable of operating long-term?
12. `Q-E012` What thresholds will trigger architectural changes in the future?

## B. Performance and Scalability (Q-E013–Q-E024)

13. `Q-E013` What is the current user/tenant/record count, and the 12–36 month forecast?
14. `Q-E014` What are the average and peak concurrent users/requests?
15. `Q-E015` What is the target throughput by operation?
16. `Q-E016` What are the p50/p95/p99 latency targets for critical paths?
17. `Q-E017` What are the startup, page load, batch completion, or report generation targets?
18. `Q-E018` What is the maximum payload/file size and pagination limits?
19. `Q-E019` What are the expected read/write ratios and hot keys/hot partitions?
20. `Q-E020` How stale can caches be, and what triggers invalidation?
21. `Q-E021` What horizontal/vertical scaling models and bottlenecks are anticipated?
22. `Q-E022` Where will load test scenarios and production-like data be sourced?
23. `Q-E023` What performance budgets apply to client, network, backend, and database layers?
24. `Q-E024` Under overload, which capabilities does the system degrade first?

## C. Reliability, Availability, and Continuity (Q-E025–Q-E036)

25. `Q-E025` What is the availability SLO by capability, and the maintenance schedule?
26. `Q-E026` What are the RTO/RPO targets for each type of data/service?
27. `Q-E027` What is the error budget and how is it managed?
28. `Q-E028` Which dependency failures must be isolated?
29. `Q-E029` What are the standard timeout, retry, backoff, jitter, and circuit-breaker policies?
30. `Q-E030` Which operations require idempotency keys or deduplication?
31. `Q-E031` What are the transaction boundaries and required consistency levels?
32. `Q-E032` What is the backup frequency, retention period, and how is restore tested?
33. `Q-E033` Is multi-zone/region deployment or disaster recovery required?
34. `Q-E034` What do health, readiness, and liveness checks reflect?
35. `Q-E035` What chaos or failover tests should be conducted?
36. `Q-E036` Who declares an incident, and who decides on failover/rollback?

## D. Authentication, Authorization, and Application Security (Q-E037–Q-E048)

37. `Q-E037` What is the identity provider and the account lifecycle source-of-truth?
38. `Q-E038` Does authentication use passwords, SSO, MFA, passkeys, or service identities?
39. `Q-E039` What are the session/token lifetimes, rotation, revocation, and device policies?
40. `Q-E040` Is authorization based on RBAC, ABAC, ReBAC, or a hybrid?
41. `Q-E041` What is the permission matrix, and at what layers is default-deny enforced?
42. `Q-E042` Which privileged actions require step-up auth or dual control?
43. `Q-E043` How are secrets, keys, and certificates stored, rotated, and audited?
44. `Q-E044` Which Security Profile is appropriate; who are the threat actors; what are the abuse cases, crown-jewel assets, and risk appetite?
45. `Q-E045` What input validation, output encoding, CSRF/CORS/CSP, and file scanning controls are required?
46. `Q-E046` Under the Security Profile, which dependency, container, SAST, DAST, or pentesting apply, and what are the severity gates?
47. `Q-E047` What must security logging capture, and what sensitive data must be redacted?
48. `Q-E048` Who is the security contact, and what are the vulnerability disclosure and patching SLAs?

## E. Privacy, Compliance, and Data Governance (Q-E049–Q-E060)

49. `Q-E049` Which data is personal, sensitive, financial, health, or confidential?
50. `Q-E050` Which regulations (GDPR, CCPA, local laws) apply, and what is the legal basis/purpose for each processing activity?
51. `Q-E051` Data minimization: which fields are strictly required, and which can be omitted?
52. `Q-E052` How are consents, privacy notices, versions, and withdrawals recorded?
53. `Q-E053` What is the retention and deletion schedule by data category?
54. `Q-E054` Under what SLA are data export, access, correction, and deletion requests processed?
55. `Q-E055` What encryption in transit/at rest and key ownership are required?
56. `Q-E056` What are the data residency and cross-border transfer constraints?
57. `Q-E057` Which vendors or subprocessors access data, and what agreements must be in place?
58. `Q-E058` How long must audit evidence be kept, and who has access?
59. `Q-E059` Who is the owner, and what is the SLA for breach detection/notification?
60. `Q-E060` Are DPIAs, legal reviews, or regulator approvals mandatory?

## F. Database, Events, and Migrations (Q-E061–Q-E072)

61. `Q-E061` Which data stores match the access patterns and consistency requirements?
62. `Q-E062` What is the schema ownership and existing migration tooling?
63. `Q-E063` Must migrations be zero-downtime, or is a maintenance window permitted?
64. `Q-E064` What is the backfill volume, duration, and throttling strategy?
65. `Q-E065` To what extent can schema or data rollbacks be performed?
66. `Q-E066` What is the indexing, partitioning, archiving, and purging strategy?
67. `Q-E067` What is the event schema, ordering, delivery guarantee, and replay policy?
68. `Q-E068` Are outbox/inbox patterns or CDC required to ensure consistency?
69. `Q-E069` How are duplicate, late, or poisoned events handled?
70. `Q-E070` What data quality checks and reconciliation jobs are required?
71. `Q-E071` How is test data generated, masked, refreshed, and reset?
72. `Q-E072` How is production data access for developers/support restricted?

## G. Development, Build, and Test Engineering (Q-E073–Q-E084)

73. `Q-E073` What is the repository strategy, branching strategy, and ownership rules?
74. `Q-E074` How are language, runtime, and package manager versions pinned?
75. `Q-E075` How long does local setup take, and which dependencies are hard to emulate?
76. `Q-E076` Which formatting, linting, typechecking, and static analysis gates are mandatory?
77. `Q-E077` What is the target unit, integration, contract, and E2E test pyramid?
78. `Q-E078` What line, branch, function, and requirement/risk coverage targets are useful by layer, tool, exclusion, and risk?
79. `Q-E079` How are flaky tests detected, quarantined, and fixed, and under what SLA?
80. `Q-E080` How is test environment and test data isolation guaranteed?
81. `Q-E081` What tools verify contract compatibility between client and service?
82. `Q-E082` How many approvers and which domain owners are required for code reviews?
83. `Q-E083` How are generated code, schemas, artifacts, and dependency locks managed?
84. `Q-E084` What technical evidence does the Definition of Done require?

## H. CI/CD, Release, and Rollback (Q-E085–Q-E096)

85. `Q-E085` How do dev, test, staging, and prod environments differ?
86. `Q-E086` What are the pipeline stages, required checks, and artifact provenance?
87. `Q-E087` Are builds reproducible, and are artifacts signed/checksummed/linked to SBOMs?
88. `Q-E088` How are configs and secrets promoted across environments?
89. `Q-E089` What is the deployment strategy (rolling, blue-green, canary, recreate)?
90. `Q-E090` What are the feature flag owners, defaults, expiry, and cleanup rules?
91. `Q-E091` What are the pre-deploy, migration, smoke, and post-deploy checks?
92. `Q-E092` What are the rollback triggers, decision owners, and maximum rollback time?
93. `Q-E093` How is database/client compatibility guaranteed during rollback?
94. `Q-E094` What is the release train, freeze windows, and emergency release process?
95. `Q-E095` Who is authorized to deploy, and what separation of duties applies?
96. `Q-E096` Where must release evidence/approvals be archived?

## I. Observability, Operations, and Cost (Q-E097–Q-E108)

97. `Q-E097` Which golden signals/SLIs reflect health and user outcomes?
98. `Q-E098` What is the log format, correlation ID, retention, and redaction rules?
99. `Q-E099` What metrics/dashboards serve dev, ops, and business teams?
100. `Q-E100` To what boundaries does distributed tracing extend, and what is the sampling rate?
101. `Q-E101` Which alerts are actionable, and what is their severity and on-call routing?
102. `Q-E102` Where are the runbooks for top failure scenarios located?
103. `Q-E103` What is the incident severity, commander role, communication SLA, and PIR process?
104. `Q-E104` What are the capacity/cost budgets and alert thresholds?
105. `Q-E105` Is cost attribution by tenant, feature, or environment required?
106. `Q-E106` How are maintenance jobs, certificate expiries, and dependency EOLs tracked?
107. `Q-E107` What logs, tools, or permissions are required for support escalation?
108. `Q-E108` Who must sign off on the operational readiness review?

## J. Brownfield, Compatibility, and Handover (Q-E109–Q-E120)

109. `Q-E109` Which branch/commit is the trusted baseline, and what changes exist in the worktree?
110. `Q-E110` Which builds or tests currently pass, fail, are skipped, or are unknown?
111. `Q-E111` What undocumented behaviors is production currently relying on?
112. `Q-E112` Which legacy clients, data, or integrations must remain backward-compatible?
113. `Q-E113` What tech debt is causing incidents or delaying changes?
114. `Q-E114` Which TODOs, mocks, or feature flags mask incomplete work?
115. `Q-E115` What documentation conflicts with the code, and which source is correct?
116. `Q-E116` Who is the sole owner of a critical module, and what knowledge must be extracted?
117. `Q-E117` Who owns the licenses, credentials, domains, certificates, and vendor accounts?
118. `Q-E118` What tasks must the handover recipient be able to perform independently?
119. `Q-E119` What decommission/archive steps must be done after migration?
120. `Q-E120` What evidence proves that the project can be continued without chat history?
