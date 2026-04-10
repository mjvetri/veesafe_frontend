import 'package:flutter/material.dart';

// ── Colors
const Color _kNavy   = Color(0xFF1A2B5E);
const Color _kBg     = Color(0xFFF4F6FA);
const Color _kWhite  = Colors.white;
const Color _kGrey   = Color(0xFF8A94A6);
const Color _kDark   = Color(0xFF1A2340);
const Color _kGreen  = Color(0xFF2E7D32);
const Color _kBorder = Color(0xFFE8ECF2);

class EmiPage extends StatefulWidget {
  const EmiPage({super.key});
  @override
  State<EmiPage> createState() => _EmiPageState();
}

class _EmiPageState extends State<EmiPage> {
  bool _noCostOnly   = false;
  int  _expandedCard = -1;

  final List<Map<String, String>> _cards = [
    {'bank': 'BajajFinserv EMI Card', 'sub': 'Processing for \$199 by issuer'},
    {'bank': 'BajajFinserv EMI Card', 'sub': 'Processing for \$199 by issuer'},
    {'bank': 'BajajFinserv EMI Card', 'sub': 'Processing for \$199 by issuer'},
    {'bank': 'BajajFinserv EMI Card', 'sub': 'Processing for \$199 by issuer'},
    {'bank': 'BajajFinserv EMI Card', 'sub': 'Processing for \$199 by issuer'},
    {'bank': 'BajajFinserv EMI Card', 'sub': 'Processing for \$199 by issuer'},
  ];

  final List<Map<String, String>> _noCostPlans = [
    {'plan': '\$2,604 x 3m', 'interest': 'No Cost', 'total': '\$2,604'},
  ];

  final List<Map<String, String>> _standardPlans = [
    {'plan': '\$2,604 x 3m', 'interest': '\$698 (4%)', 'total': '\$2,604'},
    {'plan': '\$2,604 x 5m', 'interest': '\$698 (4%)', 'total': '\$2,604'},
    {'plan': '\$2,604 x 3m', 'interest': '\$698 (4%)', 'total': '\$2,604'},
  ];

