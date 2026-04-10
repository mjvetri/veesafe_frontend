import 'package:flutter/material.dart';

class ReviewFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const ReviewFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: sw * 0.045, vertical: sw * 0.018),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1A2B5E) : Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF1A2B5E)
                : const Color(0xFFE0E0E0),
            width: 1.5,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                      color: const Color(0xFF1A2B5E).withValues(alpha: 0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 3))
                ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: sw * 0.03,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : const Color(0xFF1A2340),
          ),
        ),
      ),
    );
  }
}