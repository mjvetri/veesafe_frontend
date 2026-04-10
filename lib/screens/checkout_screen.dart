import 'package:flutter/material.dart';

// ── Top-level color constants (required so they can be used in const contexts)
const Color _kNavy = Color(0xFF1A2B5E);
const Color _kCyan = Color(0xFF00B4D8);
const Color _kBg   = Color(0xFFF2F4F8);
const Color _kRed  = Color(0xFFE53E3E);

class CheckoutScreen extends StatefulWidget {
  final String productTitle;
  final String productPrice;
  final String productDiscount;

  const CheckoutScreen({
    super.key,
    required this.productTitle,
    required this.productPrice,
    required this.productDiscount,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _quantity        = 1;
  int _selectedPayment = 0;
  int _selectedAddress = 0;

  static const List<Map<String, dynamic>> _addresses = [
    {
      'label': 'Home',
      'icon': Icons.home_rounded,
      'name': 'Sheetal Kumar',
      'line': 'Akshaya Nagar 1st Block, 1st Cross,\nRammurthy Nagar, Bangalore – 560016',
      'phone': '+91 9802367892',
    },
    {
      'label': 'Office',
      'icon': Icons.business_rounded,
      'name': 'Sheetal Kumar',
      'line': '3rd Floor, Tech Park, Whitefield,\nBangalore – 560066',
      'phone': '+91 9802367892',
    },
  ];

  static const List<Map<String, dynamic>> _paymentMethods = [
    {'label': 'Credit / Debit Card', 'icon': Icons.credit_card_rounded,   'sub': 'Visa, Mastercard, Rupay'},
    {'label': 'UPI',                 'icon': Icons.qr_code_rounded,        'sub': 'GPay, PhonePe, Paytm'},
    {'label': 'Cash on Delivery',    'icon': Icons.money_rounded,           'sub': 'Pay when you receive'},
    {'label': 'Net Banking',         'icon': Icons.account_balance_rounded, 'sub': 'All major banks'},
  ];

  double get _unitPrice {
    final raw = widget.productPrice.replaceAll(RegExp(r'[^\d.]'), '');
    return double.tryParse(raw) ?? 2604.0;
  }

  double get _subtotal => _unitPrice * _quantity;
  double get _delivery => _subtotal > 1000 ? 0 : 260;
  double get _discount => _subtotal * 0.07;
  double get _total    => _subtotal + _delivery - _discount;

  String _fmt(double v) => '\$${v.toStringAsFixed(2).replaceAllMapped(
    RegExp(r'(\d)(?=(\d{3})+\.)'), (m) => '${m[1]},')}';

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _kBg,
      body: Column(children: [
        _buildHeader(context, sw),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sw * 0.04, vertical: sw * 0.04),
              child: Column(children: [
                _productCard(sw),
                SizedBox(height: sw * 0.04),
                _sectionTitle('Delivery Address', sw),
                SizedBox(height: sw * 0.025),
                _addressSection(sw),
                SizedBox(height: sw * 0.04),
                _sectionTitle('Price Summary', sw),
                SizedBox(height: sw * 0.025),
                _priceSummaryCard(sw),
                SizedBox(height: sw * 0.04),
                _sectionTitle('Payment Method', sw),
                SizedBox(height: sw * 0.025),
                _paymentSection(sw),
                SizedBox(height: sw * 0.06),
              ]),
            ),
          ),
        ),
        _bottomBar(sw),
      ]),
    );
  }

  // ─────────────────────────────────────────
  // HEADER
  // ─────────────────────────────────────────
  Widget _buildHeader(BuildContext context, double sw) {
    return Container(
      width: sw,
      decoration: BoxDecoration(
        color: _kNavy,
        borderRadius: const BorderRadius.only(
          bottomLeft:  Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
              color: _kNavy.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 8)),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              sw * 0.04, sw * 0.03, sw * 0.04, sw * 0.05),
          child: Row(children: [
            _hdrBtn(Icons.chevron_left_rounded, sw,
                onTap: () => Navigator.maybePop(context)),
            Expanded(
              child: Center(
                child: Text('Checkout',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: sw * 0.045,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.4)),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: sw * 0.03, vertical: sw * 0.012),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
              ),
              child: Text('Step 1 of 2',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: sw * 0.028,
                      fontWeight: FontWeight.w600)),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _hdrBtn(IconData icon, double sw, {VoidCallback? onTap}) {
    final size = sw * 0.095;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(sw * 0.028),
          border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
        ),
        child: Icon(icon, color: Colors.white, size: sw * 0.05),
      ),
    );
  }

  // ─────────────────────────────────────────
  // SECTION TITLE
  // ─────────────────────────────────────────
  Widget _sectionTitle(String text, double sw) {
    return Row(children: [
      Container(
        width: sw * 0.012,
        height: sw * 0.048,
        decoration: BoxDecoration(
            color: _kCyan, borderRadius: BorderRadius.circular(3)),
      ),
      SizedBox(width: sw * 0.022),
      Text(text,
          style: TextStyle(
              fontSize: sw * 0.038,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A2340))),
    ]);
  }

  // ─────────────────────────────────────────
  // PRODUCT CARD + QTY SELECTOR
  // ─────────────────────────────────────────
  Widget _productCard(double sw) {
    final imageSize = sw * 0.22;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(sw * 0.038),
      decoration: _cardDecor(),
      child: Column(children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              color: const Color(0xFFEBEFF8),
              borderRadius: BorderRadius.circular(14),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                  top: -imageSize * 0.2, right: -imageSize * 0.2,
                  child: Container(
                    width: imageSize * 0.55, height: imageSize * 0.55,
                    decoration: BoxDecoration(
                        color: _kNavy.withValues(alpha: 0.08),
                        shape: BoxShape.circle),
                  ),
                ),
                Positioned(
                  bottom: -imageSize * 0.15, left: -imageSize * 0.15,
                  child: Container(
                    width: imageSize * 0.45, height: imageSize * 0.45,
                    decoration: BoxDecoration(
                        color: _kCyan.withValues(alpha: 0.1),
                        shape: BoxShape.circle),
                  ),
                ),
                Icon(Icons.monitor_heart_outlined,
                    color: _kNavy, size: imageSize * 0.42),
              ]),
            ),
          ),
          SizedBox(width: sw * 0.035),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: sw * 0.022, vertical: sw * 0.008),
                decoration: BoxDecoration(
                    color: _kNavy, borderRadius: BorderRadius.circular(6)),
                child: Text('NEW',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: sw * 0.025,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.8)),
              ),
              SizedBox(height: sw * 0.015),
              Text(widget.productTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: sw * 0.031,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF2D3748),
                      height: 1.45)),
              SizedBox(height: sw * 0.018),
              Row(children: [
                Text(widget.productPrice,
                    style: TextStyle(
                        fontSize: sw * 0.038,
                        fontWeight: FontWeight.w800,
                        color: _kNavy)),
                SizedBox(width: sw * 0.018),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: sw * 0.018, vertical: sw * 0.007),
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFEBEB),
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(widget.productDiscount,
                      style: TextStyle(
                          fontSize: sw * 0.025,
                          fontWeight: FontWeight.w700,
                          color: _kRed)),
                ),
              ]),
            ]),
          ),
        ]),
        SizedBox(height: sw * 0.03),
        const Divider(color: Color(0xFFEDF0F7), thickness: 1),
        SizedBox(height: sw * 0.025),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Quantity',
              style: TextStyle(
                  fontSize: sw * 0.034,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2D3748))),
          _qtyControl(sw),
        ]),
      ]),
    );
  }

  Widget _qtyControl(double sw) {
    return Container(
      decoration: BoxDecoration(
        color: _kNavy,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: _kNavy.withValues(alpha: 0.25),
              blurRadius: 8,
              offset: const Offset(0, 3)),
        ],
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        _qtyBtn(Icons.remove_rounded,
            () { if (_quantity > 1) setState(() => _quantity--); }, sw),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sw * 0.045),
          child: Text('$_quantity',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: sw * 0.036,
                  fontWeight: FontWeight.w700)),
        ),
        _qtyBtn(Icons.add_rounded, () => setState(() => _quantity++), sw),
      ]),
    );
  }

  Widget _qtyBtn(IconData icon, VoidCallback onTap, double sw) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(sw * 0.022),
        child: Icon(icon, color: Colors.white, size: sw * 0.042),
      ),
    );
  }

  // ─────────────────────────────────────────
  // ADDRESS SECTION
  // ─────────────────────────────────────────
  Widget _addressSection(double sw) {
    return Column(children: [
      ..._addresses.asMap().entries.map((e) {
        final i   = e.key;
        final a   = e.value;
        final sel = _selectedAddress == i;
        return GestureDetector(
          onTap: () => setState(() => _selectedAddress = i),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: double.infinity,
            margin: EdgeInsets.only(bottom: sw * 0.025),
            padding: EdgeInsets.all(sw * 0.038),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                  color: sel ? _kNavy : const Color(0xFFEDF0F7),
                  width: sel ? 2.0 : 1.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withValues(alpha: sel ? 0.10 : 0.06),
                    blurRadius: sel ? 16.0 : 12.0,
                    offset: const Offset(0, 4)),
              ],
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Container(
                width: sw * 0.05,
                height: sw * 0.05,
                margin: EdgeInsets.only(top: sw * 0.004),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: sel ? _kNavy : const Color(0xFFCBD5E0),
                      width: 2),
                  color: sel ? _kNavy : Colors.transparent,
                ),
                child: sel
                    ? Icon(Icons.check, color: Colors.white, size: sw * 0.028)
                    : null,
              ),
              SizedBox(width: sw * 0.03),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Row(children: [
                    Icon(a['icon'] as IconData,
                        color: _kNavy, size: sw * 0.04),
                    SizedBox(width: sw * 0.015),
                    Text(a['label'] as String,
                        style: TextStyle(
                            fontSize: sw * 0.034,
                            fontWeight: FontWeight.w700,
                            color: _kNavy)),
                  ]),
                  SizedBox(height: sw * 0.012),
                  Text(a['name'] as String,
                      style: TextStyle(
                          fontSize: sw * 0.032,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2D3748))),
                  SizedBox(height: sw * 0.006),
                  Text(a['line'] as String,
                      style: TextStyle(
                          fontSize: sw * 0.029,
                          color: const Color(0xFF6B7280),
                          height: 1.5)),
                  SizedBox(height: sw * 0.006),
                  Text(a['phone'] as String,
                      style: TextStyle(
                          fontSize: sw * 0.029,
                          color: _kNavy,
                          fontWeight: FontWeight.w500)),
                ]),
              ),
            ]),
          ),
        );
      }),
      GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Add new address coming soon!'),
              backgroundColor: Color(0xFF1A2B5E),
              duration: Duration(seconds: 1),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: sw * 0.032),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: _kCyan.withValues(alpha: 0.5), width: 1.5),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 3)),
            ],
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.add_rounded, color: _kCyan, size: sw * 0.042),
            SizedBox(width: sw * 0.015),
            Text('Add New Address',
                style: TextStyle(
                    fontSize: sw * 0.032,
                    fontWeight: FontWeight.w600,
                    color: _kCyan)),
          ]),
        ),
      ),
    ]);
  }

  // ─────────────────────────────────────────
  // PRICE SUMMARY
  // ─────────────────────────────────────────
  Widget _priceSummaryCard(double sw) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(sw * 0.042),
      decoration: _cardDecor(),
      child: Column(children: [
        _priceRow('Subtotal (${_quantity}x)', _fmt(_subtotal), sw),
        _priceRow(
            'Delivery Charges',
            _delivery == 0 ? 'FREE' : _fmt(_delivery),
            sw,
            valueColor: _delivery == 0 ? const Color(0xFF27AE60) : null),
        _priceRow('Discount (7%)', '- ${_fmt(_discount)}', sw,
            valueColor: _kRed),
        Padding(
          padding: EdgeInsets.symmetric(vertical: sw * 0.02),
          child: const Divider(color: Color(0xFFEDF0F7), thickness: 1),
        ),
        _priceRow('Order Total', _fmt(_total), sw,
            bold: true, valueColor: _kNavy),
        if (_delivery == 0) ...[
          SizedBox(height: sw * 0.018),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: sw * 0.03, vertical: sw * 0.022),
            decoration: BoxDecoration(
              color: const Color(0xFFEBFAF3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(children: [
              const Icon(Icons.local_shipping_rounded,
                  color: Color(0xFF27AE60), size: 18),
              SizedBox(width: sw * 0.02),
              Text('Free delivery on this order!',
                  style: TextStyle(
                      fontSize: sw * 0.029,
                      color: const Color(0xFF27AE60),
                      fontWeight: FontWeight.w600)),
            ]),
          ),
        ],
      ]),
    );
  }

  Widget _priceRow(String label, String value, double sw,
      {bool bold = false, Color? valueColor}) {
    return Padding(
      padding: EdgeInsets.only(bottom: sw * 0.016),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Text(label,
            style: TextStyle(
                fontSize: sw * 0.031,
                color: const Color(0xFF6B7280),
                fontWeight: bold ? FontWeight.w700 : FontWeight.w400)),
        Text(value,
            style: TextStyle(
                fontSize: bold ? sw * 0.036 : sw * 0.031,
                fontWeight: bold ? FontWeight.w800 : FontWeight.w500,
                color: valueColor ?? const Color(0xFF2D3748))),
      ]),
    );
  }

  // ─────────────────────────────────────────
  // PAYMENT METHODS
  // ─────────────────────────────────────────
  Widget _paymentSection(double sw) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(sw * 0.038),
      decoration: _cardDecor(),
      child: Column(
        children: _paymentMethods.asMap().entries.map((e) {
          final i    = e.key;
          final p    = e.value;
          final sel  = _selectedPayment == i;
          final last = i == _paymentMethods.length - 1;
          return GestureDetector(
            onTap: () => setState(() => _selectedPayment = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.only(bottom: last ? 0 : sw * 0.022),
              padding: EdgeInsets.all(sw * 0.032),
              decoration: BoxDecoration(
                color: sel ? _kNavy.withValues(alpha: 0.05)
                           : const Color(0xFFF8F9FC),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                    color: sel ? _kNavy : const Color(0xFFE2E8F0),
                    width: sel ? 1.8 : 1.0),
              ),
              child: Row(children: [
                Container(
                  width: sw * 0.1,
                  height: sw * 0.1,
                  decoration: BoxDecoration(
                    color: sel ? _kNavy : const Color(0xFFEBEFF8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(p['icon'] as IconData,
                      color: sel ? Colors.white : _kNavy,
                      size: sw * 0.045),
                ),
                SizedBox(width: sw * 0.03),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(p['label'] as String,
                        style: TextStyle(
                            fontSize: sw * 0.033,
                            fontWeight: FontWeight.w600,
                            color: sel ? _kNavy : const Color(0xFF2D3748))),
                    SizedBox(height: sw * 0.004),
                    Text(p['sub'] as String,
                        style: TextStyle(
                            fontSize: sw * 0.027,
                            color: const Color(0xFF9CA3AF))),
                  ]),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: sw * 0.048,
                  height: sw * 0.048,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: sel ? _kNavy : const Color(0xFFCBD5E0),
                        width: 2),
                    color: sel ? _kNavy : Colors.transparent,
                  ),
                  child: sel
                      ? Icon(Icons.check,
                          color: Colors.white, size: sw * 0.025)
                      : null,
                ),
              ]),
            ),
          );
        }).toList(),
      ),
    );
  }

  // ─────────────────────────────────────────
  // BOTTOM BAR
  // ─────────────────────────────────────────
  Widget _bottomBar(double sw) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, -5)),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sw * 0.04, vertical: sw * 0.032),
          child: Row(children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
              Text('Total Amount',
                  style: TextStyle(
                      fontSize: sw * 0.026,
                      color: const Color(0xFF9CA3AF))),
              Text(_fmt(_total),
                  style: TextStyle(
                      fontSize: sw * 0.042,
                      fontWeight: FontWeight.w800,
                      color: _kNavy)),
            ]),
            SizedBox(width: sw * 0.04),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('🎉 Order Placed Successfully!'),
                      backgroundColor: Color(0xFF2BB5A0),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: sw * 0.036),
                  decoration: BoxDecoration(
                    color: _kNavy,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: _kNavy.withValues(alpha: 0.35),
                          blurRadius: 12,
                          offset: const Offset(0, 5)),
                    ],
                  ),
                  child: Center(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      const Icon(Icons.shopping_bag_rounded,
                          color: Colors.white, size: 18),
                      SizedBox(width: sw * 0.02),
                      Text('Place Order',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: sw * 0.036,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.3)),
                    ]),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  BoxDecoration _cardDecor() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.07),
              blurRadius: 16,
              offset: const Offset(0, 5)),
        ],
      );
}