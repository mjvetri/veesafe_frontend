import 'package:flutter/material.dart';
import '../../../models/healthcare_models.dart';
import '../healthcare_screen.dart';
import '../nursing_care_screen.dart';
import '../caretaker_screen.dart';

class HealthcareAssistanceWidget extends StatelessWidget {
  final String? productName;
  const HealthcareAssistanceWidget({super.key, this.productName});

  static const Color _navy = Color(0xFF1A2B5E);
  static const Color _teal = Color(0xFF2BB5A0);
  static const Color _red = Color(0xFFE53E3E);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F7FB),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _navy.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: _navy,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.health_and_safety_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Need Assistance?',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1A2340),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        productName != null
                            ? 'Book a caregiver to assist with $productName'
                            : 'Book a qualified Nurse or Caretaker at home',
                        style: const TextStyle(
                          fontSize: 10.5,
                          color: Color(0xFF8A94A6),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: _navy.withOpacity(0.1)),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: _btn(
                    context,
                    Icons.local_hospital_rounded,
                    'Book\nNurse',
                    _navy,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const NursingCareScreen(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _btn(
                    context,
                    Icons.support_agent_rounded,
                    'Book\nCaretaker',
                    _teal,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CaretakerScreen(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _btn(
                    context,
                    Icons.elderly_rounded,
                    'Senior\nCare',
                    _red,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CaretakerScreen(
                          preSelectedType: CaretakerType.seniorCitizenCare,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HomeHealthcareScreen()),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: _navy.withOpacity(0.05),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'View All Home Healthcare Services',
                    style: TextStyle(
                      fontSize: 11,
                      color: _navy,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.arrow_forward_ios_rounded, size: 10, color: _navy),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _btn(
    BuildContext context,
    IconData icon,
    String label,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withOpacity(0.35)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 22, color: color),
            const SizedBox(height: 5),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 9.5,
                fontWeight: FontWeight.w700,
                color: color,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
