import 'package:flutter/material.dart';
import 'product_description_screen.dart';

class CartScreen extends StatefulWidget {
  // ── ProductDescriptionScreen இருந்து pass ஆகும் data ──
  final String? productTitle;
  final String? price;
  final String? origPrice;
  final String? discount;
  final String? rating;
  final String? brand;
  final String? imagePath;
  final String? tag;
  final int quantity;

  const CartScreen({
    super.key,
    this.productTitle,
    this.price,
    this.origPrice,
    this.discount,
    this.rating,
    this.brand,
    this.imagePath,
    this.tag,
    this.quantity = 1,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late int _qty;
  bool _couponExpanded = false;
  bool _itemRemoved = false;
  final TextEditingController _couponController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _qty = widget.quantity;
  }

  // ── Cart item: widget இருந்து வரும் data, இல்லாவிட்டால் fallback ──
  Map<String, dynamic> get _cartItem => {
    'title':       widget.productTitle ?? 'Dr Trust USA Gold Standard Glucometer Sugar Check Testing Machine 9090 with 25 Strips',
    'rating':      widget.rating       ?? '4.2',
    'ratingCount': '347 ratings',
    'price':       widget.price        ?? '\$2,604.00',
    'origPrice':   widget.origPrice    ?? '\$3,800.00',
    'discount':    widget.discount     ?? '31% OFF',
    'brand':       widget.brand        ?? 'Dr Trust USA',
    'image':       widget.imagePath    ?? 'assets/images/image2.jpg',
    'tag':         widget.tag          ?? 'NEW',
  };

  // ── Similar products ──
  final List<Map<String, dynamic>> _similarProducts = [
    {
      'name': 'Dr Trust Silver Glucometer Pro',
      'price': '\$2,604.00',
      'origPrice': '\$3,200.00',
      'rating': '4.1',
      'discount': '19% OFF',
      'brand': 'Dr Trust',
      'image': 'assets/images/image2.jpg',
      'tag': 'NEW',
    },
    {
      'name': 'Accu-Chek Active Glucometer Kit',
      'price': '\$2,604.00',
      'origPrice': '\$3,500.00',
      'rating': '4.3',
      'discount': '26% OFF',
      'brand': 'Accu-Chek',
      'image': 'assets/images/image2.jpg',
      'tag': 'HOT',
    },
    {
      'name': 'OneTouch Select Plus Meter',
      'price': '\$2,604.00',
      'origPrice': '\$3,000.00',
      'rating': '4.2',
      'discount': '13% OFF',
      'brand': 'OneTouch',
      'image': 'assets/images/image2.jpg',
      'tag': 'NEW',
    },
  ];

  // ── Frequently bought ──
  final List<Map<String, dynamic>> _frequentProducts = [
    {
      'name': 'Dr Trust USA Gold Standard Glucometer Sugar Check Testing Mac...',
      'fullName': 'Dr Trust USA Gold Standard Glucometer Sugar Check Testing Machine 9090',
      'price': '\$2,604.00',
      'origPrice': '\$3,200.00',
      'rating': '4.5',
      'discount': '19% OFF',
      'brand': 'Dr Trust USA',
      'image': 'assets/images/image2.jpg',
      'tag': 'TOP',
    },
    {
      'name': 'Dr Trust USA Gold Standard Glucometer Sugar Check Testing Mac...',
      'fullName': 'Dr Trust USA Gold Standard Glucometer - Advanced Edition',
      'price': '\$2,604.00',
      'origPrice': '\$3,400.00',
      'rating': '4.3',
      'discount': '23% OFF',
      'brand': 'Dr Trust USA',
      'image': 'assets/images/image2.jpg',
      'tag': 'NEW',
    },
    {
      'name': 'Dr Trust USA Gold Standard Glucometer Sugar Check Testing Mac...',
      'fullName': 'Dr Trust USA Gold Standard Glucometer - Smart Series',
      'price': '\$2,604.00',
      'origPrice': '\$3,100.00',
      'rating': '4.4',
      'discount': '16% OFF',
      'brand': 'Dr Trust USA',
      'image': 'assets/images/image2.jpg',
      'tag': 'HOT',
    },
    {
      'name': 'Dr Trust USA Gold Standard Glucometer Sugar Check Testing Mac...',
      'fullName': 'Dr Trust USA Gold Standard Glucometer - Classic Edition',
      'price': '\$2,604.00',
      'origPrice': '\$3,600.00',
      'rating': '4.6',
      'discount': '28% OFF',
      'brand': 'Dr Trust USA',
      'image': 'assets/images/image2.jpg',
      'tag': 'TOP',
    },
  ];

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  void _showRemoveDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Remove Item', style: TextStyle(color: Color(0xFF1A2B5E), fontWeight: FontWeight.w700)),
        content: const Text('Are you sure you want to remove this item from your cart?', style: TextStyle(color: Color(0xFF6B7280))),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel', style: TextStyle(color: Color(0xFF6B7280))),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              setState(() => _itemRemoved = true);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Item removed from cart'),
                backgroundColor: const Color(0xFF1A2B5E),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                duration: const Duration(seconds: 2),
              ));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE53E3E),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Remove', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }

  void _goToProduct(Map<String, dynamic> product) {
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => ProductDescriptionScreen(
        productTitle: (product['fullName'] ?? product['name']) as String,
        price: product['price'] as String,
        origPrice: product['origPrice'] as String,
        rating: product['rating'] as String,
        discount: product['discount'] as String?,
        brand: product['brand'] as String,
        imagePath: product['image'] as String,
        tag: product['tag'] as String,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      body: Column(
        children: [
          _buildHeader(context, sw),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: sw * 0.04),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
                    child: Text(
                      _itemRemoved ? '0 Items' : '${_qty} Item${_qty > 1 ? 's' : ''} added',
                      style: TextStyle(fontSize: sw * 0.038, fontWeight: FontWeight.w600, color: const Color(0xFF2D3748)),
                    ),
                  ),
                  SizedBox(height: sw * 0.03),
                  if (!_itemRemoved) _buildCartItemCard(sw),
                  if (_itemRemoved) _buildEmptyCart(sw),
                  SizedBox(height: sw * 0.03),
                  _buildCouponRow(sw),
                  SizedBox(height: sw * 0.04),
                  _buildSectionHeader('Similar Products', sw),
                  SizedBox(height: sw * 0.025),
                  _buildSimilarProductsRow(sw),
                  SizedBox(height: sw * 0.04),
                  _buildSectionHeader('Frequently brought Products', sw),
                  SizedBox(height: sw * 0.025),
                  _buildFrequentProductsGrid(sw),
                  SizedBox(height: sw * 0.04),
                  _buildShippingDetails(sw),
                  SizedBox(height: sw * 0.04),
                  _buildManufacturerCard(sw),
                  SizedBox(height: sw * 0.04),
                  _buildSupportCard(sw),
                  SizedBox(height: sw * 0.04),
                  _buildFooter(sw),
                  SizedBox(height: sw * 0.08),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, double sw) {
    return Container(
      width: sw,
      decoration: const BoxDecoration(
        color: Color(0xFF1A2B5E),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
        boxShadow: [BoxShadow(color: Color(0x4D1A2B5E), blurRadius: 20, offset: Offset(0, 8))],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(sw * 0.04, sw * 0.03, sw * 0.04, sw * 0.05),
          child: Row(children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: sw * 0.095, height: sw * 0.095,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(sw * 0.028),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: Icon(Icons.chevron_left_rounded, color: Colors.white, size: sw * 0.05),
              ),
            ),
            Expanded(child: Center(child: Text('Cart',
                style: TextStyle(color: Colors.white, fontSize: sw * 0.045, fontWeight: FontWeight.w700, letterSpacing: 0.4)))),
            SizedBox(width: sw * 0.095),
          ]),
        ),
      ),
    );
  }

  Widget _buildEmptyCart(double sw) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: sw * 0.1),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 4))],
        ),
        child: Column(children: [
          Icon(Icons.shopping_cart_outlined, size: sw * 0.15, color: const Color(0xFFCBD5E0)),
          SizedBox(height: sw * 0.03),
          Text('Your cart is empty', style: TextStyle(fontSize: sw * 0.038, fontWeight: FontWeight.w700, color: const Color(0xFF1A2B5E))),
          SizedBox(height: sw * 0.01),
          Text('Add items to get started', style: TextStyle(fontSize: sw * 0.03, color: const Color(0xFF6B7280))),
        ]),
      ),
    );
  }

  Widget _buildCartItemCard(double sw) {
    final double imageSize = sw * 0.22;
    final item = _cartItem;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 4))],
        ),
        child: Padding(
          padding: EdgeInsets.all(sw * 0.04),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              GestureDetector(
                onTap: () => _goToProduct(item),
                child: Container(
                  width: imageSize, height: imageSize,
                  decoration: BoxDecoration(color: const Color(0xFFEBEFF8), borderRadius: BorderRadius.circular(12)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      item['image'] as String, fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Icon(Icons.monitor_heart_outlined,
                          color: const Color(0xFF1A2B5E), size: imageSize * 0.5),
                    ),
                  ),
                ),
              ),
              SizedBox(width: sw * 0.035),
              Expanded(child: GestureDetector(
                onTap: () => _goToProduct(item),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: sw * 0.022, vertical: sw * 0.008),
                    decoration: BoxDecoration(color: const Color(0xFF1A2B5E), borderRadius: BorderRadius.circular(6)),
                    child: Text(item['tag'] as String,
                        style: TextStyle(color: Colors.white, fontSize: sw * 0.025, fontWeight: FontWeight.w800, letterSpacing: 0.8)),
                  ),
                  SizedBox(height: sw * 0.015),
                  Text(item['title'] as String, maxLines: 3, overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: sw * 0.031, fontWeight: FontWeight.w500, color: const Color(0xFF2D3748), height: 1.4)),
                  SizedBox(height: sw * 0.012),
                  Row(children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: sw * 0.02, vertical: sw * 0.007),
                      decoration: BoxDecoration(color: const Color(0xFF2E7D32), borderRadius: BorderRadius.circular(6)),
                      child: Row(children: [
                        Text(item['rating'] as String,
                            style: TextStyle(color: Colors.white, fontSize: sw * 0.028, fontWeight: FontWeight.w700)),
                        SizedBox(width: sw * 0.01),
                        Icon(Icons.star_rounded, color: Colors.white, size: sw * 0.032),
                      ]),
                    ),
                    SizedBox(width: sw * 0.015),
                    Text(item['ratingCount'] as String,
                        style: TextStyle(fontSize: sw * 0.028, color: const Color(0xFF6B7280))),
                  ]),
                  SizedBox(height: sw * 0.015),
                  Text(item['price'] as String,
                      style: TextStyle(fontSize: sw * 0.042, fontWeight: FontWeight.w800, color: const Color(0xFF1A2B5E))),
                ]),
              )),
            ]),
            SizedBox(height: sw * 0.035),
            Row(children: [
              OutlinedButton(
                onPressed: _showRemoveDialog,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFE53E3E), width: 1.5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(horizontal: sw * 0.045, vertical: sw * 0.022),
                ),
                child: Text('Remove',
                    style: TextStyle(color: const Color(0xFFE53E3E), fontSize: sw * 0.032, fontWeight: FontWeight.w600)),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(color: const Color(0xFF1A2B5E), borderRadius: BorderRadius.circular(8)),
                child: Row(children: [
                  GestureDetector(
                    onTap: () { if (_qty > 1) setState(() => _qty--); },
                    child: Container(width: sw * 0.09, height: sw * 0.09, alignment: Alignment.center,
                        child: Icon(Icons.remove, color: Colors.white, size: sw * 0.04)),
                  ),
                  Container(width: sw * 0.09, height: sw * 0.09, alignment: Alignment.center, color: Colors.white,
                      child: Text('$_qty',
                          style: TextStyle(fontSize: sw * 0.036, fontWeight: FontWeight.w700, color: const Color(0xFF1A2B5E)))),
                  GestureDetector(
                    onTap: () => setState(() => _qty++),
                    child: Container(width: sw * 0.09, height: sw * 0.09, alignment: Alignment.center,
                        child: Icon(Icons.add, color: Colors.white, size: sw * 0.04)),
                  ),
                ]),
              ),
            ]),
          ]),
        ),
      ),
    );
  }

  Widget _buildCouponRow(double sw) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 3))],
        ),
        child: Column(children: [
          GestureDetector(
            onTap: () => setState(() => _couponExpanded = !_couponExpanded),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: sw * 0.04, vertical: sw * 0.04),
              child: Row(children: [
                Icon(Icons.local_offer_outlined, color: const Color(0xFF1A2B5E), size: sw * 0.05),
                SizedBox(width: sw * 0.03),
                Text('Apply Coupons',
                    style: TextStyle(fontSize: sw * 0.036, fontWeight: FontWeight.w600, color: const Color(0xFF2D3748))),
                const Spacer(),
                Icon(Icons.chevron_right_rounded, color: const Color(0xFFADB5BD), size: sw * 0.06),
              ]),
            ),
          ),
          if (_couponExpanded)
            Padding(
              padding: EdgeInsets.fromLTRB(sw * 0.04, 0, sw * 0.04, sw * 0.04),
              child: Row(children: [
                Expanded(child: TextField(
                  controller: _couponController,
                  style: TextStyle(fontSize: sw * 0.034),
                  decoration: InputDecoration(
                    hintText: 'Enter coupon code',
                    hintStyle: TextStyle(color: const Color(0xFFADB5BD), fontSize: sw * 0.034),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                    contentPadding: EdgeInsets.symmetric(horizontal: sw * 0.03, vertical: sw * 0.025),
                    isDense: true,
                  ),
                )),
                SizedBox(width: sw * 0.03),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: sw * 0.04, vertical: sw * 0.028),
                  decoration: BoxDecoration(color: const Color(0xFF1A2B5E), borderRadius: BorderRadius.circular(8)),
                  child: Text('Apply',
                      style: TextStyle(color: Colors.white, fontSize: sw * 0.032, fontWeight: FontWeight.w700)),
                ),
              ]),
            ),
        ]),
      ),
    );
  }

  Widget _buildSectionHeader(String title, double sw) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title, style: TextStyle(fontSize: sw * 0.04, fontWeight: FontWeight.w700, color: const Color(0xFF1A2B5E))),
        Text('View all >', style: TextStyle(fontSize: sw * 0.032, color: const Color(0xFF1A2B5E), fontWeight: FontWeight.w500)),
      ]),
    );
  }

  Widget _buildSimilarProductsRow(double sw) {
    final double cardWidth = sw * 0.42;
    final double imageHeight = sw * 0.3;
    return SizedBox(
      height: imageHeight + sw * 0.22,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
        physics: const BouncingScrollPhysics(),
        itemCount: _similarProducts.length,
        itemBuilder: (context, index) {
          final product = _similarProducts[index];
          return GestureDetector(
            onTap: () => _goToProduct(product),
            child: Container(
              width: cardWidth, margin: EdgeInsets.only(right: sw * 0.03),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 3))],
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14)),
                  child: Container(width: cardWidth, height: imageHeight, color: const Color(0xFFEBEFF8),
                    child: Image.asset(product['image'] as String, fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Center(child: Icon(Icons.monitor_heart_outlined,
                          color: const Color(0xFF1A2B5E), size: sw * 0.1))),
                  ),
                ),
                Padding(padding: EdgeInsets.all(sw * 0.025), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(product['price'] as String,
                      style: TextStyle(fontSize: sw * 0.034, fontWeight: FontWeight.w800, color: const Color(0xFF1A2B5E))),
                  SizedBox(height: sw * 0.008),
                  Row(children: [
                    Icon(Icons.star_rounded, color: Colors.amber, size: sw * 0.028),
                    SizedBox(width: sw * 0.005),
                    Text(product['rating'] as String,
                        style: TextStyle(fontSize: sw * 0.026, fontWeight: FontWeight.w700, color: const Color(0xFF2D3748))),
                  ]),
                  SizedBox(height: sw * 0.01),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: sw * 0.018, vertical: sw * 0.006),
                    decoration: BoxDecoration(color: const Color(0xFF1A2B5E), borderRadius: BorderRadius.circular(5)),
                    child: Text(product['tag'] as String,
                        style: TextStyle(color: Colors.white, fontSize: sw * 0.022, fontWeight: FontWeight.w800)),
                  ),
                ])),
              ]),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFrequentProductsGrid(double sw) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
      child: Column(
        children: List.generate((_frequentProducts.length / 2).ceil(), (rowIndex) {
          final int firstIdx = rowIndex * 2;
          final int secondIdx = firstIdx + 1;
          return Padding(
            padding: EdgeInsets.only(bottom: sw * 0.03),
            child: Row(children: [
              Expanded(child: _buildFrequentCard(_frequentProducts[firstIdx], sw)),
              SizedBox(width: sw * 0.03),
              if (secondIdx < _frequentProducts.length)
                Expanded(child: _buildFrequentCard(_frequentProducts[secondIdx], sw))
              else
                const Expanded(child: SizedBox()),
            ]),
          );
        }),
      ),
    );
  }

  Widget _buildFrequentCard(Map<String, dynamic> product, double sw) {
    final double imageSize = sw * 0.22;
    return GestureDetector(
      onTap: () => _goToProduct(product),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 3))],
        ),
        child: Padding(
          padding: EdgeInsets.all(sw * 0.03),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(width: imageSize, height: imageSize,
              decoration: BoxDecoration(color: const Color(0xFFEBEFF8), borderRadius: BorderRadius.circular(10)),
              child: ClipRRect(borderRadius: BorderRadius.circular(10),
                child: Image.asset(product['image'] as String, fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Icon(Icons.monitor_heart_outlined,
                      color: const Color(0xFF1A2B5E), size: imageSize * 0.5))),
            ),
            SizedBox(width: sw * 0.02),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(product['name'] as String, maxLines: 2, overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: sw * 0.026, fontWeight: FontWeight.w500, color: const Color(0xFF2D3748), height: 1.4)),
              SizedBox(height: sw * 0.01),
              Text(product['price'] as String,
                  style: TextStyle(fontSize: sw * 0.03, fontWeight: FontWeight.w800, color: const Color(0xFF1A2B5E))),
              SizedBox(height: sw * 0.012),
              Container(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.018, vertical: sw * 0.006),
                decoration: BoxDecoration(color: const Color(0xFF1A2B5E), borderRadius: BorderRadius.circular(5)),
                child: Text(product['tag'] as String,
                    style: TextStyle(color: Colors.white, fontSize: sw * 0.022, fontWeight: FontWeight.w800)),
              ),
            ])),
          ]),
        ),
      ),
    );
  }

  Widget _buildShippingDetails(double sw) {
    final item = _cartItem;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 4))],
        ),
        child: Padding(
          padding: EdgeInsets.all(sw * 0.04),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Shipping Details',
                style: TextStyle(fontSize: sw * 0.04, fontWeight: FontWeight.w700, color: const Color(0xFF1A2B5E))),
            SizedBox(height: sw * 0.02),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Shipping to : ', style: TextStyle(fontSize: sw * 0.032, color: const Color(0xFF6B7280))),
              Expanded(child: Text('Sheetal, Akshaya Nagar 1st Block, Ram...',
                  style: TextStyle(fontSize: sw * 0.032, color: const Color(0xFF2D3748), fontWeight: FontWeight.w500))),
            ]),
            Divider(color: Colors.grey.shade100, height: sw * 0.05),
            _buildPriceLine('Items :', item['price'] as String, sw),
            _buildPriceLine('Delivery :', '\$0.00', sw),
            _buildPriceLine('Discount :', item['discount'] as String, sw, valueColor: const Color(0xFFE53E3E)),
            Divider(color: Colors.grey.shade200, height: sw * 0.05),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Order Total :',
                  style: TextStyle(fontSize: sw * 0.035, fontWeight: FontWeight.w700, color: const Color(0xFF2D3748))),
              Text(item['price'] as String,
                  style: TextStyle(fontSize: sw * 0.038, fontWeight: FontWeight.w800, color: const Color(0xFF1A2B5E))),
            ]),
            SizedBox(height: sw * 0.015),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Your Savings :',
                  style: TextStyle(fontSize: sw * 0.032, color: const Color(0xFF6B7280))),
              Text(item['discount'] as String,
                  style: TextStyle(fontSize: sw * 0.032, fontWeight: FontWeight.w700, color: const Color(0xFF2E7D32))),
            ]),
          ]),
        ),
      ),
    );
  }

  Widget _buildPriceLine(String label, String value, double sw, {Color? valueColor}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sw * 0.01),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: TextStyle(fontSize: sw * 0.032, color: const Color(0xFF6B7280))),
        Text(value, style: TextStyle(fontSize: sw * 0.032, fontWeight: FontWeight.w600, color: valueColor ?? const Color(0xFF2D3748))),
      ]),
    );
  }

  Widget _buildManufacturerCard(double sw) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 4))],
        ),
        child: Padding(
          padding: EdgeInsets.all(sw * 0.04),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Manufacturer / Market address',
                style: TextStyle(fontSize: sw * 0.036, fontWeight: FontWeight.w700, color: const Color(0xFF1A2B5E))),
            SizedBox(height: sw * 0.025),
            Text('Sheetal', style: TextStyle(fontSize: sw * 0.033, fontWeight: FontWeight.w600, color: const Color(0xFF2D3748))),
            SizedBox(height: sw * 0.01),
            Text('Akshaya Nagar 1st Block 1st Cross, Rammurthy\nNagar, Bangalore-560016.',
                style: TextStyle(fontSize: sw * 0.03, color: const Color(0xFF6B7280), height: 1.5)),
            SizedBox(height: sw * 0.01),
            Text('+91 8802167892', style: TextStyle(fontSize: sw * 0.03, color: const Color(0xFF6B7280))),
            SizedBox(height: sw * 0.01),
            Text('Country of Origin: India', style: TextStyle(fontSize: sw * 0.03, color: const Color(0xFF6B7280))),
          ]),
        ),
      ),
    );
  }

  Widget _buildSupportCard(double sw) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 4))],
        ),
        child: Padding(
          padding: EdgeInsets.all(sw * 0.04),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('In case of any issues, contact us',
                style: TextStyle(fontSize: sw * 0.033, fontWeight: FontWeight.w700, color: const Color(0xFF1A2B5E))),
            SizedBox(height: sw * 0.025),
            Row(children: [
              Icon(Icons.email_outlined, size: sw * 0.04, color: const Color(0xFF6B7280)),
              SizedBox(width: sw * 0.02),
              Text('care@gmail.com', style: TextStyle(fontSize: sw * 0.03, color: const Color(0xFF6B7280))),
            ]),
            SizedBox(height: sw * 0.015),
            Text('Akshaya Nagar 1st Block 1st Cross, Rammurthy\nNagar, Bangalore-560016.',
                style: TextStyle(fontSize: sw * 0.03, color: const Color(0xFF6B7280), height: 1.5)),
            SizedBox(height: sw * 0.01),
            Row(children: [
              Icon(Icons.phone_outlined, size: sw * 0.04, color: const Color(0xFF6B7280)),
              SizedBox(width: sw * 0.02),
              Text('+91 8802167892', style: TextStyle(fontSize: sw * 0.03, color: const Color(0xFF6B7280))),
            ]),
          ]),
        ),
      ),
    );
  }

  Widget _buildFooter(double sw) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(sw * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 4))],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Making healthcare',
              style: TextStyle(fontSize: sw * 0.036, fontWeight: FontWeight.w700, color: const Color(0xFF2D3748))),
          SizedBox(height: sw * 0.01),
          Text('UNDERSTANDABLE, ACCESSIBLE & AFFORDABLE',
              style: TextStyle(fontSize: sw * 0.028, fontWeight: FontWeight.w600, color: const Color(0xFF6B7280), letterSpacing: 0.3)),
          SizedBox(height: sw * 0.015),
          Row(children: [
            Text('Made with ', style: TextStyle(fontSize: sw * 0.03, color: const Color(0xFF6B7280))),
            Icon(Icons.favorite, color: Colors.red, size: sw * 0.035),
            Text(' by vaseefa',
                style: TextStyle(fontSize: sw * 0.03, fontWeight: FontWeight.w600, color: const Color(0xFF1A2B5E))),
          ]),
        ]),
      ),
    );
  }
}