  final List<String> _notes = [
    'Our team of experts is here to make sure you get the best quality products and services at affordable prices.',
    'Our team of experts is here to make sure you get the best quality products and services at affordable prices.',
  ];

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _kBg,
      body: Column(
        children: [
          _buildAppBar(context, sw),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: sw * 0.04, vertical: sw * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('EMI Options',
                        style: TextStyle(
                            fontSize: sw * 0.048,
                            fontWeight: FontWeight.w800,
                            color: _kDark)),
                    SizedBox(height: sw * 0.035),
                    _buildToggleRow(sw),
                    SizedBox(height: sw * 0.025),
                    ...List.generate(_cards.length, (i) => Padding(
                          padding: EdgeInsets.only(bottom: sw * 0.022),
                          child: _buildBankCard(i, sw),
                        )),
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

  Widget _buildAppBar(BuildContext context, double sw) {
    return Container(
      color: _kNavy,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              sw * 0.04, sw * 0.025, sw * 0.04, sw * 0.038),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: sw * 0.085,
                  height: sw * 0.085,
                  decoration: BoxDecoration(
                    color: _kWhite.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(sw * 0.02),
                    border: Border.all(color: _kWhite.withValues(alpha: 0.25)),
                  ),
                  child: Icon(Icons.chevron_left_rounded,
                      color: _kWhite, size: sw * 0.052),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text('EMI Page',
                      style: TextStyle(
                          color: _kWhite,
                          fontSize: sw * 0.042,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              SizedBox(width: sw * 0.085),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleRow(double sw) {
    return Container(
      padding: EdgeInsets.fromLTRB(sw * 0.04, sw * 0.005, sw * 0.01, sw * 0.005),
      decoration: BoxDecoration(
        color: _kWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _kBorder),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 6,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text("View only 'No Cost' options",
                style: TextStyle(
                    fontSize: sw * 0.03,
                    color: _kDark,
                    fontWeight: FontWeight.w500)),
          ),
          Transform.scale(
            scale: 0.85,
            child: Switch(
              value: _noCostOnly,
              onChanged: (val) => setState(() {
                _noCostOnly = val;
                _expandedCard = -1;
              }),
              activeThumbColor: _kWhite,
              activeTrackColor: _kNavy,
              inactiveThumbColor: _kWhite,
              inactiveTrackColor: Colors.grey.shade300,
              trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBankCard(int index, double sw) {
    final bool isExpanded = _expandedCard == index;
    final card = _cards[index];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: _kWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: isExpanded
                ? _kNavy.withValues(alpha: 0.3)
                : _kBorder,
            width: isExpanded ? 1.5 : 1),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: isExpanded ? 0.07 : 0.03),
              blurRadius: isExpanded ? 12 : 4,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          // Header row
          GestureDetector(
            onTap: () => setState(() {
              _expandedCard = isExpanded ? -1 : index;
            }),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sw * 0.035, vertical: sw * 0.028),
              child: Row(
                children: [
                  // Bank icon
                  Container(
                    width: sw * 0.1,
                    height: sw * 0.1,
                    decoration: BoxDecoration(
                      color: _kNavy,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text('B',
                          style: TextStyle(
                              color: _kWhite,
                              fontSize: sw * 0.044,
                              fontWeight: FontWeight.w900)),
                    ),
                  ),
                  SizedBox(width: sw * 0.03),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(card['bank']!,
                            style: TextStyle(
                                fontSize: sw * 0.031,
                                fontWeight: FontWeight.w700,
                                color: _kDark)),
                        SizedBox(height: sw * 0.005),
                        Text(card['sub']!,
                            style: TextStyle(
                                fontSize: sw * 0.026, color: _kGrey)),
                      ],
                    ),
                  ),
                  // Chevron right (collapsed) / down (expanded)
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_down_rounded
                        : Icons.chevron_right_rounded,
                    color: _kGrey,
                    size: sw * 0.048,
                  ),
                ],
              ),
            ),
          ),

          // Expanded EMI content — only when tapped
          if (isExpanded) ...[
            Divider(height: 1, thickness: 1, color: _kBorder),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  sw * 0.035, sw * 0.025, sw * 0.035, sw * 0.03),
              child: _buildExpandedContent(sw),
            ),
          ],
        ],
      ),
    );
  }

  // EMI content shown INSIDE the card when expanded
  Widget _buildExpandedContent(double sw) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // "EMI Options" section label
        Text('EMI Options',
            style: TextStyle(
                fontSize: sw * 0.032,
                fontWeight: FontWeight.w700,
                color: _kDark)),
        SizedBox(height: sw * 0.016),

        // No Cost EMI table header label (only when toggle ON)
        if (_noCostOnly)
          Padding(
            padding: EdgeInsets.only(bottom: sw * 0.01),
            child: Text('No Cost  EMI Options',
                style: TextStyle(
                    fontSize: sw * 0.028,
                    fontWeight: FontWeight.w700,
                    color: _kDark)),
          ),

        // No Cost EMI table (always shown)
        _buildTable(
          plans: _noCostPlans,
          isNoCost: true,
          sw: sw,
        ),

        // Standard Plans (only when toggle OFF)
        if (!_noCostOnly) ...[
          SizedBox(height: sw * 0.016),
          Text('Standard Plans',
              style: TextStyle(
                  fontSize: sw * 0.028,
                  fontWeight: FontWeight.w700,
                  color: _kDark)),
          SizedBox(height: sw * 0.01),
          _buildTable(
            plans: _standardPlans,
            isNoCost: false,
            sw: sw,
          ),
        ],

        // Things to Note (always shown)
        SizedBox(height: sw * 0.016),
        _buildThingsToNote(sw),
      ],
    );
  }

  Widget _buildTable({
    required List<Map<String, String>> plans,
    required bool isNoCost,
    required double sw,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: _kBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _kBorder),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: sw * 0.03, vertical: sw * 0.013),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border(bottom: BorderSide(color: _kBorder)),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Text('EMI Plan',
                        style: TextStyle(
                            fontSize: sw * 0.026,
                            fontWeight: FontWeight.w600,
                            color: _kGrey))),
                Expanded(
                    child: Text('Interest',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: sw * 0.026,
                            fontWeight: FontWeight.w600,
                            color: _kGrey))),
                Expanded(
                    child: Text('Total Cost',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: sw * 0.026,
                            fontWeight: FontWeight.w600,
                            color: _kGrey))),
              ],
            ),
          ),
          // Rows
          ...plans.asMap().entries.map((e) {
            final plan = e.value;
            final bool isLast = e.key == plans.length - 1;
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: sw * 0.03, vertical: sw * 0.015),
              decoration: BoxDecoration(
                border: Border(
                  bottom: isLast
                      ? BorderSide.none
                      : BorderSide(color: _kBorder),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Text(plan['plan']!,
                          style: TextStyle(
                              fontSize: sw * 0.028, color: _kDark))),
                  Expanded(
                      child: Text(plan['interest']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: sw * 0.028,
                              fontWeight: isNoCost
                                  ? FontWeight.w700
                                  : FontWeight.w400,
                              color: isNoCost ? _kGreen : _kDark))),
                  Expanded(
                      child: Text(plan['total']!,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: sw * 0.028,
                              fontWeight: FontWeight.w700,
                              color: _kNavy))),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildThingsToNote(double sw) {
    return Container(
      padding: EdgeInsets.all(sw * 0.03),
      decoration: BoxDecoration(
        color: _kBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _kBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Things to Note :',
              style: TextStyle(
                  fontSize: sw * 0.028,
                  fontWeight: FontWeight.w700,
                  color: _kDark)),
          SizedBox(height: sw * 0.014),
          ..._notes.map((note) => Padding(
                padding: EdgeInsets.only(bottom: sw * 0.013),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: sw * 0.006),
                      child: Container(
                        width: sw * 0.013,
                        height: sw * 0.013,
                        decoration: const BoxDecoration(
                            color: _kNavy, shape: BoxShape.circle),
                      ),
                    ),
                    SizedBox(width: sw * 0.018),
                    Expanded(
                      child: Text(note,
                          style: TextStyle(
                              fontSize: sw * 0.026,
                              color: _kGrey,
                              height: 1.5)),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}