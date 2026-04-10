import 'package:flutter/material.dart';

// ═══════════════════════════════════════════════════════
// SCREEN 2 — TRACK ORDER (Delivering / Received / Pending)
// ═══════════════════════════════════════════════════════
class TrackOrderScreen extends StatefulWidget {
  final String orderId;
  const TrackOrderScreen({super.key, required this.orderId});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  int _selectedTab   = 0; // 0=Delivering, 1=Received, 2=Pending
  int _expandedOrder = -1;
  final TextEditingController _searchCtrl = TextEditingController();

  static const Color _kNavy  = Color(0xFF1A2B5E);
  static const Color _kRed   = Color(0xFFE53E3E);
  static const Color _kGreen = Color(0xFF2E7D32);
  static const Color _kGrey  = Color(0xFF8A94A6);
  static const Color _kBg    = Color(0xFFFFFFFF);

  final List<Map<String, String>> _orders = [
    {
      'name':    'The Scrubs',
      'id':      'SDI23456789WD',
      'from':    'Chicago',
      'to':      'India',
      'date':    'Sun , 5 Jan',
      'status':  'Delivering',
    },
    {
      'name':    'The Scrubs',
      'id':      'SDI23456789WD',
      'from':    'Chicago',
      'to':      'India',
      'date':    'Sun , 5 Jan',
      'status':  'Delivering',
    },
    {
      'name':    'The Scrubs',
      'id':      'SDI23456789WD',
      'from':    'New York',
      'to':      'India',
      'date':    'Sun , 5 Jan',
      'status':  'Received',
    },
    {
      'name':    'The Scrubs',
      'id':      'SDI23456789WD',
      'from':    'Chicago',
      'to':      'India',
      'date':    'Sun , 5 Jan',
      'status':  'Received',
    },
    {
      'name':    'The Scrubs',
      'id':      'SDI23456789WD',
      'from':    'Chicago',
      'to':      'India',
      'date':    'Sun , 5 Jan',
      'status':  'Received',
    },
    {
      'name':    'The Scrubs',
      'id':      'SDI23456789WD',
      'from':    'Chicago',
      'to':      'India',
      'date':    'Sun , 5 Jan',
      'status':  'Received',
    },
    {
      'name':    'The Scrubs',
      'id':      'SDI23456789WD',
      'from':    'Chicago',
      'to':      'India',
      'date':    'Sun , 5 Jan',
      'status':  'Pending',
    },
    {
      'name':    'The Scrubs',
      'id':      'SDI23456789WD',
      'from':    'Chicago',
      'to':      'India',
      'date':    'Sun , 5 Jan',
      'status':  'Pending',
    },
    {
      'name':    'The Scrubs',
      'id':      'SDI23456789WD',
      'from':    'Chicago',
      'to':      'India',
      'date':    'Sun , 5 Jan',
      'status':  'Pending',
    },
  ];

