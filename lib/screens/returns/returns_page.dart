import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../widgets/common_widgets.dart';

class ReturnsPage extends StatelessWidget {
  const ReturnsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          const SubPageHeader(
            title: AppStrings.returnsTitle,
            subtitle: AppStrings.returnsSub,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  const AppSearchBar(hint: AppStrings.searchReturn),
                  _OtpStrip(),
                  const SizedBox(height: 48),
                  const Text('📦', style: TextStyle(fontSize: 42)),
                  const SizedBox(height: 12),
                  const Text(
                    AppStrings.noReturns,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 13,
                        color: AppColors.muted,
                        fontWeight: FontWeight.w600,
                        height: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OtpStrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.iconOrange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.lock_outline_rounded, size: 16, color: Color(0xFF92400E)),
          SizedBox(width: 8),
          Text(
            AppStrings.returnsOtp,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Color(0xFF92400E)),
          ),
        ],
      ),
    );
  }
}
