import 'package:flutter/material.dart';
import '../../models/order_model.dart';
import 'order_detail_page.dart';
import 'widgets/orders_header_bar.dart';
import 'widgets/order_search_bar.dart';
import 'widgets/filter_row.dart';
import 'widgets/order_card.dart';
import 'widgets/order_detail_content.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Section Title ─────────────────────────────────────────
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 20, 16, 10),
                child: Text(
                  'Your Order',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF222222),
                  ),
                ),
              ),

              // ── Orders List Card ──────────────────────────────────────
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Blue header
                    const OrdersHeaderBar(),

                    // Search bar
                    const Padding(
                      padding: EdgeInsets.fromLTRB(12, 14, 12, 10),
                      child: OrderSearchBar(),
                    ),

                    // Filter row
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: FilterRow(),
                    ),

                    const SizedBox(height: 10),

                    // Product cards list
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: dummyOrders.length,
                      separatorBuilder: (_, _) => const Divider(
                        height: 1,
                        color: Color(0xFFEEEEEE),
                        indent: 12,
                        endIndent: 12,
                      ),
                      itemBuilder: (context, index) {
                        final order = dummyOrders[index];
                        return OrderCard(
                          order: order,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    OrderDetailPage(order: order),
                              ),
                            );
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 12),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ── Section Title 2 (inline detail preview) ───────────────
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
                child: Text(
                  'Your Order',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF222222),
                  ),
                ),
              ),

              // ── Order Detail Card (inline preview) ────────────────────
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const OrdersHeaderBar(),
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: OrderDetailContent(order: dummyOrders[2]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}
