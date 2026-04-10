import 'package:flutter/material.dart';

// ── Top-level color constants
const Color _kNavy = Color(0xFF1A2B5E);
const Color _kCyan = Color(0xFF00B4D8);
const Color _kBg   = Color(0xFFF2F4F8);

class AllReviewsScreen extends StatefulWidget {
  const AllReviewsScreen({super.key});

  @override
  State<AllReviewsScreen> createState() => _AllReviewsScreenState();
}

class _AllReviewsScreenState extends State<AllReviewsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _filterIndex = 0; // 0=All, 1=Image, 2=Video

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: _kBg,
      body: Column(
        children: [
          // ── Header
          _buildHeader(context, sw),
          // ── Tab Bar
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: _kNavy,
              unselectedLabelColor: const Color(0xFF9CA3AF),
              labelStyle: TextStyle(
                fontSize: sw * 0.036,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: sw * 0.036,
                fontWeight: FontWeight.w500,
              ),
              indicatorColor: _kNavy,
              indicatorWeight: 3,
              tabs: const [
                Tab(text: 'Text Review'),
                Tab(text: 'Video Review'),
              ],
            ),
          ),
          // ── Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // TEXT REVIEW TAB
                _buildTextReviewTab(sw),
                // VIDEO REVIEW TAB
                _buildVideoReviewTab(sw),
              ],
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
      decoration: const BoxDecoration(
        color: _kNavy,
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
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: sw * 0.095,
                  height: sw * 0.095,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(sw * 0.028),
                    border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2), width: 1),
                  ),
                  child: Icon(Icons.chevron_left_rounded,
                      color: Colors.white, size: sw * 0.05),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'All Reviews',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: sw * 0.045,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(width: sw * 0.095),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  // TEXT REVIEW TAB
  // Shows: filter chips + room/image style reviews
  // ─────────────────────────────────────────
  Widget _buildTextReviewTab(double sw) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: sw * 0.04),
          // Reviews — Text only (no filter chips, no image thumbnails)
          ..._textReviews.map((r) => _buildTextReviewCard(r, sw)),
          // Offer Banner
          _buildOfferBanner(sw),
          SizedBox(height: sw * 0.03),
          // You may also like
          _buildYouMayAlsoLike(sw),
          SizedBox(height: sw * 0.03),
          // Frequently bought
          _buildFrequentlyBought(sw),
          SizedBox(height: sw * 0.06),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  // VIDEO REVIEW TAB
  // Shows: filter chips + reviews with video thumbnails
  // ─────────────────────────────────────────
  Widget _buildVideoReviewTab(double sw) {
    // Which reviews to show based on filter
    final reviews = _filterIndex == 2
        ? _videoReviews
        : _filterIndex == 1
            ? _imageReviews
            : [..._imageReviews, ..._videoReviews];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: sw * 0.04),
          // Filter chips
          _buildFilterChips(sw),
          SizedBox(height: sw * 0.03),
          // Reviews with image/video thumbnails
          ...reviews.map((r) => _buildMediaReviewCard(r, sw)),
          // Offer Banner
          _buildOfferBanner(sw),
          SizedBox(height: sw * 0.03),
          // You may also like
          _buildYouMayAlsoLike(sw),
          SizedBox(height: sw * 0.03),
          // Frequently bought
          _buildFrequentlyBought(sw),
          SizedBox(height: sw * 0.06),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  // FILTER CHIPS
  // ─────────────────────────────────────────
  Widget _buildFilterChips(double sw) {
    final filters = ['All', 'Image', 'Video'];
    final activeColors = [_kNavy, _kNavy, Colors.red];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
      child: Row(
        children: List.generate(filters.length, (i) {
          final selected = _filterIndex == i;
          return GestureDetector(
            onTap: () => setState(() => _filterIndex = i),
            child: Container(
              margin: EdgeInsets.only(right: sw * 0.025),
              padding: EdgeInsets.symmetric(
                  horizontal: sw * 0.045, vertical: sw * 0.02),
              decoration: BoxDecoration(
                color: selected ? activeColors[i] : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: selected ? activeColors[i] : const Color(0xFFCBD5E0),
                  width: 1.5,
                ),
              ),
              child: Text(
                filters[i],
                style: TextStyle(
                  fontSize: sw * 0.032,
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.white : const Color(0xFF2D3748),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // ─────────────────────────────────────────
  // TEXT REVIEW CARD (no image thumbnail)
  // ─────────────────────────────────────────
  Widget _buildTextReviewCard(Map<String, dynamic> r, double sw) {
    return Container(
      margin: EdgeInsets.fromLTRB(sw * 0.04, 0, sw * 0.04, sw * 0.03),
      padding: EdgeInsets.all(sw * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Reviewer info
          Row(
            children: [
              CircleAvatar(
                radius: sw * 0.045,
                backgroundColor: _kNavy,
                child: Text(
                  r['name'][0],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: sw * 0.036,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(width: sw * 0.025),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(r['name'],
                      style: TextStyle(
                          fontSize: sw * 0.034,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF2D3748))),
                  SizedBox(height: sw * 0.005),
                  _buildStars(r['rating'] as int, sw),
                ],
              ),
            ],
          ),
          SizedBox(height: sw * 0.025),
          // Review text
          Text(
            '"${r['review']}"',
            style: TextStyle(
              fontSize: sw * 0.03,
              color: const Color(0xFF6B7280),
              height: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: sw * 0.025),
          // Action row
          Row(
            children: [
              Icon(Icons.image_outlined,
                  size: sw * 0.042, color: const Color(0xFF9CA3AF)),
              SizedBox(width: sw * 0.03),
              Icon(Icons.thumb_up_outlined,
                  size: sw * 0.042, color: const Color(0xFF9CA3AF)),
              SizedBox(width: sw * 0.015),
              Text('1',
                  style: TextStyle(
                      fontSize: sw * 0.03, color: const Color(0xFF9CA3AF))),
              SizedBox(width: sw * 0.03),
              Icon(Icons.flag_outlined,
                  size: sw * 0.042, color: const Color(0xFF9CA3AF)),
            ],
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  // MEDIA REVIEW CARD (with image/video thumbnail)
  // ─────────────────────────────────────────
  Widget _buildMediaReviewCard(Map<String, dynamic> r, double sw) {
    final bool isVideo = r['isVideo'] as bool;
    final bool isSelected = r['isSelected'] as bool? ?? false;

    return Container(
      margin: EdgeInsets.fromLTRB(sw * 0.04, 0, sw * 0.04, sw * 0.03),
      padding: EdgeInsets.all(sw * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: isSelected
            ? Border.all(color: _kCyan, width: 2)
            : Border.all(color: Colors.transparent, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Reviewer info
          Row(
            children: [
              CircleAvatar(
                radius: sw * 0.045,
                backgroundColor: _kNavy,
                child: Text(
                  r['name'][0],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: sw * 0.036,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(width: sw * 0.025),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(r['name'],
                      style: TextStyle(
                          fontSize: sw * 0.034,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF2D3748))),
                  SizedBox(height: sw * 0.005),
                  _buildStars(r['rating'] as int, sw),
                ],
              ),
            ],
          ),
          SizedBox(height: sw * 0.02),
          // Review text
          Text(
            '"${r['review']}"',
            style: TextStyle(
              fontSize: sw * 0.03,
              color: const Color(0xFF6B7280),
              height: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: sw * 0.025),
          // Media thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Room illustration
                _buildRoomIllustration(sw),
                // Play button for video
                if (isVideo)
                  Container(
                    width: sw * 0.14,
                    height: sw * 0.14,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Icon(Icons.play_arrow_rounded,
                        color: _kNavy, size: sw * 0.08),
                  ),
              ],
            ),
          ),
          SizedBox(height: sw * 0.025),
          // Action row
          Row(
            children: [
              Icon(Icons.image_outlined,
                  size: sw * 0.042, color: const Color(0xFF9CA3AF)),
              SizedBox(width: sw * 0.03),
              Icon(Icons.thumb_up_outlined,
                  size: sw * 0.042, color: const Color(0xFF9CA3AF)),
              SizedBox(width: sw * 0.015),
              Text('1',
                  style: TextStyle(
                      fontSize: sw * 0.03, color: const Color(0xFF9CA3AF))),
              SizedBox(width: sw * 0.03),
              Icon(Icons.flag_outlined,
                  size: sw * 0.042, color: const Color(0xFF9CA3AF)),
            ],
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  // ROOM ILLUSTRATION (medical room scene)
  // ─────────────────────────────────────────
  Widget _buildRoomIllustration(double sw) {
    return Container(
      width: double.infinity,
      height: sw * 0.45,
      color: const Color(0xFFE8EDF5),
      child: CustomPaint(
        painter: _RoomPainter(),
      ),
    );
  }

  // ─────────────────────────────────────────
  // STARS
  // ─────────────────────────────────────────
  Widget _buildStars(int rating, double sw) {
    return Row(
      children: List.generate(5, (i) {
        return Icon(
          i < rating ? Icons.star_rounded : Icons.star_outline_rounded,
          color: const Color(0xFFFBBF24),
          size: sw * 0.038,
        );
      }),
    );
  }

  // ─────────────────────────────────────────
  // OFFER BANNER
  // ─────────────────────────────────────────
  Widget _buildOfferBanner(double sw) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sw * 0.04),
      padding: EdgeInsets.all(sw * 0.04),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFFCC80), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: sw * 0.03, vertical: sw * 0.015),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('50% OFF',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: sw * 0.028,
                    fontWeight: FontWeight.w800)),
          ),
          SizedBox(width: sw * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Medical Product',
                    style: TextStyle(
                        fontSize: sw * 0.038,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF2D3748))),
                SizedBox(height: sw * 0.01),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: sw * 0.04, vertical: sw * 0.015),
                  decoration: BoxDecoration(
                    color: _kNavy,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('Open',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: sw * 0.03,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
          // Product illustration
          Container(
            width: sw * 0.2,
            height: sw * 0.2,
            decoration: BoxDecoration(
              color: const Color(0xFFEBEFF8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.monitor_weight_outlined,
                color: _kNavy, size: sw * 0.1),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  // YOU MAY ALSO LIKE
  // ─────────────────────────────────────────
  Widget _buildYouMayAlsoLike(double sw) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('You may also like',
                  style: TextStyle(
                      fontSize: sw * 0.04,
                      fontWeight: FontWeight.w700,
                      color: _kNavy)),
              Text('View all',
                  style: TextStyle(
                      fontSize: sw * 0.032,
                      color: _kNavy,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        SizedBox(height: sw * 0.03),
        SizedBox(
          height: sw * 0.55,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
            physics: const BouncingScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                width: sw * 0.42,
                margin: EdgeInsets.only(right: sw * 0.03),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Doctor image
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14),
                      ),
                      child: Container(
                        height: sw * 0.32,
                        color: const Color(0xFFEBEFF8),
                        child: CustomPaint(
                          painter: _DoctorPainter(),
                          size: Size(sw * 0.42, sw * 0.32),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(sw * 0.025),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Surgical Dress Combo',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: sw * 0.03,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF2D3748))),
                          SizedBox(height: sw * 0.005),
                          Text('NEW',
                              style: TextStyle(
                                  fontSize: sw * 0.022,
                                  color: Colors.grey)),
                          SizedBox(height: sw * 0.005),
                          Text('Rs.1499.00',
                              style: TextStyle(
                                  fontSize: sw * 0.03,
                                  fontWeight: FontWeight.w700,
                                  color: _kNavy)),
                          SizedBox(height: sw * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.all(sw * 0.015),
                                decoration: BoxDecoration(
                                  color: _kNavy,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Icon(Icons.add,
                                    color: Colors.white, size: sw * 0.035),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────
  // FREQUENTLY BOUGHT
  // ─────────────────────────────────────────
  Widget _buildFrequentlyBought(double sw) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Frequently brought Products',
                  style: TextStyle(
                      fontSize: sw * 0.038,
                      fontWeight: FontWeight.w700,
                      color: _kNavy)),
              Text('View all',
                  style: TextStyle(
                      fontSize: sw * 0.032,
                      color: _kNavy,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        SizedBox(height: sw * 0.03),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
          child: Column(
            children: List.generate(2, (rowIndex) {
              return Padding(
                padding: EdgeInsets.only(bottom: sw * 0.025),
                child: Row(
                  children: List.generate(2, (colIndex) {
                    return Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            right: colIndex == 0 ? sw * 0.025 : 0),
                        padding: EdgeInsets.all(sw * 0.025),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: sw * 0.14,
                              height: sw * 0.14,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEBEFF8),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: CustomPaint(
                                painter: _DoctorPainter(),
                              ),
                            ),
                            SizedBox(width: sw * 0.015),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Liveasy Wellness Scrubs - Men and Women\'s wear and it was the produ...',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: sw * 0.024,
                                        color: const Color(0xFF2D3748),
                                        height: 1.3),
                                  ),
                                  SizedBox(height: sw * 0.008),
                                  Text('\$2,604.00',
                                      style: TextStyle(
                                          fontSize: sw * 0.026,
                                          fontWeight: FontWeight.w700,
                                          color: _kNavy)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────
  // DUMMY DATA
  // ─────────────────────────────────────────
  final List<Map<String, dynamic>> _textReviews = [
    {
      'name': 'Rikitha',
      'rating': 4,
      'review':
          'We are glad we can help you with your medical needs. Our team of experts is here to make sure you get the best quality products.',
    },
    {
      'name': 'Rikitha',
      'rating': 4,
      'review':
          'We are glad we can help you with your medical needs. Our team of experts is here to make sure you get the best quality products.',
    },
    {
      'name': 'Rikitha',
      'rating': 4,
      'review':
          'We are glad we can help you with your medical needs. Our team of experts is here to make sure you get the best quality products.',
    },
    {
      'name': 'Rikitha',
      'rating': 4,
      'review':
          'We are glad we can help you with your medical needs. Our team of experts is here to make sure you get the best quality products.',
    },
  ];

  final List<Map<String, dynamic>> _imageReviews = [
    {
      'name': 'Rikitha',
      'rating': 4,
      'review':
          'We are glad we can help you with your medical needs. Our team of experts is here to make sure you get the best quality products.',
      'isVideo': false,
      'isSelected': false,
    },
    {
      'name': 'Rikitha',
      'rating': 4,
      'review':
          'We are glad we can help you with your medical needs. Our team of experts is here to make sure you get the best quality products.',
      'isVideo': false,
      'isSelected': false,
    },
  ];

  final List<Map<String, dynamic>> _videoReviews = [
    {
      'name': 'Rikitha',
      'rating': 4,
      'review':
          'We are glad we can help you with your medical needs. Our team of experts is here to make sure you get the best quality products.',
      'isVideo': true,
      'isSelected': false,
    },
    {
      'name': 'Rikitha',
      'rating': 4,
      'review':
          'We are glad we can help you with your medical needs. Our team of experts is here to make sure you get the best quality products.',
      'isVideo': true,
      'isSelected': true,
    },
    {
      'name': 'Rikitha',
      'rating': 4,
      'review':
          'We are glad we can help you with your medical needs. Our team of experts is here to make sure you get the best quality products.',
      'isVideo': true,
      'isSelected': false,
    },
  ];
}

// ─────────────────────────────────────────
// ROOM PAINTER — Medical room scene
// ─────────────────────────────────────────
class _RoomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final sw = size.width;
    final sh = size.height;
    final paint = Paint()..style = PaintingStyle.fill;

    // Floor
    paint.color = const Color(0xFFD0D8E8);
    canvas.drawRect(Rect.fromLTWH(0, sh * 0.65, sw, sh * 0.35), paint);

    // Back wall
    paint.color = const Color(0xFFE8EDF5);
    canvas.drawRect(Rect.fromLTWH(0, 0, sw, sh * 0.65), paint);

    // Ceiling light bar
    paint.color = const Color(0xFFFFE082);
    canvas.drawRect(Rect.fromLTWH(sw * 0.3, 0, sw * 0.4, sh * 0.06), paint);

    // Overhead surgical light
    paint.color = const Color(0xFFB0BEC5);
    canvas.drawCircle(Offset(sw * 0.5, sh * 0.18), sw * 0.07, paint);
    paint.color = const Color(0xFFFFECB3);
    canvas.drawCircle(Offset(sw * 0.5, sh * 0.18), sw * 0.05, paint);

    // Operating table
    paint.color = const Color(0xFF90A4AE);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(sw * 0.2, sh * 0.52, sw * 0.6, sh * 0.1),
        const Radius.circular(6),
      ),
      paint,
    );
    // Table leg
    paint.color = const Color(0xFF78909C);
    canvas.drawRect(Rect.fromLTWH(sw * 0.46, sh * 0.62, sw * 0.08, sh * 0.1), paint);

    // Monitor/screen on left
    paint.color = const Color(0xFF546E7A);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(sw * 0.04, sh * 0.25, sw * 0.18, sh * 0.28),
        const Radius.circular(4),
      ),
      paint,
    );
    paint.color = const Color(0xFF00BCD4);
    canvas.drawRect(
        Rect.fromLTWH(sw * 0.06, sh * 0.28, sw * 0.14, sh * 0.2), paint);

    // Cabinet on right
    paint.color = const Color(0xFF78909C);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(sw * 0.78, sh * 0.28, sw * 0.18, sh * 0.38),
        const Radius.circular(4),
      ),
      paint,
    );

    // Plant on right side
    paint.color = const Color(0xFF4CAF50);
    canvas.drawCircle(Offset(sw * 0.88, sh * 0.3), sw * 0.04, paint);
    paint.color = const Color(0xFF388E3C);
    canvas.drawCircle(Offset(sw * 0.84, sh * 0.32), sw * 0.025, paint);
    canvas.drawCircle(Offset(sw * 0.92, sh * 0.32), sw * 0.025, paint);

    // Plant pot
    paint.color = const Color(0xFFBCAAA4);
    canvas.drawRect(
        Rect.fromLTWH(sw * 0.84, sh * 0.34, sw * 0.08, sh * 0.05), paint);

    // Side table
    paint.color = const Color(0xFF90A4AE);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(sw * 0.62, sh * 0.45, sw * 0.14, sh * 0.06),
        const Radius.circular(3),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─────────────────────────────────────────
// DOCTOR PAINTER — Doctor in scrubs
// ─────────────────────────────────────────
class _DoctorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final sw = size.width;
    final sh = size.height;
    final paint = Paint()..style = PaintingStyle.fill;

    // Background
    paint.color = const Color(0xFFEBEFF8);
    canvas.drawRect(Rect.fromLTWH(0, 0, sw, sh), paint);

    // Body (scrubs - teal/blue)
    paint.color = const Color(0xFF0097A7);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(sw * 0.25, sh * 0.45, sw * 0.5, sh * 0.55),
        const Radius.circular(8),
      ),
      paint,
    );

    // Arms
    paint.color = const Color(0xFF0097A7);
    // Left arm
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(sw * 0.08, sh * 0.45, sw * 0.18, sh * 0.35),
        const Radius.circular(6),
      ),
      paint,
    );
    // Right arm
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(sw * 0.74, sh * 0.45, sw * 0.18, sh * 0.35),
        const Radius.circular(6),
      ),
      paint,
    );

    // Gloves
    paint.color = const Color(0xFF80DEEA);
    canvas.drawOval(
        Rect.fromLTWH(sw * 0.06, sh * 0.76, sw * 0.2, sh * 0.12), paint);
    canvas.drawOval(
        Rect.fromLTWH(sw * 0.74, sh * 0.76, sw * 0.2, sh * 0.12), paint);

    // Head
    paint.color = const Color(0xFFFFCC80);
    canvas.drawOval(
        Rect.fromLTWH(sw * 0.3, sh * 0.08, sw * 0.4, sh * 0.38), paint);

    // Surgical cap
    paint.color = const Color(0xFF00838F);
    canvas.drawRect(Rect.fromLTWH(sw * 0.28, sh * 0.08, sw * 0.44, sh * 0.12),
        paint);
    // Cap brim
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(sw * 0.24, sh * 0.17, sw * 0.52, sh * 0.04),
        const Radius.circular(2),
      ),
      paint,
    );

    // Mask
    paint.color = const Color(0xFFB2EBF2);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(sw * 0.3, sh * 0.28, sw * 0.4, sh * 0.18),
        const Radius.circular(4),
      ),
      paint,
    );

    // Eyes
    paint.color = const Color(0xFF37474F);
    canvas.drawOval(
        Rect.fromLTWH(sw * 0.35, sh * 0.2, sw * 0.1, sh * 0.07), paint);
    canvas.drawOval(
        Rect.fromLTWH(sw * 0.55, sh * 0.2, sw * 0.1, sh * 0.07), paint);

    // Stethoscope
    paint.color = const Color(0xFFFFFFFF);
    final stethPath = Path();
    stethPath.moveTo(sw * 0.4, sh * 0.5);
    stethPath.quadraticBezierTo(sw * 0.3, sh * 0.6, sw * 0.38, sh * 0.7);
    final stethPaint = Paint()
      ..color = const Color(0xFFFFFFFF)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;
    canvas.drawPath(stethPath, stethPaint);
    paint.color = const Color(0xFFFFFFFF);
    canvas.drawCircle(Offset(sw * 0.38, sh * 0.72), sw * 0.03, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}