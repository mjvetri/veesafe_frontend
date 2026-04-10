import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color _reNavy  = Color(0xFF1A2B5E);
const Color _reBg    = Color(0xFFF2F6FA);
const Color _reDark  = Color(0xFF1A2340);
const Color _reGrey  = Color(0xFF8A94A6);
const Color _reOrange = Color(0xFFF6971E);

// ════════════════════════════════════════════════════
// REFER & EARN SCREEN
// ════════════════════════════════════════════════════
class ReferAndEarnScreen extends StatelessWidget {
  const ReferAndEarnScreen({super.key});
  static const String _code = 'C0H5E2';

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _reBg,
      body: Column(
        children: [
          _buildAppBar(context, sw),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(sw * 0.04),
                child: Column(
                  children: [
                    SizedBox(height: sw * 0.03),
                    _buildIllustration(sw),
                    SizedBox(height: sw * 0.06),
                    _buildReferralCard(context, sw),
                    SizedBox(height: sw * 0.04),
                    _buildInviteButton(context, sw),
                    SizedBox(height: sw * 0.06),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, double sw) {
    return Container(
      color: _reNavy,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(sw * 0.04, sw * 0.025, sw * 0.04, sw * 0.038),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: sw * 0.085, height: sw * 0.085,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(sw * 0.02),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
                  ),
                  child: Icon(Icons.chevron_left_rounded, color: Colors.white, size: sw * 0.052),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text('Refer and Earn',
                      style: TextStyle(color: Colors.white, fontSize: sw * 0.042, fontWeight: FontWeight.w700)),
                ),
              ),
              Container(
                width: sw * 0.085, height: sw * 0.085,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12), shape: BoxShape.circle),
                child: Icon(Icons.notifications_outlined, color: Colors.white, size: sw * 0.042),
              ),
              SizedBox(width: sw * 0.025),
              Container(
                width: sw * 0.085, height: sw * 0.085,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  color: const Color(0xFFFFCBA4),
                ),
                child: Icon(Icons.person_rounded, color: const Color(0xFF8B4513), size: sw * 0.055),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIllustration(double sw) {
    return Container(
      width: sw * 0.85,
      height: sw * 0.65,
      decoration: BoxDecoration(
        color: const Color(0xFFEEF4FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background glow
          Container(
            width: sw * 0.45, height: sw * 0.45,
            decoration: BoxDecoration(
              color: _reNavy.withValues(alpha: 0.06), shape: BoxShape.circle),
          ),
          // Person figure
          Positioned(
            left: sw * 0.1, bottom: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: sw * 0.1, height: sw * 0.1,
                    decoration: const BoxDecoration(color: Color(0xFFFFCBA4), shape: BoxShape.circle)),
                Container(
                  width: sw * 0.14, height: sw * 0.18,
                  decoration: const BoxDecoration(
                    color: Color(0xFF4A90D9),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  ),
                  child: Center(child: Icon(Icons.add, color: Colors.white, size: sw * 0.045)),
                ),
                Row(mainAxisSize: MainAxisSize.min, children: [
                  Container(width: sw * 0.055, height: sw * 0.07,
                      decoration: BoxDecoration(color: _reNavy,
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)))),
                  SizedBox(width: sw * 0.025),
                  Container(width: sw * 0.055, height: sw * 0.07,
                      decoration: BoxDecoration(color: _reNavy,
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)))),
                ]),
              ],
            ),
          ),
          // Gift boxes
          Positioned(
            right: sw * 0.06, bottom: sw * 0.04,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: sw * 0.16, height: sw * 0.14,
                  decoration: BoxDecoration(color: _reOrange, borderRadius: BorderRadius.circular(6)),
                  child: Center(child: Icon(Icons.card_giftcard, color: Colors.white, size: sw * 0.07)),
                ),
                SizedBox(height: sw * 0.015),
                Container(
                  width: sw * 0.18, height: sw * 0.16,
                  decoration: BoxDecoration(color: const Color(0xFFE67E22), borderRadius: BorderRadius.circular(8)),
                  child: Center(child: Icon(Icons.card_giftcard, color: Colors.white, size: sw * 0.08)),
                ),
              ],
            ),
          ),
          // % badge
          Positioned(
            top: sw * 0.05, right: sw * 0.12,
            child: Container(
              width: sw * 0.12, height: sw * 0.12,
              decoration: BoxDecoration(
                color: _reNavy, shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: _reNavy.withValues(alpha: 0.3), blurRadius: 8)],
              ),
              child: Center(child: Text('%', style: TextStyle(color: Colors.white, fontSize: sw * 0.048, fontWeight: FontWeight.w900))),
            ),
          ),
          // Document icon
          Positioned(
            top: sw * 0.06, left: sw * 0.06,
            child: Container(
              width: sw * 0.12, height: sw * 0.14,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 6, offset: const Offset(0, 3))]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (i) => Container(
                  margin: EdgeInsets.symmetric(horizontal: sw * 0.015, vertical: sw * 0.005),
                  height: sw * 0.008,
                  decoration: BoxDecoration(color: const Color(0xFFE0E0E0), borderRadius: BorderRadius.circular(4)),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReferralCard(BuildContext context, double sw) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(sw * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.07), blurRadius: 14, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          Text('Your Referral Code',
              style: TextStyle(fontSize: sw * 0.034, fontWeight: FontWeight.w700, color: _reDark)),
          SizedBox(height: sw * 0.03),
          Container(
            padding: EdgeInsets.symmetric(horizontal: sw * 0.04, vertical: sw * 0.022),
            decoration: BoxDecoration(color: _reNavy, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ..._code.split('').map((char) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: sw * 0.015),
                  child: Text(char, style: TextStyle(color: Colors.white, fontSize: sw * 0.042, fontWeight: FontWeight.w800)),
                )),
                SizedBox(width: sw * 0.02),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(const ClipboardData(text: _code));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Code copied!', style: TextStyle(fontSize: sw * 0.03)),
                          backgroundColor: _reNavy, duration: const Duration(seconds: 1)));
                  },
                  child: Container(
                    padding: EdgeInsets.all(sw * 0.015),
                    decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(6)),
                    child: Icon(Icons.copy_rounded, color: Colors.white, size: sw * 0.035),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: sw * 0.025),
          Text('Copy your code & share it with\nyour friends',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: sw * 0.03, color: _reGrey, height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildInviteButton(BuildContext context, double sw) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Share code: $_code', style: TextStyle(fontSize: sw * 0.03)),
                backgroundColor: _reNavy, duration: const Duration(seconds: 2)));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: _reNavy,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.symmetric(vertical: sw * 0.038),
          elevation: 4,
          shadowColor: _reNavy.withValues(alpha: 0.4),
        ),
        child: Text('Invite a friend',
            style: TextStyle(color: Colors.white, fontSize: sw * 0.036, fontWeight: FontWeight.w700)),
      ),
    );
  }
}