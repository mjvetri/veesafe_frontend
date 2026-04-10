import 'package:flutter/material.dart';

const Color _kNavy  = Color(0xFF1A2B5E);
const Color _kBg    = Color(0xFFF2F4F8);
const Color _kWhite = Colors.white;
const Color _kGrey  = Color(0xFF8A94A6);
const Color _kDark  = Color(0xFF1A2340);

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedQuick     = 0;
  bool _savedCardsExpanded  = false;
  bool _emiExpanded         = false;
  bool _cardExpanded        = false;
  bool _netBankingExpanded  = false;
  bool _codExpanded         = false;
  final TextEditingController _giftCtrl = TextEditingController();
  final TextEditingController _cvvCtrl  = TextEditingController();

  @override
  void dispose() {
    _giftCtrl.dispose();
    _cvvCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _kBg,
      body: Column(
        children: [
          _buildHeader(context, sw),
          _buildStepper(sw),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: sw * 0.04),
                  _buildQuickPay(sw),
                  SizedBox(height: sw * 0.04),
                  _buildOtherModes(sw),
                  SizedBox(height: sw * 0.04),
                  _buildGiftCard(sw),
                  SizedBox(height: sw * 0.06),
                ],
              ),
            ),
          ),
          _buildBottomBar(sw),
        ],
      ),
    );
  }

  // ── HEADER ──────────────────────────────
  Widget _buildHeader(BuildContext context, double sw) {
    return Container(
      color: _kNavy,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(sw * 0.04, sw * 0.03, sw * 0.04, sw * 0.04),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: sw * 0.09,
                  height: sw * 0.09,
                  decoration: BoxDecoration(
                    color: _kWhite.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(sw * 0.025),
                    border: Border.all(color: _kWhite.withValues(alpha: 0.25)),
                  ),
                  child: Icon(Icons.chevron_left_rounded, color: _kWhite, size: sw * 0.055),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Checkout (1/3)',
                    style: TextStyle(
                      color: _kWhite,
                      fontSize: sw * 0.045,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(width: sw * 0.09),
            ],
          ),
        ),
      ),
    );
  }

  // ── STEPPER ─────────────────────────────
  Widget _buildStepper(double sw) {
    final steps = ['Payment', 'Address', 'Place order'];
    return Container(
      color: _kWhite,
      padding: EdgeInsets.symmetric(horizontal: sw * 0.06, vertical: sw * 0.04),
      child: Row(
        children: List.generate(steps.length, (i) {
          final bool active = i == 0;
          return Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    if (i > 0)
                      Expanded(
                        child: Container(
                          height: 2,
                          color: _kGrey.withValues(alpha: 0.3),
                        ),
                      ),
                    Container(
                      width: sw * 0.07,
                      height: sw * 0.07,
                      decoration: BoxDecoration(
                        color: active ? _kNavy : _kGrey.withValues(alpha: 0.25),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${i + 1}',
                          style: TextStyle(
                            color: active ? _kWhite : _kGrey,
                            fontSize: sw * 0.03,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    if (i < steps.length - 1)
                      Expanded(
                        child: Container(
                          height: 2,
                          color: _kGrey.withValues(alpha: 0.3),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: sw * 0.015),
                Text(
                  steps[i],
                  style: TextStyle(
                    fontSize: sw * 0.028,
                    fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                    color: active ? _kNavy : _kGrey,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // ── QUICK PAY ────────────────────────────
  Widget _buildQuickPay(double sw) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
      child: Container(
        decoration: BoxDecoration(
          color: _kWhite,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 10, offset: const Offset(0, 3)),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(sw * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Most commonly used modes of payment',
                style: TextStyle(fontSize: sw * 0.03, color: _kGrey, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: sw * 0.03),
              Row(
                children: [
                  _quickOption(0, 'Paytm', true, sw),
                  SizedBox(width: sw * 0.03),
                  _quickOption(1, 'G Pay', false, sw),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _quickOption(int idx, String label, bool isBlue, double sw) {
    final bool sel = _selectedQuick == idx;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedQuick = idx),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: sw * 0.03, vertical: sw * 0.032),
          decoration: BoxDecoration(
            color: sel ? _kNavy.withValues(alpha: 0.05) : _kWhite,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: sel ? _kNavy : _kGrey.withValues(alpha: 0.3), width: sel ? 2 : 1),
          ),
          child: Row(
            children: [
              Container(
                width: sw * 0.045,
                height: sw * 0.045,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: sel ? _kNavy : _kGrey, width: 2),
                ),
                child: sel
                    ? Center(
                        child: Container(
                          width: sw * 0.022,
                          height: sw * 0.022,
                          decoration: const BoxDecoration(color: _kNavy, shape: BoxShape.circle),
                        ),
                      )
                    : null,
              ),
              SizedBox(width: sw * 0.02),
              Container(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.02, vertical: sw * 0.008),
                decoration: BoxDecoration(
                  color: isBlue ? Colors.blue.withValues(alpha: 0.1) : Colors.grey.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: sw * 0.032,
                    fontWeight: FontWeight.w700,
                    color: isBlue ? Colors.blue : _kDark,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── OTHER MODES ──────────────────────────
  Widget _buildOtherModes(double sw) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: sw * 0.01, bottom: sw * 0.025),
            child: Text(
              'OTHER MODES OF PAYMENT',
              style: TextStyle(fontSize: sw * 0.028, fontWeight: FontWeight.w700, color: _kGrey, letterSpacing: 0.8),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: _kWhite,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 10, offset: const Offset(0, 3)),
              ],
            ),
            child: Column(
              children: [
                _expandable('Saved Cards', Icons.credit_card_rounded, _savedCardsExpanded, sw,
                    () => setState(() => _savedCardsExpanded = !_savedCardsExpanded),
                    _buildSavedCards(sw)),
                _divider(),
                _expandable('EMI Option', Icons.calendar_month_outlined, _emiExpanded, sw,
                    () => setState(() => _emiExpanded = !_emiExpanded),
                    _info('No Cost EMI available on select cards', sw)),
                _divider(),
                _expandable('Credit / Debit / ATM cards', Icons.credit_card_rounded, _cardExpanded, sw,
                    () => setState(() => _cardExpanded = !_cardExpanded),
                    _buildCardEntry(sw)),
                _divider(),
                _expandable('Net Banking', Icons.account_balance_rounded, _netBankingExpanded, sw,
                    () => setState(() => _netBankingExpanded = !_netBankingExpanded),
                    _info('Select your bank to proceed', sw)),
                _divider(),
                _expandable('Cash on Delivery', Icons.money_rounded, _codExpanded, sw,
                    () => setState(() => _codExpanded = !_codExpanded),
                    _info('Pay when your order arrives', sw)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _expandable(String title, IconData icon, bool isExpanded, double sw, VoidCallback onTap, Widget child) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: sw * 0.04, vertical: sw * 0.04),
            child: Row(
              children: [
                Icon(icon, color: _kNavy, size: sw * 0.048),
                SizedBox(width: sw * 0.03),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: sw * 0.034, fontWeight: FontWeight.w600, color: _kDark),
                  ),
                ),
                Icon(
                  isExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_right_rounded,
                  color: _kGrey,
                  size: sw * 0.055,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Padding(
            padding: EdgeInsets.fromLTRB(sw * 0.04, 0, sw * 0.04, sw * 0.035),
            child: child,
          ),
      ],
    );
  }

  Widget _buildSavedCards(double sw) {
    return Column(
      children: [
        // Card visual
        Container(
          height: sw * 0.48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            ),
            boxShadow: [
              BoxShadow(color: const Color(0xFF6A11CB).withValues(alpha: 0.4), blurRadius: 16, offset: const Offset(0, 6)),
            ],
          ),
          child: Stack(
            children: [
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
                    Row(
                      children: [
                        Container(
                          width: sw * 0.09, height: sw * 0.07,
                          decoration: BoxDecoration(color: Colors.amber.shade300, borderRadius: BorderRadius.circular(6)),
                        ),
                        const Spacer(),
                        Stack(
                          children: [
                            Container(
                              width: sw * 0.1, height: sw * 0.1,
                              decoration: BoxDecoration(color: Colors.red.withValues(alpha: 0.85), shape: BoxShape.circle),
                            ),
                            Positioned(
                              left: sw * 0.05,
                              child: Container(
                                width: sw * 0.1, height: sw * 0.1,
                                decoration: BoxDecoration(color: Colors.orange.withValues(alpha: 0.85), shape: BoxShape.circle),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: sw * 0.28, height: sw * 0.09,
                          decoration: BoxDecoration(
                            color: _kWhite.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: _kWhite.withValues(alpha: 0.3)),
                          ),
                          child: TextField(
                            controller: _cvvCtrl,
                            textAlign: TextAlign.center,
                            maxLength: 3,
                            obscureText: true,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: _kWhite, fontSize: sw * 0.032),
                            decoration: InputDecoration(
                              hintText: 'Enter CVV',
                              hintStyle: TextStyle(color: _kWhite.withValues(alpha: 0.6), fontSize: sw * 0.026),
                              border: InputBorder.none,
                              counterText: '',
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: sw * 0.02),
                    Text('4356  XXXX  XXXX  1342',
                        style: TextStyle(color: _kWhite, fontSize: sw * 0.038, fontWeight: FontWeight.w600, letterSpacing: 1.5)),
                    SizedBox(height: sw * 0.02),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('CARD HOLDER', style: TextStyle(color: _kWhite.withValues(alpha: 0.6), fontSize: sw * 0.022, letterSpacing: 0.5)),
                            Text('J.Williams', style: TextStyle(color: _kWhite, fontSize: sw * 0.032, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        SizedBox(width: sw * 0.06),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('EXPIRES', style: TextStyle(color: _kWhite.withValues(alpha: 0.6), fontSize: sw * 0.022, letterSpacing: 0.5)),
                            Text('06/24', style: TextStyle(color: _kWhite, fontSize: sw * 0.032, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: sw * 0.03),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: _kNavy,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.symmetric(vertical: sw * 0.032),
            ),
            child: Text('Pay with this card',
                style: TextStyle(color: _kWhite, fontSize: sw * 0.034, fontWeight: FontWeight.w700)),
          ),
        ),
      ],
    );
  }

  Widget _buildCardEntry(double sw) {
    return Column(
      children: [
        _cardField('Card Number', Icons.credit_card_rounded, sw),
        SizedBox(height: sw * 0.025),
        Row(
          children: [
            Expanded(child: _cardField('MM/YY', Icons.date_range_rounded, sw)),
            SizedBox(width: sw * 0.025),
            Expanded(child: _cardField('CVV', Icons.lock_outline_rounded, sw)),
          ],
        ),
        SizedBox(height: sw * 0.025),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: _kNavy,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.symmetric(vertical: sw * 0.032),
            ),
            child: Text('Add & Pay',
                style: TextStyle(color: _kWhite, fontSize: sw * 0.034, fontWeight: FontWeight.w700)),
          ),
        ),
      ],
    );
  }

  Widget _cardField(String hint, IconData icon, double sw) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: _kGrey, fontSize: sw * 0.032),
        prefixIcon: Icon(icon, color: _kNavy, size: sw * 0.042),
        filled: true,
        fillColor: _kBg,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        contentPadding: EdgeInsets.symmetric(horizontal: sw * 0.035, vertical: sw * 0.03),
        isDense: true,
      ),
    );
  }

  Widget _info(String text, double sw) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(sw * 0.035),
      decoration: BoxDecoration(color: _kBg, borderRadius: BorderRadius.circular(10)),
      child: Text(text, style: TextStyle(fontSize: sw * 0.03, color: _kGrey, fontWeight: FontWeight.w500)),
    );
  }

  // ── GIFT CARD ────────────────────────────
  Widget _buildGiftCard(double sw) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
      child: Container(
        decoration: BoxDecoration(
          color: _kWhite,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 10, offset: const Offset(0, 3)),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(sw * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.card_giftcard_rounded, color: _kNavy, size: sw * 0.048),
                  SizedBox(width: sw * 0.025),
                  Text('Gift Card',
                      style: TextStyle(fontSize: sw * 0.036, fontWeight: FontWeight.w700, color: _kDark)),
                ],
              ),
              SizedBox(height: sw * 0.03),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _giftCtrl,
                      style: TextStyle(fontSize: sw * 0.033, color: _kDark),
                      decoration: InputDecoration(
                        hintText: 'Enter gift card code',
                        hintStyle: TextStyle(color: _kGrey, fontSize: sw * 0.032),
                        filled: true,
                        fillColor: _kBg,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.symmetric(horizontal: sw * 0.035, vertical: sw * 0.03),
                        isDense: true,
                      ),
                    ),
                  ),
                  SizedBox(width: sw * 0.025),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Gift card applied!'),
                          backgroundColor: Color(0xFF2BB5A0),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: sw * 0.045, vertical: sw * 0.032),
                      decoration: BoxDecoration(color: _kNavy, borderRadius: BorderRadius.circular(10)),
                      child: Text('REDEEM',
                          style: TextStyle(color: _kWhite, fontSize: sw * 0.028, fontWeight: FontWeight.w800, letterSpacing: 0.8)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── BOTTOM BAR ───────────────────────────
  Widget _buildBottomBar(double sw) {
    return Container(
      decoration: BoxDecoration(
        color: _kWhite,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 16, offset: const Offset(0, -4)),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sw * 0.04, vertical: sw * 0.025),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Total Amount', style: TextStyle(fontSize: sw * 0.027, color: _kGrey)),
                  Text('\$2,604.00',
                      style: TextStyle(fontSize: sw * 0.042, fontWeight: FontWeight.w800, color: _kNavy)),
                ],
              ),
              SizedBox(width: sw * 0.04),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _kNavy,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    padding: EdgeInsets.symmetric(vertical: sw * 0.035),
                    elevation: 4,
                    shadowColor: _kNavy.withValues(alpha: 0.35),
                  ),
                  child: Text(
                    'Continue to Address →',
                    style: TextStyle(color: _kWhite, fontSize: sw * 0.034, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── HELPERS ──────────────────────────────
  Widget _divider() => const Divider(height: 1, color: Color(0xFFF0F0F0));
}