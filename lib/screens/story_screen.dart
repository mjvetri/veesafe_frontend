// lib/screens/story_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_colors.dart';

class _Slide {
  final String title;
  final String subtitle;
  final String description;
  final IconData mainIcon;
  final List<IconData> floatingIcons;
  final List<Color> gradient;
  final String tag;
  final String buttonLabel;
  final String price;

  const _Slide({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.mainIcon,
    required this.floatingIcons,
    required this.gradient,
    required this.tag,
    required this.buttonLabel,
    required this.price,
  });
}

const List<_Slide> _slides = [
  _Slide(
    title: 'Welcome to Veesafe',
    subtitle: 'HEALTHCARE MADE SIMPLE',
    description: 'Making healthcare understandable, accessible & affordable for everyone in India.',
    mainIcon: Icons.health_and_safety_rounded,
    floatingIcons: [Icons.medical_services_rounded, Icons.vaccines_rounded, Icons.monitor_heart_rounded, Icons.local_hospital_rounded],
    gradient: [Color(0xFF0A1F5C), Color(0xFF113A7A), Color(0xFF1A5276)],
    tag: 'Official App',
    buttonLabel: 'Explore Now',
    price: 'Free to Use',
  ),
  _Slide(
    title: 'Shop Medical Products',
    subtitle: 'TRENDING OFFERS EVERY DAY',
    description: 'Browse thousands of medical products at the best prices.',
    mainIcon: Icons.shopping_bag_rounded,
    floatingIcons: [Icons.bloodtype_rounded, Icons.air_rounded, Icons.wheelchair_pickup_rounded, Icons.medical_services_rounded],
    gradient: [Color(0xFF0D2B6B), Color(0xFF1565C0), Color(0xFF1976D2)],
    tag: 'Hot Deals',
    buttonLabel: 'Shop Now',
    price: 'From Rs.299',
  ),
  _Slide(
    title: 'Popular Categories',
    subtitle: '8 PRODUCT CATEGORIES',
    description: 'Beauty, Fitness, Personal Care, Mother & Baby, Testing Products & more.',
    mainIcon: Icons.grid_view_rounded,
    floatingIcons: [Icons.face_retouching_natural, Icons.fitness_center, Icons.child_care, Icons.coronavirus],
    gradient: [Color(0xFF0D3B1A), Color(0xFF1B5E20), Color(0xFF2E7D32)],
    tag: 'All Categories',
    buttonLabel: 'Browse Categories',
    price: '8 Categories',
  ),
  _Slide(
    title: 'Buyer / Seller Market',
    subtitle: 'CONNECT WITH SELLERS',
    description: 'Search seller-listed products, message them and buy at negotiated prices.',
    mainIcon: Icons.storefront_rounded,
    floatingIcons: [Icons.chat_rounded, Icons.sell_rounded, Icons.handshake_rounded, Icons.local_shipping_rounded],
    gradient: [Color(0xFF2D0A5C), Color(0xFF4A148C), Color(0xFF6A1B9A)],
    tag: 'Marketplace',
    buttonLabel: 'Find Sellers',
    price: 'Best Prices',
  ),
  _Slide(
    title: 'Smart Notifications',
    subtitle: 'STAY UPDATED ALWAYS',
    description: 'Real-time alerts for orders, payments, appointments and seller messages.',
    mainIcon: Icons.notifications_active_rounded,
    floatingIcons: [Icons.receipt_long_rounded, Icons.verified_rounded, Icons.campaign_rounded, Icons.medication_rounded],
    gradient: [Color(0xFF5C0A2D), Color(0xFF880E4F), Color(0xFFAD1457)],
    tag: 'Live Alerts',
    buttonLabel: 'View Notifications',
    price: 'Real-time',
  ),
  _Slide(
    title: 'Manage Your Profile',
    subtitle: 'EVERYTHING IN ONE PLACE',
    description: 'Manage addresses, orders, wishlist, wallet and health profile all in one screen.',
    mainIcon: Icons.person_rounded,
    floatingIcons: [Icons.location_on_rounded, Icons.favorite_rounded, Icons.account_balance_wallet_rounded, Icons.receipt_long_rounded],
    gradient: [Color(0xFF01335C), Color(0xFF0277BD), Color(0xFF0288D1)],
    tag: 'Your Account',
    buttonLabel: 'Edit Profile',
    price: 'Personalized',
  ),
  _Slide(
    title: 'Veesafe Wallet',
    subtitle: 'REFER, EARN & SAVE',
    description: 'Refer friends and earn reward points. Use wallet for instant cashback on orders.',
    mainIcon: Icons.account_balance_wallet_rounded,
    floatingIcons: [Icons.card_giftcard_rounded, Icons.currency_rupee_rounded, Icons.stars_rounded, Icons.percent_rounded],
    gradient: [Color(0xFF5C2000), Color(0xFFE65100), Color(0xFFBF360C)],
    tag: 'Earn Rewards',
    buttonLabel: 'View Wallet',
    price: 'Earn Points',
  ),
  _Slide(
    title: 'Old Age & Homecare',
    subtitle: 'CARE FOR YOUR LOVED ONES',
    description: 'Wheelchairs, walking sticks, nebulizers — everything for comfortable home healthcare.',
    mainIcon: Icons.elderly_rounded,
    floatingIcons: [Icons.wheelchair_pickup_rounded, Icons.accessibility_new_rounded, Icons.air_rounded, Icons.healing_rounded],
    gradient: [Color(0xFF00272A), Color(0xFF006064), Color(0xFF00838F)],
    tag: 'Homecare',
    buttonLabel: 'Shop Homecare',
    price: 'From Rs.499',
  ),
];

