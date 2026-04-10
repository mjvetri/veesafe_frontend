import 'package:flutter/material.dart';
import 'track_order_screen.dart';

// ═══════════════════════════════════════════════════════
// SCREEN 1 — ORDER PLACED SUCCESSFULLY
// ═══════════════════════════════════════════════════════
class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sw * 0.06),
          child: Column(
            children: [
              SizedBox(height: sw * 0.06),
              _buildIllustration(sw),
              SizedBox(height: sw * 0.06),
              Text(
                'Order Placed Successfully !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: sw * 0.054,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1A2340),
                  height: 1.2,
                ),
              ),
              SizedBox(height: sw * 0.035),
              Text(
                'Congragulations ! Your order has been\nplaced .You can track your order number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: sw * 0.033,
                  color: const Color(0xFF8A94A6),
                  height: 1.6,
                ),
              ),
              SizedBox(height: sw * 0.015),
              Text(
                '#67890',
                style: TextStyle(
                  fontSize: sw * 0.038,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1A2B5E),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () =>
                          Navigator.of(context).popUntil((r) => r.isFirst),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            color: Colors.grey.withValues(alpha: 0.4),
                            width: 1.5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(vertical: sw * 0.038),
                      ),
                      child: Text(
                        'Continue Shopping',
                        style: TextStyle(
                            fontSize: sw * 0.031,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1A2340)),
                      ),
                    ),
                  ),
                  SizedBox(width: sw * 0.04),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const TrackOrderScreen(orderId: '#67890')),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1A2B5E),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(vertical: sw * 0.038),
                        elevation: 4,
                        shadowColor:
                            const Color(0xFF1A2B5E).withValues(alpha: 0.4),
                      ),
                      child: Text(
                        'Track Order',
                        style: TextStyle(
                            fontSize: sw * 0.033,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: sw * 0.08),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIllustration(double sw) {
    return Container(
      width: sw * 0.8,
      height: sw * 0.65,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FF),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Top grey bars (building lines)
          Positioned(
            top: sw * 0.06,
            left: sw * 0.06,
            child: _greyBar(sw * 0.18, sw * 0.045),
          ),
          Positioned(
            top: sw * 0.06,
            right: sw * 0.06,
            child: _greyBar(sw * 0.12, sw * 0.045),
          ),
          Positioned(
            top: sw * 0.13,
            left: sw * 0.06,
            child: _greyBar(sw * 0.14, sw * 0.035),
          ),
          // Main content row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Packages
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _packageBox(sw * 0.16, sw * 0.11,
                      const Color(0xFFD4A843), sw),
                  SizedBox(height: sw * 0.01),
                  _packageBox(sw * 0.21, sw * 0.16,
                      const Color(0xFFC8922A), sw),
                ],
              ),
              SizedBox(width: sw * 0.02),
              // Person
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Check bubble
                  Container(
                    width: sw * 0.1,
                    height: sw * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Icon(Icons.check_rounded,
                        color: Colors.green.shade500, size: sw * 0.055),
                  ),
                  SizedBox(height: sw * 0.01),
                  // Head with cap
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: sw * 0.1,
                        height: sw * 0.04,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2D6BC4),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: sw * 0.015),
                        child: Container(
                          width: sw * 0.085,
                          height: sw * 0.085,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFCBA4),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Body
                  Container(
                    width: sw * 0.12,
                    height: sw * 0.13,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2D6BC4),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Icon(Icons.add,
                          color: Colors.white.withValues(alpha: 0.5),
                          size: sw * 0.04),
                    ),
                  ),
                  // Legs
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _leg(sw),
                      SizedBox(width: sw * 0.012),
                      _leg(sw),
                    ],
                  ),
                ],
              ),
              SizedBox(width: sw * 0.025),
              // Clipboard
              Container(
                width: sw * 0.1,
                height: sw * 0.15,
                margin: EdgeInsets.only(bottom: sw * 0.06),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.07),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (i) => Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: sw * 0.015, vertical: sw * 0.007),
                      height: sw * 0.012,
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _greyBar(double w, double h) => Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.14),
          borderRadius: BorderRadius.circular(4),
        ),
      );

  Widget _packageBox(double w, double h, Color color, double sw) =>
      Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 6,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Center(
          child: Icon(Icons.add,
              color: Colors.white.withValues(alpha: 0.7), size: sw * 0.06),
        ),
      );

  Widget _leg(double sw) => Container(
        width: sw * 0.044,
        height: sw * 0.055,
        decoration: BoxDecoration(
          color: const Color(0xFF1A3A6B),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(6),
          ),
        ),
      );
}