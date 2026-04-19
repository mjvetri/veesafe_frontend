import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

// ─── Sub Page Header ──────────────────────────────────────────────────────────
class SubPageHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onBack;

  const SubPageHeader({super.key, required this.title, required this.subtitle, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.navy,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onBack ?? () => Navigator.maybePop(context),
            child: const Row(
              children: [
                Icon(Icons.chevron_left_rounded, color: Colors.white60, size: 20),
                Text('Back',
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white60)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(title,
              style: const TextStyle(
                  fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white)),
          const SizedBox(height: 2),
          Text(subtitle,
              style: const TextStyle(
                  fontSize: 11, color: Colors.white54, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

// ─── Section Label ────────────────────────────────────────────────────────────
class SectionLabel extends StatelessWidget {
  final String text;
  const SectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          color: AppColors.muted,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}

// ─── Search Bar ───────────────────────────────────────────────────────────────
class AppSearchBar extends StatelessWidget {
  final String hint;
  const AppSearchBar({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, color: AppColors.muted, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                    color: Color(0xFFCBD5E1),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: const TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.navy),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Filter Row ───────────────────────────────────────────────────────────────
class FilterRow extends StatelessWidget {
  final List<String> items;
  final int selected;
  final ValueChanged<int> onSelect;
  final double topPad;

  const FilterRow({
    super.key,
    required this.items,
    required this.selected,
    required this.onSelect,
    this.topPad = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.fromLTRB(12, topPad, 12, 10),
      child: Row(
        children: List.generate(items.length, (i) {
          final active = selected == i;
          return GestureDetector(
            onTap: () => onSelect(i),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: active ? AppColors.navy : AppColors.iconNavy,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                items[i],
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: active ? Colors.white : AppColors.navy,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ─── Period Chip ─────────────────────────────────────────────────────────────
class PeriodChip extends StatelessWidget {
  final String label;
  const PeriodChip(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFE2E8F0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label,
          style: const TextStyle(
              fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.muted)),
    );
  }
}

// ─── Outline Button ──────────────────────────────────────────────────────────
class AppOutlineBtn extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  const AppOutlineBtn({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap ?? () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.navy,
        side: const BorderSide(color: AppColors.navy, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 8),
        textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800),
      ),
      child: Text(label),
    );
  }
}

// ─── Filled Button ───────────────────────────────────────────────────────────
class AppFilledBtn extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  const AppFilledBtn({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap ?? () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.navy,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 8),
        elevation: 0,
        textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800),
      ),
      child: Text(label),
    );
  }
}