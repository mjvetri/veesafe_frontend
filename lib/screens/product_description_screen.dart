// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'write_review_screen.dart';
// import 'all_reviews_screen.dart';
// import 'checkout_payment_screen.dart';

// class ProductDescriptionScreen extends StatefulWidget {
//   const ProductDescriptionScreen({super.key});

//   @override
//   State<ProductDescriptionScreen> createState() =>
//       _ProductDescriptionScreenState();
// }

// class _ProductDescriptionScreenState extends State<ProductDescriptionScreen>
//     with SingleTickerProviderStateMixin {
//   int _selectedImageIndex = 0;
//   int _quantity = 1;
//   int _selectedTab = 0;
//   bool _couponExpanded = false;

//   static const Color kNavy     = Color(0xFF1A2B5E);
//   static const Color kTeal     = Color(0xFF2BB5A0);
//   static const Color kLightBg  = Color(0xFFF4F7FB);
//   static const Color kCardBg   = Colors.white;
//   static const Color kTextDark = Color(0xFF1A2340);
//   static const Color kTextGrey = Color(0xFF8A94A6);
//   static const Color kRed      = Color(0xFFE53E3E);
//   static const Color kGreen    = Color(0xFF2E7D32);
//   static const Color kOrange   = Color(0xFFF59E0B);

//   static const String _productTitle =
//       "Livesay Wellness Scrubs - Men and Women's wear - Complete soft fabric";
//   static const String _price     = '\$2,604.00';
//   static const String _origPrice = '\$3,800.00';
//   static const String _discount  = '47% OFF';
//   static const String _rating    = '4.2';
//   static const String _reviews   = '347';

//   final List<Map<String, dynamic>> _productViews = [
//     {
//       'image': 'assets/image4.png',
//       'alignment': Alignment.center,
//       'label': 'Front',
//       'icon': Icons.person_outlined,
//       'flipX': false,
//     },
//     {
//       'image': 'assets/image4.png',
//       'alignment': Alignment.centerRight,
//       'label': 'Side',
//       'icon': Icons.person_outlined,
//       'flipX': true,
//     },
//     {
//       'image': 'assets/image4.png',
//       'alignment': Alignment.topCenter,
//       'label': 'Top',
//       'icon': Icons.person_outlined,
//       'flipX': false,
//     },
//     {
//       'image': 'assets/image4.png',
//       'alignment': Alignment.bottomCenter,
//       'label': 'Back',
//       'icon': Icons.person_outlined,
//       'flipX': true,
//     },
//   ];

//   final List<Map<String, dynamic>> _highlights = [
//     {'icon': Icons.water_drop_outlined,           'label': 'No Coding\nRequired'},
//     {'icon': Icons.hourglass_empty,               'label': '5 Second\nResult'},
//     {'icon': Icons.memory_outlined,               'label': '500 Memory\nStorage'},
//     {'icon': Icons.battery_charging_full_outlined,'label': 'Auto\nOff'},
//     {'icon': Icons.wifi,                          'label': 'Bluetooth\nSync'},
//     {'icon': Icons.verified,                      'label': 'CE & FDA\nApproved'},
//   ];

//   final List<Map<String, dynamic>> _offers = [
//     {'code': 'HEALTH10', 'desc': '10% off on orders above \$1,000',
//      'icon': Icons.local_offer_outlined, 'badge': '10% OFF'},
//     {'code': 'SAVE5', 'desc': '5% cashback on first order',
//      'icon': Icons.savings_outlined, 'badge': '5% BACK'},
//     {'code': 'FREESHIP', 'desc': 'Free shipping on orders above \$500',
//      'icon': Icons.local_shipping_outlined, 'badge': 'FREE'},
//   ];

//   final List<Map<String, dynamic>> _similarProducts = [
//     {
//       'name': 'Dr Trust Silver\nGlucometer',
//       'price': '\$1,804.00',
//       'origPrice': '\$2,200.00',
//       'rating': '4.0',
//       'tag': 'NEW',
//       'icon': Icons.monitor_heart_outlined,
//       'image': 'assets/images/image3.png',
//     },
//     {
//       'name': 'Accu-Chek Active\nGlucometer',
//       'price': '\$2,104.00',
//       'origPrice': '\$2,800.00',
//       'rating': '4.3',
//       'tag': 'HOT',
//       'icon': Icons.medical_services_outlined,
//       'image': 'assets/images/image.jpg',
//     },
//     {
//       'name': 'OneTouch Select\nSimple Meter',
//       'price': '\$1,504.00',
//       'origPrice': '\$2,000.00',
//       'rating': '4.1',
//       'tag': 'NEW',
//       'icon': Icons.biotech,
//       'image': 'assets/images/image3.png',
//     },
//     {
//       'name': 'Contour Plus\nOne Meter',
//       'price': '\$2,304.00',
//       'origPrice': '\$3,100.00',
//       'rating': '4.5',
//       'tag': 'TOP',
//       'icon': Icons.favorite_border,
//       'image': 'assets/images/image.jpg',
//     },
//   ];

//   final List<Map<String, dynamic>> _frequentProducts = [
//     {
//       'name': 'BP Monitor\nAutomatic',
//       'price': '\$2,504.00',
//       'origPrice': '\$3,000.00',
//       'rating': '4.5',
//       'tag': 'TOP',
//       'icon': Icons.favorite,
//       'image': 'assets/images/image3.png',
//     },
//     {
//       'name': 'Pulse Oximeter\nFingertip',
//       'price': '\$804.00',
//       'origPrice': '\$1,200.00',
//       'rating': '4.2',
//       'tag': 'NEW',
//       'icon': Icons.air,
//       'image': 'assets/images/image.jpg',
//     },
//     {
//       'name': 'Digital\nThermometer',
//       'price': '\$304.00',
//       'origPrice': '\$500.00',
//       'rating': '4.4',
//       'tag': 'HOT',
//       'icon': Icons.thermostat_outlined,
//       'image': 'assets/images/image3.png',
//     },
//     {
//       'name': 'Nebulizer\nMachine',
//       'price': '\$3,204.00',
//       'origPrice': '\$4,500.00',
//       'rating': '4.6',
//       'tag': 'TOP',
//       'icon': Icons.air,
//       'image': 'assets/images/image.jpg',
//     },
//   ];

//   final List<Map<String, dynamic>> _reviewsList = [
//     {
//       'name': 'Rekha',
//       'rating': 5,
//       'date': '12 Jan 2025',
//       'comment': 'We can get you with your medical needs. Our team of experts is here to make sure you get the best quality products.',
//       'helpful': 24,
//     },
//     {
//       'name': 'Rekha',
//       'rating': 4,
//       'date': '05 Feb 2025',
//       'comment': 'We can get you with your medical needs. Our team of experts is here to make sure you get the best quality products.',
//       'helpful': 18,
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final double sw = MediaQuery.of(context).size.width;
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarIconBrightness: Brightness.light,
//     ));
//     return Scaffold(
//       backgroundColor: kLightBg,
//       body: Column(
//         children: [
//           _buildHeader(context, sw),
//           Expanded(
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildHeroImage(sw),
//                   _buildProductInfoCard(sw),
//                   SizedBox(height: sw * 0.03),
//                   _buildTabSection(sw),
//                   SizedBox(height: sw * 0.03),
//                   _buildOffersSection(sw),
//                   SizedBox(height: sw * 0.03),
//                   _buildShippingBadges(sw),
//                   SizedBox(height: sw * 0.03),
//                   _buildSimilarProducts(sw),
//                   SizedBox(height: sw * 0.03),
//                   _buildFrequentlyBought(sw),
//                   SizedBox(height: sw * 0.03),
//                   _buildManufacturerCard(sw),
//                   SizedBox(height: sw * 0.1),
//                 ],
//               ),
//             ),
//           ),
//           _buildStickyBottom(context, sw),
//         ],
//       ),
//     );
//   }

//   // ═══════ HEADER ═══════
//   Widget _buildHeader(BuildContext context, double sw) {
//     return Container(
//       decoration: const BoxDecoration(color: kNavy),
//       child: SafeArea(
//         bottom: false,
//         child: Padding(
//           padding: EdgeInsets.fromLTRB(sw * 0.04, sw * 0.02, sw * 0.04, sw * 0.03),
//           child: Row(
//             children: [
//               _hdrBtn(Icons.chevron_left_rounded, sw, onTap: () => Navigator.pop(context)),
//               Expanded(
//                 child: Text('Product Description',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.white, fontSize: sw * 0.043, fontWeight: FontWeight.w700)),
//               ),
//               _hdrBtn(Icons.search_rounded, sw, onTap: () {}),
//               SizedBox(width: sw * 0.02),
//               _hdrBtn(Icons.shopping_bag_outlined, sw, onTap: () {}),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _hdrBtn(IconData icon, double sw, {VoidCallback? onTap}) => GestureDetector(
//         onTap: onTap,
//         child: Container(
//           width: sw * 0.088, height: sw * 0.088,
//           decoration: BoxDecoration(
//             color: Colors.white.withValues(alpha: 0.15),
//             borderRadius: BorderRadius.circular(sw * 0.022),
//             border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
//           ),
//           child: Icon(icon, color: Colors.white, size: sw * 0.046),
//         ),
//       );

//   // ═══════ HERO IMAGE ═══════
//   Widget _buildHeroImage(double sw) {
//     final currentView = _productViews[_selectedImageIndex];
//     final bool flipX = currentView['flipX'] == true;
//     final Alignment alignment = currentView['alignment'] as Alignment;

//     return Stack(
//       children: [
//         Container(
//           height: sw * 0.72,
//           width: double.infinity,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [Color(0xFF1A2B5E), Color(0xFF2BB5A0)],
//             ),
//           ),
//           child: Stack(
//             children: [
//               Positioned.fill(child: CustomPaint(painter: _DotPatternPainter())),
//               Positioned.fill(
//                 child: ClipRect(
//                   child: AnimatedSwitcher(
//                     duration: const Duration(milliseconds: 300),
//                     child: Transform(
//                       key: ValueKey(_selectedImageIndex),
//                       alignment: Alignment.center,
//                       transform: flipX
//                           ? (Matrix4.identity()..scale(-1.0, 1.0, 1.0))
//                           : Matrix4.identity(),
//                       child: Image.asset(
//                         currentView['image'] as String,
//                         fit: BoxFit.contain,
//                         alignment: alignment,
//                         errorBuilder: (_, _, _) => Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(Icons.person_rounded,
//                                   color: Colors.white.withOpacity(0.7),
//                                   size: sw * 0.28),
//                               SizedBox(height: sw * 0.02),
//                               Text(currentView['label'] as String,
//                                   style: TextStyle(
//                                       color: Colors.white.withOpacity(0.6),
//                                       fontSize: sw * 0.032,
//                                       fontWeight: FontWeight.w600)),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: sw * 0.03,
//                 right: sw * 0.04,
//                 child: AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 250),
//                   child: Container(
//                     key: ValueKey(_selectedImageIndex),
//                     padding: EdgeInsets.symmetric(
//                         horizontal: sw * 0.025, vertical: sw * 0.008),
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.4),
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(color: Colors.white.withOpacity(0.3)),
//                     ),
//                     child: Text(currentView['label'] as String,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: sw * 0.026,
//                             fontWeight: FontWeight.w700,
//                             letterSpacing: 0.5)),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: sw * 0.03,
//                 left: 0,
//                 right: 0,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: List.generate(_productViews.length, (i) {
//                     final sel = _selectedImageIndex == i;
//                     final view = _productViews[i];
//                     final bool tFlip = view['flipX'] == true;
//                     final Alignment tAlign = view['alignment'] as Alignment;

