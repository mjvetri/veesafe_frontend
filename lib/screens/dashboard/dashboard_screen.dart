import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../home/home_screen.dart';
import '../orders/orders_page.dart';
import '../products/products_page.dart';
import '../messages/messages_page.dart';
import '../menu/menu_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    OrdersPage(),
    ProductsPage(),
    MessagesPage(), // ✅ Inventory slot → Messages page
    MenuPage(),
  ];

  final List<_NavItem> _navItems = const [
    _NavItem(icon: Icons.home_rounded,             label: AppStrings.navHome),
    _NavItem(icon: Icons.receipt_long_rounded,     label: AppStrings.navOrders),
    _NavItem(icon: Icons.medical_services_rounded, label: AppStrings.navProducts),
    _NavItem(icon: Icons.inventory_2_rounded,      label: AppStrings.navInventory),
    _NavItem(icon: Icons.menu_rounded,             label: AppStrings.navMenu),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.card,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 62,
          child: Row(
            children: List.generate(_navItems.length, (i) {
              final isActive = _currentIndex == i;
              return Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _currentIndex = i),
                  behavior: HitTestBehavior.opaque,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ✅ Pill highlight for active tab
                      Container(
                        width: 44,
                        height: 28,
                        decoration: BoxDecoration(
                          color: isActive
                              ? AppColors.navy.withOpacity(0.12)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          _navItems[i].icon,
                          color: isActive ? AppColors.navy : AppColors.muted,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _navItems[i].label,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: isActive ? AppColors.navy : AppColors.muted,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}