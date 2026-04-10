import 'package:flutter/material.dart';
import 'cart_screen.dart';
import 'cancel_item_screen.dart';
import 'home_screen.dart'; // ← added import

class YourOrdersScreen extends StatefulWidget {
  const YourOrdersScreen({super.key});

  @override
  State<YourOrdersScreen> createState() => _YourOrdersScreenState();
}

class _YourOrdersScreenState extends State<YourOrdersScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';

  final List<String> _categories = ['All', 'Devices', 'Equipments'];

  final List<Map<String, dynamic>> _orders = [
    {
      'title': 'Dr Trust USA Gold Standard Glucometer...',
      'rating': '4.2',
      'ratingCount': '347 ratings',
      'status': 'Delivered on Feb 14',
      'statusColor': Color(0xFF2E7D32),
      'showCancel': false,
      'qty': null,
      'image': 'assets/images/image.jpg',
    },
    {
      'title': 'Dr Trust USA Gold Standard Glucometer...',
      'rating': '4.2',
      'ratingCount': '347 ratings',
      'status': 'Delivered on Feb 14',
      'statusColor': Color(0xFF2E7D32),
      'showCancel': false,
      'qty': null,
      'image': 'assets/images/image.jpg',
    },
    {
      'title': 'Dr Trust USA Gold Standard Glucometer...',
      'rating': '4.2',
      'ratingCount': '347 ratings',
      'status': 'Delivered on Feb 14',
      'statusColor': Color(0xFF2E7D32),
      'showCancel': false,
      'qty': null,
      'image': 'assets/images/image.jpg',
    },
  ];

  final Map<String, dynamic> _orderDetail = {
    'title':
        'Dr Trust USA Gold Standard Glucometer Sugar Check Testing Machine 9090 with 25 Strips',
    'rating': '4.2',
    'ratingCount': '347 ratings',
    'qty': 1,
    'items': '\$250.00',
    'delivery': '\$250.00',
    'total': '\$250.00',
    'promotion': '-\$780.00',
    'orderTotal': '\$2,604.00',
    'savings': '\$2,604.00 (47%)',
    'shippingTo': 'Sheetal, Akshaya Nagar 1st Block, Ram...',
    'manufacturerName': 'Sheetal',
    'manufacturerAddress':
        'Akshaya Nagar 1st Block 1st Cross, Rammurthy\nNagar, Bangalore-560016.',
    'phone': '+91 8802167892',
    'country': 'India',
    'email': 'care@gmail.com',
    'supportAddress':
        'Akshaya Nagar 1st Block 1st Cross, Rammurthy\nNagar, Bangalore-560016.',
    'supportPhone': '+91 8802167892',
    'image': 'assets/images/image.jpg',
  };

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: sw * 0.04),
                    _buildSearchBar(sw),
                    SizedBox(height: sw * 0.04),
                    _buildBuyAgainRow(sw),
                    SizedBox(height: sw * 0.035),
                    _buildCategoryChips(sw),
                    SizedBox(height: sw * 0.04),
                    ..._orders.map((o) => _buildOrderListCard(o, sw)),
                    SizedBox(height: sw * 0.05),
                    _buildOrderDetailCard(sw),
                    SizedBox(height: sw * 0.04),
                    _buildShippingDetails(sw),
                    SizedBox(height: sw * 0.04),
                    _buildManufacturerCard(sw),
                    SizedBox(height: sw * 0.04),
                    _buildSupportCard(sw),
                    SizedBox(height: sw * 0.08),
                  ],
                ),
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
            sw * 0.04,
            sw * 0.03,
            sw * 0.04,
            sw * 0.05,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pushReplacement(
                  // ← changed from Navigator.pop
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                ),
                child: Container(
                  width: sw * 0.095,
                  height: sw * 0.095,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(sw * 0.028),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    Icons.chevron_left_rounded,
                    color: Colors.white,
                    size: sw * 0.05,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Your Orders',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: sw * 0.045,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartScreen()),
                ),
                child: Container(
                  width: sw * 0.095,
                  height: sw * 0.095,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(sw * 0.028),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                    size: sw * 0.05,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(double sw) {
    return Container(
      height: sw * 0.12,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: sw * 0.04),
          Expanded(
            child: TextField(
              controller: _searchController,
              style: TextStyle(
                fontSize: sw * 0.035,
                color: const Color(0xFF2D3748),
              ),
              decoration: InputDecoration(
                hintText: 'Search Your Order',
                hintStyle: TextStyle(
                  color: const Color(0xFFADB5BD),
                  fontSize: sw * 0.035,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          Icon(
            Icons.search_rounded,
            color: const Color(0xFF1A2B5E),
            size: sw * 0.055,
          ),
          SizedBox(width: sw * 0.04),
        ],
      ),
    );
  }

  Widget _buildBuyAgainRow(double sw) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Buy Again',
          style: TextStyle(
            fontSize: sw * 0.042,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1A2B5E),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: sw * 0.035,
            vertical: sw * 0.022,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                Icons.tune_rounded,
                size: sw * 0.04,
                color: const Color(0xFF1A2B5E),
              ),
              SizedBox(width: sw * 0.015),
              Text(
                'Filter By',
                style: TextStyle(
                  fontSize: sw * 0.032,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1A2B5E),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryChips(double sw) {
    return Row(
      children: _categories.map((cat) {
        final bool selected = _selectedCategory == cat;
        return GestureDetector(
          onTap: () => setState(() => _selectedCategory = cat),
          child: Container(
            margin: EdgeInsets.only(right: sw * 0.025),
            padding: EdgeInsets.symmetric(
              horizontal: sw * 0.045,
              vertical: sw * 0.022,
            ),
            decoration: BoxDecoration(
              color: selected ? const Color(0xFF1A2B5E) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              cat,
              style: TextStyle(
                fontSize: sw * 0.032,
                fontWeight: FontWeight.w600,
                color: selected ? Colors.white : const Color(0xFF2D3748),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildOrderListCard(Map<String, dynamic> order, double sw) {
    final double imageSize = sw * 0.18;

    return Container(
      margin: EdgeInsets.only(bottom: sw * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(sw * 0.035),
        child: Row(
          children: [
            Container(
              width: imageSize,
              height: imageSize,
              decoration: BoxDecoration(
                color: const Color(0xFFEBEFF8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  order['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: const Color(0xFFEBEFF8),
                    child: Icon(
                      Icons.monitor_heart_outlined,
                      color: const Color(0xFF1A2B5E),
                      size: imageSize * 0.5,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: sw * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order['title'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: sw * 0.032,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2D3748),
                    ),
                  ),
                  SizedBox(height: sw * 0.015),
                  _buildRatingBadge(order['rating'], order['ratingCount'], sw),
                  SizedBox(height: sw * 0.015),
                  Row(
                    children: [
                      Container(
                        width: sw * 0.025,
                        height: sw * 0.025,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2E7D32),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: sw * 0.015),
                      Text(
                        order['status'],
                        style: TextStyle(
                          fontSize: sw * 0.03,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF2E7D32),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: const Color(0xFFADB5BD),
              size: sw * 0.06,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingBadge(String rating, String count, double sw) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: sw * 0.02,
            vertical: sw * 0.008,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF2E7D32),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              Text(
                rating,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: sw * 0.028,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: sw * 0.01),
              Icon(Icons.star_rounded, color: Colors.white, size: sw * 0.032),
            ],
          ),
        ),
        SizedBox(width: sw * 0.015),
        Text(
          count,
          style: TextStyle(
            fontSize: sw * 0.028,
            color: const Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderDetailCard(double sw) {
    final double imageSize = sw * 0.2;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(sw * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: imageSize,
                  height: imageSize,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBEFF8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      _orderDetail['image'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: const Color(0xFFEBEFF8),
                        child: Icon(
                          Icons.monitor_heart_outlined,
                          color: const Color(0xFF1A2B5E),
                          size: imageSize * 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: sw * 0.035),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _orderDetail['title'],
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: sw * 0.032,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2D3748),
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: sw * 0.015),
                      _buildRatingBadge(
                        _orderDetail['rating'],
                        _orderDetail['ratingCount'],
                        sw,
                      ),
                      SizedBox(height: sw * 0.015),
                      Text(
                        'Qty: ${_orderDetail['qty']}',
                        style: TextStyle(
                          fontSize: sw * 0.03,
                          color: const Color(0xFF6B7280),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: sw * 0.04),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CancelItemScreen()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: sw * 0.032),
                ),
                child: Text(
                  'Cancel Order',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: sw * 0.035,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShippingDetails(double sw) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(sw * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shipping Details',
              style: TextStyle(
                fontSize: sw * 0.04,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1A2B5E),
              ),
            ),
            SizedBox(height: sw * 0.02),
            _buildShippingRow('Shipping to :', _orderDetail['shippingTo'], sw),
            Divider(color: Colors.grey.shade100, height: sw * 0.05),
            _buildPriceLineItem('Items', _orderDetail['items'], sw),
            _buildPriceLineItem('Delivery', _orderDetail['delivery'], sw),
            _buildPriceLineItem('Total', _orderDetail['total'], sw),
            _buildPriceLineItem(
              'Promotion Applied',
              _orderDetail['promotion'],
              sw,
              valueColor: const Color(0xFFE53E3E),
            ),
            Divider(color: Colors.grey.shade200, height: sw * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Total :',
                  style: TextStyle(
                    fontSize: sw * 0.035,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF2D3748),
                  ),
                ),
                Text(
                  _orderDetail['orderTotal'],
                  style: TextStyle(
                    fontSize: sw * 0.038,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF1A2B5E),
                  ),
                ),
              ],
            ),
            SizedBox(height: sw * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your Savings :',
                  style: TextStyle(
                    fontSize: sw * 0.032,
                    color: const Color(0xFF6B7280),
                  ),
                ),
                Text(
                  _orderDetail['savings'],
                  style: TextStyle(
                    fontSize: sw * 0.032,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF2E7D32),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShippingRow(String label, String value, double sw) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: sw * 0.032,
            color: const Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: sw * 0.015),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: sw * 0.032,
              color: const Color(0xFF2D3748),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceLineItem(
    String label,
    String value,
    double sw, {
    Color? valueColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sw * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: sw * 0.032,
              color: const Color(0xFF6B7280),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: sw * 0.032,
              fontWeight: FontWeight.w600,
              color: valueColor ?? const Color(0xFF2D3748),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildManufacturerCard(double sw) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(sw * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Manufacturer / Market address',
              style: TextStyle(
                fontSize: sw * 0.036,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1A2B5E),
              ),
            ),
            SizedBox(height: sw * 0.025),
            Text(
              _orderDetail['manufacturerName'],
              style: TextStyle(
                fontSize: sw * 0.033,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2D3748),
              ),
            ),
            SizedBox(height: sw * 0.01),
            Text(
              _orderDetail['manufacturerAddress'],
              style: TextStyle(
                fontSize: sw * 0.03,
                color: const Color(0xFF6B7280),
                height: 1.5,
              ),
            ),
            SizedBox(height: sw * 0.01),
            Text(
              _orderDetail['phone'],
              style: TextStyle(
                fontSize: sw * 0.03,
                color: const Color(0xFF6B7280),
              ),
            ),
            SizedBox(height: sw * 0.01),
            Text(
              'Country of Origin: India',
              style: TextStyle(
                fontSize: sw * 0.03,
                color: const Color(0xFF6B7280),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportCard(double sw) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(sw * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'In case of any issues, contact us',
              style: TextStyle(
                fontSize: sw * 0.033,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF1A2B5E),
              ),
            ),
            SizedBox(height: sw * 0.025),
            Row(
              children: [
                Icon(
                  Icons.email_outlined,
                  size: sw * 0.04,
                  color: const Color(0xFF6B7280),
                ),
                SizedBox(width: sw * 0.02),
                Text(
                  _orderDetail['email'],
                  style: TextStyle(
                    fontSize: sw * 0.03,
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
            SizedBox(height: sw * 0.015),
            Text(
              _orderDetail['supportAddress'],
              style: TextStyle(
                fontSize: sw * 0.03,
                color: const Color(0xFF6B7280),
                height: 1.5,
              ),
            ),
            SizedBox(height: sw * 0.01),
            Row(
              children: [
                Icon(
                  Icons.phone_outlined,
                  size: sw * 0.04,
                  color: const Color(0xFF6B7280),
                ),
                SizedBox(width: sw * 0.02),
                Text(
                  _orderDetail['supportPhone'],
                  style: TextStyle(
                    fontSize: sw * 0.03,
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
