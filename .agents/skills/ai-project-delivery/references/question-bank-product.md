# Product and workflow question bank — 120 câu có điều kiện

Chỉ hỏi nhóm áp dụng cho sản phẩm. Dùng câu trả lời để tạo FR/UC/US, data rules, UX spec, integration contract và acceptance criteria.

## A. Hành trình và capability (Q-P001–Q-P012)

1. `Q-P001` Điểm bắt đầu tự nhiên của hành trình người dùng là gì?
2. `Q-P002` Người dùng cần biết gì trước khi bắt đầu?
3. `Q-P003` Hành động đầu tiên tạo ra giá trị là gì?
4. `Q-P004` Time-to-first-value chấp nhận được là bao lâu?
5. `Q-P005` Người dùng mới khác người dùng quay lại thế nào?
6. `Q-P006` Bước nào bắt buộc, bước nào có thể bỏ qua hoặc làm sau?
7. `Q-P007` Người dùng có thể lưu nháp và tiếp tục trên thiết bị khác không?
8. `Q-P008` Ai có thể hành động thay mặt người khác và theo quyền nào?
9. `Q-P009` Hành trình nào cần self-service, hành trình nào cần nhân viên hỗ trợ?
10. `Q-P010` Thời điểm nào cần xác nhận kép hoặc cảnh báo hậu quả?
11. `Q-P011` Hành trình thành công kết thúc bằng kết quả/bằng chứng gì?
12. `Q-P012` Sau khi hoàn tất, next best action là gì?

## B. Workflow, trạng thái và đồng thời (Q-P013–Q-P024)

13. `Q-P013` Entity nghiệp vụ chính có những trạng thái nào?
14. `Q-P014` Transition hợp lệ và không hợp lệ là gì?
15. `Q-P015` Ai hoặc sự kiện nào được phép kích hoạt từng transition?
16. `Q-P016` Transition nào cần lý do, comment hoặc attachment?
17. `Q-P017` Có trạng thái tạm, timeout, expired, archived hoặc deleted không?
18. `Q-P018` Nếu hai người sửa cùng lúc, hệ thống ưu tiên hay phát hiện xung đột thế nào?
19. `Q-P019` Hành động nào phải idempotent khi người dùng bấm/gửi lại?
20. `Q-P020` Có cần scheduled job, queue hoặc xử lý nền không?
21. `Q-P021` Job thất bại được retry bao nhiêu lần và ai được báo?
22. `Q-P022` Có thao tác hàng loạt không, và giới hạn an toàn là gì?
23. `Q-P023` Undo/reversal nào cần hỗ trợ và trong thời hạn bao lâu?
24. `Q-P024` Lịch sử trạng thái phải giữ chi tiết đến mức nào?

## C. UX, nội dung và accessibility (Q-P025–Q-P036)

25. `Q-P025` Giao diện chính là web, mobile, desktop, chat, API hay kết hợp?
26. `Q-P026` Ba màn hình/tác vụ được dùng thường xuyên nhất là gì?
27. `Q-P027` Người dùng ưu tiên tốc độ, hướng dẫn chi tiết hay mật độ thông tin?
28. `Q-P028` Có design system, brand guideline hoặc component library sẵn không?
29. `Q-P029` Tone of voice và thuật ngữ bắt buộc/cấm là gì?
30. `Q-P030` Cần hỗ trợ bàn phím, screen reader, contrast hoặc cỡ chữ ở mức nào?
31. `Q-P031` Validation nên xảy ra tức thì, khi rời field hay khi submit?
32. `Q-P032` Error message cần hướng dẫn phục hồi đến mức nào?
33. `Q-P033` Empty/loading/offline/permission-denied states hiển thị ra sao?
34. `Q-P034` Dữ liệu nhạy cảm cần mask/reveal/copy theo quy tắc nào?
35. `Q-P035` Có cần print/export/share/deep-link không?
36. `Q-P036` Usability success sẽ được đo bằng task completion, time, error rate hay SUS?

## D. Dữ liệu nghiệp vụ (Q-P037–Q-P048)

