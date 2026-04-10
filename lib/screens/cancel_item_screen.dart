import 'package:flutter/material.dart';

class CancelItemScreen extends StatefulWidget {
  const CancelItemScreen({super.key});

  @override
  State<CancelItemScreen> createState() => _CancelItemScreenState();
}

class _CancelItemScreenState extends State<CancelItemScreen> {
  String? _selectedReason;

  final List<String> _cancelReasons = [
    'I want to change my delivery address',
    'I want to cancel and reorder',
    'Product is no longer required',
    'Expected delivery time is too long',
    'Incorrect product ordered',
    'Found a better price elsewhere',
    'Other reason',
  ];

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      body: Column(
        children: [
          _buildHeader(context, sw),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: sw * 0.05),
                    _buildProductCard(sw),
                    SizedBox(height: sw * 0.05),
                    Text(
                      'Select a reason for cancellation',
                      style: TextStyle(
                        fontSize: sw * 0.04,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF1A2B5E),
                      ),
                    ),
                    SizedBox(height: sw * 0.03),
                    _buildReasonsList(sw),
                    SizedBox(height: sw * 0.06),
                    _buildCancelButton(context, sw),
                    SizedBox(height: sw * 0.08),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  // HEADER
  // ─────────────────────────────────────────
  Widget _buildHeader(BuildContext context, double sw) {
    return Container(
      width: sw,
      decoration: const BoxDecoration(
        color: Color(0xFF1A2B5E),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
              color: Color(0x4D1A2B5E),
              blurRadius: 20,
              offset: Offset(0, 8)),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              sw * 0.04, sw * 0.03, sw * 0.04, sw * 0.05),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: sw * 0.095,
                  height: sw * 0.095,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(sw * 0.028),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.2), width: 1),
                  ),
                  child: Icon(Icons.chevron_left_rounded,
                      color: Colors.white, size: sw * 0.05),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Cancel Order',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: sw * 0.045,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
              ),
              SizedBox(width: sw * 0.095),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  // PRODUCT CARD
  // ─────────────────────────────────────────
  Widget _buildProductCard(double sw) {
    final double imageSize = sw * 0.22;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(sw * 0.04),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: imageSize,
              height: imageSize,
              decoration: BoxDecoration(
                color: const Color(0xFFEBEFF8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/image.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Icon(
                    Icons.monitor_heart_outlined,
                    color: const Color(0xFF1A2B5E),
                    size: imageSize * 0.5,
                  ),
                ),
              ),
            ),
            SizedBox(width: sw * 0.035),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr Trust USA Gold Standard Glucometer Sugar Check Testing Machine 9090 with 25 Strips',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: sw * 0.031,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2D3748),
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: sw * 0.012),
                  Text(
                    '\$2,604.00',
                    style: TextStyle(
                      fontSize: sw * 0.038,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF1A2B5E),
                    ),
                  ),
                  SizedBox(height: sw * 0.008),
                  Text(
                    'Qty: 1',
                    style: TextStyle(
                      fontSize: sw * 0.03,
                      color: const Color(0xFF6B7280),
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

  // ─────────────────────────────────────────
  // REASONS LIST
  // ─────────────────────────────────────────
  Widget _buildReasonsList(double sw) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: List.generate(_cancelReasons.length, (index) {
          final reason = _cancelReasons[index];
          final bool isSelected = _selectedReason == reason;
          final bool isLast = index == _cancelReasons.length - 1;

          return Column(
            children: [
              GestureDetector(
                onTap: () => setState(() => _selectedReason = reason),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: sw * 0.04, vertical: sw * 0.038),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          reason,
                          style: TextStyle(
                            fontSize: sw * 0.033,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: isSelected
                                ? const Color(0xFF1A2B5E)
                                : const Color(0xFF2D3748),
                          ),
                        ),
                      ),
                      Container(
                        width: sw * 0.055,
                        height: sw * 0.055,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF1A2B5E)
                                : const Color(0xFFCBD5E0),
                            width: 2,
                          ),
                        ),
                        child: isSelected
                            ? Center(
                                child: Container(
                                  width: sw * 0.03,
                                  height: sw * 0.03,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF1A2B5E),
                                  ),
                                ),
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
              if (!isLast)
                Divider(
                    color: Colors.grey.shade100,
                    height: 1,
                    indent: sw * 0.04,
                    endIndent: sw * 0.04),
            ],
          );
        }),
      ),
    );
  }

  // ─────────────────────────────────────────
  // CANCEL BUTTON
  // ─────────────────────────────────────────
  Widget _buildCancelButton(BuildContext context, double sw) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _selectedReason == null
            ? null
            : () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    title: Text(
                      'Confirm Cancellation',
                      style: TextStyle(
                          fontSize: sw * 0.04,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1A2B5E)),
                    ),
                    content: Text(
                      'Are you sure you want to cancel this order?',
                      style: TextStyle(
                          fontSize: sw * 0.033,
                          color: const Color(0xFF6B7280)),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('No',
                            style: TextStyle(
                                color: const Color(0xFF6B7280),
                                fontSize: sw * 0.034,
                                fontWeight: FontWeight.w600)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text('Yes, Cancel',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: sw * 0.034,
                                fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                );
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: _selectedReason == null
              ? const Color(0xFFCBD5E0)
              : Colors.red,
          padding: EdgeInsets.symmetric(vertical: sw * 0.04),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: Text(
          'Cancel Order',
          style: TextStyle(
            color: Colors.white,
            fontSize: sw * 0.038,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}