//                     return GestureDetector(
//                       onTap: () => setState(() => _selectedImageIndex = i),
//                       child: AnimatedContainer(
//                         duration: const Duration(milliseconds: 200),
//                         margin: EdgeInsets.symmetric(horizontal: sw * 0.012),
//                         width: sw * 0.16,
//                         height: sw * 0.16,
//                         decoration: BoxDecoration(
//                           color: sel ? Colors.white : Colors.white.withValues(alpha: 0.15),
//                           borderRadius: BorderRadius.circular(12),
//                           border: Border.all(
//                             color: sel ? kTeal : Colors.white.withValues(alpha: 0.4),
//                             width: sel ? 2.5 : 1,
//                           ),
//                           boxShadow: sel
//                               ? [BoxShadow(color: kTeal.withOpacity(0.4), blurRadius: 8, spreadRadius: 1)]
//                               : [],
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Stack(
//                             children: [
//                               Positioned.fill(
//                                 child: Transform(
//                                   alignment: Alignment.center,
//                                   transform: tFlip
//                                       ? (Matrix4.identity()..scale(-1.0, 1.0, 1.0))
//                                       : Matrix4.identity(),
//                                   child: Image.asset(
//                                     view['image'] as String,
//                                     fit: BoxFit.cover,
//                                     alignment: tAlign,
//                                     errorBuilder: (_, _, _) => Container(
//                                       color: sel
//                                           ? kNavy.withOpacity(0.08)
//                                           : Colors.white.withOpacity(0.08),
//                                       child: Center(
//                                         child: Icon(view['icon'] as IconData,
//                                             color: sel ? kNavy : Colors.white,
//                                             size: sw * 0.05),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 0, left: 0, right: 0,
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(vertical: sw * 0.008),
//                                   decoration: BoxDecoration(
//                                     color: sel
//                                         ? kNavy.withOpacity(0.75)
//                                         : Colors.black.withOpacity(0.45),
//                                     borderRadius: const BorderRadius.only(
//                                       bottomLeft: Radius.circular(10),
//                                       bottomRight: Radius.circular(10),
//                                     ),
//                                   ),
//                                   child: Text(view['label'] as String,
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: sw * 0.02,
//                                           fontWeight: FontWeight.w700)),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Positioned(
//           top: sw * 0.03,
//           left: sw * 0.04,
//           child: _chip('On Sale', kRed),
//         ),
//       ],
//     );
//   }

//   // ═══════ PRODUCT INFO ═══════
//   Widget _buildProductInfoCard(double sw) {
//     return Container(
//       color: kCardBg,
//       padding: EdgeInsets.fromLTRB(sw * 0.04, sw * 0.04, sw * 0.04, sw * 0.03),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: sw * 0.025, vertical: sw * 0.008),
//                 decoration: BoxDecoration(
//                   color: kTeal.withValues(alpha: 0.12),
//                   borderRadius: BorderRadius.circular(6),
//                   border: Border.all(color: kTeal.withValues(alpha: 0.3)),
//                 ),
//                 child: Text('Dr Trust USA',
//                     style: TextStyle(fontSize: sw * 0.028, color: kTeal, fontWeight: FontWeight.w700)),
//               ),
//               const Spacer(),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: sw * 0.02, vertical: sw * 0.008),
//                 decoration: BoxDecoration(color: kGreen, borderRadius: BorderRadius.circular(6)),
//                 child: Row(mainAxisSize: MainAxisSize.min, children: [
//                   Text(_rating,
//                       style: TextStyle(color: Colors.white, fontSize: sw * 0.03, fontWeight: FontWeight.w700)),
//                   SizedBox(width: sw * 0.008),
//                   Icon(Icons.star_rounded, color: Colors.white, size: sw * 0.032),
//                 ]),
//               ),
//               SizedBox(width: sw * 0.015),
//               Text('($_reviews Ratings)',
//                   style: TextStyle(fontSize: sw * 0.028, color: kTextGrey)),
//             ],
//           ),
//           SizedBox(height: sw * 0.02),
//           Text(_productTitle,
//               style: TextStyle(
//                   fontSize: sw * 0.04,
//                   fontWeight: FontWeight.w700,
//                   color: kTextDark,
//                   height: 1.35)),
//           SizedBox(height: sw * 0.015),
//           Row(children: [
//             Icon(Icons.store_outlined, color: kTeal, size: sw * 0.035),
//             SizedBox(width: sw * 0.01),
//             Text('Visit SOLAND store',
//                 style: TextStyle(color: kTeal, fontSize: sw * 0.029, fontWeight: FontWeight.w600)),
//           ]),
//           SizedBox(height: sw * 0.02),
//           Row(
//             children: [
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: sw * 0.02, vertical: sw * 0.006),
//                 decoration: BoxDecoration(
//                     color: kGreen.withValues(alpha: 0.1),
//                     borderRadius: BorderRadius.circular(6)),
//                 child: Text('In Stock',
//                     style: TextStyle(
//                         color: kGreen, fontSize: sw * 0.026, fontWeight: FontWeight.w700)),
//               ),
//               const Spacer(),
//               Container(
//                 decoration: BoxDecoration(color: kNavy, borderRadius: BorderRadius.circular(8)),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         if (_quantity > 1) setState(() => _quantity--);
//                       },
//                       child: Padding(
//                           padding: EdgeInsets.all(sw * 0.02),
//                           child: Icon(Icons.remove, color: Colors.white, size: sw * 0.038)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: sw * 0.025),
//                       child: Text('$_quantity',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: sw * 0.034,
//                               fontWeight: FontWeight.w700)),
//                     ),
//                     GestureDetector(
//                       onTap: () => setState(() => _quantity++),
//                       child: Padding(
//                           padding: EdgeInsets.all(sw * 0.02),
//                           child: Icon(Icons.add, color: Colors.white, size: sw * 0.038)),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: sw * 0.022),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(_price,
//                   style: TextStyle(
//                       fontSize: sw * 0.052,
//                       fontWeight: FontWeight.w800,
//                       color: kNavy)),
//               SizedBox(width: sw * 0.02),
//               Padding(
//                 padding: EdgeInsets.only(bottom: sw * 0.005),
//                 child: Text(_origPrice,
//                     style: TextStyle(
//                         fontSize: sw * 0.03,
//                         color: kTextGrey,
//                         decoration: TextDecoration.lineThrough)),
//               ),
//               const Spacer(),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: sw * 0.022, vertical: sw * 0.008),
//                 decoration: BoxDecoration(
//                   color: kRed.withValues(alpha: 0.1),
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: kRed.withValues(alpha: 0.3)),
//                 ),
//                 child: Text(_discount,
//                     style: TextStyle(
//                         color: kRed, fontSize: sw * 0.028, fontWeight: FontWeight.w800)),
//               ),
//             ],
//           ),
//           SizedBox(height: sw * 0.028),
//           Row(
//             children: [
//               Expanded(
//                   child: _actionBtn('Add to Cart', kNavy, sw,
//                       icon: Icons.shopping_cart_outlined, onTap: () {})),
//               SizedBox(width: sw * 0.025),
//               Expanded(
//                   child: _actionBtn('Buy Now', kTeal, sw,
//                       icon: Icons.flash_on_rounded,
//                       onTap: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (_) => const CheckoutPaymentScreen()));
//                       })),
//             ],
//           ),
//           SizedBox(height: sw * 0.015),
//           SizedBox(
//             width: double.infinity,
//             child: OutlinedButton.icon(
//               onPressed: () {},
//               icon: Icon(Icons.mail_outline_rounded, size: sw * 0.04, color: kNavy),
//               label: Text('Bulk Enquiry',
//                   style: TextStyle(
//                       color: kNavy, fontSize: sw * 0.034, fontWeight: FontWeight.w700)),
//               style: OutlinedButton.styleFrom(
//                 side: BorderSide(color: kNavy, width: 1.5),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 padding: EdgeInsets.symmetric(vertical: sw * 0.028),
//               ),
//             ),
//           ),
//           SizedBox(height: sw * 0.025),
//           _buildCouponRow(sw),
//         ],
//       ),
//     );
//   }

//   Widget _actionBtn(String label, Color color, double sw,
//       {IconData? icon, VoidCallback? onTap}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: sw * 0.032),
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//                 color: color.withValues(alpha: 0.35),
//                 blurRadius: 8,
//                 offset: const Offset(0, 3))
//           ],
//         ),
//         child: Center(
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               if (icon != null) ...[
//                 Icon(icon, color: Colors.white, size: sw * 0.04),
//                 SizedBox(width: sw * 0.012)
//               ],
//               Text(label,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: sw * 0.033,
//                       fontWeight: FontWeight.w700)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCouponRow(double sw) {
//     return GestureDetector(
//       onTap: () => setState(() => _couponExpanded = !_couponExpanded),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: sw * 0.04, vertical: sw * 0.03),
//         decoration: BoxDecoration(
//           color: kLightBg,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: kTeal.withValues(alpha: 0.3)),
//         ),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.local_offer_outlined, color: kTeal, size: sw * 0.042),
//                 SizedBox(width: sw * 0.025),
//                 Expanded(
//                     child: Text('Apply Coupons',
//                         style: TextStyle(
//                             fontSize: sw * 0.033,
//                             fontWeight: FontWeight.w700,
//                             color: kTextDark))),
//                 Icon(
//                     _couponExpanded
//                         ? Icons.keyboard_arrow_up_rounded
//                         : Icons.keyboard_arrow_right_rounded,
//                     color: kTeal,
//                     size: sw * 0.05),
//               ],
//             ),
//             if (_couponExpanded) ...[
//               SizedBox(height: sw * 0.02),
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Enter coupon code',
//                         hintStyle: TextStyle(color: kTextGrey, fontSize: sw * 0.032),
//                         filled: true,
//                         fillColor: Colors.white,
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: BorderSide.none),
//                         contentPadding: EdgeInsets.symmetric(
//                             horizontal: sw * 0.03, vertical: sw * 0.025),
//                         isDense: true,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: sw * 0.02),
//                   Container(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: sw * 0.04, vertical: sw * 0.028),
//                     decoration:
//                         BoxDecoration(color: kTeal, borderRadius: BorderRadius.circular(8)),
//                     child: Text('Apply',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: sw * 0.03,
//                             fontWeight: FontWeight.w700)),
//                   ),
//                 ],
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   // ═══════ THREE TABS ═══════
//   Widget _buildTabSection(double sw) {
//     final tabs = ['Description', 'Details', 'Reviews'];
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: sw * 0.04),
//       decoration: BoxDecoration(
//         color: kCardBg,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withValues(alpha: 0.06),
//               blurRadius: 12,
//               offset: const Offset(0, 4))
//         ],
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.fromLTRB(sw * 0.04, sw * 0.03, sw * 0.04, 0),
//             child: Row(
//               children: List.generate(tabs.length, (i) {
//                 final selected = _selectedTab == i;
//                 return GestureDetector(
//                   onTap: () => setState(() => _selectedTab = i),
//                   child: Container(
//                     margin: EdgeInsets.only(right: sw * 0.04),
//                     padding: EdgeInsets.only(bottom: sw * 0.02),
//                     decoration: BoxDecoration(
//                       border: Border(
//                           bottom: BorderSide(
//                               color: selected ? kNavy : Colors.transparent, width: 2.5)),
//                     ),
//                     child: Text(tabs[i],
//                         style: TextStyle(
//                           fontSize: sw * 0.034,
//                           fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
//                           color: selected ? kNavy : kTextGrey,
//                         )),
//                   ),
//                 );
//               }),
//             ),
//           ),
//           Divider(height: 1, color: Colors.grey.shade100),
//           Padding(
//             padding: EdgeInsets.all(sw * 0.04),
//             child: _buildTabContent(sw),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTabContent(double sw) {
//     switch (_selectedTab) {
//       case 0:
//         return _buildDescriptionTab(sw);
//       case 1:
//         return _buildDetailsTab(sw);
//       case 2:
//         return _buildReviewsTab(sw);
//       default:
//         return _buildDescriptionTab(sw);
//     }
//   }