class StoryScreen extends StatefulWidget {
  final VoidCallback? onFinish;
  const StoryScreen({super.key, this.onFinish});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _progressCtrl;
  int  _current = 0;
  bool _paused  = false;
  bool _liked   = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _progressCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) _next();
      });
    _start();
  }

  void _start() { _progressCtrl.reset(); if (!_paused) _progressCtrl.forward(); }

  void _next() {
    if (_current < _slides.length - 1) {
      setState(() { _current++; _liked = false; });
      _start();
    } else {
      _progressCtrl.stop();
      widget.onFinish?.call();
    }
  }

  void _prev() {
    if (_current > 0) {
      setState(() { _current--; _liked = false; });
      _start();
    } else {
      _progressCtrl.stop();
      widget.onFinish?.call();
    }
  }

  @override
  void dispose() {
    _progressCtrl.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final slide = _slides[_current];
    final size  = MediaQuery.of(context).size;

    return GestureDetector(
      onTapDown: (_) { _paused = true; _progressCtrl.stop(); },
      onTapUp: (d) {
        _paused = false;
        if (d.globalPosition.dx < size.width / 2) {
          _prev();
        } else {
          _next();
        }
      },
      onLongPressStart: (_) { setState(() => _paused = true); _progressCtrl.stop(); },
      onLongPressEnd:   (_) { setState(() => _paused = false); _progressCtrl.forward(); },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: slide.gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // ── Background circles ──
            Positioned(top: -60, right: -60,
              child: Container(width: 260, height: 260,
                decoration: BoxDecoration(shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.04)))),
            Positioned(bottom: 160, left: -80,
              child: Container(width: 220, height: 220,
                decoration: BoxDecoration(shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.04)))),

            // ── Floating icons ──
            ..._buildFloating(slide, size),

            // ── Main content ──
            SafeArea(
              child: Column(
                children: [
                  _buildProgressBars(),
                  const SizedBox(height: 10),
                  _buildHeader(),
                  const Spacer(),
                  _buildCenterIcon(slide),
                  const Spacer(),
                  _buildBottom(slide),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Progress bars ──
  Widget _buildProgressBars() => Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
        child: Row(
          children: List.generate(_slides.length, (i) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  height: 2.5,
                  child: i < _current
                      ? Container(color: Colors.white)
                      : i == _current
                          ? AnimatedBuilder(
                              animation: _progressCtrl,
                              builder: (_, _) => LinearProgressIndicator(
                                value: _progressCtrl.value,
                                backgroundColor: Colors.white.withOpacity(0.25),
                                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : Container(color: Colors.white.withOpacity(0.25)),
                ),
              ),
            ),
          )),
        ),
      );

  // ── Header ──
  Widget _buildHeader() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            // Veesafe logo circle
            Container(
              width: 36, height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.15),
                border: Border.all(color: Colors.white.withOpacity(0.4)),
              ),
              child: const Icon(Icons.health_and_safety_rounded,
                  color: Colors.white, size: 18),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Veesafe',
                    style: TextStyle(color: Colors.white, fontSize: 13,
                        fontWeight: FontWeight.w800)),
                const Text('Sponsored',
                    style: TextStyle(color: Colors.white60, fontSize: 10)),
              ],
            ),
            const Spacer(),
            // ── Like button ──
            GestureDetector(
              onTap: () => setState(() => _liked = !_liked),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 36, height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _liked
                      ? const Color(0xFFE11D48).withOpacity(0.2)
                      : Colors.black.withOpacity(0.25),
                  border: Border.all(
                    color: _liked
                        ? const Color(0xFFE11D48)
                        : Colors.white.withOpacity(0.2),
                  ),
                ),
                child: Icon(
                  _liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                  color: _liked ? const Color(0xFFE11D48) : Colors.white,
                  size: 17,
                ),
              ),
            ),
            const SizedBox(width: 8),
            // ── Share button ──
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 36, height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.25),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: const Icon(Icons.send_rounded,
                    color: Colors.white, size: 17),
              ),
            ),
            const SizedBox(width: 8),
            // ── More button ──
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 36, height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.25),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: const Icon(Icons.more_vert_rounded,
                    color: Colors.white, size: 17),
              ),
            ),
          ],
        ),
      );

  // ── Center icon ──
  Widget _buildCenterIcon(_Slide slide) => TweenAnimationBuilder<double>(
        key: ValueKey(_current),
        tween: Tween(begin: 0.5, end: 1.0),
        duration: const Duration(milliseconds: 600),
        curve: Curves.elasticOut,
        builder: (_, scale, _) => Transform.scale(
          scale: scale,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(width: 200, height: 200,
                  decoration: BoxDecoration(shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.05))),
              Container(width: 165, height: 165,
                  decoration: BoxDecoration(shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.08),
                      border: Border.all(color: Colors.white.withOpacity(0.12), width: 1.5))),
              Container(width: 125, height: 125,
                  decoration: BoxDecoration(shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.13),
                      border: Border.all(color: Colors.white.withOpacity(0.35), width: 2),
                      boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.08),
                          blurRadius: 30, spreadRadius: 5)]),
                  child: Icon(slide.mainIcon, size: 58, color: Colors.white)),
            ],
          ),
        ),
      );

  // ── Floating icons ──
  List<Widget> _buildFloating(_Slide slide, Size size) {
    final positions = [[0.06, 0.14], [0.76, 0.10], [0.82, 0.40], [0.04, 0.56]];
    return List.generate(slide.floatingIcons.length, (i) => Positioned(
      left:  size.width  * (positions[i][0]),
      top:   size.height * (positions[i][1]),
      child: Opacity(opacity: 0.12,
          child: Icon(slide.floatingIcons[i], size: 44, color: Colors.white)),
    ));
  }

  // ── Bottom ──
  Widget _buildBottom(_Slide slide) => Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Seller row (like your screenshot) ──
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.add_circle_rounded,
                          color: Colors.white, size: 13),
                      const SizedBox(width: 5),
                      const Text('Veesafe',
                          style: TextStyle(color: Colors.white,
                              fontSize: 12, fontWeight: FontWeight.w600)),
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 1),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text('Sponsored',
                            style: TextStyle(color: Colors.white70,
                                fontSize: 9, fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Tag
            Text(slide.tag,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 10.5,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.8)),
            const SizedBox(height: 4),

            // Title
            Text(slide.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    height: 1.2)),
            const SizedBox(height: 6),

            // Description
            Text(slide.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12.5,
                    height: 1.5)),
            const SizedBox(height: 14),

            // ── Buy Now button (like screenshot) ──
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10, offset: const Offset(0, 3))],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(slide.buttonLabel,
                        style: TextStyle(
                            color: slide.gradient[1],
                            fontSize: 14,
                            fontWeight: FontWeight.w800)),
                    const SizedBox(width: 8),
                    Icon(Icons.arrow_forward_ios_rounded,
                        color: slide.gradient[1], size: 14),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            // ── Product name at bottom (like screenshot) ──
            Text(slide.subtitle,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.55),
                    fontSize: 11,
                    letterSpacing: 0.5)),

            const SizedBox(height: 6),

            // ── Dot indicators ──
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_slides.length, (i) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 2.5),
                width:  i == _current ? 18 : 5,
                height: 5,
                decoration: BoxDecoration(
                  color: i == _current
                      ? Colors.white
                      : Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(3),
                ),
              )),
            ),
          ],
        ),
      );
}