37. `Q-P037` Những entity cốt lõi và quan hệ của chúng là gì?
38. `Q-P038` Trường nào bắt buộc, optional, derived hoặc immutable?
39. `Q-P039` Identifier nào phải duy nhất và ở phạm vi nào?
40. `Q-P040` Nguồn sự thật cho từng dữ liệu là hệ thống nào?
41. `Q-P041` Ai được tạo, đọc, sửa, xóa và xuất từng loại dữ liệu?
42. `Q-P042` Dữ liệu thay đổi cần version/audit đến mức nào?
43. `Q-P043` Có dữ liệu hiệu lực theo thời gian hoặc cần lịch sử không?
44. `Q-P044` Quy tắc validation, normalization và duplicate detection là gì?
45. `Q-P045` Attachment hỗ trợ loại, kích thước, số lượng và scan malware thế nào?
46. `Q-P046` Import/export cần định dạng, mapping và xử lý lỗi ra sao?
47. `Q-P047` Dữ liệu seed/reference do ai quản lý và cập nhật thế nào?
48. `Q-P048` Khi dữ liệu mâu thuẫn giữa các nguồn, quy tắc reconcile là gì?

## E. Tích hợp và API sản phẩm (Q-P049–Q-P060)

49. `Q-P049` Hệ thống bên ngoài nào gửi dữ liệu vào hoặc nhận dữ liệu ra?
50. `Q-P050` Integration là synchronous API, webhook, file, event, email hay thao tác tay?
51. `Q-P051` Ai sở hữu contract và sandbox của từng integration?
52. `Q-P052` Authentication/authorization với đối tác dùng cơ chế gì?
53. `Q-P053` Quota/rate limit và chi phí theo lượt gọi là bao nhiêu?
54. `Q-P054` Timeout, retry, backoff và circuit-breaker mong muốn là gì?
55. `Q-P055` Làm sao phát hiện/khử request hoặc event trùng?
56. `Q-P056` Ordering và eventual consistency có chấp nhận được không?
57. `Q-P057` Schema/version compatibility được quản lý thế nào?
58. `Q-P058` Khi đối tác downtime, người dùng thấy gì và fallback ra sao?
59. `Q-P059` Cần reconcile/audit integration bằng báo cáo nào?
60. `Q-P060` Dữ liệu nào tuyệt đối không được gửi sang bên thứ ba?

## F. Tìm kiếm, báo cáo và thông báo (Q-P061–Q-P072)

61. `Q-P061` Người dùng tìm theo trường nào và kỳ vọng fuzzy/full-text ra sao?
62. `Q-P062` Filter, sort, saved view và pagination nào cần có?
63. `Q-P063` Search result cần phân quyền/ẩn dữ liệu thế nào?
64. `Q-P064` Báo cáo nào phục vụ quyết định nào và cho ai?
65. `Q-P065` Báo cáo cần realtime, near-real-time hay batch theo lịch?
66. `Q-P066` Metric có định nghĩa/denominator/timezone chính xác thế nào?
67. `Q-P067` Export CSV/Excel/PDF có giới hạn và masking gì?
68. `Q-P068` Sự kiện nào cần notification?
69. `Q-P069` Kênh notification là in-app, email, SMS, push hay webhook?
70. `Q-P070` Người dùng được opt-in/out, mute hoặc chọn tần suất ra sao?
71. `Q-P071` Notification thất bại/rebound được retry và theo dõi thế nào?
72. `Q-P072` Nội dung notification có template, localization và approval không?

## G. Admin, support và kiểm soát (Q-P073–Q-P084)

73. `Q-P073` Admin cần quản lý user, role, config, content hay reference data nào?
74. `Q-P074` Admin action nào cần maker-checker hoặc re-authentication?
75. `Q-P075` Support được phép impersonate người dùng không và phải audit thế nào?
76. `Q-P076` Support cần xem timeline/log nào để chẩn đoán?
77. `Q-P077` Có cần feature flag hoặc cấu hình theo tenant/market không?
78. `Q-P078` Ai được thay đổi config và thay đổi có cần version/rollback không?
79. `Q-P079` Account lifecycle gồm invite, activate, suspend, merge, close ra sao?
80. `Q-P080` Có tổ chức/team/tenant và phân cấp quyền như thế nào?
81. `Q-P081` Dữ liệu giữa tenant phải cách ly ở mức nào?
82. `Q-P082` Audit log nào admin xem được và audit log nào chỉ security xem?
83. `Q-P083` Có cần legal hold, freeze hoặc e-discovery không?
84. `Q-P084` Khi support sửa dữ liệu, cần approval và thông báo cho ai?

