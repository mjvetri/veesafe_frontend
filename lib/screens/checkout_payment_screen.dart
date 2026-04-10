import 'package:flutter/material.dart';
import 'checkout_address_screen.dart';

// ── Colors
const Color _kNavy   = Color(0xFF1A2B5E);
const Color _kBg     = Color(0xFFF2F4F8);
const Color _kWhite  = Colors.white;
const Color _kGrey   = Color(0xFF8A94A6);
const Color _kDark   = Color(0xFF1A2340);
const Color _kBorder = Color(0xFFE2E8F0);

// ════════════════════════════════════════════════════════
// STEP INDICATOR (shared across all 3 pages)
// ════════════════════════════════════════════════════════
class CheckoutStepBar extends StatelessWidget {
  final int currentStep; // 0=Payment, 1=Address, 2=PlaceOrder
  const CheckoutStepBar({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final steps = ['Payment', 'Address', 'Place order'];
    return Container(
      color: _kWhite,
      padding: EdgeInsets.symmetric(horizontal: sw * 0.06, vertical: sw * 0.04),
      child: Row(
        children: List.generate(steps.length, (i) {
          final bool done   = i < currentStep;
          final bool active = i == currentStep;
          return Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    if (i > 0)
                      Expanded(
                        child: Container(
                          height: 2,
                          color: i <= currentStep ? _kNavy : _kBorder,
                        ),
                      ),
                    Container(
                      width: sw * 0.07,
                      height: sw * 0.07,
                      decoration: BoxDecoration(
                        color: (active || done) ? _kNavy : _kBg,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: (active || done) ? _kNavy : _kBorder,
                          width: 2,
                        ),
                      ),
                      child: done
                          ? Icon(Icons.check, color: _kWhite, size: sw * 0.032)
                          : Center(
                              child: Text(
                                '${i + 1}',
                                style: TextStyle(
                                  color: active ? _kWhite : _kGrey,
                                  fontSize: sw * 0.028,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                    ),
                    if (i < steps.length - 1)
                      Expanded(
                        child: Container(
                          height: 2,
                          color: i < currentStep ? _kNavy : _kBorder,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: sw * 0.015),
                Text(
                  steps[i],
                  style: TextStyle(
                    fontSize: sw * 0.027,
                    fontWeight: (active || done) ? FontWeight.w700 : FontWeight.w400,
                    color: (active || done) ? _kNavy : _kGrey,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════
// CHECKOUT PAGE 1/3 — PAYMENT
// ════════════════════════════════════════════════════════
class CheckoutPaymentScreen extends StatefulWidget {
  const CheckoutPaymentScreen({super.key});
  @override
  State<CheckoutPaymentScreen> createState() => _CheckoutPaymentScreenState();
}

class _CheckoutPaymentScreenState extends State<CheckoutPaymentScreen> {
  int  _selectedQuick      = 0;
  bool _savedCardsExpanded = false;
  bool _emiExpanded        = false;
  bool _noCostOnly         = false;
  bool _cardExpanded       = false;
  bool _netExpanded        = false;
  bool _codExpanded        = false;
  final _cvvCtrl  = TextEditingController();
  final _giftCtrl = TextEditingController();

  @override
  void dispose() {
    _cvvCtrl.dispose();
    _giftCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _kBg,
      body: Column(
        children: [
          _header(context, 'Checkout (1/3)', sw),
          const CheckoutStepBar(currentStep: 0),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: sw * 0.04),
                  _quickPay(sw),
                  SizedBox(height: sw * 0.04),
                  _otherModes(sw),
                  SizedBox(height: sw * 0.04),
                  _giftCard(sw),
                  SizedBox(height: sw * 0.06),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Header
  Widget _header(BuildContext context, String title, double sw) {
    return Container(
      color: _kNavy,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(sw * 0.04, sw * 0.025, sw * 0.04, sw * 0.035),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: sw * 0.088,
                  height: sw * 0.088,
                  decoration: BoxDecoration(
                    color: _kWhite.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(sw * 0.022),
                    border: Border.all(color: _kWhite.withValues(alpha: 0.25)),
                  ),
                  child: Icon(Icons.chevron_left_rounded, color: _kWhite, size: sw * 0.055),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(title,
                      style: TextStyle(
                          color: _kWhite,
                          fontSize: sw * 0.043,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              SizedBox(width: sw * 0.088),
            ],
          ),
        ),
      ),
    );
  }

  // ── Quick Pay
  Widget _quickPay(double sw) {
    return _card(
      sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most commonly used modes of payment',
              style: TextStyle(fontSize: sw * 0.03, color: _kGrey)),
          SizedBox(height: sw * 0.03),
          Row(
            children: [
              _quickOption(0, 'Paytm', Colors.blue, sw),
              SizedBox(width: sw * 0.03),
              _quickOption(1, 'G Pay', Colors.grey.shade700, sw),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quickOption(int idx, String label, Color color, double sw) {
    final bool sel = _selectedQuick == idx;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedQuick = idx),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: sw * 0.03, vertical: sw * 0.03),
          decoration: BoxDecoration(
            color: sel ? _kNavy.withValues(alpha: 0.05) : _kWhite,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: sel ? _kNavy : _kBorder, width: sel ? 2 : 1),
          ),
          child: Row(
            children: [
              Container(
                width: sw * 0.042,
                height: sw * 0.042,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: sel ? _kNavy : _kGrey, width: 2),
                ),
                child: sel
                    ? Center(
                        child: Container(
                          width: sw * 0.02,
                          height: sw * 0.02,
                          decoration: const BoxDecoration(color: _kNavy, shape: BoxShape.circle),
                        ),
                      )
                    : null,
              ),
              SizedBox(width: sw * 0.02),
              Text(label,
                  style: TextStyle(
                      fontSize: sw * 0.032,
                      fontWeight: FontWeight.w700,
                      color: color)),
            ],
          ),
        ),
      ),
    );
  }

  // ── Other Modes
  Widget _otherModes(double sw) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: sw * 0.025),
            child: Text('OTHER MODES OF PAYMENT',
                style: TextStyle(
                    fontSize: sw * 0.027,
                    fontWeight: FontWeight.w700,
                    color: _kGrey,
                    letterSpacing: 0.8)),
          ),
          Container(
            decoration: BoxDecoration(
              color: _kWhite,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 10, offset: const Offset(0, 3))],
            ),
            child: Column(
              children: [
                _expandItem('Saved Cards', Icons.credit_card_rounded,
                    _savedCardsExpanded, sw,
                    () => setState(() => _savedCardsExpanded = !_savedCardsExpanded),
                    _savedCardsContent(sw)),
                _divider(),
                _expandItem('EMI Option', Icons.calendar_today_outlined,
                    _emiExpanded, sw,
                    () => setState(() => _emiExpanded = !_emiExpanded),
                    _emiContent(sw)),
                _divider(),
                _expandItem('Credit / Debit / ATM cards', Icons.credit_card_rounded,
                    _cardExpanded, sw,
                    () => setState(() => _cardExpanded = !_cardExpanded),
                    _cardEntry(sw)),
                _divider(),
                _expandItem('Net Banking', Icons.account_balance_rounded,
                    _netExpanded, sw,
                    () => setState(() => _netExpanded = !_netExpanded),
                    _infoBox('Select your bank to proceed', sw)),
                _divider(),
                _expandItem('Cash on Delivery', Icons.money_rounded,
                    _codExpanded, sw,
                    () => setState(() => _codExpanded = !_codExpanded),
                    _infoBox('Pay when your order arrives', sw)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _expandItem(String title, IconData icon, bool expanded, double sw,
      VoidCallback onTap, Widget child) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: sw * 0.04, vertical: sw * 0.038),
            child: Row(
              children: [
                Icon(icon, color: _kNavy, size: sw * 0.046),
                SizedBox(width: sw * 0.03),
                Expanded(
                  child: Text(title,
                      style: TextStyle(
                          fontSize: sw * 0.033,
                          fontWeight: FontWeight.w600,
                          color: _kDark)),
                ),
                Icon(
                  expanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_right_rounded,
                  color: _kGrey, size: sw * 0.052,
                ),
              ],
            ),
          ),
        ),
        if (expanded)
          Padding(
            padding: EdgeInsets.fromLTRB(sw * 0.04, 0, sw * 0.04, sw * 0.04),
            child: child,
          ),
      ],
    );
  }

  Widget _savedCardsContent(double sw) {
    return Column(
      children: [
        // Credit card visual
        Container(
          height: sw * 0.46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            ),
            boxShadow: [BoxShadow(color: const Color(0xFF6A11CB).withValues(alpha: 0.4), blurRadius: 18, offset: const Offset(0, 6))],
          ),
          child: Stack(
            children: [
              // Background circles
              Positioned(
                top: -sw * 0.1, right: -sw * 0.05,
                child: Container(
                  width: sw * 0.5, height: sw * 0.5,
                  decoration: BoxDecoration(color: _kWhite.withValues(alpha: 0.06), shape: BoxShape.circle),
                ),
              ),
              Positioned(
                bottom: -sw * 0.08, left: -sw * 0.08,
                child: Container(
                  width: sw * 0.45, height: sw * 0.45,
                  decoration: BoxDecoration(color: _kWhite.withValues(alpha: 0.06), shape: BoxShape.circle),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(sw * 0.055),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Chip + Mastercard row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: sw * 0.088, height: sw * 0.065,
                          decoration: BoxDecoration(
                              color: Colors.amber.shade300,
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        Stack(children: [
                          Container(
                            width: sw * 0.095, height: sw * 0.095,
                            decoration: BoxDecoration(
                                color: Colors.red.withValues(alpha: 0.85),
                                shape: BoxShape.circle),
                          ),
                          Positioned(
                            left: sw * 0.048,
                            child: Container(
                              width: sw * 0.095, height: sw * 0.095,
                              decoration: BoxDecoration(
                                  color: Colors.orange.withValues(alpha: 0.8),
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ]),
                      ],
                    ),
                    const Spacer(),
                    // CVV field
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: sw * 0.3, height: sw * 0.085,
                        decoration: BoxDecoration(
                          color: _kWhite.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: _kWhite.withValues(alpha: 0.35)),
                        ),
                        child: TextField(
                          controller: _cvvCtrl,
                          textAlign: TextAlign.center,
                          maxLength: 3,
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: _kWhite, fontSize: sw * 0.03),
                          decoration: InputDecoration(
                            hintText: 'Enter CVV',
                            hintStyle: TextStyle(color: _kWhite.withValues(alpha: 0.6), fontSize: sw * 0.025),
                            border: InputBorder.none,
                            counterText: '',
                            contentPadding: EdgeInsets.zero,
                            isDense: true,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: sw * 0.02),
                    Text('4356  XXXX  XXXX  1342',
                        style: TextStyle(
                            color: _kWhite,
                            fontSize: sw * 0.036,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5)),
                    SizedBox(height: sw * 0.018),
                    Row(
                      children: [
                        _cardLabel('CARD HOLDER', 'J.Williams', sw),
                        SizedBox(width: sw * 0.06),
                        _cardLabel('EXPIRES', '06/24', sw),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: sw * 0.03),
        _fullBtn('Pay with this card', _kNavy, sw, onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (_) => const CheckoutAddressScreen(),
        ));
      }),
      ],
    );
  }

  Widget _cardLabel(String label, String value, double sw) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: _kWhite.withValues(alpha: 0.6), fontSize: sw * 0.021, letterSpacing: 0.4)),
        Text(value, style: TextStyle(color: _kWhite, fontSize: sw * 0.03, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _cardEntry(double sw) {
    return Column(
      children: [
        _field('Card Number', Icons.credit_card_rounded, sw),
        SizedBox(height: sw * 0.025),
        Row(
          children: [
            Expanded(child: _field('MM/YY', Icons.date_range_outlined, sw)),
            SizedBox(width: sw * 0.025),
            Expanded(child: _field('CVV', Icons.lock_outline_rounded, sw)),
          ],
        ),
        SizedBox(height: sw * 0.025),
        _fullBtn('Add & Pay', _kNavy, sw, onTap: () {}),
      ],
    );
  }

  Widget _field(String hint, IconData icon, double sw) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: _kGrey, fontSize: sw * 0.032),
        prefixIcon: Icon(icon, color: _kNavy, size: sw * 0.04),
        filled: true,
        fillColor: _kBg,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(horizontal: sw * 0.03, vertical: sw * 0.028),
        isDense: true,
      ),
    );
  }

  // ── EMI Full Content
  Widget _emiContent(double sw) {
    final List<Map<String, String>> noCostPlans = [
      {'plan': '\$2,604 × 3m', 'interest': 'No Cost', 'total': '\$2,604'},
    ];
    final List<Map<String, String>> standardPlans = [
      {'plan': '\$2,604 × 3m', 'interest': '\$698 (4%)', 'total': '\$2,604'},
      {'plan': '\$2,604 × 5m', 'interest': '\$698 (4%)', 'total': '\$2,604'},
      {'plan': '\$2,604 × 3m', 'interest': '\$698 (4%)', 'total': '\$2,604'},
    ];
    final List<String> notes = [
      'Our team of experts is here to make sure you get the best quality products and services at affordable prices.',
      'Our team of experts is here to make sure you get the best quality products and services at affordable prices.',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Toggle row
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: sw * 0.035, vertical: sw * 0.025),
          decoration: BoxDecoration(
            color: _kBg,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "View only 'No Cost' options",
                  style: TextStyle(
                      fontSize: sw * 0.03,
                      color: _kDark,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Switch(
                value: _noCostOnly,
                onChanged: (val) => setState(() => _noCostOnly = val),
                activeThumbColor: _kNavy,
                activeTrackColor: _kNavy.withValues(alpha: 0.3),
                inactiveThumbColor: Colors.grey.shade400,
                inactiveTrackColor: Colors.grey.shade200,
              ),
            ],
          ),
        ),
        SizedBox(height: sw * 0.025),
        // No Cost EMI Plans
        _emiTable(
          title: 'No Cost EMI Options',
          plans: noCostPlans,
          sw: sw,
          isNoCost: true,
        ),
        if (!_noCostOnly) ...[
          SizedBox(height: sw * 0.025),
          // Standard Plans
          _emiTable(
            title: 'Standard Plans',
            plans: standardPlans,
            sw: sw,
            isNoCost: false,
          ),
          SizedBox(height: sw * 0.025),
          // Things to Note
          _emiNotes(notes, sw),
        ],
      ],
    );
  }

  Widget _emiTable({
    required String title,
    required List<Map<String, String>> plans,
    required double sw,
    required bool isNoCost,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: _kBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title row
          Padding(
            padding: EdgeInsets.fromLTRB(sw * 0.035, sw * 0.025, sw * 0.035, sw * 0.01),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: sw * 0.032,
                  fontWeight: FontWeight.w700,
                  color: _kDark),
            ),
          ),
          // Header row
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: sw * 0.035, vertical: sw * 0.018),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border(
                top: BorderSide(color: Colors.grey.shade200),
                bottom: BorderSide(color: Colors.grey.shade200),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text('EMI Plan',
                      style: TextStyle(
                          fontSize: sw * 0.028,
                          fontWeight: FontWeight.w600,
                          color: _kGrey)),
                ),
                Expanded(
                  child: Text('Interest',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: sw * 0.028,
                          fontWeight: FontWeight.w600,
                          color: _kGrey)),
                ),
                Expanded(
                  child: Text('Total Cost',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: sw * 0.028,
                          fontWeight: FontWeight.w600,
                          color: _kGrey)),
                ),
              ],
            ),
          ),
          // Plan rows
          ...plans.map((plan) => Container(
                padding: EdgeInsets.symmetric(
                    horizontal: sw * 0.035, vertical: sw * 0.022),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.shade100)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(plan['plan']!,
                          style: TextStyle(
                              fontSize: sw * 0.03, color: _kDark)),
                    ),
                    Expanded(
                      child: Text(plan['interest']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: sw * 0.03,
                              color: isNoCost
                                  ? const Color(0xFF2E7D32)
                                  : _kDark,
                              fontWeight: isNoCost
                                  ? FontWeight.w600
                                  : FontWeight.w400)),
                    ),
                    Expanded(
                      child: Text(plan['total']!,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: sw * 0.03,
                              fontWeight: FontWeight.w700,
                              color: _kNavy)),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _emiNotes(List<String> notes, double sw) {
    return Container(
      padding: EdgeInsets.all(sw * 0.035),
      decoration: BoxDecoration(
        color: _kBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Things to Note :',
              style: TextStyle(
                  fontSize: sw * 0.032,
                  fontWeight: FontWeight.w700,
                  color: _kDark)),
          SizedBox(height: sw * 0.018),
          ...notes.map((note) => Padding(
                padding: EdgeInsets.only(bottom: sw * 0.015),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: sw * 0.007),
                      width: sw * 0.015,
                      height: sw * 0.015,
                      decoration: BoxDecoration(
                          color: _kNavy, shape: BoxShape.circle),
                    ),
                    SizedBox(width: sw * 0.02),
                    Expanded(
                      child: Text(note,
                          style: TextStyle(
                              fontSize: sw * 0.029,
                              color: _kGrey,
                              height: 1.5)),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _infoBox(String text, double sw) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(sw * 0.035),
      decoration: BoxDecoration(color: _kBg, borderRadius: BorderRadius.circular(10)),
      child: Text(text, style: TextStyle(fontSize: sw * 0.03, color: _kGrey)),
    );
  }

  // ── Gift Card
  Widget _giftCard(double sw) {
    return _card(sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.card_giftcard_rounded, color: _kNavy, size: sw * 0.046),
              SizedBox(width: sw * 0.025),
              Text('Gift Card',
                  style: TextStyle(fontSize: sw * 0.036, fontWeight: FontWeight.w700, color: _kDark)),
            ]),
            SizedBox(height: sw * 0.03),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _giftCtrl,
                    decoration: InputDecoration(
                      hintText: 'Enter gift card code',
                      hintStyle: TextStyle(color: _kGrey, fontSize: sw * 0.031),
                      filled: true, fillColor: _kBg,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.symmetric(horizontal: sw * 0.035, vertical: sw * 0.028),
                      isDense: true,
                    ),
                  ),
                ),
                SizedBox(width: sw * 0.025),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: sw * 0.045, vertical: sw * 0.03),
                    decoration: BoxDecoration(color: _kNavy, borderRadius: BorderRadius.circular(10)),
                    child: Text('REDEEM',
                        style: TextStyle(color: _kWhite, fontSize: sw * 0.028, fontWeight: FontWeight.w800, letterSpacing: 0.8)),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  // ── Helpers
  Widget _card(double sw, {required Widget child}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(sw * 0.04),
        decoration: BoxDecoration(
          color: _kWhite,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 10, offset: const Offset(0, 3))],
        ),
        child: child,
      ),
    );
  }

  Widget _fullBtn(String label, Color color, double sw, {required VoidCallback onTap}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.symmetric(vertical: sw * 0.032),
          elevation: 3,
          shadowColor: color.withValues(alpha: 0.35),
        ),
        child: Text(label,
            style: TextStyle(color: _kWhite, fontSize: sw * 0.034, fontWeight: FontWeight.w700)),
      ),
    );
  }

  Widget _divider() => const Divider(height: 1, color: Color(0xFFF0F2F5));
}