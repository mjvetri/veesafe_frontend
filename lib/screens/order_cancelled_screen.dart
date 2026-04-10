import 'package:flutter/material.dart';
import 'liked_products_screen.dart';

class OrderCancelledScreen extends StatelessWidget {
  const OrderCancelledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sw * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: sh * 0.12),

              // ── Cancelled Illustration ──
              _buildIllustration(sw),

              SizedBox(height: sh * 0.05),

              // ── Title ──
              Text(
                'Order Cancelled !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: sw * 0.058,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1A2B5E),
                  letterSpacing: 0.3,
                ),
              ),

              SizedBox(height: sw * 0.03),

              // ── Subtitle ──
              Text(
                'Refunded \$2,604.00 Successfully',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: sw * 0.036,
                  color: const Color(0xFF6B7280),
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),

              const Spacer(),

              // ── Back to Shop Button ──
              _buildBackToShopButton(context, sw),

              SizedBox(height: sh * 0.06),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  // ILLUSTRATION
  // ─────────────────────────────────────────
  Widget _buildIllustration(double sw) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer faint circle
        Container(
          width: sw * 0.58,
          height: sw * 0.58,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFF0F4FF),
          ),
        ),
        // Middle circle
        Container(
          width: sw * 0.44,
          height: sw * 0.44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFDDE5FF),
          ),
        ),
        // Inner circle with icon
        Container(
          width: sw * 0.3,
          height: sw * 0.3,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF1A2B5E),
          ),
          child: Icon(
            Icons.cancel_outlined,
            color: Colors.white,
            size: sw * 0.14,
          ),
        ),
        // Small product image at bottom-right of circle
        Positioned(
          bottom: sw * 0.04,
          right: sw * 0.04,
          child: Container(
            width: sw * 0.16,
            height: sw * 0.16,
            decoration: BoxDecoration(
              color: const Color(0xFFEBEFF8),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/glucometer.png',
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Icon(
                  Icons.monitor_heart_outlined,
                  color: const Color(0xFF1A2B5E),
                  size: sw * 0.07,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────
  // BACK TO SHOP BUTTON
  // ─────────────────────────────────────────
  Widget _buildBackToShopButton(BuildContext context, double sw) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Navigate all the way back to Page 1
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => const LikedProductsScreen(),
            ),
            (route) => false,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1A2B5E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: EdgeInsets.symmetric(vertical: sw * 0.042),
          elevation: 6,
          shadowColor: const Color(0xFF1A2B5E).withOpacity(0.4),
        ),
        child: Text(
          'Back to shop',
          style: TextStyle(
            color: Colors.white,
            fontSize: sw * 0.04,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}