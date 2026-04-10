import 'package:flutter/material.dart';
import 'place_order_page.dart';

// Class name: CheckoutPlaceorderScreen  (lowercase 'o' in 'order')
// This matches what checkout_address_screen.dart imports
class CheckoutPlaceorderScreen extends StatefulWidget {
  const CheckoutPlaceorderScreen({super.key});
  @override
  State<CheckoutPlaceorderScreen> createState() =>
      _CheckoutPlaceorderScreenState();
}

class _CheckoutPlaceorderScreenState
    extends State<CheckoutPlaceorderScreen> {
  static const Color _kNavy  = Color(0xFF1A2B5E);
  static const Color _kTeal  = Color(0xFF00B4D8);
  static const Color _kBg    = Color(0xFFF2F4F8);
  static const Color _kGrey  = Color(0xFF8A94A6);
  static const Color _kDark  = Color(0xFF1A2340);
  static const Color _kGreen = Color(0xFF2E7D32);
  static const Color _kRed   = Color(0xFFE53E3E);

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _kBg,
      body: Column(
        children: [
          _header(context, sw),
          _stepBar(sw, currentStep: 2),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(sw * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: sw * 0.01),
                    _deliveryAddressCard(sw),
                    SizedBox(height: sw * 0.025),
                    _deliveryDateRow(sw),
                    SizedBox(height: sw * 0.025),
                    _orderSummaryCard(sw),
                    SizedBox(height: sw * 0.025),
                    _otherInfoCard(sw),
                    SizedBox(height: sw * 0.025),
                    _manufacturerCard(sw),
                    SizedBox(height: sw * 0.025),
                    _footerCard(sw),
                    SizedBox(height: sw * 0.04),
                  ],
                ),
              ),
            ),
          ),
          _bottomBar(context, sw),
        ],
      ),
    );
  }

  // ── Inline Step Bar ──────────────────────────────────────────────────────

  Widget _stepBar(double sw, {required int currentStep}) {
    const steps = ['Payment', 'Address', 'Place order'];
    return Container(
      color: _kNavy,
      padding: EdgeInsets.only(bottom: sw * 0.035),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(steps.length, (i) {
          final isActive = i == currentStep;
          final isDone   = i < currentStep;
          final isLast   = i == steps.length - 1;
          return Row(
            children: [
              Column(
                children: [
                  Container(
                    width: sw * 0.07,
                    height: sw * 0.07,
                    decoration: BoxDecoration(
                      color: isActive
                          ? _kTeal
                          : isDone
                              ? Colors.white.withValues(alpha: 0.5)
                              : Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: isDone
                          ? Icon(Icons.check,
                              color: Colors.white, size: sw * 0.035)
                          : Text('${i + 1}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: sw * 0.03,
                                  fontWeight: FontWeight.w700)),
                    ),
                  ),
                  SizedBox(height: sw * 0.01),
                  Text(steps[i],
                      style: TextStyle(
                          color: isActive
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.5),
                          fontSize: sw * 0.026,
                          fontWeight: isActive
                              ? FontWeight.w600
                              : FontWeight.w400)),
                ],
              ),
              if (!isLast)
                Container(
                  width: sw * 0.1,
                  height: 1.5,
                  margin: EdgeInsets.only(bottom: sw * 0.045),
                  color: Colors.white.withValues(alpha: 0.25),
                ),
            ],
          );
        }),
      ),
    );
  }

  // ── Header ───────────────────────────────────────────────────────────────

  Widget _header(BuildContext context, double sw) {
    return Container(
      color: _kNavy,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              sw * 0.04, sw * 0.025, sw * 0.04, sw * 0.035),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: sw * 0.088,
                  height: sw * 0.088,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(sw * 0.022),
                    border: Border.all(
                        color: Colors.white.withValues(alpha: 0.25)),
                  ),
                  child: Icon(Icons.chevron_left_rounded,
                      color: Colors.white, size: sw * 0.055),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text('Checkout (3/3)',
                      style: TextStyle(
                          color: Colors.white,
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

  // ── Delivery Address Card ─────────────────────────────────────────────────

  Widget _deliveryAddressCard(double sw) {
    return _cardBox(
      sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Delivery address',
              style: TextStyle(
                  fontSize: sw * 0.038,
                  fontWeight: FontWeight.w700,
                  color: _kNavy)),
          SizedBox(height: sw * 0.02),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: sw * 0.025, vertical: sw * 0.007),
            decoration: BoxDecoration(
              color: _kNavy,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text('Home',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: sw * 0.026,
                    fontWeight: FontWeight.w700)),
          ),
          SizedBox(height: sw * 0.015),
          Text('Akshoya Nagar 1st Block 1st Cross,',
              style: TextStyle(fontSize: sw * 0.03, color: _kDark)),
          Text('Rammurthy Nagar, Bangalore- 560016.',
              style: TextStyle(fontSize: sw * 0.03, color: _kDark)),
          SizedBox(height: sw * 0.006),
          Text('Anirudh',
              style: TextStyle(
                  fontSize: sw * 0.03,
                  fontWeight: FontWeight.w600,
                  color: _kDark)),
          Text('+91 9862367892',
              style: TextStyle(fontSize: sw * 0.03, color: _kGrey)),
          SizedBox(height: sw * 0.022),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: _kNavy, width: 1.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(vertical: sw * 0.025),
              ),
              child: Text('Change',
                  style: TextStyle(
                      color: _kNavy,
                      fontSize: sw * 0.034,
                      fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }

  // ── Delivery Date Row ─────────────────────────────────────────────────────

  Widget _deliveryDateRow(double sw) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: sw * 0.04, vertical: sw * 0.032),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2))
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.local_shipping_outlined,
              color: _kNavy, size: sw * 0.046),
          SizedBox(width: sw * 0.025),
          Expanded(
            child: Text('Delivery Between 1 - 3 February',
                style: TextStyle(
                    fontSize: sw * 0.031,
                    color: _kDark,
                    fontWeight: FontWeight.w500)),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: sw * 0.025, vertical: sw * 0.01),
            decoration: BoxDecoration(
              color: _kTeal,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('Change',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: sw * 0.028,
                    fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }

  // ── Order Summary Card ────────────────────────────────────────────────────

  Widget _orderSummaryCard(double sw) {
    return _cardBox(
      sw,
      child: Column(
        children: [
          _priceRow('Items :', '\$260.00', sw),
          _dividerLine(),
          _priceRow('Delivery :', '\$260.00', sw),
          _dividerLine(),
          _priceRow('Total :', '\$260.00', sw),
          _dividerLine(),
          _priceRow('Promotion Applied :', '- \$260.00', sw,
              valueColor: _kRed),
          _dividerLine(),
          _priceRow('Order Total :', '\$260.00', sw,
              labelStyle: TextStyle(
                  fontSize: sw * 0.033,
                  fontWeight: FontWeight.w700,
                  color: _kDark),
              valueStyle: TextStyle(
                  fontSize: sw * 0.035,
                  fontWeight: FontWeight.w800,
                  color: _kNavy)),
          _dividerLine(),
          _priceRow('Your Savings :', '\$260.00', sw,
              labelStyle:
                  TextStyle(fontSize: sw * 0.031, color: _kGrey),
              valueStyle: TextStyle(
                  fontSize: sw * 0.033,
                  fontWeight: FontWeight.w700,
                  color: _kGreen)),
        ],
      ),
    );
  }

  Widget _priceRow(String label, String value, double sw,
      {Color? valueColor,
      TextStyle? labelStyle,
      TextStyle? valueStyle}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sw * 0.022),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: labelStyle ??
                  TextStyle(fontSize: sw * 0.031, color: _kGrey)),
          Text(value,
              style: valueStyle ??
                  TextStyle(
                      fontSize: sw * 0.032,
                      fontWeight: FontWeight.w600,
                      color: valueColor ?? _kDark)),
        ],
      ),
    );
  }

  // ── Other Info Card ───────────────────────────────────────────────────────

  Widget _otherInfoCard(double sw) {
    return _cardBox(
      sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Other Information',
              style: TextStyle(
                  fontSize: sw * 0.034,
                  fontWeight: FontWeight.w700,
                  color: _kDark)),
          SizedBox(height: sw * 0.015),
          Text(
            'We are glad we can help you with your medical needs. '
            'Our team of experts is here to make sure you get the best quality products '
            'and services at affordable prices.',
            style: TextStyle(
                fontSize: sw * 0.029, color: _kGrey, height: 1.55),
          ),
        ],
      ),
    );
  }

  // ── Manufacturer Card ─────────────────────────────────────────────────────

  Widget _manufacturerCard(double sw) {
    return _cardBox(
      sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Manufacturer / Market address',
              style: TextStyle(
                  fontSize: sw * 0.033,
                  fontWeight: FontWeight.w700,
                  color: _kNavy)),
          SizedBox(height: sw * 0.018),
          Text('Sheetal',
              style: TextStyle(
                  fontSize: sw * 0.031,
                  fontWeight: FontWeight.w600,
                  color: _kDark)),
          SizedBox(height: sw * 0.006),
          Text(
              'Akshoya Nagar 1st Block 1st Cross, Rammurthy\nNagar, Bangalore- 560016.',
              style: TextStyle(
                  fontSize: sw * 0.029, color: _kGrey, height: 1.45)),
          SizedBox(height: sw * 0.006),
          Text('+91 9862367892',
              style: TextStyle(fontSize: sw * 0.029, color: _kGrey)),
          SizedBox(height: sw * 0.006),
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: sw * 0.029, color: _kGrey),
              children: [
                const TextSpan(text: 'Country of Origin : '),
                TextSpan(
                    text: 'India',
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: _kDark)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Footer Card ───────────────────────────────────────────────────────────

  Widget _footerCard(double sw) {
    return _cardBox(
      sw,
      child: Column(
        children: [
          Text('Making healthcare',
              style: TextStyle(
                  fontSize: sw * 0.036,
                  fontWeight: FontWeight.w800,
                  color: _kNavy,
                  letterSpacing: 0.2)),
          SizedBox(height: sw * 0.006),
          Text('UNDERSTANDABLE , ACCESSIBLE & AFFORDABLE',
              style: TextStyle(
                  fontSize: sw * 0.024,
                  fontWeight: FontWeight.w600,
                  color: _kGrey,
                  letterSpacing: 0.4)),
          SizedBox(height: sw * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Made with ',
                  style: TextStyle(fontSize: sw * 0.028, color: _kGrey)),
              Icon(Icons.favorite, color: _kRed, size: sw * 0.03),
              Text(' by veesafe',
                  style: TextStyle(
                      fontSize: sw * 0.028,
                      fontWeight: FontWeight.w700,
                      color: _kNavy)),
            ],
          ),
        ],
      ),
    );
  }

  // ── Bottom Bar ────────────────────────────────────────────────────────────

  Widget _bottomBar(BuildContext context, double sw) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 16,
              offset: const Offset(0, -4))
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sw * 0.04, vertical: sw * 0.03),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const PlaceOrderPage()),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: _kNavy,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(vertical: sw * 0.035),
                elevation: 4,
                shadowColor: _kNavy.withValues(alpha: 0.35),
              ),
              child: Text('Continue',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: sw * 0.036,
                      fontWeight: FontWeight.w700)),
            ),
          ),
        ),
      ),
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  Widget _cardBox(double sw, {required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(sw * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 10,
              offset: const Offset(0, 3))
        ],
      ),
      child: child,
    );
  }

  Widget _dividerLine() =>
      const Divider(height: 1, color: Color(0xFFF0F2F5));
}