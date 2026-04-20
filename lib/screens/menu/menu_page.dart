import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../widgets/menu_row.dart';
import '../orders/orders_page.dart';
import '../returns/returns_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          _MenuHeader(context),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                const MenuSectionTitle(AppStrings.ordersReturns),
                MenuRow(
                  icon: Icons.receipt_long_rounded,
                  label: AppStrings.manageOrders,
                  badge: '17',
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const OrdersPage())),
                ),
                MenuRow(
                  icon: Icons.refresh_rounded,
                  label: AppStrings.manageReturns,
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ReturnsPage())),
                ),
                MenuRow(
                  icon: Icons.shield_rounded,
                  label: AppStrings.safeT,
                  onTap: () => _showSnack(context, AppStrings.safeT),
                ),
                const SizedBox(height: 12),
                const MenuSectionTitle(AppStrings.performance),
                MenuRow(
                  icon: Icons.favorite_rounded,
                  label: AppStrings.accountHealth,
                  onTap: () => _showSnack(context, AppStrings.accountHealth),
                ),
                MenuRow(
                  icon: Icons.bar_chart_rounded,
                  label: AppStrings.bizReports,
                  onTap: () => _showSnack(context, AppStrings.bizReports),
                ),
                MenuRow(
                  icon: Icons.message_rounded,
                  label: AppStrings.buyerMessages,
                  badge: '0',
                  badgeColor: AppColors.red,
                  onTap: () => _showSnack(context, AppStrings.buyerMessages),
                ),
                const SizedBox(height: 12),
                const MenuSectionTitle(AppStrings.settings),
                MenuRow(
                  icon: Icons.settings_rounded,
                  label: AppStrings.accountSett,
                  onTap: () => _showSnack(context, AppStrings.accountSett),
                ),
                MenuRow(
                  icon: Icons.location_on_rounded,
                  label: AppStrings.sellerAddress,
                  onTap: () => _showSnack(context, 'Address'),
                ),
                const SizedBox(height: 4),
                MenuRow(
                  icon: Icons.logout_rounded,
                  label: AppStrings.signOut,
                  isDestructive: true,
                  onTap: () => _confirmSignOut(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _MenuHeader(BuildContext context) {
    return Container(
      color: AppColors.navy,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 14,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          AppStrings.menuTitle,
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white),
        ),
      ),
    );
  }

  void _showSnack(BuildContext context, String label) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label — coming soon!'),
        backgroundColor: AppColors.navy,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _confirmSignOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Sign Out',
            style: TextStyle(
                fontWeight: FontWeight.w800, color: AppColors.navy)),
        content: const Text('Are you sure you want to sign out?',
            style: TextStyle(color: AppColors.sub)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel',
                style: TextStyle(color: AppColors.muted)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 0,
            ),
            child: const Text('Sign Out',
                style: TextStyle(fontWeight: FontWeight.w800)),
          ),
        ],
      ),
    );
  }
}
