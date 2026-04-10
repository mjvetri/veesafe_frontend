import 'package:flutter/material.dart';
import 'order_success_screen.dart';

// ── Colors
const Color _kNavy   = Color(0xFF1A2B5E);
const Color _kTeal   = Color(0xFF00B4D8);
const Color _kBg     = Color(0xFFF4F6FA);
const Color _kWhite  = Colors.white;
const Color _kGrey   = Color(0xFF8A94A6);
const Color _kDark   = Color(0xFF1A2340);
const Color _kGreen  = Color(0xFF2E7D32);
const Color _kRed    = Color(0xFFE53E3E);
const Color _kCardBg = Color(0xFFF0F2F5);

// ════════════════════════════════════════════════════════
// PLACE ORDER PAGE
// ════════════════════════════════════════════════════════
class PlaceOrderPage extends StatelessWidget {
  const PlaceOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: _kBg,
      appBar: _buildAppBar(context, sw),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Hero illustration
                  _buildHeroIllustration(sw),
                  SizedBox(height: sw * 0.02),
                  // ── Shipping Details
                  _buildShippingDetails(sw),
                  _sectionDivider(sw),
                  // ── Delivery Details
                  _buildDeliveryDetails(sw),
                  _sectionDivider(sw),
                  // ── Order Details
                  _buildOrderDetails(sw),
                  SizedBox(height: sw * 0.04),
                ],
              ),
            ),
          ),
          // ── Bottom bar
          _buildBottomBar(context, sw),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════
  // APP BAR
  // ═══════════════════════════════════════
  PreferredSizeWidget _buildAppBar(BuildContext context, double sw) {
    return PreferredSize(
      preferredSize: Size.fromHeight(sw * 0.145),
      child: Container(
        color: _kNavy,
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                sw * 0.04, sw * 0.02, sw * 0.04, sw * 0.032),
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
                      border: Border.all(
                          color: _kWhite.withValues(alpha: 0.25)),
                    ),
                    child: Icon(Icons.chevron_left_rounded,
                        color: _kWhite, size: sw * 0.055),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Place Order',
                      style: TextStyle(
                        color: _kWhite,
                        fontSize: sw * 0.045,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: sw * 0.088),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ═══════════════════════════════════════
  // HERO ILLUSTRATION
  // ═══════════════════════════════════════
  Widget _buildHeroIllustration(double sw) {
    return Container(
      color: _kWhite,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: sw * 0.06),
      child: Center(
        child: Container(
          width: sw * 0.72,
          height: sw * 0.52,
          decoration: BoxDecoration(
            color: const Color(0xFFEEF2FF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background decoration circles
              Positioned(
                top: sw * 0.04,
                right: sw * 0.04,
                child: Container(
                  width: sw * 0.14,
                  height: sw * 0.14,
                  decoration: BoxDecoration(
                    color: _kNavy.withValues(alpha: 0.06),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                bottom: sw * 0.03,
                left: sw * 0.03,
                child: Container(
                  width: sw * 0.1,
                  height: sw * 0.1,
                  decoration: BoxDecoration(
                    color: _kTeal.withValues(alpha: 0.08),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              // Phone mockup illustration
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Phone body
                  Container(
                    width: sw * 0.28,
                    height: sw * 0.35,
                    decoration: BoxDecoration(
                      color: _kNavy,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: _kNavy.withValues(alpha: 0.3),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Phone top notch
                        SizedBox(height: sw * 0.02),
                        Container(
                          width: sw * 0.06,
                          height: sw * 0.012,
                          decoration: BoxDecoration(
                            color: _kWhite.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        SizedBox(height: sw * 0.015),
                        // Screen content
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: sw * 0.02),
                          padding: EdgeInsets.all(sw * 0.015),
                          decoration: BoxDecoration(
                            color: _kWhite.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: sw * 0.025,
                                decoration: BoxDecoration(
                                  color: _kTeal.withValues(alpha: 0.8),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              SizedBox(height: sw * 0.01),
                              Row(children: [
                                Expanded(
                                  child: Container(
                                    height: sw * 0.018,
                                    decoration: BoxDecoration(
                                      color: _kWhite.withValues(alpha: 0.3),
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                  ),
                                ),
                                SizedBox(width: sw * 0.01),
                                Container(
                                  width: sw * 0.04,
                                  height: sw * 0.018,
                                  decoration: BoxDecoration(
                                    color: _kWhite.withValues(alpha: 0.5),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ),
                        SizedBox(height: sw * 0.01),
                        // Price tag
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: sw * 0.025),
                          padding: EdgeInsets.symmetric(
                              horizontal: sw * 0.02, vertical: sw * 0.008),
                          decoration: BoxDecoration(
                            color: _kTeal,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            '\$26.95',
                            style: TextStyle(
                              color: _kWhite,
                              fontSize: sw * 0.026,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Shopping bag below phone
                  Transform.translate(
                    offset: Offset(sw * 0.1, -sw * 0.02),
                    child: Container(
                      width: sw * 0.1,
                      height: sw * 0.1,
                      decoration: BoxDecoration(
                        color: _kNavy,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: _kNavy.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.shopping_bag_rounded,
                        color: _kWhite,
                        size: sw * 0.055,
                      ),
                    ),
                  ),
                ],
              ),
              // Person illustration (right side)
              Positioned(
                right: sw * 0.04,
                bottom: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Head
                    Container(
                      width: sw * 0.055,
                      height: sw * 0.055,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFCBA4),
                        shape: BoxShape.circle,
                      ),
                    ),
                    // Body
                    Container(
                      width: sw * 0.065,
                      height: sw * 0.1,
                      decoration: BoxDecoration(
                        color: _kTeal,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                    ),
                    // Legs
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: sw * 0.026,
                          height: sw * 0.055,
                          decoration: BoxDecoration(
                            color: _kNavy,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                          ),
                        ),
                        SizedBox(width: sw * 0.012),
                        Container(
                          width: sw * 0.026,
                          height: sw * 0.055,
                          decoration: BoxDecoration(
                            color: _kNavy,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Plant decoration
              Positioned(
                left: sw * 0.03,
                bottom: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.eco_rounded,
                        color: Colors.green.shade400, size: sw * 0.08),
                    Container(
                      width: sw * 0.016,
                      height: sw * 0.04,
                      color: Colors.green.shade600,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ═══════════════════════════════════════
  // SHIPPING DETAILS
  // ═══════════════════════════════════════
  Widget _buildShippingDetails(double sw) {
    return _section(
      sw,
      title: 'Shipping Details',
      child: Column(
        children: [
          // Shipping to row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Shipping to : ',
                  style: TextStyle(
                      fontSize: sw * 0.032,
                      color: _kDark,
                      fontWeight: FontWeight.w500)),
              Expanded(
                child: Text(
                  'Sheetal ,Akshaya Nagar 1st Block , Ram...',
                  style: TextStyle(
                    fontSize: sw * 0.032,
                    color: _kNavy,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: sw * 0.02),
          const Divider(color: Color(0xFFEDF0F7), height: 1),
          SizedBox(height: sw * 0.015),
          // Price rows
          _priceRow('Items :', '\$260.00', sw),
          _priceRow('Delivery :', '\$260.00', sw),
          _priceRow('Total :', '\$260.00', sw),
          _priceRow('Promotion Applied :', '- \$260.00', sw,
              valueColor: _kRed),
          SizedBox(height: sw * 0.008),
          const Divider(color: Color(0xFFEDF0F7), height: 1),
          SizedBox(height: sw * 0.008),
          _priceRow('Order Total :', '\$2,604.00', sw,
              labelBold: true,
              valueBold: true,
              valueColor: _kNavy,
              fontSize: sw * 0.034),
          _priceRow('Your Savings :', '\$2,604 (47%)', sw,
              valueColor: _kGreen,
              valueBold: true),
        ],
      ),
    );
  }

  Widget _priceRow(String label, String value, double sw,
      {Color? valueColor,
      bool labelBold = false,
      bool valueBold = false,
      double? fontSize}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sw * 0.018),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: fontSize ?? sw * 0.031,
                  fontWeight:
                      labelBold ? FontWeight.w700 : FontWeight.w400,
                  color: _kGrey)),
          Text(value,
              style: TextStyle(
                  fontSize: fontSize ?? sw * 0.032,
                  fontWeight:
                      valueBold ? FontWeight.w700 : FontWeight.w500,
                  color: valueColor ?? _kDark)),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════
  // DELIVERY DETAILS
  // ═══════════════════════════════════════
  Widget _buildDeliveryDetails(double sw) {
    return _section(
      sw,
      title: 'Delivery Details',
      child: Column(
        children: [
          // Pay with row
          _deliveryRow(
            sw,
            label: 'Pay with',
            value: 'Cash on Delivery',
            valueColor: _kTeal,
          ),
          SizedBox(height: sw * 0.005),
          const Divider(color: Color(0xFFEDF0F7), height: 1),
          SizedBox(height: sw * 0.005),
          // Deliver to row
          _deliveryRow(
            sw,
            label: 'Deliver to',
            value: 'Sheetal ,Akshaya Nagar 1st Block , Ramnagar ...',
            valueColor: _kTeal,
          ),
          SizedBox(height: sw * 0.018),
          // OTP note
          Text(
            'OTP should be informed at the time of delivery.',
            style: TextStyle(
                fontSize: sw * 0.028,
                color: _kGrey,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _deliveryRow(double sw,
      {required String label,
      required String value,
      required Color valueColor}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sw * 0.018),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: TextStyle(
                        fontSize: sw * 0.03,
                        color: _kGrey,
                        fontWeight: FontWeight.w500)),
                SizedBox(height: sw * 0.006),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: sw * 0.031,
                    color: valueColor,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right_rounded, color: _kGrey, size: sw * 0.055),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════
  // ORDER DETAILS
  // ═══════════════════════════════════════
  Widget _buildOrderDetails(double sw) {
    final products = [
      {
        'name': 'JUNBERRY N95 Facemask\n(N95_M_Anthra_M) Purely soft',
        'price': '\$2,10.00',
        'qty': '1',
      },
      {
        'name': 'JUNBERRY N95 Facemask\n(N95_M_Anthra_M) Purely soft',
        'price': '\$2,10.00',
        'qty': '1',
      },
      {
        'name': 'JUNBERRY N95 Facemask\n(N95_M_Anthra_M) Purely soft',
        'price': '\$2,10.00',
        'qty': '1',
      },
    ];

    return _section(
      sw,
      title: 'Order Details',
      child: Container(
        decoration: BoxDecoration(
          color: _kCardBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          children: [
            // Date header
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: sw * 0.04, vertical: sw * 0.028),
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFFE2E8F0))),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Monday ,30 Jan',
                      style: TextStyle(
                          fontSize: sw * 0.033,
                          fontWeight: FontWeight.w700,
                          color: _kDark)),
                  SizedBox(height: sw * 0.006),
                  Text('Free Delivery on eligible orders',
                      style: TextStyle(
                          fontSize: sw * 0.028,
                          color: _kGrey)),
                ],
              ),
            ),
            // Product list
            ...products
                .map((p) => _productItem(p, sw, products))
                ,
          ],
        ),
      ),
    );
  }

  Widget _productItem(Map<String, String> product, double sw,
      List<Map<String, String>> all) {
    final bool isLast = all.last == product;
    return Container(
      padding: EdgeInsets.all(sw * 0.035),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(
                bottom: BorderSide(color: Color(0xFFE8ECF0))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image placeholder
          Container(
            width: sw * 0.18,
            height: sw * 0.18,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFB2DFDB)),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.masks_rounded,
                    color: Colors.green.shade600, size: sw * 0.1),
              ],
            ),
          ),
          SizedBox(width: sw * 0.03),
          // Product details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name']!,
                  style: TextStyle(
                    fontSize: sw * 0.029,
                    fontWeight: FontWeight.w600,
                    color: _kDark,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: sw * 0.012),
                Text(
                  product['price']!,
                  style: TextStyle(
                    fontSize: sw * 0.034,
                    fontWeight: FontWeight.w800,
                    color: _kNavy,
                  ),
                ),
                SizedBox(height: sw * 0.006),
                Text(
                  'Quantity : ${product['qty']}',
                  style: TextStyle(
                      fontSize: sw * 0.028, color: _kGrey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════
  // BOTTOM BAR
  // ═══════════════════════════════════════
  Widget _buildBottomBar(BuildContext context, double sw) {
    return Container(
      decoration: BoxDecoration(
        color: _kWhite,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 16,
              offset: const Offset(0, -4)),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              sw * 0.04, sw * 0.025, sw * 0.04, sw * 0.025),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Terms & conditions
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Terms and conditions',
                  style: TextStyle(
                    fontSize: sw * 0.032,
                    color: _kNavy,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    decorationColor: _kNavy,
                  ),
                ),
              ),
              SizedBox(height: sw * 0.025),
              // Place Your Order button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const OrderSuccessScreen()),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _kNavy,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding:
                        EdgeInsets.symmetric(vertical: sw * 0.038),
                    elevation: 4,
                    shadowColor: _kNavy.withValues(alpha: 0.4),
                  ),
                  child: Text(
                    'Place Your Order',
                    style: TextStyle(
                      color: _kWhite,
                      fontSize: sw * 0.038,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ═══════════════════════════════════════
  // ORDER SUCCESS DIALOG
  // ═══════════════════════════════════════


  // ═══════════════════════════════════════
  // HELPERS
  // ═══════════════════════════════════════
  Widget _section(double sw,
      {required String title, required Widget child}) {
    return Container(
      color: _kWhite,
      padding: EdgeInsets.all(sw * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: sw * 0.038,
                  fontWeight: FontWeight.w700,
                  color: _kDark)),
          SizedBox(height: sw * 0.022),
          child,
        ],
      ),
    );
  }

  Widget _sectionDivider(double sw) => Container(
        height: sw * 0.022,
        color: _kBg,
      );
}