//   Widget _buildDescriptionTab(double sw) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Health and wellness is our priority!',
//             style: TextStyle(
//                 fontSize: sw * 0.035, fontWeight: FontWeight.w700, color: kTextDark)),
//         SizedBox(height: sw * 0.015),
//         Text(
//           'We are glad to help you with your medical needs. Our team of experts is here to make sure you get the best quality products and services at affordable prices. Veesafe is here to help you with your medical needs.',
//           style: TextStyle(fontSize: sw * 0.031, color: kTextGrey, height: 1.65),
//         ),
//         SizedBox(height: sw * 0.02),
//         ...([
//           'No coding technology for ease of use',
//           'Results in just 5 seconds with 99% accuracy',
//           'Stores up to 500 readings with date and time',
//           'Includes 25 test strips in the pack',
//           'Bluetooth sync to mobile health apps',
//           'CE & FDA certified for medical use',
//         ].map((p) => Padding(
//               padding: EdgeInsets.only(bottom: sw * 0.014),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(top: sw * 0.007),
//                     width: sw * 0.015,
//                     height: sw * 0.015,
//                     decoration: const BoxDecoration(color: kTeal, shape: BoxShape.circle),
//                   ),
//                   SizedBox(width: sw * 0.02),
//                   Expanded(
//                       child: Text(p,
//                           style:
//                               TextStyle(fontSize: sw * 0.03, color: kTextDark, height: 1.4))),
//                 ],
//               ),
//             ))),
//         SizedBox(height: sw * 0.025),
//         _sectionHeader('Key Highlights', sw),
//         SizedBox(height: sw * 0.02),
//         GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             mainAxisSpacing: sw * 0.02,
//             crossAxisSpacing: sw * 0.02,
//             childAspectRatio: 1.0,
//           ),
//           itemCount: _highlights.length,
//           itemBuilder: (_, i) {
//             final h = _highlights[i];
//             return Container(
//               decoration: BoxDecoration(
//                 color: kNavy.withValues(alpha: 0.04),
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: kNavy.withValues(alpha: 0.08)),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: sw * 0.1,
//                     height: sw * 0.1,
//                     decoration: BoxDecoration(
//                         color: kTeal.withValues(alpha: 0.12), shape: BoxShape.circle),
//                     child: Icon(h['icon'] as IconData, color: kTeal, size: sw * 0.05),
//                   ),
//                   SizedBox(height: sw * 0.012),
//                   Text(h['label'] as String,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontSize: sw * 0.022,
//                           fontWeight: FontWeight.w600,
//                           color: kTextDark,
//                           height: 1.3)),
//                 ],
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildDetailsTab(double sw) {
//     final details = [
//       {'label': 'Material Composition', 'value': 'Cotton'},
//       {'label': 'Pattern', 'value': 'Solid'},
//       {'label': 'Collar', 'value': 'Round'},
//       {'label': 'Item Height', 'value': '501 g'},
//       {'label': 'Preload', 'value': 'Some'},
//       {'label': 'Fabric', 'value': 'Cotton'},
//     ];
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ...details.map((d) => Column(
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       width: sw * 0.38,
//                       child: Text(d['label']!,
//                           style: TextStyle(
//                               fontSize: sw * 0.031,
//                               color: kTextGrey,
//                               fontWeight: FontWeight.w500)),
//                     ),
//                     Text(':  ',
//                         style: TextStyle(fontSize: sw * 0.031, color: kTextGrey)),
//                     Expanded(
//                       child: Text(d['value']!,
//                           style: TextStyle(
//                               fontSize: sw * 0.031,
//                               color: kTextDark,
//                               fontWeight: FontWeight.w600)),
//                     ),
//                   ],
//                 ),
//                 Divider(height: sw * 0.05, color: Colors.grey.shade100),
//               ],
//             )),
//         SizedBox(height: sw * 0.02),
//         _sectionHeader('Shipping & Returns', sw),
//         SizedBox(height: sw * 0.02),
//         _infoRow(Icons.local_shipping_outlined, 'Free Cash on Delivery available', sw),
//         SizedBox(height: sw * 0.014),
//         _infoRow(Icons.calendar_today_outlined,
//             'Delivery on January 31; use prime to get delivery within 24hours', sw),
//         SizedBox(height: sw * 0.014),
//         _infoRow(Icons.replay, '7 Days Replacement Policy', sw),
//         SizedBox(height: sw * 0.025),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _benefitBadge(Icons.assignment_return_outlined, 'Returns\nLite', sw),
//             _benefitBadge(Icons.local_shipping_outlined, 'Free\nDelivery', sw),
//             _benefitBadge(Icons.verified_outlined, 'Veesafe\nDelivery', sw),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildReviewsTab(double sw) {
//     final bars = [
//       {'stars': 5, 'pct': 0.68},
//       {'stars': 4, 'pct': 0.18},
//       {'stars': 3, 'pct': 0.08},
//       {'stars': 2, 'pct': 0.04},
//       {'stars': 1, 'pct': 0.02},
//     ];
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Column(
//               children: [
//                 Text(_rating,
//                     style: TextStyle(
//                         fontSize: sw * 0.1,
//                         fontWeight: FontWeight.w900,
//                         color: kNavy,
//                         height: 1)),
//                 Row(
//                   children: List.generate(
//                       5,
//                       (i) => Icon(
//                             i < 4 ? Icons.star_rounded : Icons.star_half_rounded,
//                             color: kOrange,
//                             size: sw * 0.03)),
//                 ),
//                 SizedBox(height: sw * 0.005),
//                 Text('$_reviews ratings',
//                     style: TextStyle(fontSize: sw * 0.024, color: kTextGrey)),
//               ],
//             ),
//             SizedBox(width: sw * 0.04),
//             Expanded(
//               child: Column(
//                 children: bars.map((b) {
//                   final pct = b['pct'] as double;
//                   final stars = b['stars'] as int;
//                   return Padding(
//                     padding: EdgeInsets.only(bottom: sw * 0.01),
//                     child: Row(
//                       children: [
//                         Text('$stars',
//                             style: TextStyle(fontSize: sw * 0.026, color: kTextGrey)),
//                         Icon(Icons.star_rounded, color: kOrange, size: sw * 0.026),
//                         SizedBox(width: sw * 0.012),
//                         Expanded(
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(4),
//                             child: LinearProgressIndicator(
//                               value: pct,
//                               backgroundColor: const Color(0xFFE8EDF5),
//                               color: stars >= 4
//                                   ? kGreen
//                                   : stars == 3
//                                       ? kOrange
//                                       : kRed,
//                               minHeight: sw * 0.016,
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: sw * 0.012),
//                         SizedBox(
//                           width: sw * 0.06,
//                           child: Text('${(pct * 100).toInt()}%',
//                               style: TextStyle(fontSize: sw * 0.024, color: kTextGrey),
//                               textAlign: TextAlign.right),
//                         ),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: sw * 0.025),
//         SizedBox(
//           width: double.infinity,
//           child: OutlinedButton.icon(
//             onPressed: () => Navigator.push(context,
//                 MaterialPageRoute(builder: (_) => const WriteReviewScreen())),
//             icon: Icon(Icons.edit_outlined, color: kNavy, size: sw * 0.038),
//             label: Text('Write a review',
//                 style: TextStyle(
//                     color: kNavy, fontSize: sw * 0.032, fontWeight: FontWeight.w600)),
//             style: OutlinedButton.styleFrom(
//               side: BorderSide(color: kNavy, width: 1.5),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//               padding: EdgeInsets.symmetric(vertical: sw * 0.025),
//             ),
//           ),
//         ),
//         SizedBox(height: sw * 0.025),
//         Text('What others think\nabout the product',
//             style: TextStyle(
//                 fontSize: sw * 0.034,
//                 fontWeight: FontWeight.w700,
//                 color: kTextDark,
//                 height: 1.35)),
//         SizedBox(height: sw * 0.015),
//         Text('Topics and reviews',
//             style: TextStyle(
//                 fontSize: sw * 0.028, color: kTextGrey, fontWeight: FontWeight.w500)),
//         SizedBox(height: sw * 0.015),
//         Wrap(
//           spacing: sw * 0.02,
//           runSpacing: sw * 0.012,
//           children: ['Comfort', 'Quality', 'Value', 'Fit']
//               .map((t) => Container(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: sw * 0.025, vertical: sw * 0.012),
//                     decoration: BoxDecoration(
//                       color: kNavy.withValues(alpha: 0.07),
//                       borderRadius: BorderRadius.circular(20),
//                       border: Border.all(color: kNavy.withValues(alpha: 0.2)),
//                     ),
//                     child: Text(t,
//                         style: TextStyle(
//                             fontSize: sw * 0.026,
//                             color: kNavy,
//                             fontWeight: FontWeight.w600)),
//                   ))
//               .toList(),
//         ),
//         SizedBox(height: sw * 0.025),
//         _sectionHeader('All Reviews', sw),
//         SizedBox(height: sw * 0.02),
//         ..._reviewsList.map((r) => _buildReviewCard(r, sw)),
//         SizedBox(height: sw * 0.015),
//         Center(
//           child: OutlinedButton(
//             onPressed: () => Navigator.push(context,
//                 MaterialPageRoute(builder: (_) => const AllReviewsScreen())),
//             style: OutlinedButton.styleFrom(
//               side: BorderSide(color: kNavy, width: 1.5),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//               padding: EdgeInsets.symmetric(
//                   horizontal: sw * 0.08, vertical: sw * 0.025),
//             ),
//             child: Text('See all Reviews',
//                 style: TextStyle(
//                     color: kNavy, fontSize: sw * 0.032, fontWeight: FontWeight.w600)),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildReviewCard(Map<String, dynamic> review, double sw) {
//     final int rating = review['rating'] as int;
//     return Container(
//       margin: EdgeInsets.only(bottom: sw * 0.025),
//       padding: EdgeInsets.all(sw * 0.035),
//       decoration: BoxDecoration(
//         color: kLightBg,
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(color: Colors.grey.shade100),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               CircleAvatar(
//                 radius: sw * 0.045,
//                 backgroundColor: kNavy.withValues(alpha: 0.12),
//                 child: Text((review['name'] as String)[0],
//                     style: TextStyle(
//                         color: kNavy, fontSize: sw * 0.035, fontWeight: FontWeight.w700)),
//               ),
//               SizedBox(width: sw * 0.025),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(review['name'] as String,
//                         style: TextStyle(
//                             fontSize: sw * 0.032,
//                             fontWeight: FontWeight.w700,
//                             color: kTextDark)),
//                     Text(review['date'] as String,
//                         style: TextStyle(fontSize: sw * 0.026, color: kTextGrey)),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: sw * 0.018, vertical: sw * 0.006),
//                 decoration:
//                     BoxDecoration(color: kGreen, borderRadius: BorderRadius.circular(6)),
//                 child: Row(children: [
//                   Text('$rating',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: sw * 0.028,
//                           fontWeight: FontWeight.w700)),
//                   SizedBox(width: sw * 0.005),
//                   Icon(Icons.star_rounded, color: Colors.white, size: sw * 0.028),
//                 ]),
//               ),
//             ],
//           ),
//           SizedBox(height: sw * 0.018),
//           Text(review['comment'] as String,
//               style: TextStyle(fontSize: sw * 0.029, color: kTextGrey, height: 1.55)),
//           SizedBox(height: sw * 0.015),
//           Row(
//             children: [
//               Icon(Icons.thumb_up_outlined, size: sw * 0.035, color: kTextGrey),
//               SizedBox(width: sw * 0.01),
//               Text('${review['helpful']} found helpful',
//                   style: TextStyle(fontSize: sw * 0.026, color: kTextGrey)),
//               const Spacer(),
//               GestureDetector(
//                 onTap: () {},
//                 child: Text('Reply',
//                     style: TextStyle(
//                         fontSize: sw * 0.028,
//                         color: kTeal,
//                         fontWeight: FontWeight.w600)),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ═══════ OFFERS ═══════
//   Widget _buildOffersSection(double sw) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: sw * 0.04),
//       decoration: BoxDecoration(
//         color: kCardBg,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withValues(alpha: 0.06),
//               blurRadius: 12,
//               offset: const Offset(0, 4))
//         ],
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(sw * 0.04),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _sectionHeader('Offers', sw),
//             SizedBox(height: sw * 0.02),
//             ..._offers.map((offer) => Container(
//                   margin: EdgeInsets.only(bottom: sw * 0.018),
//                   padding: EdgeInsets.all(sw * 0.03),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF0FBF8),
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: kTeal.withValues(alpha: 0.25)),
//                   ),
//                   child: Row(
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(sw * 0.018),
//                         decoration: BoxDecoration(
//                             color: kTeal.withValues(alpha: 0.15),
//                             borderRadius: BorderRadius.circular(8)),
//                         child:
//                             Icon(offer['icon'] as IconData, color: kTeal, size: sw * 0.038),
//                       ),
//                       SizedBox(width: sw * 0.02),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(offer['desc'] as String,
//                                 style: TextStyle(
//                                     fontSize: sw * 0.029,
//                                     color: kTextDark,
//                                     fontWeight: FontWeight.w500)),
//                             SizedBox(height: sw * 0.006),
//                             Container(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: sw * 0.015, vertical: sw * 0.004),
//                               decoration: BoxDecoration(
//                                   color: kNavy, borderRadius: BorderRadius.circular(4)),
//                               child: Text(offer['code'] as String,
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: sw * 0.022,
//                                       fontWeight: FontWeight.w800,
//                                       letterSpacing: 0.5)),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: sw * 0.018, vertical: sw * 0.008),
//                         decoration: BoxDecoration(
//                             color: kTeal, borderRadius: BorderRadius.circular(6)),
//                         child: Text(offer['badge'] as String,
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: sw * 0.022,
//                                 fontWeight: FontWeight.w800)),
//                       ),
//                     ],
//                   ),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }

//   // ═══════ SHIPPING BADGES ═══════
//   Widget _buildShippingBadges(double sw) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: sw * 0.04),
//       padding: EdgeInsets.all(sw * 0.035),
//       decoration: BoxDecoration(
//         color: kCardBg,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withValues(alpha: 0.05),
//               blurRadius: 10,
//               offset: const Offset(0, 3))
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _benefitBadge(Icons.assignment_return_outlined, 'Returns\nLite', sw),
//           _benefitBadge(Icons.local_shipping_outlined, 'Free\nDelivery', sw),
//           _benefitBadge(Icons.verified_outlined, 'Veesafe\nDelivery', sw),
//         ],
//       ),
//     );
//   }

//   // ═══════ SIMILAR PRODUCTS ═══════
//   Widget _buildSimilarProducts(double sw) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(child: _sectionHeader('Similar Products', sw)),
//               TextButton(
//                   onPressed: () {},
//                   child: Text('View all',
//                       style: TextStyle(
//                           color: kTeal, fontSize: sw * 0.03, fontWeight: FontWeight.w600))),
//             ],
//           ),
//         ),
//         SizedBox(height: sw * 0.012),
//         SizedBox(
//           height: sw * 0.58,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             physics: const BouncingScrollPhysics(),
//             padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
//             itemCount: _similarProducts.length,
//             itemBuilder: (_, i) => _buildProductCard(_similarProducts[i], sw),
//           ),
//         ),
//       ],
//     );
//   }

//   // ═══ GestureDetector added — click பண்ணா ProductDescriptionScreen open ஆகும் ═══
//   Widget _buildProductCard(Map<String, dynamic> product, double sw) {
//     final double cw = sw * 0.44;
//     return GestureDetector(
//       onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(builder: (_) => const ProductDescriptionScreen()),
//       ),
//       child: Container(
//         width: cw,
//         margin: EdgeInsets.only(right: sw * 0.03),
//         decoration: BoxDecoration(
//           color: kCardBg,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.black.withValues(alpha: 0.07),
//                 blurRadius: 12,
//                 offset: const Offset(0, 4))
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(16), topRight: Radius.circular(16)),
//               child: Container(
//                 height: sw * 0.28,
//                 width: cw,
//                 decoration: const BoxDecoration(
//                     gradient:
//                         LinearGradient(colors: [Color(0xFFEBEFF8), Color(0xFFD4E4F7)])),
//                 child: Stack(
//                   children: [
//                     Positioned.fill(
//                       child: Image.asset(
//                         product['image'] as String,
//                         fit: BoxFit.contain,
//                         errorBuilder: (_, _, _) => Center(
//                           child: Icon(product['icon'] as IconData,
//                               color: kNavy.withValues(alpha: 0.3), size: sw * 0.1),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: sw * 0.018,
//                       left: sw * 0.018,
//                       child: _chip(
//                         product['tag'] as String,
//                         product['tag'] == 'HOT'
//                             ? kRed
//                             : product['tag'] == 'TOP'
//                                 ? kOrange
//                                 : kNavy,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(sw * 0.025),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(product['name'] as String,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                           fontSize: sw * 0.027,
//                           fontWeight: FontWeight.w600,
//                           color: kTextDark,
//                           height: 1.3)),
//                   SizedBox(height: sw * 0.008),
//                   Row(children: [
//                     Icon(Icons.star_rounded, color: kOrange, size: sw * 0.028),
//                     SizedBox(width: sw * 0.005),
//                     Text(product['rating'] as String,
//                         style: TextStyle(
//                             fontSize: sw * 0.025,
//                             fontWeight: FontWeight.w700,
//                             color: kTextDark)),
//                   ]),
//                   SizedBox(height: sw * 0.008),
//                   Text(product['price'] as String,
//                       style: TextStyle(
//                           fontSize: sw * 0.03,
//                           fontWeight: FontWeight.w800,
//                           color: kNavy)),
//                   Text(product['origPrice'] as String,
//                       style: TextStyle(
//                           fontSize: sw * 0.024,
//                           color: kTextGrey,
//                           decoration: TextDecoration.lineThrough)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ═══════ FREQUENTLY BOUGHT ═══════
//   Widget _buildFrequentlyBought(double sw) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(child: _sectionHeader('Frequently bought Products', sw)),
//               TextButton(
//                   onPressed: () {},
//                   child: Text('View all 7',
//                       style: TextStyle(
//                           color: kTeal, fontSize: sw * 0.03, fontWeight: FontWeight.w600))),
//             ],
//           ),
//           SizedBox(height: sw * 0.015),
//           GridView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: sw * 0.025,
//                 crossAxisSpacing: sw * 0.025,
//                 childAspectRatio: 0.82),
//             itemCount: _frequentProducts.length,
//             itemBuilder: (_, i) => _buildGridCard(_frequentProducts[i], sw),
//           ),
//         ],
//       ),
//     );
//   }

//   // ═══ GestureDetector added — click பண்ணா ProductDescriptionScreen open ஆகும் ═══
//   Widget _buildGridCard(Map<String, dynamic> product, double sw) {
//     return GestureDetector(
//       onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(builder: (_) => const ProductDescriptionScreen()),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           color: kCardBg,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.black.withValues(alpha: 0.07),
//                 blurRadius: 10,
//                 offset: const Offset(0, 4))
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(16), topRight: Radius.circular(16)),
//               child: Container(
//                 height: sw * 0.3,
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                     gradient:
//                         LinearGradient(colors: [Color(0xFFEBEFF8), Color(0xFFD4E4F7)])),
//                 child: Stack(
//                   children: [
//                     Positioned.fill(
//                       child: Image.asset(
//                         product['image'] as String,
//                         fit: BoxFit.contain,
//                         errorBuilder: (_, _, _) => Center(
//                           child: Icon(product['icon'] as IconData,
//                               color: kNavy.withValues(alpha: 0.3), size: sw * 0.1),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: sw * 0.012,
//                       left: sw * 0.012,
//                       child: _chip(
//                         product['tag'] as String,
//                         product['tag'] == 'HOT'
//                             ? kRed
//                             : product['tag'] == 'TOP'
//                                 ? kOrange
//                                 : kNavy,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(sw * 0.022),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(product['name'] as String,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                           fontSize: sw * 0.026,
//                           fontWeight: FontWeight.w600,
//                           color: kTextDark,
//                           height: 1.3)),
//                   SizedBox(height: sw * 0.007),
//                   Row(children: [
//                     Icon(Icons.star_rounded, color: kOrange, size: sw * 0.026),
//                     SizedBox(width: sw * 0.005),
//                     Text(product['rating'] as String,
//                         style: TextStyle(
//                             fontSize: sw * 0.024,
//                             fontWeight: FontWeight.w700,
//                             color: kTextDark)),
//                   ]),
//                   SizedBox(height: sw * 0.007),
//                   Text(product['price'] as String,
//                       style: TextStyle(
//                           fontSize: sw * 0.028,
//                           fontWeight: FontWeight.w800,
//                           color: kNavy)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ═══════ MANUFACTURER ═══════
//   Widget _buildManufacturerCard(double sw) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: sw * 0.04),
//       padding: EdgeInsets.all(sw * 0.04),
//       decoration: BoxDecoration(
//         color: kCardBg,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withValues(alpha: 0.06),
//               blurRadius: 12,
//               offset: const Offset(0, 4))
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _sectionHeader('Manufacturer / Market address', sw),
//           SizedBox(height: sw * 0.02),
//           _infoRow(Icons.business_outlined, 'Sheetal Healthcare Pvt. Ltd.', sw),
//           SizedBox(height: sw * 0.014),
//           _infoRow(Icons.location_on_outlined,
//               'Akshaya Nagar 1st Block, Rammurthy Nagar, Bangalore-560016', sw),
//           SizedBox(height: sw * 0.014),
//           _infoRow(Icons.phone_outlined, '+91 8802167892', sw),
//           SizedBox(height: sw * 0.014),
//           _infoRow(Icons.email_outlined, 'care@veesafe.com', sw),
//           const Divider(height: 32, color: Color(0xFFEDF0F7)),
//           Center(
//             child: Column(children: [
//               Text('Making healthcare',
//                   style: TextStyle(
//                       fontSize: sw * 0.034,
//                       fontWeight: FontWeight.w800,
//                       color: kNavy)),
//               Text('UNDERSTANDABLE, ACCESSIBLE & AFFORDABLE',
//                   style: TextStyle(
//                       fontSize: sw * 0.022,
//                       fontWeight: FontWeight.w600,
//                       color: kTeal,
//                       letterSpacing: 0.4)),
//               SizedBox(height: sw * 0.008),
//               Row(mainAxisSize: MainAxisSize.min, children: [
//                 Text('Made with ',
//                     style: TextStyle(fontSize: sw * 0.026, color: kTextGrey)),
//                 Icon(Icons.favorite, color: kRed, size: sw * 0.028),
//                 Text(' by vaseefa',
//                     style: TextStyle(
//                         fontSize: sw * 0.026,
//                         fontWeight: FontWeight.w700,
//                         color: kNavy)),
//               ]),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }

//   // ═══════ STICKY BOTTOM ═══════
//   Widget _buildStickyBottom(BuildContext context, double sw) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withValues(alpha: 0.1),
//               blurRadius: 16,
//               offset: const Offset(0, -4))
//         ],
//       ),
//       child: SafeArea(
//         top: false,
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: sw * 0.04, vertical: sw * 0.022),
//           child: Row(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text('Total Price',
//                       style: TextStyle(fontSize: sw * 0.025, color: kTextGrey)),
//                   Text(_price,
//                       style: TextStyle(
//                           fontSize: sw * 0.042,
//                           fontWeight: FontWeight.w900,
//                           color: kNavy)),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ═══════ HELPERS ═══════
//   Widget _sectionHeader(String title, double sw) => Row(
//         children: [
//           Container(
//               width: sw * 0.012,
//               height: sw * 0.045,
//               decoration: BoxDecoration(
//                   color: kTeal, borderRadius: BorderRadius.circular(3))),
//           SizedBox(width: sw * 0.018),
//           Flexible(
//               fit: FlexFit.loose,
//               child: Text(title,
//                   style: TextStyle(
//                       fontSize: sw * 0.034,
//                       fontWeight: FontWeight.w700,
//                       color: kTextDark))),
//         ],
//       );

