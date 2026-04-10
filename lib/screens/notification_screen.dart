
// // // lib/screens/notification_screen.dart

// // import 'package:flutter/material.dart';
// // import '../constants/app_colors.dart';
// // import 'notification_setting_screen.dart';

// // //import 'message_store.dart';
// // import 'notification_store.dart';

// // class NotificationScreen extends StatefulWidget {
// //   const NotificationScreen({super.key});

// //   @override
// //   State<NotificationScreen> createState() => _NotificationScreenState();
// // }

// // class _NotificationScreenState extends State<NotificationScreen>
// //     with SingleTickerProviderStateMixin, WidgetsBindingObserver {

// //   late TabController _tabController;
// //   String _searchQuery = '';

// //   // ── Use shared NotificationStore so other screens can add to it ──
// //   List<Map<String, dynamic>> get _todayNotifs => NotificationStore.todayNotifs;
// //   List<Map<String, dynamic>> get _thisWeekNotifs => NotificationStore.thisWeekNotifs;

// //   List<Map<String, dynamic>> get _filteredToday => _searchQuery.isEmpty
// //       ? _todayNotifs
// //       : _todayNotifs.where((n) =>
// //           (n['title'] as String).toLowerCase().contains(_searchQuery.toLowerCase()) ||
// //           (n['subtitle'] as String).toLowerCase().contains(_searchQuery.toLowerCase())).toList();

// //   List<Map<String, dynamic>> get _filteredThisWeek => _searchQuery.isEmpty
// //       ? _thisWeekNotifs
// //       : _thisWeekNotifs.where((n) =>
// //           (n['title'] as String).toLowerCase().contains(_searchQuery.toLowerCase()) ||
// //           (n['subtitle'] as String).toLowerCase().contains(_searchQuery.toLowerCase())).toList();

// //   int get _unreadCount => _todayNotifs.where((n) => n['unread'] == true).length;
// //  // int get _unreadMessages => MessageStore.messages.where((m) => !(m['hasReply'] as bool)).length;

// //   @override
// //   void didChangeAppLifecycleState(AppLifecycleState state) {
// //     if (state == AppLifecycleState.resumed) setState(() {});
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     WidgetsBinding.instance.addObserver(this);
// //    // _tabController = TabController(length: 2, vsync: this);
// //     _tabController = TabController(length: 1, vsync: this);
// //     _tabController.addListener(() => setState(() {}));
// //   }

