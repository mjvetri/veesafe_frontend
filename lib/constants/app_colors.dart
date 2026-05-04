
// import 'package:flutter/material.dart';

// const kGreen      = Color(0xFF4CAF50);
// const kBlue       = Color(0xFF113A7A);   // ← exact color from image
// const kDarkNavy   = Color(0xFF113A7A);   // ← same
// const kBlack      = Color(0xFF111111);
// const kGrey       = Color(0xFF777777);
// const kLightGrey  = Color(0xFFF2F2F2);
// const kBorderGrey = Color(0xFFEEEEEE);
// const kPink       = Color(0xFFFCE4EC);
// const kLavender   = Color(0xFFEDE7F6);
// const kBlueLite   = Color(0xFFEEF3FB);



































import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Brand / Navy ─────────────────────────────────────────────
  static const Color navy      = Color(0xFF1A2B5E);
  static const Color navyLight = Color(0xFF243870);

  // ── Teal / Green ─────────────────────────────────────────────
  static const Color green     = Color(0xFF3DBCB8);
  static const Color greenDark = Color(0xFF2E9E9A);

  // ── Semantic ──────────────────────────────────────────────────
  static const Color red    = Color(0xFFFF4757);
  static const Color orange = Color(0xFFE07A00);

  // ── Backgrounds ───────────────────────────────────────────────
  static const Color bg     = Color(0xFFF0F4FF);
  static const Color card   = Colors.white;
  static const Color border = Color(0xFFE8EDF5);

  // ── Text ──────────────────────────────────────────────────────
  static const Color muted = Color(0xFF94A3B8);
  static const Color sub   = Color(0xFF64748B);

  // ── Icon backgrounds ──────────────────────────────────────────
  static const Color iconNavy   = Color(0xFFEEF2FF);
  static const Color iconGreen  = Color(0xFFE0F7F4);
  static const Color iconOrange = Color(0xFFFFF4E6);
  static const Color iconRed    = Color(0xFFFFF0F0);

  // ── Tags ──────────────────────────────────────────────────────
  static const Color tagActiveBg = Color(0xFFE0F7F4);
  static const Color tagActiveFg = Color(0xFF0D6E5F);
  static const Color tagHotBg    = Color(0xFFFFF0F0);
  static const Color tagNewBg    = Color(0xFFFFF4E6);
  static const Color tagNewFg    = Color(0xFFE07A00);

  // ── Status ────────────────────────────────────────────────────
  static const Color statusDeliveredBg = Color(0xFFE0F7F4);
  static const Color statusDeliveredFg = Color(0xFF0D6E5F);
  static const Color statusReturnBg    = Color(0xFFFFF0F0);
  static const Color statusPendingBg   = Color(0xFFFFF4E6);

  // ── Legacy k-constants (from old app_color.dart) ──────────────
  static const Color kGreen      = Color(0xFF4CAF50);
  static const Color kBlue       = Color(0xFF113A7A);
  static const Color kDarkNavy   = Color(0xFF113A7A);
  static const Color kBlack      = Color(0xFF111111);
  static const Color kGrey       = Color(0xFF777777);
  static const Color kLightGrey  = Color(0xFFF2F2F2);
  static const Color kBorderGrey = Color(0xFFEEEEEE);
  static const Color kPink       = Color(0xFFFCE4EC);
  static const Color kLavender   = Color(0xFFEDE7F6);
  static const Color kBlueLite   = Color(0xFFEEF3FB);
}