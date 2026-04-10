import 'package:flutter/material.dart';
import '../../models/order_model.dart';
import 'widgets/order_detail_content.dart';

class OrderDetailPage extends StatelessWidget {
  final OrderProduct order;

  const OrderDetailPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ── Blue Header ─────────────────────────────────────────────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 14),
                decoration: const BoxDecoration(color: Color(0xFF1A2D6B)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.chevron_left,
                          color: Colors.white, size: 26),
                    ),
                    const Expanded(
                      child: Text(
                        'Your Orders',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 26),
                  ],
                ),
              ),

              // ── Detail Content ──────────────────────────────────────────
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(14),
                child: OrderDetailContent(order: order),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
