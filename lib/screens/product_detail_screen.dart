// lib/screens/product_detail_screen.dart

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/product_model.dart';
import '../models/rental_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with SingleTickerProviderStateMixin {
  int    _qty      = 1;
  int    _imgIdx   = 0;
  bool   _inCart   = false;
  bool   _liked    = false;

  OrderMode _orderMode = OrderMode.buy;
RentalDuration _rentalDuration = RentalDuration.daily;
int _rentalCount = 1;


  late   TabController _tabCtrl;

  final List<Map<String, dynamic>> _reviews = [
    {'name': 'Ramesh K.',    'rating': 5, 'date': '12 Mar 2025', 'comment': 'Excellent product! Works perfectly. Very happy with the quality and fast delivery.'},
    {'name': 'Priya S.',     'rating': 4, 'date': '08 Feb 2025', 'comment': 'Good product, value for money. Packaging was good. Recommend to everyone.'},
    {'name': 'Anand M.',     'rating': 5, 'date': '01 Jan 2025', 'comment': 'Best purchase this year. Very accurate and easy to use. My family loves it.'},
    {'name': 'Sunita R.',    'rating': 3, 'date': '20 Dec 2024', 'comment': 'Decent product but delivery took longer than expected. Quality is ok.'},
    {'name': 'Karthik V.',   'rating': 5, 'date': '15 Nov 2024', 'comment': 'Top notch quality. Exactly as described. Will buy again from Veesafe!'},
  ];

  double get _avgRating => _reviews.fold(0.0, (s, r) => s + (r['rating'] as int)) / _reviews.length;

  double get _salePrice =>
      double.tryParse(widget.product.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
  double get _originalPrice =>
      double.tryParse(widget.product.oldPrice.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
  int get _discountPct => _originalPrice == 0 ? 0
      : ((_originalPrice - _salePrice) / _originalPrice * 100).round();
  double get _totalPrice => _salePrice * _qty;

  String _modifyPrice(String price, double factor) {
    final num = double.tryParse(price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
    return 'Rs.${(num * factor).toStringAsFixed(2)}';
  }

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 3, vsync: this);
    _tabCtrl.addListener(() => setState(() {}));
    _liked = widget.product.liked;
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  void _snack(String msg, Color color) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(msg), backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ));

  Widget _productImage() {
    final url = widget.product.imageUrl;
    if (url.startsWith('http')) {
      return Image.network(url, fit: BoxFit.contain,
          loadingBuilder: (_, c, p) => p == null ? c
              : const Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)),
          errorBuilder: (_, _, _) =>
              Icon(widget.product.imageIcon, size: 90, color: Colors.white.withOpacity(0.9)));
    }
    if (url.startsWith('assets')) {
      return Image.asset(url, fit: BoxFit.contain,
          errorBuilder: (_, _, _) =>
              Icon(widget.product.imageIcon, size: 90, color: Colors.white.withOpacity(0.9)));
    }
    return Icon(widget.product.imageIcon, size: 90, color: Colors.white.withOpacity(0.9));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _buildHero(),
              _buildInfoCard(),
              const SizedBox(height: 10),
              _buildApplyCoupons(),
              const SizedBox(height: 10),
              _buildTabs(),
              const SizedBox(height: 10),
              _buildKeyHighlights(),
              const SizedBox(height: 10),
              _buildOffers(),
              const SizedBox(height: 10),
              _buildDeliveryBadges(),
              const SizedBox(height: 10),
              _buildSimilarProducts(),
              const SizedBox(height: 10),
              _buildFrequentlyBought(),
              const SizedBox(height: 10),
              _buildManufacturer(),
              const SizedBox(height: 90),
            ]),
          ),
        ),
        _buildBottomBar(),
      ]),
    );
  }

  Widget _buildHero() => Stack(children: [
    Container(
      width: double.infinity, height: 390,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF0D2B6B),
            widget.product.imageBg,
            const Color(0xFF0D9488),
          ],
          begin: Alignment.topCenter, end: Alignment.bottomCenter,
        ),
      ),
      child: Column(children: [
        const SizedBox(height: 80),
        Container(
          width: 180, height: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.15),
            border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
          ),
          child: ClipOval(child: _productImage()),
        ),
        const SizedBox(height: 16),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (i) => GestureDetector(
              onTap: () => setState(() => _imgIdx = i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 80, height: 64,
                decoration: BoxDecoration(
                  color: _imgIdx == i ? Colors.white : Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  i == 0 ? widget.product.imageIcon
                      : i == 1 ? Icons.zoom_in_rounded : Icons.view_in_ar_rounded,
                  size: 26,
                  color: _imgIdx == i ? const Color(0xFF0D9488) : Colors.white,
                ),
              ),
            )),
          ),
        ),
      ]),
    ),
    SafeArea(child: Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
      child: Row(children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2), shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.4)),
            ),
            child: const Icon(Icons.arrow_back_ios_rounded, size: 18, color: Colors.white),
          ),
        ),
        const Expanded(child: Center(
          child: Text('Product Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white)),
        )),
        const SizedBox(width: 40),
      ]),
    )),
    if (_discountPct > 0)
      Positioned(top: 65, left: 14,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(color: const Color(0xFFE11D48), borderRadius: BorderRadius.circular(8)),
          child: const Text('On Sale',
              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800)),
        )),
  ]);

  Widget _buildInfoCard() => Container(
    color: Colors.white,
    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF0D9488)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text('Dr Trust USA',
              style: TextStyle(color: Color(0xFF0D9488), fontSize: 12, fontWeight: FontWeight.w600)),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(color: const Color(0xFF16A34A), borderRadius: BorderRadius.circular(8)),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Text(_avgRating.toStringAsFixed(1),
                style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w800)),
            const SizedBox(width: 4),
            const Icon(Icons.star_rounded, color: Colors.white, size: 14),
          ]),
        ),
        const SizedBox(width: 8),
        Text('(${_reviews.length * 69} Ratings)',
            style: const TextStyle(fontSize: 12, color: AppColors.kGrey)),
      ]),
      const SizedBox(height: 12),
     
     //new
     // Buy / Rent Toggle
