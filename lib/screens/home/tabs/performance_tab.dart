import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/stat_card.dart';

class PerformanceTab extends StatelessWidget {
  const PerformanceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _HealthStrip(),
          _PromoBanner(),
          const SectionLabel(AppStrings.salesOverview),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppStrings.productSales,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: AppColors.navy)),
                PeriodChip(AppStrings.last7Days),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 6, 16, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.salesValue,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: AppColors.navy)),
                // ✅ Soft teal growth text
                Text(AppStrings.salesGrowth,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.green)),
              ],
            ),
          ),
          const _MiniBarChart(),
          const SizedBox(height: 2),
          _ChartLabels(),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5,
              children: const [
                StatCard(emoji: '💊', emojiBg: Color(0xFFE0F7F4), label: 'Total Sales',    value: '\$2,604', sub: 'Today so far'),
                StatCard(emoji: '📦', emojiBg: Color(0xFFEEF2FF), label: 'Units Ordered',  value: '47',      sub: 'Today so far'),
                StatCard(emoji: '🏥', emojiBg: Color(0xFFFFF4E6), label: 'Open Orders',    value: '17',      sub: 'Total Count'),
                StatCard(emoji: '💬', emojiBg: Color(0xFFFFF0F0), label: 'Buyer Messages', value: '0',       sub: 'Response Needed'),
                StatCard(emoji: '📣', emojiBg: Color(0xFFEEF2FF), label: 'Ad Impressions', value: '0',       sub: 'Today so far'),
                StatCard(emoji: '⭐', emojiBg: Color(0xFFE0F7F4), label: 'Seller Rating',  value: '4.7',     sub: 'Past Year'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ Health strip — soft teal gradient, light and calm
class _HealthStrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Store Health — All systems healthy!'),
            backgroundColor: Color(0xFF3DBCB8),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          // ✅ Soft light teal gradient — calm, not too bright
          gradient: const LinearGradient(
            colors: [Color(0xFF4ECFCB), Color(0xFF2E9E9A)],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 4, backgroundColor: Colors.white),
                SizedBox(width: 8),
                Text(AppStrings.healthOk,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Colors.white)),
              ],
            ),
            Icon(Icons.chevron_right_rounded, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

// ✅ Promo banner — soft teal Shop Now button
class _PromoBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.navy,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Soft teal "50% OFF" text
              Text(AppStrings.promoOff,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: AppColors.green,
                      letterSpacing: 1)),
              SizedBox(height: 3),
              Text(AppStrings.promoTitle,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.2)),
              SizedBox(height: 3),
              Text(AppStrings.promoSub,
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.white60,
                      fontWeight: FontWeight.w600)),
            ],
          ),
          Column(
            children: [
              const Text('🏥', style: TextStyle(fontSize: 28)),
              const SizedBox(height: 8),
              // ✅ Soft teal Shop Now button
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Medical Products — 50% OFF deals loading...'),
                      backgroundColor: Color(0xFF3DBCB8),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                  decoration: BoxDecoration(
                    color: AppColors.green, // ✅ soft teal
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(AppStrings.shopNow,
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ✅ Smaller bar chart — soft teal highlight bar
class _MiniBarChart extends StatelessWidget {
  const _MiniBarChart();

  @override
  Widget build(BuildContext context) {
    final heights = [0.60, 0.80, 0.55, 0.90, 0.70, 0.50, 0.85];
    final colors = [
      AppColors.navy,
      AppColors.navy,
      const Color(0xFFCBD5E1),
      AppColors.green,        // ✅ soft teal highlight
      AppColors.navy,
      const Color(0xFFCBD5E1),
      AppColors.navy,
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: SizedBox(
        height: 48,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(7, (i) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: FractionallySizedBox(
                  heightFactor: heights[i],
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: colors[i],
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(3)),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _ChartLabels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const labels = [
      'Apr 10', 'Apr 11', 'Apr 12', 'Apr 13', 'Apr 14', 'Apr 15', 'Apr 16'
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 2, 14, 8),
      child: Row(
        children: labels
            .map((l) => Expanded(
                  child: Text(l,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 8,
                          color: AppColors.muted,
                          fontWeight: FontWeight.w600)),
                ))
            .toList(),
      ),
    );
  }
}