//   Widget _chip(String label, Color color) => Container(
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//         decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
//         child: Text(label,
//             style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 10,
//                 fontWeight: FontWeight.w800,
//                 letterSpacing: 0.5)),
//       );

//   Widget _infoRow(IconData icon, String text, double sw) => Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: sw * 0.08,
//             height: sw * 0.08,
//             decoration: BoxDecoration(
//                 color: kTeal.withValues(alpha: 0.1),
//                 borderRadius: BorderRadius.circular(8)),
//             child: Icon(icon, color: kTeal, size: sw * 0.038),
//           ),
//           SizedBox(width: sw * 0.025),
//           Expanded(
//               child: Text(text,
//                   style:
//                       TextStyle(fontSize: sw * 0.029, color: kTextDark, height: 1.4))),
//         ],
//       );

//   Widget _benefitBadge(IconData icon, String label, double sw) => Column(
//         children: [
//           Container(
//             width: sw * 0.14,
//             height: sw * 0.14,
//             decoration: BoxDecoration(
//                 color: kLightBg,
//                 shape: BoxShape.circle,
//                 border: Border.all(color: kNavy.withValues(alpha: 0.1))),
//             child: Icon(icon, color: kNavy, size: sw * 0.065),
//           ),
//           SizedBox(height: sw * 0.012),
//           Text(label,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: sw * 0.024,
//                   fontWeight: FontWeight.w600,
//                   color: kTextDark,
//                   height: 1.3)),
//         ],
//       );
// }

