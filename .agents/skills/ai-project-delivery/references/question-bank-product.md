# Product and Workflow Question Bank — 120 Conditional Questions

Only ask the group applicable to the product. Use responses to create FR/UC/US, data rules, UX spec, integration contracts, and acceptance criteria.

## A. Journey and Capabilities (Q-P001–Q-P012)

1. `Q-P001` What is the natural starting point of the user journey?
2. `Q-P002` What does the user need to know before starting?
3. `Q-P003` What is the first action that delivers value to the user?
4. `Q-P004` What is the maximum acceptable time-to-first-value?
5. `Q-P005` How do new users differ from returning users?
6. `Q-P006` Which steps are mandatory, and which can be skipped or deferred?
7. `Q-P007` Can users save progress draft and resume on a different device?
8. `Q-P008` Who is authorized to act on behalf of another user, and under what permissions?
9. `Q-P009` Which journeys require self-service, and which require staff assistance?
10. `Q-P010` When is double-confirmation or critical warning required?
11. `Q-P011` What output or evidence marks a successful journey end?
12. `Q-P012` After completion, what is the next best action?

## B. Workflows, States, and Concurrency (Q-P013–Q-P024)

13. `Q-P013` What are the lifecycle states of the primary business entity?
14. `Q-P014` What are the valid and invalid state transitions?
15. `Q-P015` Who or what event is authorized to trigger each transition?
16. `Q-P016` Which transitions require reasons, comments, or attachments?
17. `Q-P017` Are there temporary, timeout, expired, archived, or deleted states?
18. `Q-P018` If two users edit simultaneously, how does the system resolve or detect conflicts?
19. `Q-P019` Which actions must be idempotent if the user double-clicks or resubmits?
20. `Q-P020` Are scheduled jobs, queues, or background processing required?
21. `Q-P021` How many times is a failed job retried, and who is notified?
22. `Q-P022` Are bulk actions supported, and what is the safety limit?
23. `Q-P023` What undo/reversal operations are supported, and within what timeframe?
24. `Q-P024` How detailed must the state history audit log be?

## C. UX, Content, and Accessibility (Q-P025–Q-P036)

25. `Q-P025` Is the primary interface web, mobile, desktop, chat, API, or a hybrid?
26. `Q-P026` What are the three most frequently used screens or tasks?
27. `Q-P027` Do users prioritize speed, detailed instructions, or high information density?
28. `Q-P028` Is there an existing design system, brand guidelines, or component library?
29. `Q-P029` What is the mandatory or forbidden tone of voice and terminology?
30. `Q-P030` What level of keyboard navigation, screen readers, contrast, or font sizing support is required?
31. `Q-P031` Should validation occur instantly, when leaving a field, or upon submission?
32. `Q-P032` To what extent must error messages provide instructions for recovery?
33. `Q-P033` How are empty, loading, offline, and permission-denied states displayed?
34. `Q-P034` What rules govern the masking, revealing, or copying of sensitive data?
35. `Q-P035` Are printing, exporting, sharing, or deep-linking required?
36. `Q-P036` Will usability success be measured by task completion, time-on-task, error rate, or SUS score?

## D. Business Data (Q-P037–Q-P048)

37. `Q-P037` What are the core entities and their relationships?
38. `Q-P038` Which fields are mandatory, optional, derived, or immutable?
39. `Q-P039` Which identifiers must be unique, and within what scope?
40. `Q-P040` Which system is the source of truth for each data element?
41. `Q-P041` Who is authorized to create, read, update, delete, and export each type of data?
42. `Q-P042` To what extent do data changes require versioning or auditing?
43. `Q-P043` Is there time-bound or historical data required?
44. `Q-P044` What are the validation, normalization, and duplicate detection rules?
45. `Q-P045` What file types, sizes, quantities, and malware scanning rules govern attachments?
46. `Q-P046` What formats, mappings, and error handling rules govern data import/export?
47. `Q-P047` Who manages and updates seed or reference data, and how?
48. `Q-P048` When data conflicts between sources, what is the reconciliation rule?

## E. Integrations and Product APIs (Q-P049–Q-P060)

49. `Q-P049` Which external systems send data in or receive data out?
50. `Q-P050` Are integrations synchronous APIs, webhooks, files, events, emails, or manual tasks?
51. `Q-P051` Who owns the contract and sandbox for each integration?
52. `Q-P052` What authentication/authorization mechanisms are used with partners?
53. `Q-P053` What is the quota, rate limit, and cost per API call?
54. `Q-P054` What are the desired timeout, retry, backoff, and circuit-breaker behaviors?
55. `Q-P055` How are duplicate requests or events detected and deduplicated?
56. `Q-P056` Are ordering guarantees and eventual consistency acceptable?
57. `Q-P057` How is schema/version compatibility managed?
58. `Q-P058` When a partner suffers downtime, what do users see and what is the fallback?
59. `Q-P059` What reports are needed to reconcile or audit integrations?
60. `Q-P060` What data must absolutely never be sent to third parties?