  List<Map<String, String>> get _filteredOrders {
    final tabs = ['Delivering', 'Received', 'Pending'];
    return _orders
        .where((o) => o['status'] == tabs[_selectedTab])
        .toList();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _kBg,
      body: Column(
        children: [
          _buildHeader(context, sw),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(sw * 0.045),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Track your order',
                      style: TextStyle(
                        fontSize: sw * 0.048,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF1A2340),
                      ),
                    ),
                    SizedBox(height: sw * 0.04),
                    // Search bar (only on Delivering tab)
                    if (_selectedTab == 0) ...[
                      _buildSearchBar(sw),
                      SizedBox(height: sw * 0.04),
                    ],
                    // Tab buttons
                    _buildTabs(sw),
                    SizedBox(height: sw * 0.035),
                    // Order list
                    ..._filteredOrders.asMap().entries.map(
                          (e) => _buildOrderCard(e.key, e.value, sw),
                        ),
                    SizedBox(height: sw * 0.04),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Header with user info
  Widget _buildHeader(BuildContext context, double sw) {
    return Container(
      color: _kNavy,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(sw * 0.05, sw * 0.025, sw * 0.05, sw * 0.05),
          child: Column(
            children: [
              // Back row
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.chevron_left_rounded,
                        color: Colors.white, size: sw * 0.07),
                  ),
                ],
              ),
              SizedBox(height: sw * 0.025),
              // Title + bell + avatar row
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Veesafe',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: sw * 0.065,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: sw * 0.008),
                        Text(
                          'Hello , Sheetal',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.75),
                            fontSize: sw * 0.034,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Bell icon
                  Container(
                    width: sw * 0.1,
                    height: sw * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.notifications_none_rounded,
                        color: Colors.white, size: sw * 0.052),
                  ),
                  SizedBox(width: sw * 0.03),
                  // Avatar
                  Container(
                    width: sw * 0.115,
                    height: sw * 0.115,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.white.withValues(alpha: 0.5),
                          width: 2.5),
                      color: const Color(0xFFFFCBA4),
                    ),
                    child: ClipOval(
                      child: Icon(
                        Icons.person_rounded,
                        color: const Color(0xFFD4845A),
                        size: sw * 0.07,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Search bar
  Widget _buildSearchBar(double sw) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF4F6FB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.15)),
      ),
      child: TextField(
        controller: _searchCtrl,
        style: TextStyle(fontSize: sw * 0.034, color: const Color(0xFF1A2340)),
        decoration: InputDecoration(
          hintText: 'Enter Order ID',
          hintStyle: TextStyle(color: _kGrey, fontSize: sw * 0.033),
          prefixIcon: Icon(Icons.search_rounded, color: _kGrey, size: sw * 0.052),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: sw * 0.036),
          isDense: true,
        ),
      ),
    );
  }

  // ── 3 Tab buttons
  Widget _buildTabs(double sw) {
    final tabs = ['Delivering', 'Received', 'Pending'];
    final activeColors = [_kNavy, _kNavy, _kRed];

    return Row(
      children: List.generate(tabs.length, (i) {
        final bool sel = _selectedTab == i;
        final Color activeColor = activeColors[i];
        return Expanded(
          child: GestureDetector(
            onTap: () => setState(() {
              _selectedTab   = i;
              _expandedOrder = -1;
            }),
            child: Container(
              margin: EdgeInsets.only(right: i < 2 ? sw * 0.025 : 0),
              padding: EdgeInsets.symmetric(vertical: sw * 0.028),
              decoration: BoxDecoration(
                color: sel ? activeColor : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: sel ? activeColor : Colors.grey.withValues(alpha: 0.3),
                  width: sel ? 0 : 1,
                ),
                boxShadow: sel
                    ? [
                        BoxShadow(
                          color: activeColor.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : [],
              ),
              child: Center(
                child: Text(
                  tabs[i],
                  style: TextStyle(
                    fontSize: sw * 0.03,
                    fontWeight: FontWeight.w700,
                    color: sel ? Colors.white : const Color(0xFF1A2340),
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  // ── Order card (expandable for Delivering tab)
  Widget _buildOrderCard(int index, Map<String, String> order, double sw) {
    final bool isDelivering = _selectedTab == 0;
    final bool isExpanded   = _expandedOrder == index;
    final String status     = order['status']!;

    Color statusColor = _kGreen;
    if (status == 'Pending') statusColor = _kRed;
    if (status == 'Delivering') statusColor = _kNavy;

    return Container(
      margin: EdgeInsets.only(bottom: sw * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(sw * 0.04),
            child: Row(
              children: [
                // Logo circle
                Container(
                  width: sw * 0.12,
                  height: sw * 0.12,
                  decoration: BoxDecoration(
                    color: _kNavy,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: _kNavy.withValues(alpha: 0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'THE\nSCRB',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: sw * 0.018,
                        fontWeight: FontWeight.w800,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: sw * 0.03),
                // Order info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order['name']!,
                        style: TextStyle(
                          fontSize: sw * 0.035,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1A2340),
                        ),
                      ),
                      SizedBox(height: sw * 0.005),
                      Text(
                        order['id']!,
                        style: TextStyle(
                          fontSize: sw * 0.026,
                          color: _kGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                // Status OR From→To
                if (!isDelivering) ...[
                  Text(
                    status == 'Received' ? 'Completed' : 'Pending',
                    style: TextStyle(
                      fontSize: sw * 0.032,
                      fontWeight: FontWeight.w700,
                      color: statusColor,
                    ),
                  ),
                ] else ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _fromToLabel('From', order['from']!, sw),
                      SizedBox(height: sw * 0.008),
                      _fromToLabel('To', order['to']!, sw),
                    ],
                  ),
                ],
              ],
            ),
          ),
          // Tracking timeline (only Delivering)
          if (isDelivering) ...[
            Padding(
              padding: EdgeInsets.fromLTRB(sw * 0.04, 0, sw * 0.04, sw * 0.03),
              child: Column(
                children: [
                  // Progress dots + Expand button
                  Row(
                    children: [
                      _trackDot(true),
                      Expanded(child: _trackLine()),
                      _trackDot(true),
                      Expanded(child: _trackLine(dashed: true)),
                      _trackDot(false),
                      SizedBox(width: sw * 0.025),
                      GestureDetector(
                        onTap: () => setState(() =>
                            _expandedOrder = isExpanded ? -1 : index),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: sw * 0.03, vertical: sw * 0.014),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.withValues(alpha: 0.35)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            isExpanded ? 'Close' : 'Expand',
                            style: TextStyle(
                              fontSize: sw * 0.028,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1A2340),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Expanded timeline
                  if (isExpanded) ...[
                    SizedBox(height: sw * 0.025),
                    _buildTimeline(sw),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _fromToLabel(String label, String value, double sw) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: sw * 0.022,
                color: _kGrey,
                fontWeight: FontWeight.w400)),
        Text(value,
            style: TextStyle(
                fontSize: sw * 0.028,
                color: const Color(0xFF1A2340),
                fontWeight: FontWeight.w700)),
      ],
    );
  }

  Widget _trackDot(bool filled) => Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: filled ? _kNavy : Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
              color: filled ? _kNavy : Colors.grey.withValues(alpha: 0.4),
              width: 2),
        ),
      );

  Widget _trackLine({bool dashed = false}) {
    if (!dashed) {
      return Container(height: 2, color: _kNavy);
    }
    return Row(
      children: List.generate(
        6,
        (i) => Expanded(
          child: Container(
            height: 2,
            color: i.isEven
                ? Colors.grey.withValues(alpha: 0.4)
                : Colors.transparent,
          ),
        ),
      ),
    );
  }

  // ── Expanded timeline
  Widget _buildTimeline(double sw) {
    final steps = [
      {
        'title':    'Tracking ID Created',
        'subtitle': 'Shomolu , Log - Feburary 14, 2:48 pm',
        'done':     true,
      },
      {
        'title':    'In Transit',
        'subtitle': 'India Distribution Centre',
        'done':     true,
      },
      {
        'title':    'Delivered',
        'subtitle': '',
        'done':     false,
      },
    ];

    return Column(
      children: List.generate(steps.length, (i) {
        final step = steps[i];
        final bool done = step['done'] as bool;
        final bool isLast = i == steps.length - 1;
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeline column
              SizedBox(
                width: sw * 0.06,
                child: Column(
                  children: [
                    Container(
                      width: sw * 0.035,
                      height: sw * 0.035,
                      decoration: BoxDecoration(
                        color: done ? _kNavy : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: done
                              ? _kNavy
                              : Colors.grey.withValues(alpha: 0.4),
                          width: 2,
                        ),
                      ),
                      child: done
                          ? Icon(Icons.check_rounded,
                              color: Colors.white, size: sw * 0.018)
                          : null,
                    ),
                    if (!isLast)
                      Expanded(
                        child: Container(
                          width: 2,
                          color: done
                              ? _kNavy.withValues(alpha: 0.3)
                              : Colors.grey.withValues(alpha: 0.2),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(width: sw * 0.02),
              // Text
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: isLast ? 0 : sw * 0.028),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        step['title'] as String,
                        style: TextStyle(
                          fontSize: sw * 0.033,
                          fontWeight: FontWeight.w700,
                          color: done
                              ? const Color(0xFF1A2340)
                              : Colors.grey.withValues(alpha: 0.5),
                        ),
                      ),
                      if ((step['subtitle'] as String).isNotEmpty) ...[
                        SizedBox(height: sw * 0.005),
                        Text(
                          step['subtitle'] as String,
                          style: TextStyle(
                            fontSize: sw * 0.027,
                            color: _kGrey,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}