// class _DotPatternPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white.withValues(alpha: 0.08)
//       ..style = PaintingStyle.fill;
//     const double spacing = 20;
//     for (double x = 0; x < size.width; x += spacing) {
//       for (double y = 0; y < size.height; y += spacing) {
//         canvas.drawCircle(Offset(x, y), 1.5, paint);
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }










import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'write_review_screen.dart';
import 'all_reviews_screen.dart';
import 'checkout_payment_screen.dart';
import 'cart_screen.dart';

class ProductDescriptionScreen extends StatefulWidget {
  // ── Product data parameters ──
  final String? productTitle;
  final String? price;
  final String? origPrice;
  final String? discount;
  final String? rating;
  final String? reviews;
  final String? brand;
  final String? imagePath;
  final String? tag;

  const ProductDescriptionScreen({
    super.key,
    this.productTitle,
    this.price,
    this.origPrice,
    this.discount,
    this.rating,
    this.reviews,
    this.brand,
    this.imagePath,
    this.tag,
  });

  @override
  State<ProductDescriptionScreen> createState() =>
      _ProductDescriptionScreenState();
}

class _ProductDescriptionScreenState extends State<ProductDescriptionScreen>
    with SingleTickerProviderStateMixin {
  int _selectedImageIndex = 0;
  int _quantity = 1;
  int _selectedTab = 0;
  bool _couponExpanded = false;

  static const Color kNavy     = Color(0xFF1A2B5E);
  static const Color kTeal     = Color(0xFF2BB5A0);
  static const Color kLightBg  = Color(0xFFF4F7FB);
  static const Color kCardBg   = Colors.white;
  static const Color kTextDark = Color(0xFF1A2340);
  static const Color kTextGrey = Color(0xFF8A94A6);
  static const Color kRed      = Color(0xFFE53E3E);
  static const Color kGreen    = Color(0xFF2E7D32);
  static const Color kOrange   = Color(0xFFF59E0B);

  // ── Use passed data or fallback defaults ──
  String get _productTitle =>
      widget.productTitle ??
      "Livesay Wellness Scrubs - Men and Women's wear - Complete soft fabric";
  String get _price     => widget.price     ?? '\$2,604.00';
  String get _origPrice => widget.origPrice ?? '\$3,800.00';
  String get _discount  => widget.discount  ?? '47% OFF';
  String get _rating    => widget.rating    ?? '4.2';
  String get _reviews   => widget.reviews   ?? '347';
  String get _brand     => widget.brand     ?? 'Dr Trust USA';
  String get _imagePath => widget.imagePath ?? 'assets/image4.png';

  List<Map<String, dynamic>> get _productViews => [
    {'image': _imagePath, 'alignment': Alignment.center,       'label': 'Front', 'icon': Icons.image_outlined, 'flipX': false},
    {'image': _imagePath, 'alignment': Alignment.centerRight,  'label': 'Side',  'icon': Icons.image_outlined, 'flipX': true},
    {'image': _imagePath, 'alignment': Alignment.topCenter,    'label': 'Top',   'icon': Icons.image_outlined, 'flipX': false},
    {'image': _imagePath, 'alignment': Alignment.bottomCenter, 'label': 'Back',  'icon': Icons.image_outlined, 'flipX': true},
  ];

  final List<Map<String, dynamic>> _highlights = [
    {'icon': Icons.water_drop_outlined,           'label': 'No Coding\nRequired'},
    {'icon': Icons.hourglass_empty,               'label': '5 Second\nResult'},
    {'icon': Icons.memory_outlined,               'label': '500 Memory\nStorage'},
    {'icon': Icons.battery_charging_full_outlined,'label': 'Auto\nOff'},
    {'icon': Icons.wifi,                          'label': 'Bluetooth\nSync'},
    {'icon': Icons.verified,                      'label': 'CE & FDA\nApproved'},
  ];

  final List<Map<String, dynamic>> _offers = [
    {'code': 'HEALTH10', 'desc': '10% off on orders above \$1,000', 'icon': Icons.local_offer_outlined, 'badge': '10% OFF'},
    {'code': 'SAVE5',    'desc': '5% cashback on first order',       'icon': Icons.savings_outlined,     'badge': '5% BACK'},
    {'code': 'FREESHIP', 'desc': 'Free shipping on orders above \$500','icon': Icons.local_shipping_outlined,'badge': 'FREE'},
  ];

  final List<Map<String, dynamic>> _similarProducts = [
    {'name': 'Dr Trust Silver\nGlucometer', 'price': '\$1,804.00', 'origPrice': '\$2,200.00', 'rating': '4.0', 'tag': 'NEW', 'icon': Icons.monitor_heart_outlined, 'image': 'assets/images/image3.png'},
    {'name': 'Accu-Chek Active\nGlucometer', 'price': '\$2,104.00', 'origPrice': '\$2,800.00', 'rating': '4.3', 'tag': 'HOT', 'icon': Icons.medical_services_outlined, 'image': 'assets/images/image.jpg'},
    {'name': 'OneTouch Select\nSimple Meter', 'price': '\$1,504.00', 'origPrice': '\$2,000.00', 'rating': '4.1', 'tag': 'NEW', 'icon': Icons.biotech, 'image': 'assets/images/image3.png'},
    {'name': 'Contour Plus\nOne Meter', 'price': '\$2,304.00', 'origPrice': '\$3,100.00', 'rating': '4.5', 'tag': 'TOP', 'icon': Icons.favorite_border, 'image': 'assets/images/image.jpg'},
  ];

  final List<Map<String, dynamic>> _frequentProducts = [
    {'name': 'BP Monitor\nAutomatic', 'price': '\$2,504.00', 'origPrice': '\$3,000.00', 'rating': '4.5', 'tag': 'TOP', 'icon': Icons.favorite, 'image': 'assets/images/image3.png'},
    {'name': 'Pulse Oximeter\nFingertip', 'price': '\$804.00', 'origPrice': '\$1,200.00', 'rating': '4.2', 'tag': 'NEW', 'icon': Icons.air, 'image': 'assets/images/image.jpg'},
    {'name': 'Digital\nThermometer', 'price': '\$304.00', 'origPrice': '\$500.00', 'rating': '4.4', 'tag': 'HOT', 'icon': Icons.thermostat_outlined, 'image': 'assets/images/image3.png'},
    {'name': 'Nebulizer\nMachine', 'price': '\$3,204.00', 'origPrice': '\$4,500.00', 'rating': '4.6', 'tag': 'TOP', 'icon': Icons.air, 'image': 'assets/images/image.jpg'},
  ];

  final List<Map<String, dynamic>> _reviewsList = [
    {'name': 'Rekha', 'rating': 5, 'date': '12 Jan 2025', 'comment': 'We can get you with your medical needs. Our team of experts is here to make sure you get the best quality products.', 'helpful': 24},
    {'name': 'Rekha', 'rating': 4, 'date': '05 Feb 2025', 'comment': 'We can get you with your medical needs. Our team of experts is here to make sure you get the best quality products.', 'helpful': 18},
  ];

  // ── Add to cart → CartScreen-க்கு navigate ──
  void _addToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CartScreen(
          productTitle: _productTitle,
          price:        _price,
          origPrice:    _origPrice,
          discount:     _discount,
          rating:       _rating,
          brand:        _brand,
          imagePath:    _imagePath,
          tag:          widget.tag ?? 'NEW',
          quantity:     _quantity,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: kLightBg,
      // ── FIX 1: _buildStickyBottom நீக்கப்பட்டது ──
      body: Column(
        children: [
          _buildHeader(context, sw),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeroImage(sw),
                  _buildProductInfoCard(sw),
                  SizedBox(height: sw * 0.03),
                  _buildTabSection(sw),
                  SizedBox(height: sw * 0.03),
                  _buildOffersSection(sw),
                  SizedBox(height: sw * 0.03),
                  _buildShippingBadges(sw),
                  SizedBox(height: sw * 0.03),
                  _buildSimilarProducts(sw),
                  SizedBox(height: sw * 0.03),
                  _buildFrequentlyBought(sw),
                  SizedBox(height: sw * 0.03),
                  _buildManufacturerCard(sw),
                  SizedBox(height: sw * 0.03), // FIX 1: 0.1 → 0.03 (sticky bar இல்லாததால்)
                ],
              ),
            ),
          ),
          // ── FIX 1: _buildStickyBottom() அழைப்பு நீக்கப்பட்டது ──
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, double sw) {
    return Container(
      decoration: const BoxDecoration(color: kNavy),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(sw * 0.04, sw * 0.02, sw * 0.04, sw * 0.03),
          child: Row(
            children: [
              _hdrBtn(Icons.chevron_left_rounded, sw, onTap: () => Navigator.pop(context)),
              Expanded(child: Text('Product Description', textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: sw * 0.043, fontWeight: FontWeight.w700))),
              SizedBox(width: sw * 0.088), // back button balance-க்கு spacing
            ],
          ),
        ),
      ),
    );
  }

  Widget _hdrBtn(IconData icon, double sw, {VoidCallback? onTap}) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: sw * 0.088, height: sw * 0.088,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(sw * 0.022),
            border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          ),
          child: Icon(icon, color: Colors.white, size: sw * 0.046),
        ),
      );

  Widget _buildHeroImage(double sw) {
    final currentView = _productViews[_selectedImageIndex];
    final bool flipX = currentView['flipX'] == true;
    final Alignment alignment = currentView['alignment'] as Alignment;

    return Stack(
      children: [
        Container(
          height: sw * 0.48, width: double.infinity,
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRect(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Transform(
                      key: ValueKey(_selectedImageIndex),
                      alignment: Alignment.center,
                      transform: flipX ? (Matrix4.identity()..scale(-1.0, 1.0, 1.0)) : Matrix4.identity(),
                      child: Image.asset(currentView['image'] as String, fit: BoxFit.contain, alignment: alignment,
                          errorBuilder: (_, __, ___) => Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Icon(Icons.image_outlined, color: kNavy.withOpacity(0.4), size: sw * 0.2),
                            SizedBox(height: sw * 0.02),
                            Text(currentView['label'] as String,
                                style: TextStyle(color: kNavy.withOpacity(0.5), fontSize: sw * 0.032, fontWeight: FontWeight.w600)),
                          ]))),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: sw * 0.03, right: sw * 0.04,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Container(
                    key: ValueKey(_selectedImageIndex),
                    padding: EdgeInsets.symmetric(horizontal: sw * 0.025, vertical: sw * 0.008),
                    decoration: BoxDecoration(color: kNavy.withOpacity(0.6), borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: kNavy.withOpacity(0.2))),
                    child: Text(currentView['label'] as String,
                        style: TextStyle(color: Colors.white, fontSize: sw * 0.026, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
                  ),
                ),
              ),
              Positioned(
                bottom: sw * 0.03, left: 0, right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_productViews.length, (i) {
                    final sel = _selectedImageIndex == i;
                    final view = _productViews[i];
                    final bool tFlip = view['flipX'] == true;
                    final Alignment tAlign = view['alignment'] as Alignment;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedImageIndex = i),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: EdgeInsets.symmetric(horizontal: sw * 0.012),
                        width: sw * 0.14, height: sw * 0.14,
                        decoration: BoxDecoration(
                          color: sel ? Colors.white : Colors.white.withValues(alpha: 0.80),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: sel ? kTeal : kNavy.withValues(alpha: 0.2), width: sel ? 2.5 : 1),
                          boxShadow: sel ? [BoxShadow(color: kTeal.withOpacity(0.4), blurRadius: 8, spreadRadius: 1)] : [],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(children: [
                            Positioned.fill(
                              child: Transform(
                                alignment: Alignment.center,
                                transform: tFlip ? (Matrix4.identity()..scale(-1.0, 1.0, 1.0)) : Matrix4.identity(),
                                child: Image.asset(view['image'] as String, fit: BoxFit.cover, alignment: tAlign,
                                    errorBuilder: (_, __, ___) => Container(
                                      color: sel ? kNavy.withOpacity(0.08) : Colors.grey.withOpacity(0.08),
                                      child: Center(child: Icon(view['icon'] as IconData, color: sel ? kNavy : kTextGrey, size: sw * 0.05)),
                                    )),
                              ),
                            ),
                            Positioned(bottom: 0, left: 0, right: 0,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: sw * 0.008),
                                decoration: BoxDecoration(
                                  color: sel ? kNavy.withOpacity(0.75) : Colors.black.withOpacity(0.35),
                                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                ),
                                child: Text(view['label'] as String, textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white, fontSize: sw * 0.02, fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
        Positioned(top: sw * 0.03, left: sw * 0.04, child: _chip(widget.tag ?? 'On Sale', kRed)),
      ],
    );
  }

  Widget _buildProductInfoCard(double sw) {
    return Container(
      color: kCardBg,
      padding: EdgeInsets.fromLTRB(sw * 0.04, sw * 0.04, sw * 0.04, sw * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.025, vertical: sw * 0.008),
                decoration: BoxDecoration(color: kTeal.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(6), border: Border.all(color: kTeal.withValues(alpha: 0.3))),
                child: Text(_brand, style: TextStyle(fontSize: sw * 0.028, color: kTeal, fontWeight: FontWeight.w700)),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.02, vertical: sw * 0.008),
                decoration: BoxDecoration(color: kGreen, borderRadius: BorderRadius.circular(6)),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(_rating, style: TextStyle(color: Colors.white, fontSize: sw * 0.03, fontWeight: FontWeight.w700)),
                  SizedBox(width: sw * 0.008),
                  Icon(Icons.star_rounded, color: Colors.white, size: sw * 0.032),
                ]),
              ),
              SizedBox(width: sw * 0.015),
              Text('($_reviews Ratings)', style: TextStyle(fontSize: sw * 0.028, color: kTextGrey)),
            ],
          ),
          SizedBox(height: sw * 0.02),
          Text(_productTitle, style: TextStyle(fontSize: sw * 0.04, fontWeight: FontWeight.w700, color: kTextDark, height: 1.35)),
          SizedBox(height: sw * 0.015),
          Row(children: [
            Icon(Icons.store_outlined, color: kTeal, size: sw * 0.035),
            SizedBox(width: sw * 0.01),
            Text('Visit SOLAND store', style: TextStyle(color: kTeal, fontSize: sw * 0.029, fontWeight: FontWeight.w600)),
          ]),
          SizedBox(height: sw * 0.02),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.02, vertical: sw * 0.006),
                decoration: BoxDecoration(color: kGreen.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(6)),
                child: Text('In Stock', style: TextStyle(color: kGreen, fontSize: sw * 0.026, fontWeight: FontWeight.w700)),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(color: kNavy, borderRadius: BorderRadius.circular(8)),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  GestureDetector(
                    onTap: () { if (_quantity > 1) setState(() => _quantity--); },
                    child: Padding(padding: EdgeInsets.all(sw * 0.02), child: Icon(Icons.remove, color: Colors.white, size: sw * 0.038)),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: sw * 0.025),
                      child: Text('$_quantity', style: TextStyle(color: Colors.white, fontSize: sw * 0.034, fontWeight: FontWeight.w700))),
                  GestureDetector(
                    onTap: () => setState(() => _quantity++),
                    child: Padding(padding: EdgeInsets.all(sw * 0.02), child: Icon(Icons.add, color: Colors.white, size: sw * 0.038)),
                  ),
                ]),
              ),
            ],
          ),
          SizedBox(height: sw * 0.022),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(_price, style: TextStyle(fontSize: sw * 0.052, fontWeight: FontWeight.w800, color: kNavy)),
              SizedBox(width: sw * 0.02),
              Padding(padding: EdgeInsets.only(bottom: sw * 0.005),
                  child: Text(_origPrice, style: TextStyle(fontSize: sw * 0.03, color: kTextGrey, decoration: TextDecoration.lineThrough))),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.022, vertical: sw * 0.008),
                decoration: BoxDecoration(color: kRed.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8), border: Border.all(color: kRed.withValues(alpha: 0.3))),
                child: Text(_discount, style: TextStyle(color: kRed, fontSize: sw * 0.028, fontWeight: FontWeight.w800)),
              ),
            ],
          ),
          SizedBox(height: sw * 0.028),
          // ── FIX 2: Add to Cart button → _addToCart() function ──
          Row(children: [
            Expanded(child: _actionBtn('Add to Cart', kNavy, sw, icon: Icons.shopping_cart_outlined, onTap: _addToCart)),
            SizedBox(width: sw * 0.025),
            Expanded(child: _actionBtn('Buy Now', kTeal, sw, icon: Icons.flash_on_rounded, onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const CheckoutPaymentScreen()));
            })),
          ]),
          SizedBox(height: sw * 0.015),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.mail_outline_rounded, size: sw * 0.04, color: kNavy),
              label: Text('Bulk Enquiry', style: TextStyle(color: kNavy, fontSize: sw * 0.034, fontWeight: FontWeight.w700)),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: kNavy, width: 1.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(vertical: sw * 0.028),
              ),
            ),
          ),
          SizedBox(height: sw * 0.025),
          _buildCouponRow(sw),
        ],
      ),
    );
  }

  Widget _actionBtn(String label, Color color, double sw, {IconData? icon, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: sw * 0.032),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: color.withValues(alpha: 0.35), blurRadius: 8, offset: const Offset(0, 3))]),
        child: Center(child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (icon != null) ...[Icon(icon, color: Colors.white, size: sw * 0.04), SizedBox(width: sw * 0.012)],
          Text(label, style: TextStyle(color: Colors.white, fontSize: sw * 0.033, fontWeight: FontWeight.w700)),
        ])),
      ),
    );
  }

  Widget _buildCouponRow(double sw) {
    return GestureDetector(
      onTap: () => setState(() => _couponExpanded = !_couponExpanded),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: sw * 0.04, vertical: sw * 0.03),
        decoration: BoxDecoration(color: kLightBg, borderRadius: BorderRadius.circular(12), border: Border.all(color: kTeal.withValues(alpha: 0.3))),
        child: Column(children: [
          Row(children: [
            Icon(Icons.local_offer_outlined, color: kTeal, size: sw * 0.042),
            SizedBox(width: sw * 0.025),
            Expanded(child: Text('Apply Coupons', style: TextStyle(fontSize: sw * 0.033, fontWeight: FontWeight.w700, color: kTextDark))),
            Icon(_couponExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_right_rounded, color: kTeal, size: sw * 0.05),
          ]),
          if (_couponExpanded) ...[
            SizedBox(height: sw * 0.02),
            Row(children: [
              Expanded(child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter coupon code',
                  hintStyle: TextStyle(color: kTextGrey, fontSize: sw * 0.032),
                  filled: true, fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.symmetric(horizontal: sw * 0.03, vertical: sw * 0.025),
                  isDense: true,
                ),
              )),
              SizedBox(width: sw * 0.02),
              Container(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.04, vertical: sw * 0.028),
                decoration: BoxDecoration(color: kTeal, borderRadius: BorderRadius.circular(8)),
                child: Text('Apply', style: TextStyle(color: Colors.white, fontSize: sw * 0.03, fontWeight: FontWeight.w700)),
              ),
            ]),
          ],
        ]),
      ),
    );
  }

  Widget _buildTabSection(double sw) {
    final tabs = ['Description', 'Details', 'Reviews'];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sw * 0.04),
      decoration: BoxDecoration(color: kCardBg, borderRadius: BorderRadius.circular(18),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 12, offset: const Offset(0, 4))]),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(sw * 0.04, sw * 0.03, sw * 0.04, 0),
          child: Row(children: List.generate(tabs.length, (i) {
            final selected = _selectedTab == i;
            return GestureDetector(
              onTap: () => setState(() => _selectedTab = i),
              child: Container(
                margin: EdgeInsets.only(right: sw * 0.04),
                padding: EdgeInsets.only(bottom: sw * 0.02),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: selected ? kNavy : Colors.transparent, width: 2.5))),
                child: Text(tabs[i], style: TextStyle(fontSize: sw * 0.034, fontWeight: selected ? FontWeight.w700 : FontWeight.w500, color: selected ? kNavy : kTextGrey)),
              ),
            );
          })),
        ),
        Divider(height: 1, color: Colors.grey.shade100),
        Padding(padding: EdgeInsets.all(sw * 0.04), child: _buildTabContent(sw)),
      ]),
    );
  }

  Widget _buildTabContent(double sw) {
    switch (_selectedTab) {
      case 0: return _buildDescriptionTab(sw);
      case 1: return _buildDetailsTab(sw);
      case 2: return _buildReviewsTab(sw);
      default: return _buildDescriptionTab(sw);
    }
  }

  Widget _buildDescriptionTab(double sw) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Health and wellness is our priority!', style: TextStyle(fontSize: sw * 0.035, fontWeight: FontWeight.w700, color: kTextDark)),
      SizedBox(height: sw * 0.015),
      Text('We are glad to help you with your medical needs. Our team of experts is here to make sure you get the best quality products and services at affordable prices.',
          style: TextStyle(fontSize: sw * 0.031, color: kTextGrey, height: 1.65)),
      SizedBox(height: sw * 0.02),
      ...(['No coding technology for ease of use', 'Results in just 5 seconds with 99% accuracy', 'Stores up to 500 readings with date and time', 'Includes 25 test strips in the pack', 'Bluetooth sync to mobile health apps', 'CE & FDA certified for medical use']
          .map((p) => Padding(padding: EdgeInsets.only(bottom: sw * 0.014), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(margin: EdgeInsets.only(top: sw * 0.007), width: sw * 0.015, height: sw * 0.015, decoration: const BoxDecoration(color: kTeal, shape: BoxShape.circle)),
            SizedBox(width: sw * 0.02),
            Expanded(child: Text(p, style: TextStyle(fontSize: sw * 0.03, color: kTextDark, height: 1.4))),
          ])))),
      SizedBox(height: sw * 0.025),
      _sectionHeader('Key Highlights', sw),
      SizedBox(height: sw * 0.02),
      GridView.builder(
        shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: sw * 0.02, crossAxisSpacing: sw * 0.02, childAspectRatio: 1.0),
        itemCount: _highlights.length,
        itemBuilder: (_, i) {
          final h = _highlights[i];
          return Container(
            decoration: BoxDecoration(color: kNavy.withValues(alpha: 0.04), borderRadius: BorderRadius.circular(12), border: Border.all(color: kNavy.withValues(alpha: 0.08))),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(width: sw * 0.1, height: sw * 0.1,
                  decoration: BoxDecoration(color: kTeal.withValues(alpha: 0.12), shape: BoxShape.circle),
                  child: Icon(h['icon'] as IconData, color: kTeal, size: sw * 0.05)),
              SizedBox(height: sw * 0.012),
              Text(h['label'] as String, textAlign: TextAlign.center, style: TextStyle(fontSize: sw * 0.022, fontWeight: FontWeight.w600, color: kTextDark, height: 1.3)),
            ]),
          );
        },
      ),
    ]);
  }

  Widget _buildDetailsTab(double sw) {
    final details = [
      {'label': 'Material Composition', 'value': 'Cotton'}, {'label': 'Pattern', 'value': 'Solid'},
      {'label': 'Collar', 'value': 'Round'}, {'label': 'Item Height', 'value': '501 g'},
      {'label': 'Preload', 'value': 'Some'}, {'label': 'Fabric', 'value': 'Cotton'},
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ...details.map((d) => Column(children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(width: sw * 0.38, child: Text(d['label']!, style: TextStyle(fontSize: sw * 0.031, color: kTextGrey, fontWeight: FontWeight.w500))),
          Text(':  ', style: TextStyle(fontSize: sw * 0.031, color: kTextGrey)),
          Expanded(child: Text(d['value']!, style: TextStyle(fontSize: sw * 0.031, color: kTextDark, fontWeight: FontWeight.w600))),
        ]),
        Divider(height: sw * 0.05, color: Colors.grey.shade100),
      ])),
      SizedBox(height: sw * 0.02),
      _sectionHeader('Shipping & Returns', sw),
      SizedBox(height: sw * 0.02),
      _infoRow(Icons.local_shipping_outlined, 'Free Cash on Delivery available', sw),
      SizedBox(height: sw * 0.014),
      _infoRow(Icons.calendar_today_outlined, 'Delivery on January 31; use prime to get delivery within 24hours', sw),
      SizedBox(height: sw * 0.014),
      _infoRow(Icons.replay, '7 Days Replacement Policy', sw),
      SizedBox(height: sw * 0.025),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _benefitBadge(Icons.assignment_return_outlined, 'Returns\nLite', sw),
        _benefitBadge(Icons.local_shipping_outlined, 'Free\nDelivery', sw),
        _benefitBadge(Icons.verified_outlined, 'Veesafe\nDelivery', sw),
      ]),
    ]);
  }

  Widget _buildReviewsTab(double sw) {
    final bars = [{'stars': 5, 'pct': 0.68}, {'stars': 4, 'pct': 0.18}, {'stars': 3, 'pct': 0.08}, {'stars': 2, 'pct': 0.04}, {'stars': 1, 'pct': 0.02}];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Column(children: [
          Text(_rating, style: TextStyle(fontSize: sw * 0.1, fontWeight: FontWeight.w900, color: kNavy, height: 1)),
          Row(children: List.generate(5, (i) => Icon(i < 4 ? Icons.star_rounded : Icons.star_half_rounded, color: kOrange, size: sw * 0.03))),
          SizedBox(height: sw * 0.005),
          Text('$_reviews ratings', style: TextStyle(fontSize: sw * 0.024, color: kTextGrey)),
        ]),
        SizedBox(width: sw * 0.04),
        Expanded(child: Column(children: bars.map((b) {
          final pct = b['pct'] as double;
          final stars = b['stars'] as int;
          return Padding(padding: EdgeInsets.only(bottom: sw * 0.01), child: Row(children: [
            Text('$stars', style: TextStyle(fontSize: sw * 0.026, color: kTextGrey)),
            Icon(Icons.star_rounded, color: kOrange, size: sw * 0.026),
            SizedBox(width: sw * 0.012),
            Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(value: pct, backgroundColor: const Color(0xFFE8EDF5), color: stars >= 4 ? kGreen : stars == 3 ? kOrange : kRed, minHeight: sw * 0.016))),
            SizedBox(width: sw * 0.012),
            SizedBox(width: sw * 0.06, child: Text('${(pct * 100).toInt()}%', style: TextStyle(fontSize: sw * 0.024, color: kTextGrey), textAlign: TextAlign.right)),
          ]));
        }).toList())),
      ]),
      SizedBox(height: sw * 0.025),
      SizedBox(width: double.infinity, child: OutlinedButton.icon(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WriteReviewScreen())),
        icon: Icon(Icons.edit_outlined, color: kNavy, size: sw * 0.038),
        label: Text('Write a review', style: TextStyle(color: kNavy, fontSize: sw * 0.032, fontWeight: FontWeight.w600)),
        style: OutlinedButton.styleFrom(side: BorderSide(color: kNavy, width: 1.5), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), padding: EdgeInsets.symmetric(vertical: sw * 0.025)),
      )),
      SizedBox(height: sw * 0.025),
      Text('What others think\nabout the product', style: TextStyle(fontSize: sw * 0.034, fontWeight: FontWeight.w700, color: kTextDark, height: 1.35)),
      SizedBox(height: sw * 0.015),
      Wrap(spacing: sw * 0.02, runSpacing: sw * 0.012,
          children: ['Comfort', 'Quality', 'Value', 'Fit'].map((t) => Container(
            padding: EdgeInsets.symmetric(horizontal: sw * 0.025, vertical: sw * 0.012),
            decoration: BoxDecoration(color: kNavy.withValues(alpha: 0.07), borderRadius: BorderRadius.circular(20), border: Border.all(color: kNavy.withValues(alpha: 0.2))),
            child: Text(t, style: TextStyle(fontSize: sw * 0.026, color: kNavy, fontWeight: FontWeight.w600)),
          )).toList()),
      SizedBox(height: sw * 0.025),
      _sectionHeader('All Reviews', sw),
      SizedBox(height: sw * 0.02),
      ..._reviewsList.map((r) => _buildReviewCard(r, sw)),
      SizedBox(height: sw * 0.015),
      Center(child: OutlinedButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AllReviewsScreen())),
        style: OutlinedButton.styleFrom(side: BorderSide(color: kNavy, width: 1.5), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), padding: EdgeInsets.symmetric(horizontal: sw * 0.08, vertical: sw * 0.025)),
        child: Text('See all Reviews', style: TextStyle(color: kNavy, fontSize: sw * 0.032, fontWeight: FontWeight.w600)),
      )),
    ]);
  }

  Widget _buildReviewCard(Map<String, dynamic> review, double sw) {
    final int rating = review['rating'] as int;
    return Container(
      margin: EdgeInsets.only(bottom: sw * 0.025),
      padding: EdgeInsets.all(sw * 0.035),
      decoration: BoxDecoration(color: kLightBg, borderRadius: BorderRadius.circular(14), border: Border.all(color: Colors.grey.shade100)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          CircleAvatar(radius: sw * 0.045, backgroundColor: kNavy.withValues(alpha: 0.12),
              child: Text((review['name'] as String)[0], style: TextStyle(color: kNavy, fontSize: sw * 0.035, fontWeight: FontWeight.w700))),
          SizedBox(width: sw * 0.025),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(review['name'] as String, style: TextStyle(fontSize: sw * 0.032, fontWeight: FontWeight.w700, color: kTextDark)),
            Text(review['date'] as String, style: TextStyle(fontSize: sw * 0.026, color: kTextGrey)),
          ])),
          Container(padding: EdgeInsets.symmetric(horizontal: sw * 0.018, vertical: sw * 0.006),
              decoration: BoxDecoration(color: kGreen, borderRadius: BorderRadius.circular(6)),
              child: Row(children: [
                Text('$rating', style: TextStyle(color: Colors.white, fontSize: sw * 0.028, fontWeight: FontWeight.w700)),
                SizedBox(width: sw * 0.005),
                Icon(Icons.star_rounded, color: Colors.white, size: sw * 0.028),
              ])),
        ]),
        SizedBox(height: sw * 0.018),
        Text(review['comment'] as String, style: TextStyle(fontSize: sw * 0.029, color: kTextGrey, height: 1.55)),
        SizedBox(height: sw * 0.015),
        Row(children: [
          Icon(Icons.thumb_up_outlined, size: sw * 0.035, color: kTextGrey),
          SizedBox(width: sw * 0.01),
          Text('${review['helpful']} found helpful', style: TextStyle(fontSize: sw * 0.026, color: kTextGrey)),
          const Spacer(),
          GestureDetector(onTap: () {}, child: Text('Reply', style: TextStyle(fontSize: sw * 0.028, color: kTeal, fontWeight: FontWeight.w600))),
        ]),
      ]),
    );
  }

  Widget _buildOffersSection(double sw) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sw * 0.04),
      decoration: BoxDecoration(color: kCardBg, borderRadius: BorderRadius.circular(18),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 12, offset: const Offset(0, 4))]),
      child: Padding(padding: EdgeInsets.all(sw * 0.04), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _sectionHeader('Offers', sw),
        SizedBox(height: sw * 0.02),
        ..._offers.map((offer) => Container(
          margin: EdgeInsets.only(bottom: sw * 0.018), padding: EdgeInsets.all(sw * 0.03),
          decoration: BoxDecoration(color: const Color(0xFFF0FBF8), borderRadius: BorderRadius.circular(12), border: Border.all(color: kTeal.withValues(alpha: 0.25))),
          child: Row(children: [
            Container(padding: EdgeInsets.all(sw * 0.018), decoration: BoxDecoration(color: kTeal.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                child: Icon(offer['icon'] as IconData, color: kTeal, size: sw * 0.038)),
            SizedBox(width: sw * 0.02),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(offer['desc'] as String, style: TextStyle(fontSize: sw * 0.029, color: kTextDark, fontWeight: FontWeight.w500)),
              SizedBox(height: sw * 0.006),
              Container(padding: EdgeInsets.symmetric(horizontal: sw * 0.015, vertical: sw * 0.004),
                  decoration: BoxDecoration(color: kNavy, borderRadius: BorderRadius.circular(4)),
                  child: Text(offer['code'] as String, style: TextStyle(color: Colors.white, fontSize: sw * 0.022, fontWeight: FontWeight.w800, letterSpacing: 0.5))),
            ])),
            Container(padding: EdgeInsets.symmetric(horizontal: sw * 0.018, vertical: sw * 0.008),
                decoration: BoxDecoration(color: kTeal, borderRadius: BorderRadius.circular(6)),
                child: Text(offer['badge'] as String, style: TextStyle(color: Colors.white, fontSize: sw * 0.022, fontWeight: FontWeight.w800))),
          ]),
        )),
      ])),
    );
  }

  Widget _buildShippingBadges(double sw) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sw * 0.04),
      padding: EdgeInsets.all(sw * 0.035),
      decoration: BoxDecoration(color: kCardBg, borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3))]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _benefitBadge(Icons.assignment_return_outlined, 'Returns\nLite', sw),
        _benefitBadge(Icons.local_shipping_outlined, 'Free\nDelivery', sw),
        _benefitBadge(Icons.verified_outlined, 'Veesafe\nDelivery', sw),
      ]),
    );
  }

  Widget _buildSimilarProducts(double sw) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: EdgeInsets.symmetric(horizontal: sw * 0.04), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(child: _sectionHeader('Similar Products', sw)),
        TextButton(onPressed: () {}, child: Text('View all', style: TextStyle(color: kTeal, fontSize: sw * 0.03, fontWeight: FontWeight.w600))),
      ])),
      SizedBox(height: sw * 0.012),
      SizedBox(height: sw * 0.58, child: ListView.builder(
        scrollDirection: Axis.horizontal, physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
        itemCount: _similarProducts.length,
        itemBuilder: (_, i) => _buildProductCard(_similarProducts[i], sw),
      )),
    ]);
  }

  Widget _buildProductCard(Map<String, dynamic> product, double sw) {
    final double cw = sw * 0.44;
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(
        builder: (_) => ProductDescriptionScreen(
          productTitle: product['name'] as String,
          price: product['price'] as String,
          origPrice: product['origPrice'] as String,
          rating: product['rating'] as String,
          tag: product['tag'] as String,
          imagePath: product['image'] as String,
          brand: 'Dr Trust USA',
        ),
      )),
      child: Container(
        width: cw, margin: EdgeInsets.only(right: sw * 0.03),
        decoration: BoxDecoration(color: kCardBg, borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.07), blurRadius: 12, offset: const Offset(0, 4))]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            child: Container(height: sw * 0.28, width: cw,
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFEBEFF8), Color(0xFFD4E4F7)])),
              child: Stack(children: [
                Positioned.fill(child: Image.asset(product['image'] as String, fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Center(child: Icon(product['icon'] as IconData, color: kNavy.withValues(alpha: 0.3), size: sw * 0.1)))),
                Positioned(top: sw * 0.018, left: sw * 0.018, child: _chip(product['tag'] as String,
                    product['tag'] == 'HOT' ? kRed : product['tag'] == 'TOP' ? kOrange : kNavy)),
              ]),
            )),
          Padding(padding: EdgeInsets.all(sw * 0.025), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(product['name'] as String, maxLines: 2, overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: sw * 0.027, fontWeight: FontWeight.w600, color: kTextDark, height: 1.3)),
            SizedBox(height: sw * 0.008),
            Row(children: [Icon(Icons.star_rounded, color: kOrange, size: sw * 0.028), SizedBox(width: sw * 0.005),
              Text(product['rating'] as String, style: TextStyle(fontSize: sw * 0.025, fontWeight: FontWeight.w700, color: kTextDark))]),
            SizedBox(height: sw * 0.008),
            Text(product['price'] as String, style: TextStyle(fontSize: sw * 0.03, fontWeight: FontWeight.w800, color: kNavy)),
            Text(product['origPrice'] as String, style: TextStyle(fontSize: sw * 0.024, color: kTextGrey, decoration: TextDecoration.lineThrough)),
          ])),
        ]),
      ),
    );
  }

  Widget _buildFrequentlyBought(double sw) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: sw * 0.04), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(child: _sectionHeader('Frequently bought Products', sw)),
        TextButton(onPressed: () {}, child: Text('View all 7', style: TextStyle(color: kTeal, fontSize: sw * 0.03, fontWeight: FontWeight.w600))),
      ]),
      SizedBox(height: sw * 0.015),
      GridView.builder(
        shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: sw * 0.025, crossAxisSpacing: sw * 0.025, childAspectRatio: 0.82),
        itemCount: _frequentProducts.length,
        itemBuilder: (_, i) => _buildGridCard(_frequentProducts[i], sw),
      ),
    ]));
  }

  Widget _buildGridCard(Map<String, dynamic> product, double sw) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(
        builder: (_) => ProductDescriptionScreen(
          productTitle: product['name'] as String,
          price: product['price'] as String,
          origPrice: product['origPrice'] as String,
          rating: product['rating'] as String,
          tag: product['tag'] as String,
          imagePath: product['image'] as String,
          brand: 'Dr Trust USA',
        ),
      )),
      child: Container(
        decoration: BoxDecoration(color: kCardBg, borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.07), blurRadius: 10, offset: const Offset(0, 4))]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            child: Container(height: sw * 0.3, width: double.infinity,
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFEBEFF8), Color(0xFFD4E4F7)])),
              child: Stack(children: [
                Positioned.fill(child: Image.asset(product['image'] as String, fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Center(child: Icon(product['icon'] as IconData, color: kNavy.withValues(alpha: 0.3), size: sw * 0.1)))),
                Positioned(top: sw * 0.012, left: sw * 0.012, child: _chip(product['tag'] as String,
                    product['tag'] == 'HOT' ? kRed : product['tag'] == 'TOP' ? kOrange : kNavy)),
              ]),
            )),
          Padding(padding: EdgeInsets.all(sw * 0.022), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(product['name'] as String, maxLines: 2, overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: sw * 0.026, fontWeight: FontWeight.w600, color: kTextDark, height: 1.3)),
            SizedBox(height: sw * 0.007),
            Row(children: [Icon(Icons.star_rounded, color: kOrange, size: sw * 0.026), SizedBox(width: sw * 0.005),
              Text(product['rating'] as String, style: TextStyle(fontSize: sw * 0.024, fontWeight: FontWeight.w700, color: kTextDark))]),
            SizedBox(height: sw * 0.007),
            Text(product['price'] as String, style: TextStyle(fontSize: sw * 0.028, fontWeight: FontWeight.w800, color: kNavy)),
          ])),
        ]),
      ),
    );
  }

  Widget _buildManufacturerCard(double sw) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sw * 0.04),
      padding: EdgeInsets.all(sw * 0.04),
      decoration: BoxDecoration(color: kCardBg, borderRadius: BorderRadius.circular(18),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 12, offset: const Offset(0, 4))]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _sectionHeader('Manufacturer / Market address', sw),
        SizedBox(height: sw * 0.02),
        _infoRow(Icons.business_outlined, 'Sheetal Healthcare Pvt. Ltd.', sw),
        SizedBox(height: sw * 0.014),
        _infoRow(Icons.location_on_outlined, 'Akshaya Nagar 1st Block, Rammurthy Nagar, Bangalore-560016', sw),
        SizedBox(height: sw * 0.014),
        _infoRow(Icons.phone_outlined, '+91 8802167892', sw),
        SizedBox(height: sw * 0.014),
        _infoRow(Icons.email_outlined, 'care@veesafe.com', sw),
        const Divider(height: 32, color: Color(0xFFEDF0F7)),
        Center(child: Column(children: [
          Text('Making healthcare', style: TextStyle(fontSize: sw * 0.034, fontWeight: FontWeight.w800, color: kNavy)),
          Text('UNDERSTANDABLE, ACCESSIBLE & AFFORDABLE', style: TextStyle(fontSize: sw * 0.022, fontWeight: FontWeight.w600, color: kTeal, letterSpacing: 0.4)),
          SizedBox(height: sw * 0.008),
          Row(mainAxisSize: MainAxisSize.min, children: [
            Text('Made with ', style: TextStyle(fontSize: sw * 0.026, color: kTextGrey)),
            Icon(Icons.favorite, color: kRed, size: sw * 0.028),
            Text(' by vaseefa', style: TextStyle(fontSize: sw * 0.026, fontWeight: FontWeight.w700, color: kNavy)),
          ]),
        ])),
      ]),
    );
  }

  // ── FIX 1: _buildStickyBottom முழுவதும் நீக்கப்பட்டது ──

  Widget _sectionHeader(String title, double sw) => Row(children: [
        Container(width: sw * 0.012, height: sw * 0.045, decoration: BoxDecoration(color: kTeal, borderRadius: BorderRadius.circular(3))),
        SizedBox(width: sw * 0.018),
        Flexible(fit: FlexFit.loose, child: Text(title, style: TextStyle(fontSize: sw * 0.034, fontWeight: FontWeight.w700, color: kTextDark))),
      ]);

  Widget _chip(String label, Color color) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 0.5)),
      );

  Widget _infoRow(IconData icon, String text, double sw) => Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(width: sw * 0.08, height: sw * 0.08,
            decoration: BoxDecoration(color: kTeal.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: kTeal, size: sw * 0.038)),
        SizedBox(width: sw * 0.025),
        Expanded(child: Text(text, style: TextStyle(fontSize: sw * 0.029, color: kTextDark, height: 1.4))),
      ]);

  Widget _benefitBadge(IconData icon, String label, double sw) => Column(children: [
        Container(width: sw * 0.14, height: sw * 0.14,
            decoration: BoxDecoration(color: kLightBg, shape: BoxShape.circle, border: Border.all(color: kNavy.withValues(alpha: 0.1))),
            child: Icon(icon, color: kNavy, size: sw * 0.065)),
        SizedBox(height: sw * 0.012),
        Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: sw * 0.024, fontWeight: FontWeight.w600, color: kTextDark, height: 1.3)),
      ]);
}

class _DotPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withValues(alpha: 0.08)..style = PaintingStyle.fill;
    const double spacing = 20;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1.5, paint);
      }
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}