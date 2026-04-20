import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';

class InformedTab extends StatelessWidget {
  const InformedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          _CarePlanCard(),
          const _InformedCard(
            title: '🏥 Account Health: Good Standing',
            body: 'Your seller account is in good standing. Order defect rate below 1%. Keep up the great work!',
            tag: 'Performance',
            tagType: _TagType.green,
          ),
          const _InformedCard(
            title: '📦 GST Filing Reminder',
            body: 'Monthly GST return is due in 5 days. Ensure your medical product records are up to date.',
            tag: 'Compliance',
            tagType: _TagType.orange,
          ),
          const _InformedCard(
            title: '🚚 Free Delivery Milestone Reached',
            body: 'You\'ve unlocked free delivery on all orders above \$260. Veesafe guaranteed delivery active.',
            tag: 'Shipping',
            tagType: _TagType.green,
          ),
          const _InformedCard(
            title: '📣 Sale Event Planner — Summer Health Sale',
            body: 'Plan inventory and pricing for the upcoming summer health product sale. Hospital beds trending.',
            tag: 'Growth',
            tagType: _TagType.navy,
          ),
        ],
      ),
    );
  }
}

class _CarePlanCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.iconNavy,
        border: Border.all(color: const Color(0xFFC7D2FE), width: 1.5),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppStrings.carePlanTitle,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.navy),
          ),
          const SizedBox(height: 6),
          const Text(
            AppStrings.carePlanBody,
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.sub,
                height: 1.5),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.navy,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                AppStrings.joinNow,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum _TagType { green, orange, navy }

class _InformedCard extends StatelessWidget {
  final String title;
  final String body;
  final String tag;
  final _TagType tagType;

  const _InformedCard({
    required this.title,
    required this.body,
    required this.tag,
    required this.tagType,
  });

  @override
  Widget build(BuildContext context) {
    Color tagBg, tagFg;
    switch (tagType) {
      case _TagType.green:
        tagBg = AppColors.tagActiveBg;
        tagFg = AppColors.tagActiveFg;
        break;
      case _TagType.orange:
        tagBg = AppColors.iconOrange;
        tagFg = AppColors.orange;
        break;
      case _TagType.navy:
        tagBg = AppColors.iconNavy;
        tagFg = AppColors.navy;
        break;
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 10, 12, 0),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: AppColors.navy)),
          const SizedBox(height: 4),
          Text(body,
              style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.sub,
                  height: 1.5)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: tagBg,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(tag,
                style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    color: tagFg)),
          ),
        ],
      ),
    );
  }
}