## H. Edge case và hành vi lỗi (Q-P085–Q-P096)

85. `Q-P085` Điều gì xảy ra khi input thiếu, sai định dạng hoặc vượt giới hạn?
86. `Q-P086` Điều gì xảy ra khi session hết hạn giữa một quy trình dài?
87. `Q-P087` Điều gì xảy ra khi payment/request thành công nhưng callback thất bại?
88. `Q-P088` Điều gì xảy ra khi user refresh/back/đóng tab giữa thao tác?
89. `Q-P089` Điều gì xảy ra khi client offline rồi kết nối lại?
90. `Q-P090` Điều gì xảy ra khi clock/timezone/daylight-saving khác nhau?
91. `Q-P091` Điều gì xảy ra khi entity liên quan bị xóa/suspend?
92. `Q-P092` Điều gì xảy ra khi file độc hại hoặc dữ liệu cực lớn được gửi lên?
93. `Q-P093` Điều gì xảy ra khi dependency trả kết quả chậm, sai hoặc một phần?
94. `Q-P094` Điều gì xảy ra khi một batch chỉ thành công một phần?
95. `Q-P095` Người dùng phục hồi từ lỗi mà không tạo dữ liệu trùng thế nào?
96. `Q-P096` Error nào cần báo user, support, operator hoặc security ngay?

## I. Mobile, offline và đa thị trường (Q-P097–Q-P108)

97. `Q-P097` Có cần responsive web hay native mobile capability nào?
98. `Q-P098` Push notification, camera, GPS, biometric hoặc deep link có cần không?
99. `Q-P099` Chức năng nào phải chạy offline?
100. `Q-P100` Dữ liệu offline sync và conflict resolution thế nào?
101. `Q-P101` Hỗ trợ phiên bản OS/device tối thiểu nào?
102. `Q-P102` Có hạn chế bandwidth, storage hoặc battery không?
103. `Q-P103` Ngôn ngữ, locale, timezone, calendar và number format nào cần hỗ trợ?
104. `Q-P104` Nội dung dịch do ai cung cấp/review và fallback ra sao?
105. `Q-P105` Quy tắc nghiệp vụ khác nhau theo quốc gia/thị trường nào?
106. `Q-P106` Currency, tax, address, phone và identity format khác nhau ra sao?
107. `Q-P107` Có feature rollout khác nhau theo vùng/tenant không?
108. `Q-P108` Store review/distribution constraint nào ảnh hưởng release?

## J. AI, tự động hóa và quyết định máy (Q-P109–Q-P120)

109. `Q-P109` AI/automation đang hỗ trợ quyết định nào, cho ai và tạo giá trị gì?
110. `Q-P110` AI chỉ gợi ý hay được phép tự hành động?
111. `Q-P111` Human-in-the-loop bắt buộc ở điểm nào?
112. `Q-P112` Dữ liệu đầu vào, quyền sử dụng và chất lượng được xác nhận thế nào?
113. `Q-P113` Output sai gây hậu quả gì và mức sai chấp nhận được là bao nhiêu?
114. `Q-P114` Ground truth/evaluation set và metric chất lượng là gì?
115. `Q-P115` Cần giải thích, citation, confidence hoặc audit prompt/output đến mức nào?
116. `Q-P116` Nội dung nhạy cảm, độc hại hoặc prompt injection được xử lý ra sao?
117. `Q-P117` Model/vendor nào được phép, dữ liệu có được dùng để train không?
118. `Q-P118` Cost/latency/token quota và fallback model là gì?
119. `Q-P119` Ai review drift, bias, failure và cập nhật evaluation?
120. `Q-P120` Người dùng có thể contest, sửa hoặc opt-out quyết định AI thế nào?
