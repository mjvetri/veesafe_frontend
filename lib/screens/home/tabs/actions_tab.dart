import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../models/product_models.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/action_row.dart';
import '../../../widgets/product_list_card.dart';
import '../../orders/orders_page.dart';
import '../../products/products_page.dart';
import '../../returns/returns_page.dart';
import '../../inventory/inventory_page.dart';

class ActionsTab extends StatelessWidget {
  const ActionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel(AppStrings.quickActions),
          ActionRow(
            icon: Icons.receipt_long_rounded,
            iconBg: AppColors.iconNavy,
            iconColor: AppColors.navy,
            title: AppStrings.manageOrders,
            sub: '17 orders pending',
            badge: '17',
            badgeColor: AppColors.red,
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const OrdersPage())),
          ),
          ActionRow(
            icon: Icons.medical_services_rounded,
            iconBg: AppColors.iconGreen,
            iconColor: AppColors.greenDark,
            title: AppStrings.manageProducts,
            sub: 'Hospital beds, scrubs, devices',
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const ProductsPage())),
          ),
          ActionRow(
            icon: Icons.refresh_rounded,
            iconBg: AppColors.iconOrange,
            iconColor: AppColors.orange,
            title: AppStrings.manageReturns,
            sub: '7-day replacement policy',
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const ReturnsPage())),
          ),
          ActionRow(
            icon: Icons.inventory_2_rounded,
            iconBg: AppColors.iconNavy,
            iconColor: AppColors.navy,
            title: AppStrings.manageInventory,
            sub: 'FBA & Standard shipments',
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const InventoryPage())),
          ),
          const SectionLabel(AppStrings.activeProducts),
          ProductListCard(
            title: AppStrings.medicalListings,
            products: sampleProducts.take(3).toList(),
            onViewAll: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const ProductsPage())),
          ),
        ],
      ),
    );
  }
}
