import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../models/inventory_model.dart';
import '../../widgets/common_widgets.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          const SubPageHeader(
            title: AppStrings.inventoryTitle,
            subtitle: AppStrings.inventorySub,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                _SectionTitle(AppStrings.inventoryMgmt),
                const SizedBox(height: 6),
                ...inventoryItems.asMap().entries.map(
                  (e) => _InventoryRow(item: e.value, index: e.key),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w800,
        color: AppColors.muted,
        letterSpacing: 0.8,
      ),
    );
  }
}

class _InventoryRow extends StatelessWidget {
  final InventoryItemModel item;
  final int index;
  const _InventoryRow({required this.item, required this.index});

  void _handleTap(BuildContext context) {
    switch (index) {
      case 0:
        _showInventoryDetail(context);
        break;
      case 4:
        _showRevenueCalculator(context);
        break;
      default:
        _showComingSoon(context, item.label, item.icon);
    }
  }

  void _showComingSoon(BuildContext context, String label, IconData icon) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => _BottomSheet(
        icon: icon,
        title: label,
        subtitle: 'This feature is coming soon.\nStay tuned for updates!',
      ),
    );
  }

  void _showInventoryDetail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _ManageInventorySheet(),
    );
  }

  void _showRevenueCalculator(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const _RevenueCalculatorSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleTap(context),
      child: Container(
        margin: const EdgeInsets.only(bottom: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            // ✅ Icon inside navy tinted rounded box
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.iconNavy,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(item.icon, color: AppColors.navy, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                item.label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.navy,
                ),
              ),
            ),
            if (item.badge != null)
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.navy,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  item.badge!,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              )
            else
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.muted,
                size: 18,
              ),
          ],
        ),
      ),
    );
  }
}

// ── Bottom Sheet ──────────────────────────────────────────────────────────────
class _BottomSheet extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _BottomSheet(
      {required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 20),
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFE0F7F4),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: AppColors.green, size: 28),
          ),
          const SizedBox(height: 14),
          Text(title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppColors.navy)),
          const SizedBox(height: 8),
          Text(subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.muted,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.navy,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 13),
                elevation: 0,
              ),
              child: const Text('Close',
                  style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w800)),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

// ── Manage Inventory Sheet ────────────────────────────────────────────────────
class _ManageInventorySheet extends StatelessWidget {
  final List<Map<String, dynamic>> _items = const [
    {'name': 'Hospital Bed Deluxe',    'sku': 'HB-001', 'qty': 8,   'status': 'Active'},
    {'name': 'Surgical Gloves Box',    'sku': 'SG-045', 'qty': 142, 'status': 'Active'},
    {'name': 'Wheelchair Foldable',    'sku': 'WC-012', 'qty': 3,   'status': 'Low Stock'},
    {'name': 'Oxygen Concentrator',    'sku': 'OC-007', 'qty': 0,   'status': 'Out of Stock'},
    {'name': 'Blood Pressure Monitor', 'sku': 'BP-023', 'qty': 27,  'status': 'Active'},
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      maxChildSize: 0.92,
      minChildSize: 0.4,
      builder: (_, controller) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(2))),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Manage Inventory',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: AppColors.navy)),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.navy,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text('13 Items',
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: Colors.white)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                controller: controller,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: _items.length,
                itemBuilder: (_, i) {
                  final item = _items[i];
                  final isLow = item['status'] == 'Low Stock';
                  final isOut = item['status'] == 'Out of Stock';
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.bg,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item['name'],
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.navy)),
                              const SizedBox(height: 2),
                              Text('SKU: ${item['sku']}',
                                  style: const TextStyle(
                                      fontSize: 11,
                                      color: AppColors.muted,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Qty: ${item['qty']}',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w800,
                                    color: isOut
                                        ? AppColors.red
                                        : isLow
                                            ? AppColors.orange
                                            : AppColors.navy)),
                            const SizedBox(height: 3),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 2),
                              decoration: BoxDecoration(
                                color: isOut
                                    ? const Color(0xFFFFF0F0)
                                    : isLow
                                        ? const Color(0xFFFFF4E6)
                                        : const Color(0xFFE0F7F4),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(item['status'],
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w800,
                                      color: isOut
                                          ? AppColors.red
                                          : isLow
                                              ? AppColors.orange
                                              : AppColors.green)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Revenue Calculator ────────────────────────────────────────────────────────
class _RevenueCalculatorSheet extends StatefulWidget {
  const _RevenueCalculatorSheet();

  @override
  State<_RevenueCalculatorSheet> createState() =>
      _RevenueCalculatorSheetState();
}

class _RevenueCalculatorSheetState extends State<_RevenueCalculatorSheet> {
  final _priceController = TextEditingController(text: '100');
  final _costController  = TextEditingController(text: '40');
  double _fbaFee = 8.0;

  double get _revenue {
    final price = double.tryParse(_priceController.text) ?? 0;
    final cost  = double.tryParse(_costController.text) ?? 0;
    return price - cost - _fbaFee - (price * 0.15);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(2))),
            ),
            const SizedBox(height: 16),
            const Text('Revenue Calculator',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.navy)),
            const SizedBox(height: 16),
            _CalcField(
                label: 'Selling Price (\$)',
                controller: _priceController,
                onChanged: (_) => setState(() {})),
            const SizedBox(height: 10),
            _CalcField(
                label: 'Product Cost (\$)',
                controller: _costController,
                onChanged: (_) => setState(() {})),
            const SizedBox(height: 10),
            Text('FBA Fee: \$${_fbaFee.toStringAsFixed(0)}',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.muted)),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: AppColors.green,
                thumbColor: AppColors.green,
                overlayColor: AppColors.green.withOpacity(0.15),
                inactiveTrackColor: AppColors.border,
              ),
              child: Slider(
                value: _fbaFee,
                min: 3,
                max: 30,
                onChanged: (v) => setState(() => _fbaFee = v),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: _revenue >= 0
                    ? const Color(0xFFE0F7F4)
                    : const Color(0xFFFFF0F0),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _revenue >= 0 ? AppColors.green : AppColors.red,
                ),
              ),
              child: Column(
                children: [
                  const Text('Est. Profit per Unit',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: AppColors.muted)),
                  const SizedBox(height: 4),
                  Text('\$${_revenue.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: _revenue >= 0
                              ? AppColors.green
                              : AppColors.red)),
                  const Text('(15% referral fee included)',
                      style: TextStyle(
                          fontSize: 10,
                          color: AppColors.muted,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _CalcField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const _CalcField({
    required this.label,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.navy),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.muted),
          border: InputBorder.none,
          isDense: true,
        ),
      ),
    );
  }
}