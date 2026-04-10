// lib/screens/change_password_screen.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_colors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _newPassCtrl     = TextEditingController();
  final _confirmPassCtrl = TextEditingController();
  bool _showNew     = false;
  bool _showConfirm = false;

  void _showSnack(String msg, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ── App Bar ──
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [kBlue, Color(0xFF1A73E8)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
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
                      child: Text('Change Password',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    const Text(
                      'Create a new password',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: kBlack),
                    ),
                    const SizedBox(height: 32),

                    // ── New Password ──
                    _passField(
                      hint: 'New Password',
                      controller: _newPassCtrl,
                      show: _showNew,
                      onToggle: () =>
                          setState(() => _showNew = !_showNew),
                    ),
                    const SizedBox(height: 16),

                    // ── Re-enter Password ──
                    _passField(
                      hint: 'Re-enter new password',
                      controller: _confirmPassCtrl,
                      show: _showConfirm,
                      onToggle: () =>
                          setState(() => _showConfirm = !_showConfirm),
                    ),

                    const SizedBox(height: 32),

                    // ── Continue Button ──
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kBlue,
                          padding:
                              const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 3,
                        ),
                        onPressed: () async {
                          if (_newPassCtrl.text.trim().isEmpty) {
                            _showSnack(
                                'Please enter a new password!', Colors.red);
                            return;
                          }
                          if (_newPassCtrl.text.length < 6) {
                            _showSnack(
                                'Password must be at least 6 characters!',
                                Colors.red);
                            return;
                          }
                          if (_newPassCtrl.text !=
                              _confirmPassCtrl.text) {
                            _showSnack(
                                'Passwords do not match!', Colors.red);
                            return;
                          }
                          // ── Save to SharedPreferences ──
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setString('password', _newPassCtrl.text.trim());
                          _showSnack('✅ Password changed successfully!',
                              const Color(0xFF16A34A));
                          // ── Return new password to profile screen ──
                          Navigator.pop(context, _newPassCtrl.text.trim());
                        },
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _passField({
    required String hint,
    required TextEditingController controller,
    required bool show,
    required VoidCallback onToggle,
  }) =>
      TextField(
        controller: controller,
        obscureText: !show,
        style: const TextStyle(fontSize: 14, color: kBlack),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle:
              const TextStyle(fontSize: 13, color: kGrey),
          suffixIcon: IconButton(
            icon: Icon(
                show ? Icons.visibility_off : Icons.visibility,
                size: 20,
                color: kGrey),
            onPressed: onToggle,
          ),
          filled: true,
          fillColor: const Color(0xFFF5F7FA),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                const BorderSide(color: Color(0xFFE8ECF4), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: kBlue, width: 1.8),
          ),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 14),
        ),
      );
}