## F. Search, Reporting, and Notifications (Q-P061–Q-P072)

61. `Q-P061` Which fields can users search by, and what fuzzy or full-text expectations exist?
62. `Q-P062` What filters, sorting, saved views, and pagination are required?
63. `Q-P063` How must search results be filtered or masked based on permissions?
64. `Q-P064` What reports serve which decisions, and for whom?
65. `Q-P065` Do reports need to be real-time, near-real-time, or batch-scheduled?
66. `Q-P066` What are the exact definitions, denominators, and time zones of metrics?
67. `Q-P067` What limits and masking apply to CSV/Excel/PDF exports?
68. `Q-P068` What events trigger a notification?
69. `Q-P069` What are the notification channels (in-app, email, SMS, push, webhook)?
70. `Q-P070` How can users opt-in/out, mute, or choose notification frequency?
71. `Q-P071` How are failed/rebounded notifications retried and monitored?
72. `Q-P072` Do notification contents use templates, localization, and approval workflows?

## G. Administration, Support, and Controls (Q-P073–Q-P084)

73. `Q-P073` What users, roles, configs, content, or reference data must admins manage?
74. `Q-P074` Which admin actions require maker-checker (dual control) or re-authentication?
75. `Q-P075` Is support permitted to impersonate users, and how is this audited?
76. `Q-P076` What timelines or logs must support see to diagnose issues?
77. `Q-P077` Are feature flags or tenant/market-specific configurations required?
78. `Q-P078` Who can modify configs, and do changes require versioning or rollback?
79. `Q-P079` What is the account lifecycle (invite, activate, suspend, merge, close)?
80. `Q-P080` What is the organization, team, or tenant hierarchy and permissions structure?
81. `Q-P081` What level of data isolation is required between tenants?
82. `Q-P082` Which audit logs can admins view, and which are restricted to security officers?
83. `Q-P083` Is legal hold, data freezing, or e-discovery required?
84. `Q-P084` When support manually edits data, who must approve and who is notified?

## H. Edge Cases and Failure Behaviors (Q-P085–Q-P096)

85. `Q-P085` What happens when inputs are missing, malformed, or exceed limits?
86. `Q-P086` What happens when a session expires in the middle of a long multi-step process?
87. `Q-P087` What happens when a payment/request succeeds but the callback fails?
88. `Q-P088` What happens when a user refreshes, clicks back, or closes the tab during an operation?
89. `Q-P089` What happens when a client goes offline and then reconnects?
90. `Q-P090` What happens when clocks, time zones, or daylight-saving times differ?
91. `Q-P091` What happens when a related entity is deleted or suspended?
92. `Q-P092` What happens when a malicious file or extremely large payload is uploaded?
93. `Q-P093` What happens when a dependency returns results slowly, incorrectly, or partially?
94. `Q-P094` What happens when a batch operation only partially succeeds?
95. `Q-P095` How do users recover from errors without creating duplicate data?
96. `Q-P096` Which errors require immediate alerts to users, support, operations, or security?

## I. Mobile, Offline, and Multi-Market (Q-P097–Q-P108)

97. `Q-P097` Are responsive web pages or native mobile capabilities required?
98. `Q-P098` Are push notifications, camera, GPS, biometrics, or deep links needed?
99. `Q-P099` Which functionalities must work offline?
100. `Q-P100` How are offline data synced and conflicts resolved?
101. `Q-P101` What minimum OS versions or device models are supported?
102. `Q-P102` Are there bandwidth, storage, or battery constraints?
103. `Q-P103` What languages, locales, time zones, calendars, and number formats must be supported?
104. `Q-P104` Who provides and reviews translated content, and what is the fallback?
105. `Q-P105` How do business rules differ by country or market?
106. `Q-P106` How do currencies, taxes, addresses, phones, and identity formats differ?
107. `Q-P107` Are there feature rollouts limited to specific regions or tenants?
108. `Q-P108` What app store review or distribution constraints affect the release?

## J. AI, Automation, and Automated Decisions (Q-P109–Q-P120)

109. `Q-P109` What decisions is the AI/automation supporting, for whom, and what is the value?
110. `Q-P110` Does the AI only suggest options or is it authorized to take action?
111. `Q-P111` Where is a human-in-the-loop mandatory?
112. `Q-P112` How are input data, usage rights, and quality validated?
113. `Q-P113` What are the consequences of incorrect outputs, and what is the acceptable error rate?
114. `Q-P114` What are the ground truth datasets, evaluation sets, and quality metrics?
115. `Q-P115` What level of explanation, citations, confidence scores, or prompt/output auditing is required?
116. `Q-P116` How are sensitive, toxic, or prompt-injection inputs handled?
117. `Q-P117` Which models/vendors are permitted, and can data be used for training?
118. `Q-P118` What are the cost, latency, token quota limits, and fallback models?
119. `Q-P119` Who reviews model drift, bias, failures, and updates evaluations?
120. `Q-P120` How can users contest, correct, or opt-out of AI-driven decisions?