// //   @override
// //   void dispose() {
// //     WidgetsBinding.instance.removeObserver(this);
// //     _tabController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return ValueListenableBuilder<int>(
// //       valueListenable: notificationNotifier,
// //       builder: (context, _, __) => Scaffold(
// //         backgroundColor: const Color(0xFFF5F7FA),
// //         body: SafeArea(
// //           child: Column(
// //             children: [
// //               _appBar(context),
// //               _tabBar(),
// //               Expanded(
// //                 child: TabBarView(
// //                   controller: _tabController,
// //                   children: [
// //                     _notificationsTab(),
// //                    // _messagesTab(context),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   // ════════════════════════════════════════
// //   //  APP BAR
// //   // ════════════════════════════════════════
// //   Widget _appBar(BuildContext context) => Container(
// //         color: kBlue,
// //         padding: const EdgeInsets.fromLTRB(4, 6, 14, 10),
// //         child: Row(
// //           children: [
// //             IconButton(
// //               icon: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.white),
// //               onPressed: () => Navigator.pop(context),
// //             ),
// //             Expanded(
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   const Text('Notifications',
// //                       style: TextStyle(
// //                           fontSize: 17,
// //                           fontWeight: FontWeight.w800,
// //                           color: Colors.white)),
// //                   if (_unreadCount > 0) ...[
// //                     const SizedBox(width: 6),
// //                     Container(
// //                       width: 20, height: 20,
// //                       decoration: const BoxDecoration(
// //                           color: Color(0xFFE11D48), shape: BoxShape.circle),
// //                       child: Center(
// //                         child: Text('$_unreadCount',
// //                             style: const TextStyle(
// //                                 color: Colors.white,
// //                                 fontSize: 11,
// //                                 fontWeight: FontWeight.bold)),
// //                       ),
// //                     ),
// //                   ],
// //                 ],
// //               ),
// //             ),
// //             GestureDetector(
// //               onTap: () => Navigator.push(context,
// //                   MaterialPageRoute(builder: (_) => const NotificationSettingScreen())),
// //               child: const Padding(
// //                 padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
// //                 child: Icon(Icons.tune_rounded, color: Colors.white, size: 22),
// //               ),
// //             ),
// //           ],
// //         ),
// //       );

// //   // ════════════════════════════════════════
// //   //  TAB BAR
// //   // ════════════════════════════════════════
// //   Widget _tabBar() => Container(
// //         color: Colors.white,
// //         child: TabBar(
// //           controller: _tabController,
// //           labelColor: kBlue,
// //           unselectedLabelColor: kGrey,
// //           indicatorColor: kBlue,
// //           indicatorWeight: 3,
// //           labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
// //           tabs: [
// //             Tab(
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   const Text('Notifications'),
// //                   if (_unreadCount > 0) ...[
// //                     const SizedBox(width: 6),
// //                     Container(
// //                       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
// //                       decoration: BoxDecoration(
// //                           color: const Color(0xFFE11D48),
// //                           borderRadius: BorderRadius.circular(10)),
// //                       child: Text('$_unreadCount',
// //                           style: const TextStyle(
// //                               color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
// //                     ),
// //                   ],
// //                 ],
// //               ),
// //             ),
// //             // Tab(
// //             //   child: Row(
// //             //     mainAxisAlignment: MainAxisAlignment.center,
// //             //     children: [
// //             //       const Text('Messages'),
// //             //       if (_unreadMessages > 0) ...[
// //             //         const SizedBox(width: 6),
// //             //         Container(
// //             //           padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
// //             //           decoration: BoxDecoration(
// //             //               color: const Color(0xFF16A34A),
// //             //               borderRadius: BorderRadius.circular(10)),
// //             //           child: Text('$_unreadMessages',
// //             //               style: const TextStyle(
// //             //                   color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
// //             //         ),
// //             //       ],
// //             //     ],
// //             //   ),
// //             // ),
// //           ],
// //         ),
// //       );

// //   // ════════════════════════════════════════
// //   //  NOTIFICATIONS TAB
// //   // ════════════════════════════════════════
// //   Widget _notificationsTab() => SingleChildScrollView(
// //         physics: const BouncingScrollPhysics(),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const SizedBox(height: 14),
// //             _searchBar(),
// //             const SizedBox(height: 14),
// //             if (_filteredToday.isNotEmpty) ...[
// //               _sectionLabel('Today'),
// //               const SizedBox(height: 8),
// //               ..._filteredToday.map((n) => _notifCard(n, context)),
// //             ],
// //             if (_filteredThisWeek.isNotEmpty) ...[
// //               const SizedBox(height: 8),
// //               _sectionLabel('This week'),
// //               const SizedBox(height: 8),
// //               ..._filteredThisWeek.map((n) => _notifCard(n, context)),
// //             ],
// //             if (_filteredToday.isEmpty && _filteredThisWeek.isEmpty)
// //               _emptyState('No notifications found', 'Try a different search keyword',
// //                   Icons.notifications_off_rounded),
// //             const SizedBox(height: 28),
// //           ],
// //         ),
// //       );

// //   // ════════════════════════════════════════
// //   //  MESSAGES TAB — buyer/seller conversations
// //   // ════════════════════════════════════════
// //   Widget _messagesTab(BuildContext context) {
// //     final msgs = MessageStore.messages;
// //     if (msgs.isEmpty) {
// //       return _emptyState(
// //           'No messages yet',
// //           'Message a seller from the marketplace to start chatting',
// //           Icons.chat_bubble_outline_rounded);
// //     }
// //     return ListView.separated(
// //       physics: const BouncingScrollPhysics(),
// //       padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
// //       itemCount: msgs.length,
// //       separatorBuilder: (_, __) => const SizedBox(height: 12),
// //       itemBuilder: (_, i) => _messageCard(context, msgs[i], i),
// //     );
// //   }

// //   // ════════════════════════════════════════
// //   //  MESSAGE CARD
// //   // ════════════════════════════════════════
// //   // Widget _messageCard(BuildContext context, Map<String, dynamic> m, int index) {
// //   //   final hasReply = m['hasReply'] as bool;
// //   //   return GestureDetector(
// //   //     onTap: () => _openChat(context, m, index),
// //   //     child: Container(
// //   //       padding: const EdgeInsets.all(14),
// //   //       decoration: BoxDecoration(
// //   //         color: Colors.white,
// //   //         borderRadius: BorderRadius.circular(16),
// //   //         border: Border.all(
// //   //             color: !hasReply
// //   //                 ? const Color(0xFF16A34A).withOpacity(0.3)
// //   //                 : const Color(0xFFEEF1F8)),
// //   //         boxShadow: [
// //   //           BoxShadow(
// //   //               color: Colors.black.withOpacity(0.05),
// //   //               blurRadius: 10,
// //   //               offset: const Offset(0, 3)),
// //   //         ],
// //   //       ),
// //   //       child: Row(
// //   //         crossAxisAlignment: CrossAxisAlignment.start,
// //   //         children: [
// //   //           // ── Product icon ──
// //   //           Container(
// //   //             width: 50, height: 50,
// //   //             decoration: BoxDecoration(
// //   //               color: m['bg'] as Color,
// //   //               borderRadius: BorderRadius.circular(13),
// //   //             ),
// //   //             child: Icon(m['icon'] as IconData,
// //   //                 size: 24, color: m['color'] as Color),
// //   //           ),
// //   //           const SizedBox(width: 12),

// //   //           Expanded(
// //   //             child: Column(
// //   //               crossAxisAlignment: CrossAxisAlignment.start,
// //   //               children: [
// //   //                 // Seller name + time
// //   //                 Row(
// //   //                   children: [
// //   //                     Expanded(
// //   //                       child: Text(m['seller'] as String,
// //   //                           style: const TextStyle(
// //   //                               fontSize: 13.5,
// //   //                               fontWeight: FontWeight.w700,
// //   //                               color: kBlack)),
// //   //                     ),
// //   //                     Text(m['time'] as String,
// //   //                         style: TextStyle(
// //   //                             fontSize: 11,
// //   //                             color: hasReply ? kGrey : const Color(0xFF16A34A),
// //   //                             fontWeight: hasReply ? FontWeight.w400 : FontWeight.w600)),
// //   //                   ],
// //   //                 ),
// //   //                 const SizedBox(height: 3),
// //   //                 // Product name
// //   //                 Row(
// //   //                   children: [
// //   //                     const Icon(Icons.local_hospital_rounded,
// //   //                         size: 11, color: kBlue),
// //   //                     const SizedBox(width: 4),
// //   //                     Expanded(
// //   //                       child: Text(m['product'] as String,
// //   //                           maxLines: 1,
// //   //                           overflow: TextOverflow.ellipsis,
// //   //                           style: const TextStyle(
// //   //                               fontSize: 11.5,
// //   //                               color: kBlue,
// //   //                               fontWeight: FontWeight.w600)),
// //   //                     ),
// //   //                     Text(m['price'] as String,
// //   //                         style: const TextStyle(
// //   //                             fontSize: 11,
// //   //                             color: kGrey,
// //   //                             fontWeight: FontWeight.w500)),
// //   //                   ],
// //   //                 ),
// //   //                 const SizedBox(height: 6),
// //   //                 // Last message preview
// //   //                 Container(
// //   //                   padding: const EdgeInsets.symmetric(
// //   //                       horizontal: 10, vertical: 7),
// //   //                   decoration: BoxDecoration(
// //   //                     color: const Color(0xFFF5F7FA),
// //   //                     borderRadius: BorderRadius.circular(10),
// //   //                   ),
// //   //                   child: Column(
// //   //                     crossAxisAlignment: CrossAxisAlignment.start,
// //   //                     children: [
// //   //                       // My message
// //   //                       Row(
// //   //                         crossAxisAlignment: CrossAxisAlignment.start,
// //   //                         children: [
// //   //                           const Text('You: ',
// //   //                               style: TextStyle(
// //   //                                   fontSize: 11.5,
// //   //                                   color: kBlue,
// //   //                                   fontWeight: FontWeight.w700)),
// //   //                           Expanded(
// //   //                             child: Text(m['myMessage'] as String,
// //   //                                 maxLines: 1,
// //   //                                 overflow: TextOverflow.ellipsis,
// //   //                                 style: const TextStyle(
// //   //                                     fontSize: 11.5, color: kGrey)),
// //   //                           ),
// //   //                         ],
// //   //                       ),
// //   //                       if (hasReply && (m['reply'] as String).isNotEmpty) ...[
// //   //                         const SizedBox(height: 4),
// //   //                         Row(
// //   //                           crossAxisAlignment: CrossAxisAlignment.start,
// //   //                           children: [
// //   //                             Text('${m['seller']}: ',
// //   //                                 style: const TextStyle(
// //   //                                     fontSize: 11.5,
// //   //                                     color: Color(0xFF16A34A),
// //   //                                     fontWeight: FontWeight.w700)),
// //   //                             Expanded(
// //   //                               child: Text(m['reply'] as String,
// //   //                                   maxLines: 1,
// //   //                                   overflow: TextOverflow.ellipsis,
// //   //                                   style: const TextStyle(
// //   //                                       fontSize: 11.5,
// //   //                                       color: kBlack,
// //   //                                       fontWeight: FontWeight.w500)),
// //   //                             ),
// //   //                           ],
// //   //                         ),
// //   //                       ],
// //   //                     ],
// //   //                   ),
// //   //                 ),
// //   //                 const SizedBox(height: 8),
// //   //                 // Status badge
// //   //                 Row(
// //   //                   children: [
// //   //                     Container(
// //   //                       padding: const EdgeInsets.symmetric(
// //   //                           horizontal: 8, vertical: 3),
// //   //                       decoration: BoxDecoration(
// //   //                         color: hasReply
// //   //                             ? const Color(0xFFDCFCE7)
// //   //                             : const Color(0xFFFEF3C7),
// //   //                         borderRadius: BorderRadius.circular(6),
// //   //                       ),
// //   //                       child: Text(
// //   //                         hasReply ? '✓ Seller replied' : '⏳ Awaiting reply',
// //   //                         style: TextStyle(
// //   //                             fontSize: 10,
// //   //                             fontWeight: FontWeight.w700,
// //   //                             color: hasReply
// //   //                                 ? const Color(0xFF16A34A)
// //   //                                 : const Color(0xFFD97706)),
// //   //                       ),
// //   //                     ),
// //   //                     const Spacer(),
// //   //                     const Text('Tap to chat →',
// //   //                         style: TextStyle(
// //   //                             fontSize: 11,
// //   //                             color: kBlue,
// //   //                             fontWeight: FontWeight.w600)),
// //   //                   ],
// //   //                 ),
// //   //               ],
// //   //             ),
// //   //           ),
// //   //         ],
// //   //       ),
// //   //     ),
// //   //   );
// //   // }

// //   // ════════════════════════════════════════
// //   //  OPEN CHAT
// //   // ════════════════════════════════════════
// //   // void _openChat(BuildContext context, Map<String, dynamic> m, int index) {
// //   //   Navigator.push(context, MaterialPageRoute(
// //   //     builder: (_) => _ChatScreen(conversation: m, onMessageSent: (msg) {
// //   //       setState(() {
// //   //         MessageStore.messages[index]['myMessage'] = msg;
// //   //       });
// //   //     }),
// //   //   ));
// //   // }

// //   // ════════════════════════════════════════
// //   //  SEARCH BAR
// //   // ════════════════════════════════════════
// //   Widget _searchBar() => Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 16),
// //         child: Container(
// //           height: 46,
// //           decoration: BoxDecoration(
// //             color: Colors.white,
// //             borderRadius: BorderRadius.circular(12),
// //             boxShadow: [
// //               BoxShadow(color: Colors.black.withOpacity(0.07),
// //                   blurRadius: 8, offset: const Offset(0, 2)),
// //             ],
// //           ),
// //           child: Row(
// //             children: [
// //               const SizedBox(width: 14),
// //               const Icon(Icons.search_rounded, color: kGrey, size: 20),
// //               const SizedBox(width: 10),
// //               Expanded(
// //                 child: TextField(
// //                   onChanged: (v) => setState(() => _searchQuery = v),
// //                   style: const TextStyle(fontSize: 13, color: kBlack),
// //                   decoration: const InputDecoration(
// //                     hintText: 'Search notifications...',
// //                     hintStyle: TextStyle(color: kGrey, fontSize: 13),
// //                     border: InputBorder.none,
// //                     isDense: true,
// //                     contentPadding: EdgeInsets.zero,
// //                   ),
// //                 ),
// //               ),
// //               if (_searchQuery.isNotEmpty)
// //                 GestureDetector(
// //                   onTap: () => setState(() => _searchQuery = ''),
// //                   child: const Padding(
// //                     padding: EdgeInsets.only(right: 12),
// //                     child: Icon(Icons.close_rounded, color: kGrey, size: 18),
// //                   ),
// //                 ),
// //             ],
// //           ),
// //         ),
// //       );

// //   Widget _sectionLabel(String label) => Padding(
// //         padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
// //         child: Text(label,
// //             style: const TextStyle(
// //                 fontSize: 13,
// //                 fontWeight: FontWeight.w700,
// //                 color: kGrey,
// //                 letterSpacing: 0.3)),
// //       );

// //   Widget _notifCard(Map<String, dynamic> n, BuildContext context) =>
// //       GestureDetector(
// //         onTap: () {
// //           setState(() => n['unread'] = false);
// //           showDialog(
// //             context: context,
// //             builder: (_) => Dialog(
// //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// //               backgroundColor: Colors.white,
// //               child: Padding(
// //                 padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
// //                 child: Column(
// //                   mainAxisSize: MainAxisSize.min,
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     const Text('Message',
// //                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: kBlue)),
// //                     const SizedBox(height: 16),
// //                     Text('${n['subtitle']}\n\n${n['subtitle']} ${n['subtitle']}',
// //                         style: const TextStyle(fontSize: 13.5, color: kGrey, height: 1.6)),
// //                     const SizedBox(height: 24),
// //                     Center(
// //                       child: GestureDetector(
// //                         onTap: () => Navigator.pop(context),
// //                         child: const Text('Close',
// //                             style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: kBlue)),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 4),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           );
// //         },
// //         child: Container(
// //           margin: const EdgeInsets.fromLTRB(16, 6, 16, 0),
// //           padding: const EdgeInsets.all(14),
// //           decoration: BoxDecoration(
// //             color: n['unread'] == true ? Colors.white : Colors.white.withOpacity(0.85),
// //             borderRadius: BorderRadius.circular(16),
// //             border: Border.all(
// //                 color: n['unread'] == true
// //                     ? kBlue.withOpacity(0.15)
// //                     : kBorderGrey),
// //             boxShadow: [
// //               BoxShadow(
// //                   color: n['unread'] == true
// //                       ? kBlue.withOpacity(0.08)
// //                       : Colors.black.withOpacity(0.04),
// //                   blurRadius: 10,
// //                   offset: const Offset(0, 3)),
// //             ],
// //           ),
// //           child: Row(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Container(
// //                 width: 46, height: 46,
// //                 decoration: BoxDecoration(
// //                     color: n['iconBg'] as Color,
// //                     borderRadius: BorderRadius.circular(13)),
// //                 child: Icon(n['icon'] as IconData,
// //                     color: n['iconColor'] as Color, size: 22),
// //               ),
// //               const SizedBox(width: 12),
// //               Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Row(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Expanded(
// //                           child: Text(n['title'] as String,
// //                               style: TextStyle(
// //                                   fontSize: 13.5,
// //                                   fontWeight: n['unread'] == true
// //                                       ? FontWeight.w700
// //                                       : FontWeight.w600,
// //                                   color: kBlack,
// //                                   height: 1.3)),
// //                         ),
// //                         const SizedBox(width: 8),
// //                         Text(n['time'] as String,
// //                             style: const TextStyle(
// //                                 fontSize: 10.5, color: kGrey)),
// //                       ],
// //                     ),
// //                     const SizedBox(height: 4),
// //                     Text(n['subtitle'] as String,
// //                         maxLines: 2,
// //                         overflow: TextOverflow.ellipsis,
// //                         style: const TextStyle(fontSize: 12, color: kGrey, height: 1.4)),
// //                   ],
// //                 ),
// //               ),
// //               if (n['unread'] == true)
// //                 Container(
// //                   margin: const EdgeInsets.only(left: 6, top: 2),
// //                   width: 8, height: 8,
// //                   decoration: const BoxDecoration(
// //                       color: Color(0xFFE11D48), shape: BoxShape.circle),
// //                 ),
// //             ],
// //           ),
// //         ),
// //       );

// //   Widget _emptyState(String title, String subtitle, IconData icon) => Padding(
// //         padding: const EdgeInsets.only(top: 60),
// //         child: Center(
// //           child: Column(
// //             children: [
// //               Container(
// //                 width: 70, height: 70,
// //                 decoration: BoxDecoration(color: kBlueLite, shape: BoxShape.circle),
// //                 child: Icon(icon, color: kBlue, size: 32)),
// //               const SizedBox(height: 16),
// //               Text(title,
// //                   style: const TextStyle(
// //                       fontSize: 15, fontWeight: FontWeight.w700, color: kBlack)),
// //               const SizedBox(height: 6),
// //               Text(subtitle,
// //                   textAlign: TextAlign.center,
// //                   style: const TextStyle(fontSize: 12, color: kGrey)),
// //             ],
// //           ),
// //         ),
// //       );
// // }

// // // ════════════════════════════════════════
// // //  CHAT SCREEN
// // // ════════════════════════════════════════
// // // class _ChatScreen extends StatefulWidget {
// // //   final Map<String, dynamic> conversation;
// // //   final Function(String) onMessageSent;
// // //   const _ChatScreen({required this.conversation, required this.onMessageSent});

// // //   @override
// // //   State<_ChatScreen> createState() => _ChatScreenState();
// // // }

// // // class _ChatScreenState extends State<_ChatScreen> {
// // //   final _msgCtrl    = TextEditingController();
// // //   final _scrollCtrl = ScrollController();
// // //   late List<Map<String, dynamic>> _messages;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _messages = [
// // //       {
// // //         'text':  widget.conversation['myMessage'],
// // //         'isMe':  true,
// // //         'time':  widget.conversation['time'],
// // //       },
// // //       if ((widget.conversation['reply'] as String).isNotEmpty)
// // //         {
// // //           'text':  widget.conversation['reply'],
// // //           'isMe':  false,
// // //           'time':  widget.conversation['time'],
// // //         },
// // //     ];
// // //   }

// // //   void _send() {
// // //     if (_msgCtrl.text.trim().isEmpty) return;
// // //     final msg = _msgCtrl.text.trim();
// // //     setState(() {
// // //       _messages.add({'text': msg, 'isMe': true, 'time': 'Just now'});
// // //       _msgCtrl.clear();
// // //     });
// // //     widget.onMessageSent(msg);
// // //     Future.delayed(const Duration(milliseconds: 100), () {
// // //       if (_scrollCtrl.hasClients) {
// // //         _scrollCtrl.animateTo(
// // //           _scrollCtrl.position.maxScrollExtent,
// // //           duration: const Duration(milliseconds: 300),
// // //           curve: Curves.easeOut,
// // //         );
// // //       }
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: const Color(0xFFF5F7FA),
// // //       body: SafeArea(
// // //         child: Column(
// // //           children: [
// // //             // ── App bar ──
// // //             Container(
// // //               decoration: const BoxDecoration(
// // //                 gradient: LinearGradient(
// // //                     colors: [kBlue, Color(0xFF1A73E8)],
// // //                     begin: Alignment.centerLeft,
// // //                     end: Alignment.centerRight),
// // //               ),
// // //               padding: const EdgeInsets.fromLTRB(4, 6, 14, 10),
// // //               child: Row(
// // //                 children: [
// // //                   IconButton(
// // //                     icon: const Icon(Icons.arrow_back_ios,
// // //                         size: 18, color: Colors.white),
// // //                     onPressed: () => Navigator.pop(context),
// // //                   ),
// // //                   Container(
// // //                     width: 38, height: 38,
// // //                     decoration: BoxDecoration(
// // //                       color: widget.conversation['bg'] as Color,
// // //                       shape: BoxShape.circle,
// // //                     ),
// // //                     child: Icon(widget.conversation['icon'] as IconData,
// // //                         size: 20, color: widget.conversation['color'] as Color),
// // //                   ),
// // //                   const SizedBox(width: 10),
// // //                   Expanded(
// // //                     child: Column(
// // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // //                       children: [
// // //                         Text(widget.conversation['seller'] as String,
// // //                             style: const TextStyle(
// // //                                 fontSize: 15,
// // //                                 fontWeight: FontWeight.w800,
// // //                                 color: Colors.white)),
// // //                         Text(widget.conversation['product'] as String,
// // //                             maxLines: 1,
// // //                             overflow: TextOverflow.ellipsis,
// // //                             style: const TextStyle(
// // //                                 fontSize: 11, color: Colors.white70)),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),

// // //             // ── Product banner ──
// // //             Container(
// // //               margin: const EdgeInsets.all(12),
// // //               padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
// // //               decoration: BoxDecoration(
// // //                 color: Colors.white,
// // //                 borderRadius: BorderRadius.circular(12),
// // //                 border: Border.all(color: kBorderGrey),
// // //               ),
// // //               child: Row(
// // //                 children: [
// // //                   const Icon(Icons.local_hospital_rounded, color: kBlue, size: 16),
// // //                   const SizedBox(width: 8),
// // //                   Expanded(
// // //                     child: Text(widget.conversation['product'] as String,
// // //                         style: const TextStyle(
// // //                             fontSize: 12, fontWeight: FontWeight.w700, color: kBlack)),
// // //                   ),
// // //                   Text(widget.conversation['price'] as String,
// // //                       style: const TextStyle(
// // //                           fontSize: 12, color: kBlue, fontWeight: FontWeight.w700)),
// // //                 ],
// // //               ),
// // //             ),

// // //             // ── Messages ──
// // //             Expanded(
// // //               child: ListView.builder(
// // //                 controller: _scrollCtrl,
// // //                 physics: const BouncingScrollPhysics(),
// // //                 padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
// // //                 itemCount: _messages.length,
// // //                 itemBuilder: (_, i) {
// // //                   final m = _messages[i];
// // //                   final isMe = m['isMe'] as bool;
// // //                   return Align(
// // //                     alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
// // //                     child: Container(
// // //                       constraints: BoxConstraints(
// // //                           maxWidth: MediaQuery.of(context).size.width * 0.72),
// // //                       margin: const EdgeInsets.only(bottom: 10),
// // //                       padding: const EdgeInsets.symmetric(
// // //                           horizontal: 14, vertical: 10),
// // //                       decoration: BoxDecoration(
// // //                         color: isMe ? kBlue : Colors.white,
// // //                         borderRadius: BorderRadius.only(
// // //                           topLeft: const Radius.circular(16),
// // //                           topRight: const Radius.circular(16),
// // //                           bottomLeft: Radius.circular(isMe ? 16 : 4),
// // //                           bottomRight: Radius.circular(isMe ? 4 : 16),
// // //                         ),
// // //                         boxShadow: [
// // //                           BoxShadow(color: Colors.black.withOpacity(0.06),
// // //                               blurRadius: 6, offset: const Offset(0, 2)),
// // //                         ],
// // //                       ),
// // //                       child: Column(
// // //                         crossAxisAlignment: isMe
// // //                             ? CrossAxisAlignment.end
// // //                             : CrossAxisAlignment.start,
// // //                         children: [
// // //                           Text(m['text'] as String,
// // //                               style: TextStyle(
// // //                                   fontSize: 13.5,
// // //                                   color: isMe ? Colors.white : kBlack,
// // //                                   height: 1.4)),
// // //                           const SizedBox(height: 4),
// // //                           Row(
// // //                             mainAxisSize: MainAxisSize.min,
// // //                             children: [
// // //                               Text(m['time'] as String,
// // //                                   style: TextStyle(
// // //                                       fontSize: 10,
// // //                                       color: isMe ? Colors.white60 : kGrey)),
// // //                               if (isMe) ...[
// // //                                 const SizedBox(width: 4),
// // //                                 const Icon(Icons.done_all_rounded,
// // //                                     size: 12, color: Colors.white60),
// // //                               ],
// // //                             ],
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //               ),
// // //             ),

// // //             // ── Input ──
// // //             Container(
// // //               color: Colors.white,
// // //               padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
// // //               child: Row(
// // //                 children: [
// // //                   Expanded(
// // //                     child: Container(
// // //                       decoration: BoxDecoration(
// // //                         color: const Color(0xFFF5F7FA),
// // //                         borderRadius: BorderRadius.circular(24),
// // //                         border: Border.all(color: kBorderGrey),
// // //                       ),
// // //                       child: Row(
// // //                         children: [
// // //                           const SizedBox(width: 14),
// // //                           Expanded(
// // //                             child: TextField(
// // //                               controller: _msgCtrl,
// // //                               style: const TextStyle(fontSize: 13, color: kBlack),
// // //                               decoration: const InputDecoration(
// // //                                 hintText: 'Type a message...',
// // //                                 hintStyle: TextStyle(
// // //                                     color: Color(0xFFB0BEC5), fontSize: 13),
// // //                                 border: InputBorder.none,
// // //                                 isDense: true,
// // //                                 contentPadding:
// // //                                     EdgeInsets.symmetric(vertical: 10),
// // //                               ),
// // //                             ),
// // //                           ),
// // //                           const SizedBox(width: 8),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   const SizedBox(width: 8),
// // //                   GestureDetector(
// // //                     onTap: _send,
// // //                     child: Container(
// // //                       width: 46, height: 46,
// // //                       decoration: BoxDecoration(
// // //                         color: kBlue,
// // //                         shape: BoxShape.circle,
// // //                         boxShadow: [
// // //                           BoxShadow(color: kBlue.withOpacity(0.35),
// // //                               blurRadius: 10, offset: const Offset(0, 3)),
// // //                         ],
// // //                       ),
// // //                       child: const Icon(Icons.send_rounded,
// // //                           color: Colors.white, size: 20),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }












// // lib/screens/notification_screen.dart

// import 'package:flutter/material.dart';
// import '../constants/app_colors.dart';
// import 'notification_setting_screen.dart';
// import 'notification_store.dart';

// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({super.key});

//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen>
//     with SingleTickerProviderStateMixin, WidgetsBindingObserver {

//   late TabController _tabController;
//   String _searchQuery = '';

//   List<Map<String, dynamic>> get _todayNotifs => NotificationStore.todayNotifs;
//   List<Map<String, dynamic>> get _thisWeekNotifs => NotificationStore.thisWeekNotifs;

//   List<Map<String, dynamic>> get _filteredToday => _searchQuery.isEmpty
//       ? _todayNotifs
//       : _todayNotifs.where((n) =>
//           (n['title'] as String).toLowerCase().contains(_searchQuery.toLowerCase()) ||
//           (n['subtitle'] as String).toLowerCase().contains(_searchQuery.toLowerCase())).toList();

//   List<Map<String, dynamic>> get _filteredThisWeek => _searchQuery.isEmpty
//       ? _thisWeekNotifs
//       : _thisWeekNotifs.where((n) =>
//           (n['title'] as String).toLowerCase().contains(_searchQuery.toLowerCase()) ||
//           (n['subtitle'] as String).toLowerCase().contains(_searchQuery.toLowerCase())).toList();

//   int get _unreadCount => _todayNotifs.where((n) => n['unread'] == true).length;

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.resumed) setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     _tabController = TabController(length: 1, vsync: this);
//     _tabController.addListener(() => setState(() {}));
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<int>(
//       valueListenable: notificationNotifier,
//       builder: (context, _, _) => Scaffold(
//         backgroundColor: const Color(0xFFF5F7FA),
//         body: SafeArea(
//           child: Column(
//             children: [
//               _appBar(context),
//               _tabBar(),
//               Expanded(
//                 child: TabBarView(
//                   controller: _tabController,
//                   children: [
//                     _notificationsTab(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ════════════════════════════════════════
//   //  APP BAR
//   // ════════════════════════════════════════
//   Widget _appBar(BuildContext context) => Container(
//         color: kBlue,
//         padding: const EdgeInsets.fromLTRB(4, 6, 14, 10),
//         child: Row(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.white),
//               onPressed: () => Navigator.pop(context),
//             ),
//             Expanded(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text('Notifications',
//                       style: TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.w800,
//                           color: Colors.white)),
//                   if (_unreadCount > 0) ...[
//                     const SizedBox(width: 6),
//                     Container(
//                       width: 20, height: 20,
//                       decoration: const BoxDecoration(
//                           color: Color(0xFFE11D48), shape: BoxShape.circle),
//                       child: Center(
//                         child: Text('$_unreadCount',
//                             style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.bold)),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//             GestureDetector(
//               onTap: () => Navigator.push(context,
//                   MaterialPageRoute(builder: (_) => const NotificationSettingScreen())),
//               child: const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
//                 child: Icon(Icons.tune_rounded, color: Colors.white, size: 22),
//               ),
//             ),
//           ],
//         ),
//       );

//   // ════════════════════════════════════════
//   //  TAB BAR
//   // ════════════════════════════════════════
//   Widget _tabBar() => Container(
//         color: Colors.white,
//         child: TabBar(
//           controller: _tabController,
//           labelColor: kBlue,
//           unselectedLabelColor: kGrey,
//           indicatorColor: kBlue,
//           indicatorWeight: 3,
//           labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
//           tabs: [
//             Tab(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text('Notifications'),
//                   if (_unreadCount > 0) ...[
//                     const SizedBox(width: 6),
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
//                       decoration: BoxDecoration(
//                           color: const Color(0xFFE11D48),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Text('$_unreadCount',
//                           style: const TextStyle(
//                               color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
//                     ),
//                   ],
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );

//   // ════════════════════════════════════════
//   //  NOTIFICATIONS TAB
//   // ════════════════════════════════════════
//   Widget _notificationsTab() => SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 14),
//             _searchBar(),
//             const SizedBox(height: 14),
//             if (_filteredToday.isNotEmpty) ...[
//               _sectionLabel('Today'),
//               const SizedBox(height: 8),
//               ..._filteredToday.map((n) => _notifCard(n, context)),
//             ],
//             if (_filteredThisWeek.isNotEmpty) ...[
//               const SizedBox(height: 8),
//               _sectionLabel('This week'),
//               const SizedBox(height: 8),
//               ..._filteredThisWeek.map((n) => _notifCard(n, context)),
//             ],
//             if (_filteredToday.isEmpty && _filteredThisWeek.isEmpty)
//               _emptyState('No notifications found', 'Try a different search keyword',
//                   Icons.notifications_off_rounded),
//             const SizedBox(height: 28),
//           ],
//         ),
//       );

//   // ════════════════════════════════════════
//   //  SEARCH BAR
//   // ════════════════════════════════════════
//   Widget _searchBar() => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Container(
//           height: 46,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(color: Colors.black.withOpacity(0.07),
//                   blurRadius: 8, offset: const Offset(0, 2)),
//             ],
//           ),
//           child: Row(
//             children: [
//               const SizedBox(width: 14),
//               const Icon(Icons.search_rounded, color: kGrey, size: 20),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: TextField(
//                   onChanged: (v) => setState(() => _searchQuery = v),
//                   style: const TextStyle(fontSize: 13, color: kBlack),
//                   decoration: const InputDecoration(
//                     hintText: 'Search notifications...',
//                     hintStyle: TextStyle(color: kGrey, fontSize: 13),
//                     border: InputBorder.none,
//                     isDense: true,
//                     contentPadding: EdgeInsets.zero,
//                   ),
//                 ),
//               ),
//               if (_searchQuery.isNotEmpty)
//                 GestureDetector(
//                   onTap: () => setState(() => _searchQuery = ''),
//                   child: const Padding(
//                     padding: EdgeInsets.only(right: 12),
//                     child: Icon(Icons.close_rounded, color: kGrey, size: 18),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       );

//   Widget _sectionLabel(String label) => Padding(
//         padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
//         child: Text(label,
//             style: const TextStyle(
//                 fontSize: 13,
//                 fontWeight: FontWeight.w700,
//                 color: kGrey,
//                 letterSpacing: 0.3)),
//       );

//   Widget _notifCard(Map<String, dynamic> n, BuildContext context) =>
//       GestureDetector(
//         onTap: () {
//           setState(() => n['unread'] = false);
//           showDialog(
//             context: context,
//             builder: (_) => Dialog(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//               backgroundColor: Colors.white,
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text('Message',
//                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: kBlue)),
//                     const SizedBox(height: 16),
//                     Text('${n['subtitle']}\n\n${n['subtitle']} ${n['subtitle']}',
//                         style: const TextStyle(fontSize: 13.5, color: kGrey, height: 1.6)),
//                     const SizedBox(height: 24),
//                     Center(
//                       child: GestureDetector(
//                         onTap: () => Navigator.pop(context),
//                         child: const Text('Close',
//                             style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: kBlue)),
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//         child: Container(
//           margin: const EdgeInsets.fromLTRB(16, 6, 16, 0),
//           padding: const EdgeInsets.all(14),
//           decoration: BoxDecoration(
//             color: n['unread'] == true ? Colors.white : Colors.white.withOpacity(0.85),
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(
//                 color: n['unread'] == true ? kBlue.withOpacity(0.15) : kBorderGrey),
//             boxShadow: [
//               BoxShadow(
//                   color: n['unread'] == true
//                       ? kBlue.withOpacity(0.08)
//                       : Colors.black.withOpacity(0.04),
//                   blurRadius: 10,
//                   offset: const Offset(0, 3)),
//             ],
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: 46, height: 46,
//                 decoration: BoxDecoration(
//                     color: n['iconBg'] as Color,
//                     borderRadius: BorderRadius.circular(13)),
//                 child: Icon(n['icon'] as IconData,
//                     color: n['iconColor'] as Color, size: 22),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: Text(n['title'] as String,
//                               style: TextStyle(
//                                   fontSize: 13.5,
//                                   fontWeight: n['unread'] == true
//                                       ? FontWeight.w700
//                                       : FontWeight.w600,
//                                   color: kBlack,
//                                   height: 1.3)),
//                         ),
//                         const SizedBox(width: 8),
//                         Text(n['time'] as String,
//                             style: const TextStyle(fontSize: 10.5, color: kGrey)),
//                       ],
//                     ),
//                     const SizedBox(height: 4),
//                     Text(n['subtitle'] as String,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(fontSize: 12, color: kGrey, height: 1.4)),
//                   ],
//                 ),
//               ),
//               if (n['unread'] == true)
//                 Container(
//                   margin: const EdgeInsets.only(left: 6, top: 2),
//                   width: 8, height: 8,
//                   decoration: const BoxDecoration(
//                       color: Color(0xFFE11D48), shape: BoxShape.circle),
//                 ),
//             ],
//           ),
//         ),
//       );

//   Widget _emptyState(String title, String subtitle, IconData icon) => Padding(
//         padding: const EdgeInsets.only(top: 60),
//         child: Center(
//           child: Column(
//             children: [
//               Container(
//                 width: 70, height: 70,
//                 decoration: BoxDecoration(color: kBlueLite, shape: BoxShape.circle),
//                 child: Icon(icon, color: kBlue, size: 32)),
//               const SizedBox(height: 16),
//               Text(title,
//                   style: const TextStyle(
//                       fontSize: 15, fontWeight: FontWeight.w700, color: kBlack)),
//               const SizedBox(height: 6),
//               Text(subtitle,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(fontSize: 12, color: kGrey)),
//             ],
//           ),
//         ),
//       );
// }











// lib/screens/notification_screen.dart

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'notification_setting_screen.dart';
import 'notification_store.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with WidgetsBindingObserver {

  String _searchQuery = '';

  List<Map<String, dynamic>> get _todayNotifs => NotificationStore.todayNotifs;
  List<Map<String, dynamic>> get _thisWeekNotifs => NotificationStore.thisWeekNotifs;

  List<Map<String, dynamic>> get _filteredToday => _searchQuery.isEmpty
      ? _todayNotifs
      : _todayNotifs.where((n) =>
          (n['title'] as String).toLowerCase().contains(_searchQuery.toLowerCase()) ||
          (n['subtitle'] as String).toLowerCase().contains(_searchQuery.toLowerCase())).toList();

  List<Map<String, dynamic>> get _filteredThisWeek => _searchQuery.isEmpty
      ? _thisWeekNotifs
      : _thisWeekNotifs.where((n) =>
          (n['title'] as String).toLowerCase().contains(_searchQuery.toLowerCase()) ||
          (n['subtitle'] as String).toLowerCase().contains(_searchQuery.toLowerCase())).toList();

  int get _unreadCount => _todayNotifs.where((n) => n['unread'] == true).length;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: notificationNotifier,
      builder: (context, _, __) => Scaffold(
        backgroundColor: const Color(0xFFF5F7FA),
        body: SafeArea(
          child: Column(
            children: [
              _appBar(context),
              Expanded(
                child: _notificationsTab(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ════════════════════════════════════════
  //  APP BAR
  // ════════════════════════════════════════
  Widget _appBar(BuildContext context) => Container(
        color: kBlue,
        padding: const EdgeInsets.fromLTRB(4, 6, 14, 10),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  if (_unreadCount > 0) ...[
                    const SizedBox(width: 6),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE11D48),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '$_unreadCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationSettingScreen()),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Icon(Icons.tune_rounded, color: Colors.white, size: 22),
              ),
            ),
          ],
        ),
      );

  // ════════════════════════════════════════
  //  NOTIFICATIONS LIST
  // ════════════════════════════════════════
  Widget _notificationsTab() => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 14),
            _searchBar(),
            const SizedBox(height: 14),
            if (_filteredToday.isNotEmpty) ...[
              _sectionLabel('Today'),
              const SizedBox(height: 8),
              ..._filteredToday.map((n) => _notifCard(n, context)),
            ],
            if (_filteredThisWeek.isNotEmpty) ...[
              const SizedBox(height: 8),
              _sectionLabel('This week'),
              const SizedBox(height: 8),
              ..._filteredThisWeek.map((n) => _notifCard(n, context)),
            ],
            if (_filteredToday.isEmpty && _filteredThisWeek.isEmpty)
              _emptyState(
                'No notifications found',
                'Try a different search keyword',
                Icons.notifications_off_rounded,
              ),
            const SizedBox(height: 28),
          ],
        ),
      );

  // ════════════════════════════════════════
  //  SEARCH BAR
  // ════════════════════════════════════════
  Widget _searchBar() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 46,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 14),
              const Icon(Icons.search_rounded, color: kGrey, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  onChanged: (v) => setState(() => _searchQuery = v),
                  style: const TextStyle(fontSize: 13, color: kBlack),
                  decoration: const InputDecoration(
                    hintText: 'Search notifications...',
                    hintStyle: TextStyle(color: kGrey, fontSize: 13),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              if (_searchQuery.isNotEmpty)
                GestureDetector(
                  onTap: () => setState(() => _searchQuery = ''),
                  child: const Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(Icons.close_rounded, color: kGrey, size: 18),
                  ),
                ),
            ],
          ),
        ),
      );

  // ════════════════════════════════════════
  //  SECTION LABEL
  // ════════════════════════════════════════
  Widget _sectionLabel(String label) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: kGrey,
            letterSpacing: 0.3,
          ),
        ),
      );

  // ════════════════════════════════════════
  //  NOTIFICATION CARD
  // ════════════════════════════════════════
  Widget _notifCard(Map<String, dynamic> n, BuildContext context) =>
      GestureDetector(
        onTap: () {
          setState(() => n['unread'] = false);
          showDialog(
            context: context,
            builder: (_) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Message',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: kBlue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${n['subtitle']}\n\n${n['subtitle']} ${n['subtitle']}',
                      style: const TextStyle(
                        fontSize: 13.5,
                        color: kGrey,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          'Close',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: kBlue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 6, 16, 0),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: n['unread'] == true
                ? Colors.white
                : Colors.white.withOpacity(0.85),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: n['unread'] == true
                  ? kBlue.withOpacity(0.15)
                  : kBorderGrey,
            ),
            boxShadow: [
              BoxShadow(
                color: n['unread'] == true
                    ? kBlue.withOpacity(0.08)
                    : Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: n['iconBg'] as Color,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(
                  n['icon'] as IconData,
                  color: n['iconColor'] as Color,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            n['title'] as String,
                            style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: n['unread'] == true
                                  ? FontWeight.w700
                                  : FontWeight.w600,
                              color: kBlack,
                              height: 1.3,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          n['time'] as String,
                          style: const TextStyle(fontSize: 10.5, color: kGrey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      n['subtitle'] as String,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: kGrey,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              if (n['unread'] == true)
                Container(
                  margin: const EdgeInsets.only(left: 6, top: 2),
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE11D48),
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      );

  // ════════════════════════════════════════
  //  EMPTY STATE
  // ════════════════════════════════════════
  Widget _emptyState(String title, String subtitle, IconData icon) => Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: kBlueLite,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: kBlue, size: 32),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: kBlack,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, color: kGrey),
              ),
            ],
          ),
        ),
      );
}