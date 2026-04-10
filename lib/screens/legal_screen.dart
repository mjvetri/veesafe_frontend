// lib/screens/legal_screen.dart

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class LegalScreen extends StatelessWidget {
  const LegalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _appBar(context),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    _legalTile(
                      context,
                      icon: Icons.description_outlined,
                      label: 'Terms and Conditions',
                      onTap: () {},
                    ),
                    _divider(),
                    _legalTile(
                      context,
                      icon: Icons.headset_mic_outlined,
                      label: 'Customer Support Policy',
                      onTap: () {},
                    ),
                    _divider(),
                    _legalTile(
                      context,
                      icon: Icons.lock_outline_rounded,
                      label: 'Privacy Policy',
                      onTap: () {},
                    ),
                    _divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ════════════════════════════════════════
  //  APP BAR
  // ════════════════════════════════════════
  Widget _appBar(BuildContext context) => Container(
        color: kBlue,
        padding: const EdgeInsets.fromLTRB(4, 6, 14, 10),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  size: 18, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Legal',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 48),
          ],
        ),
      );

  // ════════════════════════════════════════
  //  LEGAL TILE — icon + label + chevron
  // ════════════════════════════════════════
  Widget _legalTile(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) =>
      Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: kBlueLite,
          highlightColor: kBlueLite,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
              child: Row(
                children: [
                  // Icon box
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: kBlueLite,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, size: 22, color: kBlue),
                  ),
                  const SizedBox(width: 14),
                  // Label
                  Expanded(
                    child: Text(
                      label,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kBlack),
                    ),
                  ),
                  // Chevron
                  const Icon(Icons.chevron_right,
                      size: 20, color: kBorderGrey),
                ],
              ),
            ),
          ),
        ),
      );

  // ════════════════════════════════════════
  //  DIVIDER
  // ════════════════════════════════════════
  Widget _divider() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Divider(color: kBorderGrey, thickness: 1, height: 1),
      );
}