import 'package:flutter/material.dart';
import 'your_orders_screen.dart';
import 'cart_screen.dart';
import 'product_description_screen.dart';
import 'checkout_payment_screen.dart';

class LikedProductsScreen extends StatefulWidget {
  const LikedProductsScreen({super.key});

  @override
  State<LikedProductsScreen> createState() => _LikedProductsScreenState();
}

class _LikedProductsScreenState extends State<LikedProductsScreen> {
  bool _inStockOnly = true;

  final List<Map<String, dynamic>> _products = [
    {
      'title':
          'Dr Trust USA Gold Standard Glucometer Regent Check Testing Machine 9090 with 25 Strips',
      'price': '\$2,604.00',
      'originalPrice': '\$2,804.00',
      'discount': '7% OFF',
      'isLiked': true,
      'inStock': true,
    },
    {
      'title':
          'Dr Trust Gold Standard Glucometer Regent Check Testing Machine 9090 with 25 Strips',
      'price': '\$2,604.00',
      'originalPrice': '\$2,804.00',
      'discount': '7% OFF',
      'isLiked': true,
      'inStock': true,
    },
    {
      'title':
          'Dr Trust USA Gold Standard Glucometer Regent Check Testing Machine 9090 with 25 Strips',
      'price': '\$2,804.00',
      'originalPrice': '\$3,104.00',
      'discount': '45% OFF',
      'isLiked': false,
      'inStock': false,
    },
  ];

  List<Map<String, dynamic>> get _displayedProducts {
    if (_inStockOnly) {
      return _products.where((p) => p['inStock'] == true).toList();
    }
    return _products;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double horizontalPadding = screenWidth * 0.04;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      body: Column(
        children: [
          _buildHeader(context, screenWidth),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.018),
                    _buildFilterRow(),
                    SizedBox(height: screenHeight * 0.014),
                    _buildStockToggleCard(screenWidth),
                    SizedBox(height: screenHeight * 0.014),
                    ..._displayedProducts
                        .map((p) => _buildProductCard(p, screenWidth))
                        ,
                    SizedBox(height: screenHeight * 0.03),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  // HEADER
  // ─────────────────────────────────────────
  Widget _buildHeader(BuildContext context, double sw) {
    return Container(
      width: sw,
      decoration: const BoxDecoration(
        color: Color(0xFF1A2B5E),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x4D1A2B5E),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              sw * 0.04, sw * 0.03, sw * 0.04, sw * 0.05),
          child: Row(
            children: [
              _buildHeaderIconButton(
                Icons.chevron_left_rounded, sw,
                onTap: () => Navigator.maybePop(context),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Cart',   // ← renamed from 'Liked Products'
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: sw * 0.045,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
              ),
              _buildHeaderIconButton(
                Icons.search_rounded, sw,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartScreen()),
                ),
              ),
              SizedBox(width: sw * 0.025),
              _buildHeaderIconButton(
                Icons.shopping_bag_outlined, sw,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const YourOrdersScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderIconButton(IconData icon, double sw,
      {VoidCallback? onTap}) {
    final double size = sw * 0.095;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(sw * 0.028),
          border:
              Border.all(color: Colors.white.withValues(alpha: 0.2), width: 1),
        ),
        child: Icon(icon, color: Colors.white, size: sw * 0.05),
      ),
    );
  }

  // ─────────────────────────────────────────
  // FILTER ROW
  // ─────────────────────────────────────────
  Widget _buildFilterRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.07),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.tune_rounded, size: 16, color: Color(0xFF1A2B5E)),
              SizedBox(width: 6),
              Text(
                'Filter By',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A2B5E),
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────
  // STOCK TOGGLE CARD
  // ─────────────────────────────────────────
  Widget _buildStockToggleCard(double sw) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: sw * 0.045, vertical: sw * 0.035),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Show in stock product only',
              style: TextStyle(
                fontSize: sw * 0.034,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF2D3748),
              ),
            ),
          ),
          Transform.scale(
            scale: 0.85,
            child: Switch(
              value: _inStockOnly,
              onChanged: (val) => setState(() => _inStockOnly = val),
              activeThumbColor: Colors.white,
              activeTrackColor: const Color(0xFF1A2B5E),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: const Color(0xFFCBD5E0),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  // PRODUCT CARD
  // ─────────────────────────────────────────
  Widget _buildProductCard(Map<String, dynamic> product, double sw) {
    final double imageSize = sw * 0.22;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ProductDescriptionScreen()),
      ),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: sw * 0.035),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.07),
              blurRadius: 16,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(sw * 0.035),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductImage(imageSize),
              SizedBox(width: sw * 0.035),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNewBadge(sw),
                    SizedBox(height: sw * 0.015),
                    Text(
                      product['title'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: sw * 0.031,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF2D3748),
                        height: 1.45,
                      ),
                    ),
                    SizedBox(height: sw * 0.02),
                    _buildPriceRow(product, sw),
                    SizedBox(height: sw * 0.025),
                    _buildActionButtons(context, product, sw),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  // PRODUCT IMAGE
  // ─────────────────────────────────────────
  Widget _buildProductImage(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xFFEBEFF8),
        borderRadius: BorderRadius.circular(14),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.asset(
          'assets/images/image2.jpg',
          width: size,
          height: size,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: -size * 0.2,
                  right: -size * 0.2,
                  child: Container(
                    width: size * 0.55,
                    height: size * 0.55,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A2B5E).withValues(alpha: 0.08),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -size * 0.15,
                  left: -size * 0.15,
                  child: Container(
                    width: size * 0.45,
                    height: size * 0.45,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00B4D8).withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Icon(
                  Icons.monitor_heart_outlined,
                  color: const Color(0xFF1A2B5E),
                  size: size * 0.42,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  // NEW BADGE
  // ─────────────────────────────────────────
  Widget _buildNewBadge(double sw) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: sw * 0.022, vertical: sw * 0.008),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2B5E),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        'NEW',
        style: TextStyle(
          color: Colors.white,
          fontSize: sw * 0.025,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  // PRICE ROW
  // ─────────────────────────────────────────
  Widget _buildPriceRow(Map<String, dynamic> product, double sw) {
    return Row(
      children: [
        Text(
          product['price'],
          style: TextStyle(
            fontSize: sw * 0.038,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1A2B5E),
          ),
        ),
        SizedBox(width: sw * 0.02),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: sw * 0.018, vertical: sw * 0.007),
          decoration: BoxDecoration(
            color: const Color(0xFFFFEBEB),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            product['discount'],
            style: TextStyle(
              fontSize: sw * 0.025,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFE53E3E),
            ),
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────
  // ACTION BUTTONS
  // ─────────────────────────────────────────
  Widget _buildActionButtons(
      BuildContext context, Map<String, dynamic> product, double sw) {
    return Row(
      children: [
        _buildPlainButton(
          'Add to Cart',
          const Color(0xFF1A2B5E),
          Colors.white,
          sw,
          onTap: null,
        ),
        SizedBox(width: sw * 0.02),
        _buildPlainButton(
          'Buy Now',
          const Color(0xFF00B4D8),
          Colors.white,
          sw,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CheckoutPaymentScreen(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlainButton(
    String label,
    Color bg,
    Color fg,
    double sw, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: sw * 0.032, vertical: sw * 0.02),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: bg.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: fg,
            fontSize: sw * 0.029,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}