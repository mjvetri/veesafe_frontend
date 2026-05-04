import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../models/order_models.dart';
import '../../widgets/common_widgets.dart';
import '../../widgets/order_card.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int _selectedFilter = 0;
  final List<String> _filters = [
    'All (17)',
    'Pending',
    'Delivered',
    'Returning',
  ];

  List<OrderModel> get _filteredOrders {
    switch (_selectedFilter) {
      case 1:
        return sampleOrders
            .where((o) => o.statusType == OrderStatus.pending)
            .toList();
      case 2:
        return sampleOrders
            .where((o) => o.statusType == OrderStatus.delivered)
            .toList();
      case 3:
        return sampleOrders
            .where((o) => o.statusType == OrderStatus.returning)
            .toList();
      default:
        return sampleOrders;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          const SubPageHeader(
            title: AppStrings.ordersTitle,
            subtitle: AppStrings.ordersSub,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  const AppSearchBar(hint: AppStrings.searchOrder),
                  FilterRow(
                    items: _filters,
                    selected: _selectedFilter,
                    onSelect: (i) => setState(() => _selectedFilter = i),
                  ),
                  if (_filteredOrders.isEmpty)
                    const _EmptyOrders()
                  else
                    ..._filteredOrders.map((o) => OrderCard(order: o)),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyOrders extends StatelessWidget {
  const _EmptyOrders();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 60),
      child: Column(
        children: [
          Text('📋', style: TextStyle(fontSize: 42)),
          SizedBox(height: 12),
          Text(
            'No orders found\nfor this filter.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: AppColors.muted,
              fontWeight: FontWeight.w600,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