Container(
  margin: const EdgeInsets.only(bottom: 14),
  padding: const EdgeInsets.all(4),
  decoration: BoxDecoration(
    color: const Color(0xFFF0F4F8),
    borderRadius: BorderRadius.circular(12),
  ),
  child: Row(children: [
    Expanded(child: GestureDetector(
      onTap: () => setState(() => _orderMode = OrderMode.buy),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: _orderMode == OrderMode.buy ? const Color(0xFF1A2E5A) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.shopping_cart_rounded,
              color: _orderMode == OrderMode.buy ? Colors.white : AppColors.kGrey, size: 16),
          const SizedBox(width: 6),
          Text('Buy', style: TextStyle(
              color: _orderMode == OrderMode.buy ? Colors.white : AppColors.kGrey,
              fontWeight: FontWeight.w700, fontSize: 14)),
        ]),
      ),
    )),
    Expanded(child: GestureDetector(
      onTap: () => setState(() => _orderMode = OrderMode.rent),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: _orderMode == OrderMode.rent ? const Color(0xFF0D9488) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.calendar_month_rounded,
              color: _orderMode == OrderMode.rent ? Colors.white : AppColors.kGrey, size: 16),
          const SizedBox(width: 6),
          Text('Rent', style: TextStyle(
              color: _orderMode == OrderMode.rent ? Colors.white : AppColors.kGrey,
              fontWeight: FontWeight.w700, fontSize: 14)),
        ]),
      ),
    )),
  ]),
),
// Rental Options
if (_orderMode == OrderMode.rent) ...[
  Container(
    margin: const EdgeInsets.only(bottom: 14),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: const Color(0xFFF0F9F8),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFF0D9488).withOpacity(0.3)),
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Select Rental Duration',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF0D9488))),
      const SizedBox(height: 10),
      Row(children: RentalDuration.values.map((d) {
        final labels = {
          RentalDuration.daily: 'Daily',
          RentalDuration.weekly: 'Weekly',
          RentalDuration.monthly: 'Monthly',
        };
        final prices = {
          RentalDuration.daily:   'Rs.${(_salePrice * 0.05).toStringAsFixed(0)}/day',
          RentalDuration.weekly:  'Rs.${(_salePrice * 0.25).toStringAsFixed(0)}/wk',
          RentalDuration.monthly: 'Rs.${(_salePrice * 0.60).toStringAsFixed(0)}/mo',
        };
        final sel = _rentalDuration == d;
        return Expanded(child: GestureDetector(
          onTap: () => setState(() => _rentalDuration = d),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            margin: const EdgeInsets.only(right: 6),
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: sel ? const Color(0xFF0D9488) : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: sel ? const Color(0xFF0D9488) : AppColors.kBorderGrey),
            ),
            child: Column(children: [
              Text(labels[d]!, style: TextStyle(
                  fontSize: 11, fontWeight: FontWeight.w700,
                  color: sel ? Colors.white : AppColors.kBlack)),
              Text(prices[d]!, style: TextStyle(
                  fontSize: 10, color: sel ? Colors.white70 : AppColors.kGrey)),
            ]),
          ),
        ));
      }).toList()),
      const SizedBox(height: 12),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Text('Duration Count',
            style: TextStyle(fontSize: 13, color: AppColors.kGrey)),
        Row(children: [
          GestureDetector(
            onTap: () { if (_rentalCount > 1) setState(() => _rentalCount--); },
            child: Container(width: 28, height: 28,
                decoration: BoxDecoration(color: AppColors.kBlueLite, borderRadius: BorderRadius.circular(6)),
                child: const Icon(Icons.remove, size: 16, color: AppColors.kBlue)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text('$_rentalCount',
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
          ),
          GestureDetector(
            onTap: () => setState(() => _rentalCount++),
            child: Container(width: 28, height: 28,
                decoration: BoxDecoration(color: AppColors.kBlueLite, borderRadius: BorderRadius.circular(6)),
                child: const Icon(Icons.add, size: 16, color: AppColors.kBlue)),
          ),
        ]),
      ]),
      const SizedBox(height: 10),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF0D9488).withOpacity(0.2)),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text('Security Deposit', style: TextStyle(fontSize: 12, color: AppColors.kGrey)),
          Text('Rs.${(_salePrice * 0.20).toStringAsFixed(0)} (refundable)',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF16A34A))),
        ]),
      ),
      const SizedBox(height: 6),
      const Text('* Deposit refunded after product return',
          style: TextStyle(fontSize: 10, color: AppColors.kGrey, fontStyle: FontStyle.italic)),
    ]),
  ),
],


      Text(widget.product.name,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: AppColors.kBlack, height: 1.35)),
      const SizedBox(height: 8),
      const Row(children: [
        Icon(Icons.storefront_rounded, size: 14, color: Color(0xFF0D9488)),
        SizedBox(width: 5),
        Text('Visit SOLAND store',
            style: TextStyle(color: Color(0xFF0D9488), fontSize: 13, fontWeight: FontWeight.w600)),
      ]),
      const SizedBox(height: 14),
      Row(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFDCFCE7), borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF16A34A).withOpacity(0.4)),
          ),
          child: const Text('In Stock',
              style: TextStyle(color: Color(0xFF16A34A), fontSize: 12, fontWeight: FontWeight.w700)),
        ),
        const Spacer(),
        Container(
          height: 42,
          decoration: BoxDecoration(color: const Color(0xFF1A2E5A), borderRadius: BorderRadius.circular(10)),
          child: Row(children: [
            GestureDetector(
              onTap: () { if (_qty > 1) setState(() => _qty--); },
              child: Container(width: 42, height: 42, alignment: Alignment.center,
                  child: const Icon(Icons.remove_rounded, color: Colors.white, size: 20)),
            ),
            Container(width: 1, height: 22, color: Colors.white.withOpacity(0.3)),
            Container(width: 40, alignment: Alignment.center,
                child: Text('$_qty',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white))),
            Container(width: 1, height: 22, color: Colors.white.withOpacity(0.3)),
            GestureDetector(
              onTap: () => setState(() => _qty++),
              child: Container(width: 42, height: 42, alignment: Alignment.center,
                  child: const Icon(Icons.add_rounded, color: Colors.white, size: 20)),
            ),
          ]),
        ),
      ]),
      const SizedBox(height: 16),
      Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(widget.product.price,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: AppColors.kBlack)),
        const SizedBox(width: 10),
        Text(widget.product.oldPrice,
            style: const TextStyle(fontSize: 14, color: AppColors.kGrey, decoration: TextDecoration.lineThrough)),
        const Spacer(),
        if (_discountPct > 0)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE4E6), borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFE11D48).withOpacity(0.3)),
            ),
            child: Text('$_discountPct% OFF',
                style: const TextStyle(color: Color(0xFFE11D48), fontSize: 12, fontWeight: FontWeight.w800)),
          ),
      ]),
      const SizedBox(height: 18),
      Row(children: [
        Expanded(child: GestureDetector(
          onTap: () { setState(() => _inCart = true); _snack('✅ Added to cart!', const Color(0xFF16A34A)); },
          child: Container(height: 52,
            decoration: BoxDecoration(color: const Color(0xFF1A2E5A), borderRadius: BorderRadius.circular(14)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(_inCart ? Icons.check_circle_rounded : Icons.shopping_cart_rounded, color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Text(_inCart ? 'Added!' : 'Add to Cart',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15)),
            ]),
          ),
        )),
        const SizedBox(width: 12),
        Expanded(child: GestureDetector(
          onTap: () => _snack('🛒 Proceeding to checkout...', const Color(0xFF0D9488)),
          child: Container(height: 52,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF0D9488), Color(0xFF0F766E)]),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(Icons.bolt_rounded, color: Colors.white, size: 18),
              SizedBox(width: 8),
              //Text('Buy Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15)),
              Text(_orderMode == OrderMode.rent ? 'Rent Now' : 'Buy Now',
    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15)),
           
            ]),
          ),
        )),
      ]),
      const SizedBox(height: 12),
      GestureDetector(
        onTap: _showBulkEnquiry,
        child: Container(
          width: double.infinity, height: 52,
          decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.kBorderGrey, width: 1.5),
          ),
          child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.mail_outline_rounded, color: AppColors.kBlack, size: 18),
            SizedBox(width: 8),
            Text('Bulk Enquiry', style: TextStyle(color: AppColors.kBlack, fontWeight: FontWeight.w600, fontSize: 15)),
          ]),
        ),
      ),
    ]),
  );

  Widget _buildApplyCoupons() => GestureDetector(
    onTap: () => _showCouponsSheet(),
    child: Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      child: Row(children: [
        Container(width: 40, height: 40,
          decoration: BoxDecoration(color: AppColors.kBlueLite, borderRadius: BorderRadius.circular(10)),
          child: const Icon(Icons.local_offer_rounded, color: AppColors.kBlue, size: 20)),
        const SizedBox(width: 14),
        const Expanded(child: Text('Apply Coupons',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.kBlack))),
        const Icon(Icons.chevron_right_rounded, color: AppColors.kGrey, size: 22),
      ]),
    ),
  );

  void _showCouponsSheet() {
    showModalBottomSheet(
      context: context, backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: const BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(child: Container(width: 40, height: 4,
              decoration: BoxDecoration(color: AppColors.kBorderGrey, borderRadius: BorderRadius.circular(10)))),
          const SizedBox(height: 16),
          const Text('Available Coupons',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: AppColors.kBlack)),
          const SizedBox(height: 14),
          _couponTile('HEALTH10', '10% off on orders above Rs.1,000', const Color(0xFF0D9488)),
          const SizedBox(height: 10),
          _couponTile('SAVE5', '5% cashback on first order', AppColors.kBlue),
          const SizedBox(height: 10),
          _couponTile('FREESHIP', 'Free shipping on orders above Rs.500', const Color(0xFFD97706)),
        ]),
      ),
    );
  }

  Widget _couponTile(String code, String desc, Color color) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      border: Border.all(color: color.withOpacity(0.3)),
      borderRadius: BorderRadius.circular(12),
      color: color.withOpacity(0.05),
    ),
    child: Row(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Text(code, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12)),
      ),
      const SizedBox(width: 12),
      Expanded(child: Text(desc, style: const TextStyle(fontSize: 12, color: AppColors.kGrey))),
      GestureDetector(
        onTap: () { Navigator.pop(context); _snack('✅ Coupon $code applied!', color); },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(border: Border.all(color: color), borderRadius: BorderRadius.circular(8)),
          child: Text('Apply', style: TextStyle(color: color, fontWeight: FontWeight.w700, fontSize: 12)),
        ),
      ),
    ]),
  );

  Widget _buildTabs() => Container(
    color: Colors.white,
    child: Column(children: [
      TabBar(
        controller: _tabCtrl,
        labelColor: AppColors.kBlack,
        unselectedLabelColor: AppColors.kGrey,
        indicatorColor: const Color(0xFF0D9488),
        indicatorWeight: 3,
        labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
        unselectedLabelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        tabs: const [Tab(text: 'Description'), Tab(text: 'Details'), Tab(text: 'Reviews')],
      ),
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: _tabCtrl.index == 0
            ? _descriptionContent()
            : _tabCtrl.index == 1
                ? _detailsContent()
                : _reviewsContent(),
      ),
    ]),
  );

  Widget _descriptionContent() => Padding(
    key: const ValueKey('desc'),
    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Health and wellness is our priority!',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.kBlack)),
      const SizedBox(height: 10),
      Text(
        '${widget.product.name} is a premium quality medical product designed '
        'for home and clinical use. Certified by leading health authorities in India. '
        'Built with the highest standards of safety and durability.',
        style: const TextStyle(fontSize: 13, color: AppColors.kGrey, height: 1.6),
      ),
      const SizedBox(height: 12),
      ...[ 'No coding technology for ease of use',
           'Results in just 5 seconds with 99% accuracy',
           'Trusted by 500+ hospitals across India',
           '1 Year manufacturer warranty included',
           'Free delivery on orders above Rs.999',
           'CE & FDA certified for medical use',
      ].map((item) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(width: 8, height: 8, margin: const EdgeInsets.only(top: 5, right: 10),
              decoration: const BoxDecoration(color: Color(0xFF0D9488), shape: BoxShape.circle)),
          Expanded(child: Text(item,
              style: const TextStyle(fontSize: 13, color: AppColors.kGrey, height: 1.5))),
        ]),
      )),
    ]),
  );

  Widget _detailsContent() => Padding(
    key: const ValueKey('details'),
    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _detailRow('Brand', 'Dr Trust USA'),
      _detailRow('Model', widget.product.name),
      _detailRow('Category', widget.product.badge),
      _detailRow('Warranty', '1 Year Manufacturer Warranty'),
      _detailRow('Country', 'India'),
      _detailRow('Material', 'Medical Grade Plastic'),
      _detailRow('Certifications', 'CE, FDA, ISO 13485'),
      _detailRow('Package Contents', '1x Product, 1x Manual, 1x Warranty Card'),
      _detailRow('Weight', '250g'),
      _detailRow('Dimensions', '15 x 8 x 5 cm'),
    ]),
  );

  Widget _detailRow(String label, String value) => Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.kBorderGrey))),
    child: Row(children: [
      SizedBox(width: 130,
          child: Text(label, style: const TextStyle(fontSize: 13, color: AppColors.kGrey, fontWeight: FontWeight.w500))),
      Expanded(child: Text(value,
          style: const TextStyle(fontSize: 13, color: AppColors.kBlack, fontWeight: FontWeight.w600))),
    ]),
  );

  Widget _reviewsContent() => Padding(
    key: const ValueKey('reviews'),
    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F9F8), borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE0F2F1)),
        ),
        child: Row(children: [
          Column(children: [
            Text(_avgRating.toStringAsFixed(1),
                style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: AppColors.kBlack)),
            Row(children: List.generate(5, (i) => Icon(
              i < _avgRating.floor() ? Icons.star_rounded : Icons.star_border_rounded,
              size: 16, color: const Color(0xFFF59E0B),
            ))),
            const SizedBox(height: 4),
            Text('${_reviews.length * 69} ratings',
                style: const TextStyle(fontSize: 11, color: AppColors.kGrey)),
          ]),
          const SizedBox(width: 20),
          Expanded(child: Column(children: [5,4,3,2,1].map((star) {
            final count = _reviews.where((r) => r['rating'] == star).length;
            final pct = count / _reviews.length;
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(children: [
                Text('$star', style: const TextStyle(fontSize: 11, color: AppColors.kGrey)),
                const SizedBox(width: 4),
                const Icon(Icons.star_rounded, size: 11, color: Color(0xFFF59E0B)),
                const SizedBox(width: 6),
                Expanded(child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: pct,
                    minHeight: 6,
                    backgroundColor: AppColors.kBorderGrey,
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF0D9488)),
                  ),
                )),
                const SizedBox(width: 6),
                Text('$count', style: const TextStyle(fontSize: 11, color: AppColors.kGrey)),
              ]),
            );
          }).toList())),
        ]),
      ),
      const SizedBox(height: 16),
      GestureDetector(
        onTap: _showWriteReview,
        child: Container(
          width: double.infinity, height: 46,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF0D9488)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.rate_review_rounded, color: Color(0xFF0D9488), size: 18),
            SizedBox(width: 8),
            Text('Write a Review',
                style: TextStyle(color: Color(0xFF0D9488), fontWeight: FontWeight.w700, fontSize: 14)),
          ]),
        ),
      ),
      const SizedBox(height: 16),
      ..._reviews.map((r) => _reviewCard(r)),
    ]),
  );

  Widget _reviewCard(Map<String, dynamic> r) => Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.kBorderGrey),
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2))],
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        CircleAvatar(radius: 18, backgroundColor: const Color(0xFF0D9488),
            child: Text((r['name'] as String)[0],
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
        const SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(r['name'] as String,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.kBlack)),
          Text(r['date'] as String,
              style: const TextStyle(fontSize: 11, color: AppColors.kGrey)),
        ])),
        Row(children: List.generate(5, (i) => Icon(
          i < (r['rating'] as int) ? Icons.star_rounded : Icons.star_border_rounded,
          size: 14, color: const Color(0xFFF59E0B),
        ))),
      ]),
      const SizedBox(height: 10),
      Text(r['comment'] as String,
          style: const TextStyle(fontSize: 13, color: AppColors.kGrey, height: 1.5)),
    ]),
  );

  void _showWriteReview() {
    int selectedRating = 5;
    final ctrl = TextEditingController();
    showModalBottomSheet(
      context: context, isScrollControlled: true, backgroundColor: Colors.transparent,
      builder: (_) => StatefulBuilder(builder: (ctx, setModalState) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(child: Container(width: 40, height: 4,
                decoration: BoxDecoration(color: AppColors.kBorderGrey, borderRadius: BorderRadius.circular(10)))),
            const SizedBox(height: 16),
            const Text('Write a Review',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: AppColors.kBlack)),
            const SizedBox(height: 14),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(5, (i) =>
              GestureDetector(
                onTap: () => setModalState(() => selectedRating = i + 1),
                child: Icon(
                  i < selectedRating ? Icons.star_rounded : Icons.star_border_rounded,
                  size: 36, color: const Color(0xFFF59E0B),
                ),
              ),
            )),
            const SizedBox(height: 14),
            TextField(
              controller: ctrl, maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Share your experience with this product...',
                hintStyle: const TextStyle(color: AppColors.kGrey, fontSize: 13),
                filled: true, fillColor: AppColors.kBlueLite,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF0D9488), width: 1.5)),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D9488),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {
                  if (ctrl.text.trim().isNotEmpty) {
                    setState(() {
                      _reviews.insert(0, {
                        'name': 'You', 'rating': selectedRating,
                        'date': 'Just now', 'comment': ctrl.text.trim(),
                      });
                    });
                    Navigator.pop(ctx);
                    _snack('✅ Review submitted! Thank you.', const Color(0xFF16A34A));
                  }
                },
                child: const Text('Submit Review',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15)),
              ),
            ),
          ]),
        ),
      )),
    );
  }

  Widget _buildKeyHighlights() => Container(
    color: Colors.white, padding: const EdgeInsets.all(16),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _sectionHeader('Key Highlights'),
      const SizedBox(height: 16),
      GridView.count(
        crossAxisCount: 3, shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 1,
        children: [
          {'icon': Icons.water_drop_outlined,           'label': 'No Coding\nRequired'},
          {'icon': Icons.hourglass_bottom_rounded,      'label': '5 Second\nResult'},
          {'icon': Icons.memory_rounded,                'label': '500 Memory\nStorage'},
          {'icon': Icons.battery_charging_full_rounded, 'label': 'Auto\nOff'},
          {'icon': Icons.wifi_rounded,                  'label': 'Bluetooth\nSync'},
          {'icon': Icons.verified_rounded,              'label': 'CE & FDA\nApproved'},
        ].map((h) => Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF0F9F8), borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE0F2F1)),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(h['icon'] as IconData, size: 28, color: const Color(0xFF0D9488)),
            const SizedBox(height: 8),
            Text(h['label'] as String, textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 11, color: AppColors.kBlack, fontWeight: FontWeight.w600, height: 1.3)),
          ]),
        )).toList(),
      ),
    ]),
  );

  Widget _buildOffers() => Container(
    color: Colors.white, padding: const EdgeInsets.all(16),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _sectionHeader('Offers'),
      const SizedBox(height: 12),
      _offerRow(Icons.local_offer_rounded, '10% off on orders above Rs.1,000', 'HEALTH10', '10% OFF'),
      const SizedBox(height: 8),
      _offerRow(Icons.savings_rounded, '5% cashback on first order', 'SAVE5', '5% BACK'),
      const SizedBox(height: 8),
      _offerRow(Icons.local_shipping_rounded, 'Free shipping on orders above Rs.500', 'FREESHIP', 'FREE'),
    ]),
  );

  Widget _offerRow(IconData icon, String title, String code, String badge) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: const Color(0xFFF0F9F8), borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFFE0F2F1)),
    ),
    child: Row(children: [
      Container(width: 40, height: 40,
        decoration: BoxDecoration(color: const Color(0xFF0D9488).withOpacity(0.15), shape: BoxShape.circle),
        child: Icon(icon, color: const Color(0xFF0D9488), size: 20)),
      const SizedBox(width: 12),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontSize: 13, color: AppColors.kBlack, fontWeight: FontWeight.w500)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(color: AppColors.kBlack, borderRadius: BorderRadius.circular(4)),
          child: Text(code, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
        ),
      ])),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(color: const Color(0xFF0D9488), borderRadius: BorderRadius.circular(20)),
        child: Text(badge, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w800)),
      ),
    ]),
  );

  Widget _buildDeliveryBadges() => Container(
    color: Colors.white, padding: const EdgeInsets.all(16),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      _deliveryBadge(Icons.assignment_return_rounded, 'Returns\nLite'),
      _deliveryBadge(Icons.local_shipping_rounded, 'Free\nDelivery'),
      _deliveryBadge(Icons.verified_rounded, 'Veesafe\nDelivery'),
    ]),
  );

  Widget _deliveryBadge(IconData icon, String label) => Column(children: [
    Container(width: 60, height: 60,
      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.kBorderGrey), color: Colors.white),
      child: Icon(icon, size: 26, color: AppColors.kBlack)),
    const SizedBox(height: 6),
    Text(label, textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 11, color: AppColors.kGrey, fontWeight: FontWeight.w500, height: 1.3)),
  ]);

  Widget _buildSimilarProducts() => Container(
    color: Colors.white, padding: const EdgeInsets.all(16),
    child: Column(children: [
      Row(children: [
        _sectionHeader('Similar Products'),
        const Spacer(),
        const Text('View all', style: TextStyle(fontSize: 13, color: Color(0xFF0D9488), fontWeight: FontWeight.w600)),
      ]),
      const SizedBox(height: 14),
      Row(children: [
        Expanded(child: _similarCard(
          '${widget.product.name} Pro',
          '4.0', _modifyPrice(widget.product.price, 0.7), _modifyPrice(widget.product.price, 0.85),
          'NEW', const Color(0xFF1A2E5A), widget.product.imageIcon)),
        const SizedBox(width: 10),
        Expanded(child: _similarCard(
          '${widget.product.name} Lite',
          '4.3', _modifyPrice(widget.product.price, 0.8), _modifyPrice(widget.product.price, 1.0),
          'HOT', const Color(0xFFE11D48), widget.product.imageIcon)),
      ]),
    ]),
  );

  Widget _similarCard(String name, String rating, String price, String oldPrice,
      String badge, Color badgeColor, IconData icon) => GestureDetector(
    onTap: () => Navigator.push(context, MaterialPageRoute(
      builder: (_) => ProductDetailScreen(product: Product(
        name: name, price: price, oldPrice: oldPrice,
        badge: badge, badgeColor: badgeColor,
        imageBg: widget.product.imageBg, imageIcon: icon,
        imageIconColor: widget.product.imageIconColor,
        imageUrl: widget.product.imageUrl,
      )),
    )),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.kBorderGrey),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(children: [
          Container(height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F4F8),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Center(child: Icon(icon, size: 48, color: Colors.blueGrey.shade300))),
          Positioned(top: 8, left: 8, child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(6)),
            child: Text(badge, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800)),
          )),
        ]),
        Padding(padding: const EdgeInsets.all(10), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(name, maxLines: 2, overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.kBlack, height: 1.3)),
          const SizedBox(height: 4),
          Row(children: [
            const Icon(Icons.star_rounded, size: 13, color: Color(0xFFF59E0B)),
            const SizedBox(width: 3),
            Text(rating, style: const TextStyle(fontSize: 12, color: AppColors.kGrey)),
          ]),
          const SizedBox(height: 4),
          Text(price, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: AppColors.kBlack)),
          Text(oldPrice, style: const TextStyle(fontSize: 11, color: AppColors.kGrey, decoration: TextDecoration.lineThrough)),
        ])),
      ]),
    ),
  );

  Widget _buildFrequentlyBought() => Container(
    color: Colors.white, padding: const EdgeInsets.all(16),
    child: Column(children: [
      Row(children: [
        _sectionHeader('Frequently bought Products'),
        const Spacer(),
        const Text('View all 7', style: TextStyle(fontSize: 13, color: Color(0xFF0D9488), fontWeight: FontWeight.w600)),
      ]),
      const SizedBox(height: 14),
      GridView.count(
        crossAxisCount: 2, shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 0.85,
        children: [
          _similarCard('${widget.product.name} Bundle', '4.5',
              _modifyPrice(widget.product.price, 0.95), _modifyPrice(widget.product.price, 1.15),
              'TOP', const Color(0xFFD97706), Icons.favorite_rounded),
          _similarCard('${widget.product.name} Mini', '4.2',
              _modifyPrice(widget.product.price, 0.3), _modifyPrice(widget.product.price, 0.4),
              'NEW', const Color(0xFF1A2E5A), widget.product.imageIcon),
          _similarCard('${widget.product.name} Advanced', '4.4',
              _modifyPrice(widget.product.price, 1.2), _modifyPrice(widget.product.price, 1.5),
              'HOT', const Color(0xFFE11D48), Icons.medical_services_rounded),
          _similarCard('${widget.product.name} Plus', '4.6',
              _modifyPrice(widget.product.price, 1.0), _modifyPrice(widget.product.price, 1.3),
              'TOP', const Color(0xFFD97706), Icons.health_and_safety_rounded),
        ],
      ),
    ]),
  );

  Widget _buildManufacturer() => Container(
    color: Colors.white, padding: const EdgeInsets.all(16),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _sectionHeader('Manufacturer / Market address'),
      const SizedBox(height: 14),
      _manuRow(Icons.business_rounded, 'Sheetal Healthcare Pvt. Ltd.'),
      _manuRow(Icons.location_on_rounded, 'Akshaya Nagar 1st Block, Rammurthy Nagar, Bangalore-560016'),
      _manuRow(Icons.phone_rounded, '+91 8802167892'),
      _manuRow(Icons.email_rounded, 'care@veesafe.com'),
    ]),
  );

  Widget _manuRow(IconData icon, String text) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(width: 36, height: 36,
        decoration: BoxDecoration(color: const Color(0xFFF0F9F8), borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, size: 18, color: const Color(0xFF0D9488))),
      const SizedBox(width: 12),
      Expanded(child: Text(text, style: const TextStyle(fontSize: 13, color: AppColors.kGrey, height: 1.5))),
    ]),
  );

  Widget _sectionHeader(String title) => Row(mainAxisSize: MainAxisSize.min, children: [
    Container(width: 4, height: 20,
        decoration: BoxDecoration(color: const Color(0xFF0D9488), borderRadius: BorderRadius.circular(4))),
    const SizedBox(width: 8),
    Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.kBlack)),
  ]);

  void _showBulkEnquiry() {
    final nameCtrl  = TextEditingController();
    final phoneCtrl = TextEditingController();
    final qtyCtrl   = TextEditingController();
    showModalBottomSheet(
      context: context, isScrollControlled: true, backgroundColor: Colors.transparent,
      builder: (_) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(child: Container(width: 40, height: 4,
                decoration: BoxDecoration(color: AppColors.kBorderGrey, borderRadius: BorderRadius.circular(10)))),
            const SizedBox(height: 16),
            const Text('Bulk Enquiry',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.kBlack)),
            const SizedBox(height: 4),
            Text('For: ${widget.product.name}',
                style: const TextStyle(fontSize: 12, color: AppColors.kGrey)),
            const SizedBox(height: 16),
            _field('Your Name', nameCtrl, Icons.person_outline_rounded),
            const SizedBox(height: 12),
            _field('Phone Number', phoneCtrl, Icons.phone_outlined, type: TextInputType.phone),
            const SizedBox(height: 12),
            _field('Quantity', qtyCtrl, Icons.inventory_2_outlined, type: TextInputType.number),
            const SizedBox(height: 20),
            SizedBox(width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.kBlue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                onPressed: () {
                  Navigator.pop(context);
                  _snack('✅ Enquiry submitted! We\'ll contact you soon.', const Color(0xFF16A34A));
                },
                child: const Text('Submit Enquiry',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15)),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _field(String label, TextEditingController ctrl, IconData icon,
      {TextInputType type = TextInputType.text}) =>
      TextField(controller: ctrl, keyboardType: type,
        decoration: InputDecoration(
          labelText: label, labelStyle: const TextStyle(color: AppColors.kGrey, fontSize: 13),
          prefixIcon: Icon(icon, color: AppColors.kGrey, size: 18),
          filled: true, fillColor: AppColors.kBlueLite,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.kBlue, width: 1.5)), isDense: true),
      );

  Widget _buildBottomBar() => Container(
    decoration: BoxDecoration(color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, -2))]),
    padding: EdgeInsets.only(left: 16, right: 16, top: 10,
        bottom: MediaQuery.of(context).padding.bottom + 10),
    child: Row(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
        // const Text('Total Price', style: TextStyle(fontSize: 11, color: AppColors.kGrey)),
        // Text('Rs.${_totalPrice.toStringAsFixed(2)}',
        //     style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: AppColors.kBlack)),


      Text(_orderMode == OrderMode.rent ? 'Rental Price' : 'Total Price',
    style: const TextStyle(fontSize: 11, color: AppColors.kGrey)),
Text(_orderMode == OrderMode.rent
    ? 'Rs.${RentalInfo(mode: OrderMode.rent, duration: _rentalDuration, durationCount: _rentalCount).rentalPrice(_salePrice).toStringAsFixed(2)}'
    : 'Rs.${_totalPrice.toStringAsFixed(2)}',
    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: AppColors.kBlack)),



      ]),
      const SizedBox(width: 12),
      Expanded(flex: 2,
        child: GestureDetector(
          onTap: () { setState(() => _inCart = true); _snack('✅ Added to cart!', const Color(0xFF16A34A)); },
          child: Container(height: 50,
            decoration: BoxDecoration(color: const Color(0xFF1A2E5A), borderRadius: BorderRadius.circular(30)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(Icons.shopping_cart_rounded, color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Text(_inCart ? 'Added!' : 'Add to Cart',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
            ]),
          ),
        ),
      ),
      const SizedBox(width: 8),
      GestureDetector(
        onTap: () => _snack('🛒 Proceeding to checkout...', const Color(0xFF0D9488)),
        child: Container(width: 70, height: 50,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color(0xFF0D9488), Color(0xFF0F766E)]),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.bolt_rounded, color: Colors.white, size: 20),
            //Text('Buy Now', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700)),

            Text(_orderMode == OrderMode.rent ? 'Rent' : 'Buy Now',
            style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700)),

    
          ]),
        ),
      ),
    ]),
  );

// // Add after existing state variables
// OrderMode _orderMode = OrderMode.buy;
// RentalDuration _rentalDuration = RentalDuration.daily;
// int _rentalCount = 1;
 }
