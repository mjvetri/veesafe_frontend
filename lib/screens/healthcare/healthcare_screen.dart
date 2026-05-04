// lib/screens/healthcare/healthcare_screen.dart
// ─────────────────────────────────────────────────────────────────────────────
// Home Healthcare – Main Landing Screen
// Entry point: shows "Book Nurse" / "Book Caretaker" / "Senior Citizen Care"
// Follows the same style & navigation pattern as category_screen.dart
// ─────────────────────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../models/healthcare_models.dart';
import 'nursing_care_screen.dart';
import 'caretaker_screen.dart';

class HomeHealthcareScreen extends StatelessWidget {
  const HomeHealthcareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: AppColors.kBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Home Healthcare',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 17,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _heroBanner(sw),
            const SizedBox(height: 20),
            _sectionTitle('What do you need?'),
            const SizedBox(height: 12),
            _mainCategoryCards(context, sw),
            const SizedBox(height: 24),
            _sectionTitle('Quick Book'),
            const SizedBox(height: 12),
            _quickBookButtons(context, sw),
            const SizedBox(height: 24),
            _howItWorks(sw),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // ── Hero Banner ───────────────────────────────────────────────────────────
  Widget _heroBanner(double sw) => Container(
    width: double.infinity,
    margin: EdgeInsets.zero,
    padding: EdgeInsets.symmetric(horizontal: sw * 0.05, vertical: sw * 0.06),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [AppColors.kBlue, Color(0xFF1B5E20)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Trusted Care at Home',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Book a Nurse or\nCaretaker Today',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w900,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Qualified, background-verified caregivers\ndeployed to your home within hours.',
          style: TextStyle(color: Colors.white70, fontSize: 12.5, height: 1.5),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            _heroPill(Icons.verified_user_outlined, 'Verified'),
            const SizedBox(width: 10),
            _heroPill(Icons.access_time_rounded, '24/7 Available'),
            const SizedBox(width: 10),
            _heroPill(Icons.favorite_outline_rounded, 'Certified'),
          ],
        ),
      ],
    ),
  );

  Widget _heroPill(IconData icon, String label) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.15),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.white.withOpacity(0.3)),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 12),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10.5,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );

  // ── Section Title ─────────────────────────────────────────────────────────
  Widget _sectionTitle(String title) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            color: AppColors.kBlue,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: AppColors.kBlack,
          ),
        ),
      ],
    ),
  );

  // ── Main Category Cards ───────────────────────────────────────────────────
  Widget _mainCategoryCards(BuildContext context, double sw) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14),
    child: Row(
      children: [
        Expanded(
          child: _categoryCard(
            context: context,
            icon: Icons.medical_services_rounded,
            iconBg: const Color(0xFFE8F0FE),
            iconColor: AppColors.kBlue,
            title: 'Nursing\nCare',
            subtitle: '4 service types',
            badgeText: null,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NursingCareScreen()),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _categoryCard(
            context: context,
            icon: Icons.people_alt_rounded,
            iconBg: const Color(0xFFE0F2F1),
            iconColor: const Color(0xFF00796B),
            title: 'Caretaker /\nAttendant',
            subtitle: '4 service types',
            badgeText: 'Top Pick',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CaretakerScreen()),
            ),
          ),
        ),
      ],
    ),
  );

  Widget _categoryCard({
    required BuildContext context,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
    String? badgeText,
    required VoidCallback onTap,
  }) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, size: 24, color: iconColor),
              ),
              if (badgeText != null) ...[
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    badgeText,
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFE65100),
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: AppColors.kBlack,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 10.5, color: AppColors.kGrey),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text(
                'Book Now',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppColors.kBlue,
                ),
              ),
              const SizedBox(width: 2),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 10,
                color: AppColors.kBlue,
              ),
            ],
          ),
        ],
      ),
    ),
  );

  // ── Quick Book Buttons ─────────────────────────────────────────────────────
  Widget _quickBookButtons(BuildContext context, double sw) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14),
    child: Column(
      children: [
        _quickBookTile(
          context: context,
          icon: Icons.elderly_rounded,
          iconBg: const Color(0xFFFCE4EC),
          iconColor: const Color(0xFFC62828),
          title: 'Senior Citizen Care',
          subtitle: 'Highest priority · 24-hour dedicated care',
          badgeText: '⭐ Most Booked',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CaretakerScreen(
                preSelectedType: CaretakerType.seniorCitizenCare,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        _quickBookTile(
          context: context,
          icon: Icons.local_hospital_rounded,
          iconBg: const Color(0xFFE3F2FD),
          iconColor: AppColors.kBlue,
          title: 'Book a Nurse',
          subtitle: 'Basic to ICU-Trained · Hourly / 12H / 24H',
          badgeText: null,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const NursingCareScreen()),
          ),
        ),
        const SizedBox(height: 10),
        _quickBookTile(
          context: context,
          icon: Icons.support_agent_rounded,
          iconBg: const Color(0xFFE8F5E9),
          iconColor: const Color(0xFF2E7D32),
          title: 'Book a Caretaker',
          subtitle: 'Male / Female · 8H / 12H / 24H',
          badgeText: null,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CaretakerScreen()),
          ),
        ),
      ],
    ),
  );

  Widget _quickBookTile({
    required BuildContext context,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
    String? badgeText,
    required VoidCallback onTap,
  }) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEEEEEE)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 22, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.kBlack,
                        ),
                      ),
                    ),
                    if (badgeText != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F5E9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          badgeText,
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2E7D32),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 11, color: AppColors.kGrey),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          const Icon(
            Icons.chevron_right_rounded,
            size: 20,
            color: AppColors.kGrey,
          ),
        ],
      ),
    ),
  );

  // ── How It Works ──────────────────────────────────────────────────────────
  Widget _howItWorks(double sw) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14),
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kBlueLite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'How It Works',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: AppColors.kBlue,
            ),
          ),
          const SizedBox(height: 12),
          _step('1', 'Select Service', 'Choose Nurse or Caretaker type'),
          const SizedBox(height: 8),
          _step('2', 'Pick Duration & Date', 'Set the schedule that suits you'),
          const SizedBox(height: 8),
          _step(
            '3',
            'Enter Patient Details',
            "Tell us about the patient's needs",
          ),
          const SizedBox(height: 8),
          _step(
            '4',
            'Confirm Booking',
            'We deploy a verified professional to you',
          ),
        ],
      ),
    ),
  );

  Widget _step(String num, String title, String sub) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: AppColors.kBlue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            num,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w700,
                color: AppColors.kBlack,
              ),
            ),
            Text(
              sub,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.kGrey,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
