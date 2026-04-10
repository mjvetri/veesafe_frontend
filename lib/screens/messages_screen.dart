// // lib/screens/messages_screen.dart

// import 'package:flutter/material.dart';
// import '../constants/app_colors.dart';
// import 'message_store.dart';

// class MessagesScreen extends StatefulWidget {
//   const MessagesScreen({super.key});

//   @override
//   State<MessagesScreen> createState() => _MessagesScreenState();
// }

// class _MessagesScreenState extends State<MessagesScreen> {
//   int get _unreadMessages =>
//       MessageStore.messages.where((m) => !(m['hasReply'] as bool)).length;

//   @override
//   Widget build(BuildContext context) {
//     final msgs = MessageStore.messages;
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F7FA),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // ── APP BAR ──
//             Container(
//               color: kBlue,
//               padding: const EdgeInsets.fromLTRB(4, 6, 14, 10),
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(
//                       Icons.arrow_back_ios,
//                       size: 18,
//                       color: Colors.white,
//                     ),
//                     // ✅ FIXED: Navigate explicitly to Home, clearing the stack
//                     onPressed: () => Navigator.pushNamedAndRemoveUntil(
//                       context,
//                       '/home',
//                       (route) => false,
//                     ),
//                   ),
//                   Expanded(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           'Messages',
//                           style: TextStyle(
//                             fontSize: 17,
//                             fontWeight: FontWeight.w800,
//                             color: Colors.white,
//                           ),
//                         ),
//                         if (_unreadMessages > 0) ...[
//                           const SizedBox(width: 6),
//                           Container(
//                             width: 20,
//                             height: 20,
//                             decoration: const BoxDecoration(
//                               color: Color(0xFF16A34A),
//                               shape: BoxShape.circle,
//                             ),
//                             child: Center(
//                               child: Text(
//                                 '$_unreadMessages',
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 11,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // ── MESSAGES LIST ──
//             Expanded(
//               child: msgs.isEmpty
//                   ? _emptyState()
//                   : ListView.separated(
//                       physics: const BouncingScrollPhysics(),
//                       padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
//                       itemCount: msgs.length,
//                       separatorBuilder: (_, _) => const SizedBox(height: 12),
//                       itemBuilder: (_, i) => _messageCard(context, msgs[i], i),
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _messageCard(BuildContext context, Map<String, dynamic> m, int index) {
//     final hasReply = m['hasReply'] as bool;
//     return GestureDetector(
//       onTap: () => _openChat(context, m, index),
//       child: Container(
//         padding: const EdgeInsets.all(14),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(
//             color: !hasReply
//                 ? const Color(0xFF16A34A).withOpacity(0.3)
//                 : const Color(0xFFEEF1F8),
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 10,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: 50,
//               height: 50,
//               decoration: BoxDecoration(
//                 color: m['bg'] as Color,
//                 borderRadius: BorderRadius.circular(13),
//               ),
//               child: Icon(
//                 m['icon'] as IconData,
//                 size: 24,
//                 color: m['color'] as Color,
//               ),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           m['seller'] as String,
//                           style: const TextStyle(
//                             fontSize: 13.5,
//                             fontWeight: FontWeight.w700,
//                             color: kBlack,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         m['time'] as String,
//                         style: TextStyle(
//                           fontSize: 11,
//                           color: hasReply ? kGrey : const Color(0xFF16A34A),
//                           fontWeight: hasReply
//                               ? FontWeight.w400
//                               : FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 3),
//                   Row(
//                     children: [
//                       const Icon(
//                         Icons.local_hospital_rounded,
//                         size: 11,
//                         color: kBlue,
//                       ),
//                       const SizedBox(width: 4),
//                       Expanded(
//                         child: Text(
//                           m['product'] as String,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(
//                             fontSize: 11.5,
//                             color: kBlue,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         m['price'] as String,
//                         style: const TextStyle(
//                           fontSize: 11,
//                           color: kGrey,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 6),
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 7,
//                     ),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFF5F7FA),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Text(
//                               'You: ',
//                               style: TextStyle(
//                                 fontSize: 11.5,
//                                 color: kBlue,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                             Expanded(
//                               child: Text(
//                                 m['myMessage'] as String,
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: const TextStyle(
//                                   fontSize: 11.5,
//                                   color: kGrey,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         if (hasReply && (m['reply'] as String).isNotEmpty) ...[
//                           const SizedBox(height: 4),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '${m['seller']}: ',
//                                 style: const TextStyle(
//                                   fontSize: 11.5,
//                                   color: Color(0xFF16A34A),
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Text(
//                                   m['reply'] as String,
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: const TextStyle(
//                                     fontSize: 11.5,
//                                     color: kBlack,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 8,
//                           vertical: 3,
//                         ),
//                         decoration: BoxDecoration(
//                           color: hasReply
//                               ? const Color(0xFFDCFCE7)
//                               : const Color(0xFFFEF3C7),
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         child: Text(
//                           hasReply ? '✓ Seller replied' : '⏳ Awaiting reply',
//                           style: TextStyle(
//                             fontSize: 10,
//                             fontWeight: FontWeight.w700,
//                             color: hasReply
//                                 ? const Color(0xFF16A34A)
//                                 : const Color(0xFFD97706),
//                           ),
//                         ),
//                       ),
//                       const Spacer(),
//                       const Text(
//                         'Tap to chat →',
//                         style: TextStyle(
//                           fontSize: 11,
//                           color: kBlue,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _openChat(BuildContext context, Map<String, dynamic> m, int index) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => ChatScreen(
//           conversation: m,
//           onMessageSent: (msg) {
//             setState(() {
//               MessageStore.messages[index]['myMessage'] = msg;
//             });
//           },
//         ),
//       ),
//     );
//   }

//   Widget _emptyState() => Padding(
//     padding: const EdgeInsets.only(top: 60),
//     child: Center(
//       child: Column(
//         children: [
//           Container(
//             width: 70,
//             height: 70,
//             decoration: BoxDecoration(color: kBlueLite, shape: BoxShape.circle),
//             child: const Icon(
//               Icons.chat_bubble_outline_rounded,
//               color: kBlue,
//               size: 32,
//             ),
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             'No messages yet',
//             style: TextStyle(
//               fontSize: 15,
//               fontWeight: FontWeight.w700,
//               color: kBlack,
//             ),
//           ),
//           const SizedBox(height: 6),
//           const Text(
//             'Message a seller from the marketplace to start chatting',
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 12, color: kGrey),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// // ════════════════════════════════════════
// //  CHAT SCREEN
// // ════════════════════════════════════════
// class ChatScreen extends StatefulWidget {
//   final Map<String, dynamic> conversation;
//   final Function(String) onMessageSent;
//   const ChatScreen({
//     super.key,
//     required this.conversation,
//     required this.onMessageSent,
//   });

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final _msgCtrl = TextEditingController();
//   final _scrollCtrl = ScrollController();
//   late List<Map<String, dynamic>> _messages;

//   @override
//   void initState() {
//     super.initState();
//     _messages = [
//       {
//         'text': widget.conversation['myMessage'],
//         'isMe': true,
//         'time': widget.conversation['time'],
//       },
//       if ((widget.conversation['reply'] as String).isNotEmpty)
//         {
//           'text': widget.conversation['reply'],
//           'isMe': false,
//           'time': widget.conversation['time'],
//         },
//     ];
//   }

//   void _send() {
//     if (_msgCtrl.text.trim().isEmpty) return;
//     final msg = _msgCtrl.text.trim();
//     setState(() {
//       _messages.add({'text': msg, 'isMe': true, 'time': 'Just now'});
//       _msgCtrl.clear();
//     });
//     widget.onMessageSent(msg);
//     Future.delayed(const Duration(milliseconds: 100), () {
//       if (_scrollCtrl.hasClients) {
//         _scrollCtrl.animateTo(
//           _scrollCtrl.position.maxScrollExtent,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeOut,
//         );
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F7FA),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // ── App bar ──
//             Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [kBlue, Color(0xFF1A73E8)],
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                 ),
//               ),
//               padding: const EdgeInsets.fromLTRB(4, 6, 14, 10),
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(
//                       Icons.arrow_back_ios,
//                       size: 18,
//                       color: Colors.white,
//                     ),
//                     // ✅ FIXED: Pop back to MessagesScreen (not SignIn)
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                   Container(
//                     width: 38,
//                     height: 38,
//                     decoration: BoxDecoration(
//                       color: widget.conversation['bg'] as Color,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       widget.conversation['icon'] as IconData,
//                       size: 20,
//                       color: widget.conversation['color'] as Color,
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           widget.conversation['seller'] as String,
//                           style: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w800,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Text(
//                           widget.conversation['product'] as String,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(
//                             fontSize: 11,
//                             color: Colors.white70,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // ── Product banner ──
//             Container(
//               margin: const EdgeInsets.all(12),
//               padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: kBorderGrey),
//               ),
//               child: Row(
//                 children: [
//                   const Icon(
//                     Icons.local_hospital_rounded,
//                     color: kBlue,
//                     size: 16,
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: Text(
//                       widget.conversation['product'] as String,
//                       style: const TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w700,
//                         color: kBlack,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     widget.conversation['price'] as String,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       color: kBlue,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // ── Messages ──
//             Expanded(
//               child: ListView.builder(
//                 controller: _scrollCtrl,
//                 physics: const BouncingScrollPhysics(),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 14,
//                   vertical: 4,
//                 ),
//                 itemCount: _messages.length,
//                 itemBuilder: (_, i) {
//                   final m = _messages[i];
//                   final isMe = m['isMe'] as bool;
//                   return Align(
//                     alignment: isMe
//                         ? Alignment.centerRight
//                         : Alignment.centerLeft,
//                     child: Container(
//                       constraints: BoxConstraints(
//                         maxWidth: MediaQuery.of(context).size.width * 0.72,
//                       ),
//                       margin: const EdgeInsets.only(bottom: 10),
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 14,
//                         vertical: 10,
//                       ),
//                       decoration: BoxDecoration(
//                         color: isMe ? kBlue : Colors.white,
//                         borderRadius: BorderRadius.only(
//                           topLeft: const Radius.circular(16),
//                           topRight: const Radius.circular(16),
//                           bottomLeft: Radius.circular(isMe ? 16 : 4),
//                           bottomRight: Radius.circular(isMe ? 4 : 16),
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.06),
//                             blurRadius: 6,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: isMe
//                             ? CrossAxisAlignment.end
//                             : CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             m['text'] as String,
//                             style: TextStyle(
//                               fontSize: 13.5,
//                               color: isMe ? Colors.white : kBlack,
//                               height: 1.4,
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Text(
//                                 m['time'] as String,
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: isMe ? Colors.white60 : kGrey,
//                                 ),
//                               ),
//                               if (isMe) ...[
//                                 const SizedBox(width: 4),
//                                 const Icon(
//                                   Icons.done_all_rounded,
//                                   size: 12,
//                                   color: Colors.white60,
//                                 ),
//                               ],
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),

//             // ── Input ──
//             Container(
//               color: Colors.white,
//               padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFF5F7FA),
//                         borderRadius: BorderRadius.circular(24),
//                         border: Border.all(color: kBorderGrey),
//                       ),
//                       child: Row(
//                         children: [
//                           const SizedBox(width: 14),
//                           Expanded(
//                             child: TextField(
//                               controller: _msgCtrl,
//                               style: const TextStyle(
//                                 fontSize: 13,
//                                 color: kBlack,
//                               ),
//                               decoration: const InputDecoration(
//                                 hintText: 'Type a message...',
//                                 hintStyle: TextStyle(
//                                   color: Color(0xFFB0BEC5),
//                                   fontSize: 13,
//                                 ),
//                                 border: InputBorder.none,
//                                 isDense: true,
//                                 contentPadding: EdgeInsets.symmetric(
//                                   vertical: 10,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   GestureDetector(
//                     onTap: _send,
//                     child: Container(
//                       width: 46,
//                       height: 46,
//                       decoration: BoxDecoration(
//                         color: kBlue,
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: kBlue.withOpacity(0.35),
//                             blurRadius: 10,
//                             offset: const Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child: const Icon(
//                         Icons.send_rounded,
//                         color: Colors.white,
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// lib/screens/messages_screen.dart

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'message_store.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  int get _unreadMessages =>
      MessageStore.messages.where((m) => !(m['hasReply'] as bool)).length;

  @override
  Widget build(BuildContext context) {
    final msgs = MessageStore.messages;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            // ── APP BAR ──
            Container(
              color: kBlue,
              padding: const EdgeInsets.fromLTRB(4, 6, 14, 10),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/home',
                      (route) => false,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Messages',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        if (_unreadMessages > 0) ...[
                          const SizedBox(width: 6),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              color: Color(0xFF16A34A),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '$_unreadMessages',
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
                ],
              ),
            ),

            // ── MESSAGES LIST ──
            Expanded(
              child: msgs.isEmpty
                  ? _emptyState()
                  : ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
                      itemCount: msgs.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (_, i) =>
                          _messageCard(context, msgs[i], i),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _messageCard(
      BuildContext context, Map<String, dynamic> m, int index) {
    final hasReply = m['hasReply'] as bool;
    return GestureDetector(
      onTap: () => _openChat(context, m, index),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: !hasReply
                ? const Color(0xFF16A34A).withOpacity(0.3)
                : const Color(0xFFEEF1F8),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: m['bg'] as Color,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                m['icon'] as IconData,
                size: 24,
                color: m['color'] as Color,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          m['seller'] as String,
                          style: const TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w700,
                            color: kBlack,
                          ),
                        ),
                      ),
                      Text(
                        m['time'] as String,
                        style: TextStyle(
                          fontSize: 11,
                          color: hasReply ? kGrey : const Color(0xFF16A34A),
                          fontWeight:
                              hasReply ? FontWeight.w400 : FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Icon(
                        Icons.local_hospital_rounded,
                        size: 11,
                        color: kBlue,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          m['product'] as String,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11.5,
                            color: kBlue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        m['price'] as String,
                        style: const TextStyle(
                          fontSize: 11,
                          color: kGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F7FA),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'You: ',
                              style: TextStyle(
                                fontSize: 11.5,
                                color: kBlue,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                m['myMessage'] as String,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 11.5,
                                  color: kGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (hasReply &&
                            (m['reply'] as String).isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${m['seller']}: ',
                                style: const TextStyle(
                                  fontSize: 11.5,
                                  color: Color(0xFF16A34A),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  m['reply'] as String,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 11.5,
                                    color: kBlack,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: hasReply
                              ? const Color(0xFFDCFCE7)
                              : const Color(0xFFFEF3C7),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          hasReply ? '✓ Seller replied' : '⏳ Awaiting reply',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: hasReply
                                ? const Color(0xFF16A34A)
                                : const Color(0xFFD97706),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Tap to chat →',
                        style: TextStyle(
                          fontSize: 11,
                          color: kBlue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openChat(BuildContext context, Map<String, dynamic> m, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChatScreen(
          conversation: m,
          onMessageSent: (msg) {
            setState(() {
              MessageStore.messages[index]['myMessage'] = msg;
            });
          },
        ),
      ),
    );
  }

  Widget _emptyState() => Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration:
                    BoxDecoration(color: kBlueLite, shape: BoxShape.circle),
                child: const Icon(
                  Icons.chat_bubble_outline_rounded,
                  color: kBlue,
                  size: 32,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'No messages yet',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: kBlack,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Message a seller from the marketplace to start chatting',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: kGrey),
              ),
            ],
          ),
        ),
      );
}

// ════════════════════════════════════════
//  CHAT SCREEN
// ════════════════════════════════════════
class ChatScreen extends StatefulWidget {
  final Map<String, dynamic> conversation;
  final Function(String) onMessageSent;
  const ChatScreen({
    super.key,
    required this.conversation,
    required this.onMessageSent,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _msgCtrl = TextEditingController();
  final _scrollCtrl = ScrollController();
  late List<Map<String, dynamic>> _messages;

  @override
  void initState() {
    super.initState();
    _messages = [
      {
        'text': widget.conversation['myMessage'],
        'isMe': true,
        'time': widget.conversation['time'],
      },
      if ((widget.conversation['reply'] as String).isNotEmpty)
        {
          'text': widget.conversation['reply'],
          'isMe': false,
          'time': widget.conversation['time'],
        },
    ];
  }

  // ════════════════════════════════════════
  //  SENSITIVE INFO DETECTOR
  // ════════════════════════════════════════
  /// Returns the type of sensitive info found, or null if clean.
  String? _detectSensitiveInfo(String text) {
    final lower = text.toLowerCase();

    // Phone number: 7+ consecutive digits (with optional spaces/dashes)
    final phoneRegex = RegExp(r'\b\d[\d\s\-]{6,}\d\b');
    if (phoneRegex.hasMatch(text)) return 'phone number';

    // Email address
    final emailRegex = RegExp(
      r'[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}',
    );
    if (emailRegex.hasMatch(text)) return 'email address';

    // WhatsApp / social media mentions
    final socialRegex = RegExp(
      r'\b(whatsapp|whats app|watsapp|wa\.me|instagram|insta|facebook|fb\.com|telegram|snapchat|twitter|tiktok)\b',
    );
    if (socialRegex.hasMatch(lower)) return 'social media contact';

    // Physical address keywords
    final addressRegex = RegExp(
      r'\b(street|st\.|road|rd\.|avenue|ave\.|lane|ln\.|nagar|colony|district|pincode|zip|landmark|near|opposite|opp\.)\b',
    );
    if (addressRegex.hasMatch(lower)) return 'address';

    // URL / website
    final urlRegex = RegExp(
      r'(https?://|www\.)[^\s]+',
      caseSensitive: false,
    );
    if (urlRegex.hasMatch(text)) return 'website link';

    // UPI / payment ID
    final upiRegex = RegExp(r'[a-zA-Z0-9.\-_]+@[a-zA-Z]{2,}');
    if (upiRegex.hasMatch(text)) return 'payment ID';

    return null; // clean
  }

  void _send() {
    final text = _msgCtrl.text.trim();
    if (text.isEmpty) return;

    // ── Check for sensitive info ──
    final detected = _detectSensitiveInfo(text);
    if (detected != null) {
      _showBlockedDialog(detected);
      return;
    }

    setState(() {
      _messages.add({'text': text, 'isMe': true, 'time': 'Just now'});
      _msgCtrl.clear();
    });
    widget.onMessageSent(text);
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollCtrl.hasClients) {
        _scrollCtrl.animateTo(
          _scrollCtrl.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // ════════════════════════════════════════
  //  BLOCKED MESSAGE DIALOG
  // ════════════════════════════════════════
  void _showBlockedDialog(String detectedType) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEBEE),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.block_rounded,
                  color: Color(0xFFE11D48),
                  size: 30,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Message Blocked',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  color: kBlack,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Sharing a $detectedType is not allowed in this chat. '
                'All transactions and communication must stay within the Veesafe platform to keep you safe.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  color: kGrey,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF9C4),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFFBC02D)),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline_rounded,
                        color: Color(0xFFD97706), size: 16),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'This protects both buyers and sellers from fraud.',
                        style: TextStyle(
                          fontSize: 11.5,
                          color: Color(0xFF92400E),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Got it',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            // ── App bar ──
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [kBlue, Color(0xFF1A73E8)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              padding: const EdgeInsets.fromLTRB(4, 6, 14, 10),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: widget.conversation['bg'] as Color,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      widget.conversation['icon'] as IconData,
                      size: 20,
                      color: widget.conversation['color'] as Color,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.conversation['seller'] as String,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          widget.conversation['product'] as String,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 🔒 Safety badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.shield_rounded,
                            color: Colors.white, size: 12),
                        SizedBox(width: 4),
                        Text(
                          'Safe Chat',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ── Safety notice banner ──
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(12, 10, 12, 0),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF9C4),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFFBC02D)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.lock_rounded, color: Color(0xFFD97706), size: 14),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'For your safety, sharing phone numbers, emails, addresses or external links is not allowed.',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF92400E),
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ── Product banner ──
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: kBorderGrey),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.local_hospital_rounded,
                    color: kBlue,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.conversation['product'] as String,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: kBlack,
                      ),
                    ),
                  ),
                  Text(
                    widget.conversation['price'] as String,
                    style: const TextStyle(
                      fontSize: 12,
                      color: kBlue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            // ── Messages ──
            Expanded(
              child: ListView.builder(
                controller: _scrollCtrl,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 4,
                ),
                itemCount: _messages.length,
                itemBuilder: (_, i) {
                  final m = _messages[i];
                  final isMe = m['isMe'] as bool;
                  return Align(
                    alignment:
                        isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.72,
                      ),
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isMe ? kBlue : Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(16),
                          topRight: const Radius.circular(16),
                          bottomLeft: Radius.circular(isMe ? 16 : 4),
                          bottomRight: Radius.circular(isMe ? 4 : 16),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: isMe
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Text(
                            m['text'] as String,
                            style: TextStyle(
                              fontSize: 13.5,
                              color: isMe ? Colors.white : kBlack,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                m['time'] as String,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: isMe ? Colors.white60 : kGrey,
                                ),
                              ),
                              if (isMe) ...[
                                const SizedBox(width: 4),
                                const Icon(
                                  Icons.done_all_rounded,
                                  size: 12,
                                  color: Colors.white60,
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // ── Input ──
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F7FA),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: kBorderGrey),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 14),
                          Expanded(
                            child: TextField(
                              controller: _msgCtrl,
                              style: const TextStyle(
                                fontSize: 13,
                                color: kBlack,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Type a message...',
                                hintStyle: TextStyle(
                                  color: Color(0xFFB0BEC5),
                                  fontSize: 13,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _send,
                    child: Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: kBlue,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: kBlue.withOpacity(0.35),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}