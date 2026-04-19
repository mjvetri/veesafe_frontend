import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../inventory/inventory_page.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  static const List<Map<String, dynamic>> _conversations = [
    {
      'name': 'Apollo Medicals',
      'icon': Icons.cut_rounded,
      'product': 'Surgical Knife – Pack of 10',
      'price': 'Rs.1,299.00',
      'time': '01:25 PM',
      'myMsg': 'Hi, I am interested in this product. Is it available?',
      'replyMsg': 'Apollo Medicals: Yes we have stock, minimum order is 5 packs.',
      'status': 'replied',
      'unread': 1,
    },
    {
      'name': 'Sunrise Healthcare',
      'icon': Icons.masks_rounded,
      'product': 'N95 Masks – Box of 50',
      'price': 'Rs.499.00',
      'time': '11:40 AM',
      'myMsg': 'Can I get bulk pricing for 10 boxes?',
      'replyMsg': 'Sunrise Healthcare: We can offer 12% discount for 10+ boxes.',
      'status': 'replied',
      'unread': 0,
    },
    {
      'name': 'Lifeline Supplies',
      'icon': Icons.air_rounded,
      'product': 'Oxygen Cylinder & Mask',
      'price': 'Rs.2,199.00',
      'time': '09:10 AM',
      'myMsg': 'Is delivery available to Puducherry?',
      'replyMsg': '',
      'status': 'awaiting',
      'unread': 0,
    },
    {
      'name': 'Healthway India',
      'icon': Icons.favorite_rounded,
      'product': 'Blood Pressure Monitor',
      'price': 'Rs.1,850.00',
      'time': 'Yesterday',
      'myMsg': 'Does it come with a warranty?',
      'replyMsg': 'Healthway India: Yes, 2 year warranty included.',
      'status': 'replied',
      'unread': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final unread =
        _conversations.where((c) => (c['unread'] as int) > 0).length;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          // ── Header
          Container(
            color: AppColors.navy,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 8,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Row(
              children: [
                // ✅ Back → goes to Inventory page
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const InventoryPage()),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.chevron_left_rounded,
                          color: Colors.white60, size: 20),
                      Text('Back',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white60)),
                    ],
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Messages',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ),
                ),
                // ✅ Unread badge aligned to right
                if (unread > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '$unread',
                      style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  )
                else
                  const SizedBox(width: 40),
              ],
            ),
          ),

          // ── Conversation list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 24),
              itemCount: _conversations.length,
              itemBuilder: (_, i) => _ConversationCard(
                data: _conversations[i],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        _ChatThreadPage(data: _conversations[i]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Conversation Card ─────────────────────────────────────────────────────────
class _ConversationCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback onTap;
  const _ConversationCard({required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isReplied  = data['status'] == 'replied';
    final isAwaiting = data['status'] == 'awaiting';
    final hasUnread  = (data['unread'] as int) > 0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row 1: icon + name + time/price
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.iconNavy,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(data['icon'] as IconData,
                        color: AppColors.navy, size: 22),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['name'] as String,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: hasUnread
                                ? FontWeight.w900
                                : FontWeight.w700,
                            color: AppColors.navy,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            const Icon(Icons.grid_view_rounded,
                                size: 11, color: AppColors.muted),
                            const SizedBox(width: 3),
                            Expanded(
                              child: Text(
                                data['product'] as String,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 11,
                                    color: AppColors.muted,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        data['time'] as String,
                        style: TextStyle(
                          fontSize: 11,
                          color: isAwaiting
                              ? AppColors.orange
                              : AppColors.muted,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        data['price'] as String,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: AppColors.navy),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Row 2: Message previews
              Text(
                'You: ${data['myMsg']}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.sub,
                    fontWeight: FontWeight.w500),
              ),
              if ((data['replyMsg'] as String).isNotEmpty) ...[
                const SizedBox(height: 3),
                Text(
                  data['replyMsg'] as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.green,
                      fontWeight: FontWeight.w600),
                ),
              ],
              const SizedBox(height: 10),

              // Row 3: Status chip + Tap to chat
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: isReplied
                          ? const Color(0xFFE0F7F4)
                          : const Color(0xFFFFF4E6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isReplied
                              ? Icons.check_circle_rounded
                              : Icons.access_time_rounded,
                          size: 11,
                          color: isReplied
                              ? AppColors.green
                              : AppColors.orange,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          isReplied ? 'Seller replied' : 'Awaiting reply',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: isReplied
                                  ? AppColors.green
                                  : AppColors.orange),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Tap to chat',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: isReplied
                                ? AppColors.green
                                : AppColors.orange),
                      ),
                      const SizedBox(width: 3),
                      Icon(
                        Icons.chat_bubble_outline_rounded,
                        size: 13,
                        color: isReplied
                            ? AppColors.green
                            : AppColors.orange,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Chat Thread Page ──────────────────────────────────────────────────────────
class _ChatThreadPage extends StatefulWidget {
  final Map<String, dynamic> data;
  const _ChatThreadPage({required this.data});

  @override
  State<_ChatThreadPage> createState() => _ChatThreadPageState();
}

class _ChatThreadPageState extends State<_ChatThreadPage> {
  final _ctrl       = TextEditingController();
  final _scrollCtrl = ScrollController();
  late List<Map<String, dynamic>> _messages;

  @override
  void initState() {
    super.initState();
    _messages = [
      {
        'text': widget.data['myMsg'] as String,
        'mine': true,
        'time': widget.data['time'],
      },
      if ((widget.data['replyMsg'] as String).isNotEmpty)
        {
          'text': (widget.data['replyMsg'] as String)
              .replaceFirst('${widget.data['name']}: ', ''),
          'mine': false,
          'time': widget.data['time'],
        },
    ];
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _scrollCtrl.dispose();
    super.dispose();
  }

  void _send() {
    final txt = _ctrl.text.trim();
    if (txt.isEmpty) return;
    setState(() {
      _messages.add({'text': txt, 'mine': true, 'time': _nowTime()});
    });
    _ctrl.clear();
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

  String _nowTime() {
    final now = DateTime.now();
    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          // ── Top bar
          Container(
            color: AppColors.navy,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 8,
              left: 12,
              right: 16,
              bottom: 14,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.chevron_left_rounded,
                      color: Colors.white70, size: 28),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: AppColors.iconNavy,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    widget.data['icon'] as IconData,
                    color: AppColors.navy,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data['name'] as String,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      Text(
                        widget.data['product'] as String,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 11,
                            color: Colors.white60,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                // ✅ Safe Chat badge
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.shield_rounded,
                          color: AppColors.green, size: 12),
                      SizedBox(width: 4),
                      Text('Safe Chat',
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ── Safety notice banner
          Container(
            margin: const EdgeInsets.fromLTRB(12, 10, 12, 0),
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF4E6),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.orange.withOpacity(0.4)),
            ),
            child: Row(
              children: [
                Icon(Icons.lock_outline_rounded,
                    color: AppColors.orange, size: 14),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'For your safety, sharing phone numbers, emails, addresses or external links is not allowed.',
                    style: TextStyle(
                        fontSize: 11,
                        color: AppColors.navy,
                        fontWeight: FontWeight.w600,
                        height: 1.4),
                  ),
                ),
              ],
            ),
          ),

          // ── Product chip
          Container(
            margin: const EdgeInsets.fromLTRB(12, 8, 12, 4),
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                const Icon(Icons.grid_view_rounded,
                    size: 14, color: AppColors.navy),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.data['product'] as String,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.navy),
                  ),
                ),
                Text(
                  widget.data['price'] as String,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: AppColors.navy),
                ),
              ],
            ),
          ),

          // ── Messages list
          Expanded(
            child: ListView.builder(
              controller: _scrollCtrl,
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (_, i) {
                final m      = _messages[i];
                final isMine = m['mine'] as bool;
                return Align(
                  alignment: isMine
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.72,
                    ),
                    child: Column(
                      crossAxisAlignment: isMine
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: isMine
                                ? AppColors.navy
                                : AppColors.card,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(16),
                              topRight: const Radius.circular(16),
                              bottomLeft:
                                  Radius.circular(isMine ? 16 : 4),
                              bottomRight:
                                  Radius.circular(isMine ? 4 : 16),
                            ),
                            border: isMine
                                ? null
                                : Border.all(color: AppColors.border),
                          ),
                          child: Text(
                            m['text'] as String,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: isMine
                                  ? Colors.white
                                  : AppColors.navy,
                              height: 1.4,
                            ),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              m['time'] as String,
                              style: const TextStyle(
                                  fontSize: 10,
                                  color: AppColors.muted,
                                  fontWeight: FontWeight.w500),
                            ),
                            if (isMine) ...[
                              const SizedBox(width: 4),
                              const Icon(Icons.done_all_rounded,
                                  size: 13, color: AppColors.green),
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

          // ── Reply input box
          Container(
            padding: EdgeInsets.only(
              left: 12,
              right: 12,
              top: 10,
              bottom: MediaQuery.of(context).padding.bottom + 10,
            ),
            decoration: const BoxDecoration(
              color: AppColors.card,
              border: Border(top: BorderSide(color: AppColors.border)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.bg,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: TextField(
                      controller: _ctrl,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.navy),
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(
                            color: AppColors.muted,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _send,
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.navy,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const Icon(Icons.send_rounded,
                        color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}