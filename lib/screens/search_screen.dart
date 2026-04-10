// // // // // lib/screens/search_screen.dart

// // // // import 'package:flutter/material.dart';
// // // // import '../constants/app_colors.dart';

// // // // class SearchScreen extends StatefulWidget {
// // // //   const SearchScreen({super.key});

// // // //   @override
// // // //   State<SearchScreen> createState() =>
// // // //       _SearchScreenState();
// // // // }

// // // // class _SearchScreenState extends State<SearchScreen> {
// // // //   final _searchCtrl = TextEditingController();
// // // //   final _focusNode  = FocusNode();
// // // //   String _query     = '';

// // // //   // ── Search history ──
// // // //   List<String> _history = [
// // // //     'Surgical products',
// // // //     'Masks',
// // // //     'Syringe',
// // // //     'Student store products',
// // // //     'Beds',
// // // //   ];

// // // //   // ── All seller listed products ──
// // // //   final List<Map<String, dynamic>> _sellerProducts = [
// // // //     {
// // // //       'name':    'Surgical Knife – Pack of 10',
// // // //       'seller':  'MedSupply Co.',
// // // //       'price':   'Rs.1,299.00',
// // // //       'oldPrice':'Rs.1,800.00',
// // // //       'stock':   'In Stock',
// // // //       'rating':  4.5,
// // // //       'reviews': 128,
// // // //       'icon':    Icons.content_cut_rounded,
// // // //       'color':   Color(0xFF0284C7),
// // // //       'bg':      Color(0xFFE0F2FE),
// // // //       'cat':     'Equipment',
// // // //     },
// // // //     {
// // // //       'name':    'N95 Masks – Box of 50',
// // // //       'seller':  'HealthMart India',
// // // //       'price':   'Rs.499.00',
// // // //       'oldPrice':'Rs.699.00',
// // // //       'stock':   'In Stock',
// // // //       'rating':  4.8,
// // // //       'reviews': 342,
// // // //       'icon':    Icons.masks_rounded,
// // // //       'color':   Color(0xFF16A34A),
// // // //       'bg':      Color(0xFFDCFCE7),
// // // //       'cat':     'COVID-19',
// // // //     },
// // // //     {
// // // //       'name':    'Hospital Beds – Recliner Type',
// // // //       'seller':  'Veesafe Stores',
// // // //       'price':   'Rs.12,500.00',
// // // //       'oldPrice':'Rs.15,000.00',
// // // //       'stock':   '3 Left',
// // // //       'rating':  4.2,
// // // //       'reviews': 56,
// // // //       'icon':    Icons.bed_rounded,
// // // //       'color':   Color(0xFF7C3AED),
// // // //       'bg':      Color(0xFFEDE9FE),
// // // //       'cat':     'Equipment',
// // // //     },
// // // //     {
// // // //       'name':    'Sethascope Pro – Cardiology',
// // // //       'seller':  'MediCare Plus',
// // // //       'price':   'Rs.3,250.00',
// // // //       'oldPrice':'Rs.4,500.00',
// // // //       'stock':   'In Stock',
// // // //       'rating':  4.9,
// // // //       'reviews': 89,
// // // //       'icon':    Icons.hearing_rounded,
// // // //       'color':   Color(0xFFD97706),
// // // //       'bg':      Color(0xFFFEF3C7),
// // // //       'cat':     'Testing',
// // // //     },
// // // //     {
// // // //       'name':    'Disposable Syringes – 100 pcs',
// // // //       'seller':  'PharmaDirect',
// // // //       'price':   'Rs.349.00',
// // // //       'oldPrice':'Rs.499.00',
// // // //       'stock':   'In Stock',
// // // //       'rating':  4.6,
// // // //       'reviews': 215,
// // // //       'icon':    Icons.vaccines_rounded,
// // // //       'color':   Color(0xFFE11D48),
// // // //       'bg':      Color(0xFFFFE4E6),
// // // //       'cat':     'Equipment',
// // // //     },
// // // //     {
// // // //       'name':    'Oxygen Cylinder & Mask',
// // // //       'seller':  'GlobalMed Supplies',
// // // //       'price':   'Rs.2,199.00',
// // // //       'oldPrice':'Rs.3,000.00',
// // // //       'stock':   '5 Left',
// // // //       'rating':  4.4,
// // // //       'reviews': 76,
// // // //       'icon':    Icons.air_rounded,
// // // //       'color':   Color(0xFF0284C7),
// // // //       'bg':      Color(0xFFE0F2FE),
// // // //       'cat':     'Equipment',
// // // //     },
// // // //     {
// // // //       'name':    'Blood Testing Device',
// // // //       'seller':  'DiagnoPlus',
// // // //       'price':   'Rs.3,250.00',
// // // //       'oldPrice':'Rs.4,000.00',
// // // //       'stock':   'In Stock',
// // // //       'rating':  4.7,
// // // //       'reviews': 193,
// // // //       'icon':    Icons.bloodtype_rounded,
// // // //       'color':   Color(0xFFE11D48),
// // // //       'bg':      Color(0xFFFFE4E6),
// // // //       'cat':     'Testing',
// // // //     },
// // // //     {
// // // //       'name':    'Walking Stick – Steel',
// // // //       'seller':  'CareHome Products',
// // // //       'price':   'Rs.1,499.00',
// // // //       'oldPrice':'Rs.1,999.00',
// // // //       'stock':   'In Stock',
// // // //       'rating':  4.3,
// // // //       'reviews': 44,
// // // //       'icon':    Icons.accessibility_new_rounded,
// // // //       'color':   Color(0xFF16A34A),
// // // //       'bg':      Color(0xFFDCFCE7),
// // // //       'cat':     'Homecare',
// // // //     },
// // // //     {
// // // //       'name':    'Wheel Chair Premium',
// // // //       'seller':  'MobilityFirst',
// // // //       'price':   'Rs.5,999.00',
// // // //       'oldPrice':'Rs.7,500.00',
// // // //       'stock':   '2 Left',
// // // //       'rating':  4.6,
// // // //       'reviews': 67,
// // // //       'icon':    Icons.wheelchair_pickup_rounded,
// // // //       'color':   Color(0xFF7C3AED),
// // // //       'bg':      Color(0xFFEDE9FE),
// // // //       'cat':     'Homecare',
// // // //     },
// // // //     {
// // // //       'name':    'First Aid Kit – Full Set',
// // // //       'seller':  'SafetyFirst India',
// // // //       'price':   'Rs.1,499.00',
// // // //       'oldPrice':'Rs.1,999.00',
// // // //       'stock':   'In Stock',
// // // //       'rating':  4.8,
// // // //       'reviews': 301,
// // // //       'icon':    Icons.medical_services_rounded,
// // // //       'color':   Color(0xFFD97706),
// // // //       'bg':      Color(0xFFFEF3C7),
// // // //       'cat':     'Equipment',
// // // //     },
// // // //   ];

// // // //   List<Map<String, dynamic>> get _results {
// // // //     if (_query.trim().isEmpty) return _sellerProducts;
// // // //     return _sellerProducts.where((p) =>
// // // //         (p['name'] as String).toLowerCase().contains(_query.toLowerCase()) ||
// // // //         (p['seller'] as String).toLowerCase().contains(_query.toLowerCase()) ||
// // // //         (p['cat'] as String).toLowerCase().contains(_query.toLowerCase())).toList();
// // // //   }

// // // //   void _onSearch(String val) {
// // // //     setState(() => _query = val);
// // // //   }

// // // //   void _addToHistory(String name) {
// // // //     if (!_history.contains(name)) {
// // // //       setState(() {
// // // //         _history.insert(0, name);
// // // //         if (_history.length > 8) _history.removeLast();
// // // //       });
// // // //     }
// // // //   }

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _focusNode.addListener(() => setState(() {}));
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _searchCtrl.dispose();
// // // //     _focusNode.dispose();
// // // //     super.dispose();
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: const Color(0xFFF5F7FA),
// // // //       body: SafeArea(
// // // //         child: Column(
// // // //           children: [
// // // //             _appBar(context),
// // // //             _searchBar(),
// // // //             Expanded(
// // // //               child: _query.trim().isEmpty
// // // //                   ? _homeView()
// // // //                   : _searchResults(),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   // ════════════════════════════════════════
// // // //   //  APP BAR
// // // //   // ════════════════════════════════════════
// // // //   Widget _appBar(BuildContext context) => Container(
// // // //         decoration: const BoxDecoration(
// // // //           gradient: LinearGradient(
// // // //             colors: [kBlue, Color(0xFF1A73E8)],
// // // //             begin: Alignment.centerLeft,
// // // //             end: Alignment.centerRight,
// // // //           ),
// // // //         ),
// // // //         padding: const EdgeInsets.fromLTRB(4, 6, 14, 10),
// // // //         child: Row(
// // // //           children: [
// // // //             IconButton(
// // // //               icon: const Icon(Icons.arrow_back_ios,
// // // //                   size: 18, color: Colors.white),
// // // //               onPressed: () => Navigator.pop(context),
// // // //             ),
// // // //             const Expanded(
// // // //               child: Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // //                 children: [
// // // //                   Text('Buyers / Seller Messages',
// // // //                       style: TextStyle(
// // // //                           fontSize: 17,
// // // //                           fontWeight: FontWeight.w800,
// // // //                           color: Colors.white)),
// // // //                   Text('Browse products listed by sellers',
// // // //                       style: TextStyle(
// // // //                           fontSize: 11, color: Colors.white70)),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       );

// // // //   // ════════════════════════════════════════
// // // //   //  SEARCH BAR
// // // //   // ════════════════════════════════════════
// // // //   Widget _searchBar() => Container(
// // // //         color: Colors.white,
// // // //         padding: const EdgeInsets.fromLTRB(14, 10, 14, 12),
// // // //         child: Container(
// // // //           height: 46,
// // // //           decoration: BoxDecoration(
// // // //             color: const Color(0xFFF5F7FA),
// // // //             borderRadius: BorderRadius.circular(12),
// // // //             border: Border.all(color: _focusNode.hasFocus
// // // //                 ? kBlue : kBorderGrey,
// // // //                 width: _focusNode.hasFocus ? 1.5 : 1),
// // // //           ),
// // // //           child: Row(
// // // //             children: [
// // // //               const SizedBox(width: 12),
// // // //               Icon(Icons.search_rounded,
// // // //                   color: _focusNode.hasFocus ? kBlue : kGrey,
// // // //                   size: 20),
// // // //               const SizedBox(width: 8),
// // // //               Expanded(
// // // //                 child: TextField(
// // // //                   controller: _searchCtrl,
// // // //                   focusNode: _focusNode,
// // // //                   onChanged: _onSearch,
// // // //                   onSubmitted: (v) {
// // // //                     if (v.trim().isNotEmpty) _addToHistory(v.trim());
// // // //                   },
// // // //                   style: const TextStyle(fontSize: 13, color: kBlack),
// // // //                   decoration: const InputDecoration(
// // // //                     hintText: 'Search your favourite product',
// // // //                     hintStyle: TextStyle(
// // // //                         color: Color(0xFFB0BEC5), fontSize: 13),
// // // //                     border: InputBorder.none,
// // // //                     isDense: true,
// // // //                     contentPadding: EdgeInsets.zero,
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //               if (_query.isNotEmpty)
// // // //                 GestureDetector(
// // // //                   onTap: () {
// // // //                     _searchCtrl.clear();
// // // //                     setState(() => _query = '');
// // // //                   },
// // // //                   child: const Padding(
// // // //                     padding: EdgeInsets.only(right: 10),
// // // //                     child: Icon(Icons.close_rounded,
// // // //                         color: kGrey, size: 18),
// // // //                   ),
// // // //                 ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       );

// // // //   // ════════════════════════════════════════
// // // //   //  HOME VIEW — search results + history
// // // //   // ════════════════════════════════════════
// // // //   Widget _homeView() => SingleChildScrollView(
// // // //         physics: const BouncingScrollPhysics(),
// // // //         padding: const EdgeInsets.all(16),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             // ── Search Results label ──
// // // //             const Text('Search Results',
// // // //                 style: TextStyle(
// // // //                     fontSize: 15,
// // // //                     fontWeight: FontWeight.w800,
// // // //                     color: kBlack)),
// // // //             const SizedBox(height: 10),

// // // //             // ── All products ──
// // // //             ..._sellerProducts.map((p) => _productTile(p)),

// // // //             const SizedBox(height: 20),

// // // //             // ── History ──
// // // //             if (_history.isNotEmpty) ...[
// // // //               Row(
// // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                 children: [
// // // //                   const Text('History',
// // // //                       style: TextStyle(
// // // //                           fontSize: 15,
// // // //                           fontWeight: FontWeight.w800,
// // // //                           color: kBlack)),
// // // //                   GestureDetector(
// // // //                     onTap: () => setState(() => _history.clear()),
// // // //                     child: const Text('Clear',
// // // //                         style: TextStyle(
// // // //                             fontSize: 12,
// // // //                             color: Colors.red,
// // // //                             fontWeight: FontWeight.w600)),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //               const SizedBox(height: 10),
// // // //               Wrap(
// // // //                 spacing: 8, runSpacing: 8,
// // // //                 children: _history.map((h) => GestureDetector(
// // // //                   onTap: () {
// // // //                     _searchCtrl.text = h;
// // // //                     _onSearch(h);
// // // //                   },
// // // //                   child: Container(
// // // //                     padding: const EdgeInsets.symmetric(
// // // //                         horizontal: 14, vertical: 8),
// // // //                     decoration: BoxDecoration(
// // // //                       color: Colors.white,
// // // //                       borderRadius: BorderRadius.circular(30),
// // // //                       border: Border.all(
// // // //                           color: const Color(0xFFE0E0E0)),
// // // //                       boxShadow: [
// // // //                         BoxShadow(
// // // //                           color: Colors.black.withOpacity(0.04),
// // // //                           blurRadius: 4,
// // // //                           offset: const Offset(0, 1),
// // // //                         ),
// // // //                       ],
// // // //                     ),
// // // //                     child: Text(h,
// // // //                         style: const TextStyle(
// // // //                             fontSize: 12,
// // // //                             color: kBlack,
// // // //                             fontWeight: FontWeight.w500)),
// // // //                   ),
// // // //                 )).toList(),
// // // //               ),
// // // //             ],
// // // //           ],
// // // //         ),
// // // //       );

// // // //   // ════════════════════════════════════════
// // // //   //  SEARCH RESULTS VIEW
// // // //   // ════════════════════════════════════════
// // // //   Widget _searchResults() {
// // // //     final list = _results;
// // // //     if (list.isEmpty) {
// // // //       return Center(
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: [
// // // //             Container(
// // // //               width: 70, height: 70,
// // // //               decoration: BoxDecoration(
// // // //                   color: kBlueLite, shape: BoxShape.circle),
// // // //               child: const Icon(Icons.search_off_rounded,
// // // //                   color: kBlue, size: 32)),
// // // //             const SizedBox(height: 14),
// // // //             Text('No products for "$_query"',
// // // //                 style: const TextStyle(
// // // //                     fontSize: 15,
// // // //                     fontWeight: FontWeight.w700,
// // // //                     color: kBlack)),
// // // //             const SizedBox(height: 6),
// // // //             const Text('Try different keywords',
// // // //                 style: TextStyle(fontSize: 13, color: kGrey)),
// // // //           ],
// // // //         ),
// // // //       );
// // // //     }
// // // //     return SingleChildScrollView(
// // // //       physics: const BouncingScrollPhysics(),
// // // //       padding: const EdgeInsets.all(16),
// // // //       child: Column(
// // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // //         children: [
// // // //           Text('${list.length} results for "$_query"',
// // // //               style: const TextStyle(
// // // //                   fontSize: 13,
// // // //                   fontWeight: FontWeight.w700,
// // // //                   color: kBlack)),
// // // //           const SizedBox(height: 10),
// // // //           ...list.map((p) => _productTile(p)),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   // ════════════════════════════════════════
// // // //   //  PRODUCT TILE
// // // //   // ════════════════════════════════════════
// // // //   Widget _productTile(Map<String, dynamic> p) => GestureDetector(
// // // //         onTap: () => _addToHistory(p['name'] as String),
// // // //         child: Container(
// // // //           margin: const EdgeInsets.only(bottom: 10),
// // // //           padding: const EdgeInsets.all(14),
// // // //           decoration: BoxDecoration(
// // // //             color: Colors.white,
// // // //             borderRadius: BorderRadius.circular(14),
// // // //             border: Border.all(color: kBorderGrey),
// // // //             boxShadow: [
// // // //               BoxShadow(
// // // //                 color: Colors.black.withOpacity(0.04),
// // // //                 blurRadius: 8,
// // // //                 offset: const Offset(0, 2),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //           child: Row(
// // // //             children: [
// // // //               // ── Icon ──
// // // //               Container(
// // // //                 width: 52, height: 52,
// // // //                 decoration: BoxDecoration(
// // // //                   color: p['bg'] as Color,
// // // //                   borderRadius: BorderRadius.circular(14),
// // // //                 ),
// // // //                 child: Icon(p['icon'] as IconData,
// // // //                     size: 26, color: p['color'] as Color),
// // // //               ),
// // // //               const SizedBox(width: 12),

// // // //               // ── Details ──
// // // //               Expanded(
// // // //                 child: Column(
// // // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // // //                   children: [
// // // //                     Text(p['name'] as String,
// // // //                         style: const TextStyle(
// // // //                             fontSize: 13.5,
// // // //                             fontWeight: FontWeight.w700,
// // // //                             color: kBlack)),
// // // //                     const SizedBox(height: 2),
// // // //                     Row(
// // // //                       children: [
// // // //                         const Icon(Icons.store_rounded,
// // // //                             size: 11, color: kGrey),
// // // //                         const SizedBox(width: 3),
// // // //                         Text(p['seller'] as String,
// // // //                             style: const TextStyle(
// // // //                                 fontSize: 11.5,
// // // //                                 color: kGrey)),
// // // //                         const SizedBox(width: 8),
// // // //                         // Stock badge
// // // //                         Container(
// // // //                           padding: const EdgeInsets.symmetric(
// // // //                               horizontal: 6, vertical: 2),
// // // //                           decoration: BoxDecoration(
// // // //                             color: (p['stock'] as String)
// // // //                                     .contains('Left')
// // // //                                 ? const Color(0xFFFEF3C7)
// // // //                                 : const Color(0xFFDCFCE7),
// // // //                             borderRadius: BorderRadius.circular(6),
// // // //                           ),
// // // //                           child: Text(p['stock'] as String,
// // // //                               style: TextStyle(
// // // //                                   fontSize: 9.5,
// // // //                                   fontWeight: FontWeight.w700,
// // // //                                   color: (p['stock'] as String)
// // // //                                           .contains('Left')
// // // //                                       ? const Color(0xFFD97706)
// // // //                                       : const Color(0xFF16A34A))),
// // // //                         ),
// // // //                       ],
// // // //                     ),
// // // //                     const SizedBox(height: 5),
// // // //                     Row(
// // // //                       children: [
// // // //                         // Stars
// // // //                         ...List.generate(5, (i) => Icon(
// // // //                           i < (p['rating'] as double).floor()
// // // //                               ? Icons.star_rounded
// // // //                               : Icons.star_border_rounded,
// // // //                           size: 13,
// // // //                           color: const Color(0xFFF59E0B),
// // // //                         )),
// // // //                         const SizedBox(width: 4),
// // // //                         Text('(${p['reviews']})',
// // // //                             style: const TextStyle(
// // // //                                 fontSize: 10.5, color: kGrey)),
// // // //                       ],
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ),

// // // //               // ── Price ──
// // // //               Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.end,
// // // //                 children: [
// // // //                   Text(p['price'] as String,
// // // //                       style: const TextStyle(
// // // //                           fontSize: 13,
// // // //                           fontWeight: FontWeight.w800,
// // // //                           color: kBlue)),
// // // //                   Text(p['oldPrice'] as String,
// // // //                       style: const TextStyle(
// // // //                           fontSize: 10.5,
// // // //                           color: kGrey,
// // // //                           decoration: TextDecoration.lineThrough)),
// // // //                   const SizedBox(height: 6),
// // // //                   Container(
// // // //                     padding: const EdgeInsets.symmetric(
// // // //                         horizontal: 10, vertical: 5),
// // // //                     decoration: BoxDecoration(
// // // //                       color: kBlue,
// // // //                       borderRadius: BorderRadius.circular(8),
// // // //                     ),
// // // //                     child: const Text('Buy Now',
// // // //                         style: TextStyle(
// // // //                             fontSize: 10,
// // // //                             color: Colors.white,
// // // //                             fontWeight: FontWeight.w700)),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       );
// // // // }
















// // // // lib/screens/search_screen.dart

// // // import 'package:flutter/material.dart';
// // // import '../constants/app_colors.dart';

// // // class SearchScreen extends StatefulWidget {
// // //   const SearchScreen({super.key});

// // //   @override
// // //   State<SearchScreen> createState() => _SearchScreenState();
// // // }

// // // class _SearchScreenState extends State<SearchScreen> {
// // //   final _searchCtrl = TextEditingController();
// // //   final _focusNode  = FocusNode();
// // //   String _query     = '';

// // //   List<String> _history = [
// // //     'Surgical products',
// // //     'Masks',
// // //     'Syringe',
// // //     'Student store products',
// // //     'Beds',
// // //   ];

// // //   final List<Map<String, dynamic>> _sellerProducts = [
// // //     {
// // //       'name':    'Surgical Knife – Pack of 10',
// // //       'seller':  'MedSupply Co.',
// // //       'price':   'Rs.1,299.00',
// // //       'oldPrice':'Rs.1,800.00',
// // //       'stock':   'In Stock',
// // //       'rating':  4.5,
// // //       'reviews': 128,
// // //       'icon':    Icons.content_cut_rounded,
// // //       'color':   Color(0xFF0284C7),
// // //       'bg':      Color(0xFFE0F2FE),
// // //       'cat':     'Equipment',
// // //     },
// // //     {
// // //       'name':    'N95 Masks – Box of 50',
// // //       'seller':  'HealthMart India',
// // //       'price':   'Rs.499.00',
// // //       'oldPrice':'Rs.699.00',
// // //       'stock':   'In Stock',
// // //       'rating':  4.8,
// // //       'reviews': 342,
// // //       'icon':    Icons.masks_rounded,
// // //       'color':   Color(0xFF16A34A),
// // //       'bg':      Color(0xFFDCFCE7),
// // //       'cat':     'COVID-19',
// // //     },
// // //     {
// // //       'name':    'Hospital Beds – Recliner Type',
// // //       'seller':  'Veesafe Stores',
// // //       'price':   'Rs.12,500.00',
// // //       'oldPrice':'Rs.15,000.00',
// // //       'stock':   '3 Left',
// // //       'rating':  4.2,
// // //       'reviews': 56,
// // //       'icon':    Icons.bed_rounded,
// // //       'color':   Color(0xFF7C3AED),
// // //       'bg':      Color(0xFFEDE9FE),
// // //       'cat':     'Equipment',
// // //     },
// // //     {
// // //       'name':    'Sethascope Pro – Cardiology',
// // //       'seller':  'MediCare Plus',
// // //       'price':   'Rs.3,250.00',
// // //       'oldPrice':'Rs.4,500.00',
// // //       'stock':   'In Stock',
// // //       'rating':  4.9,
// // //       'reviews': 89,
// // //       'icon':    Icons.hearing_rounded,
// // //       'color':   Color(0xFFD97706),
// // //       'bg':      Color(0xFFFEF3C7),
// // //       'cat':     'Testing',
// // //     },
// // //     {
// // //       'name':    'Disposable Syringes – 100 pcs',
// // //       'seller':  'PharmaDirect',
// // //       'price':   'Rs.349.00',
// // //       'oldPrice':'Rs.499.00',
// // //       'stock':   'In Stock',
// // //       'rating':  4.6,
// // //       'reviews': 215,
// // //       'icon':    Icons.vaccines_rounded,
// // //       'color':   Color(0xFFE11D48),
// // //       'bg':      Color(0xFFFFE4E6),
// // //       'cat':     'Equipment',
// // //     },
// // //     {
// // //       'name':    'Oxygen Cylinder & Mask',
// // //       'seller':  'GlobalMed Supplies',
// // //       'price':   'Rs.2,199.00',
// // //       'oldPrice':'Rs.3,000.00',
// // //       'stock':   '5 Left',
// // //       'rating':  4.4,
// // //       'reviews': 76,
// // //       'icon':    Icons.air_rounded,
// // //       'color':   Color(0xFF0284C7),
// // //       'bg':      Color(0xFFE0F2FE),
// // //       'cat':     'Equipment',
// // //     },
// // //     {
// // //       'name':    'Blood Testing Device',
// // //       'seller':  'DiagnoPlus',
// // //       'price':   'Rs.3,250.00',
// // //       'oldPrice':'Rs.4,000.00',
// // //       'stock':   'In Stock',
// // //       'rating':  4.7,
// // //       'reviews': 193,
// // //       'icon':    Icons.bloodtype_rounded,
// // //       'color':   Color(0xFFE11D48),
// // //       'bg':      Color(0xFFFFE4E6),
// // //       'cat':     'Testing',
// // //     },
// // //     {
// // //       'name':    'Walking Stick – Steel',
// // //       'seller':  'CareHome Products',
// // //       'price':   'Rs.1,499.00',
// // //       'oldPrice':'Rs.1,999.00',
// // //       'stock':   'In Stock',
// // //       'rating':  4.3,
// // //       'reviews': 44,
// // //       'icon':    Icons.accessibility_new_rounded,
// // //       'color':   Color(0xFF16A34A),
// // //       'bg':      Color(0xFFDCFCE7),
// // //       'cat':     'Homecare',
// // //     },
// // //     {
// // //       'name':    'Wheel Chair Premium',
// // //       'seller':  'MobilityFirst',
// // //       'price':   'Rs.5,999.00',
// // //       'oldPrice':'Rs.7,500.00',
// // //       'stock':   '2 Left',
// // //       'rating':  4.6,
// // //       'reviews': 67,
// // //       'icon':    Icons.wheelchair_pickup_rounded,
// // //       'color':   Color(0xFF7C3AED),
// // //       'bg':      Color(0xFFEDE9FE),
// // //       'cat':     'Homecare',
// // //     },
// // //     {
// // //       'name':    'First Aid Kit – Full Set',
// // //       'seller':  'SafetyFirst India',
// // //       'price':   'Rs.1,499.00',
// // //       'oldPrice':'Rs.1,999.00',
// // //       'stock':   'In Stock',
// // //       'rating':  4.8,
// // //       'reviews': 301,
// // //       'icon':    Icons.medical_services_rounded,
// // //       'color':   Color(0xFFD97706),
// // //       'bg':      Color(0xFFFEF3C7),
// // //       'cat':     'Equipment',
// // //     },
// // //   ];

// // //   List<Map<String, dynamic>> get _results {
// // //     if (_query.trim().isEmpty) return _sellerProducts;
// // //     return _sellerProducts.where((p) =>
// // //         (p['name'] as String).toLowerCase().contains(_query.toLowerCase()) ||
// // //         (p['seller'] as String).toLowerCase().contains(_query.toLowerCase()) ||
// // //         (p['cat'] as String).toLowerCase().contains(_query.toLowerCase())).toList();
// // //   }

// // //   void _onSearch(String val) => setState(() => _query = val);

// // //   void _addToHistory(String name) {
// // //     if (!_history.contains(name)) {
// // //       setState(() {
// // //         _history.insert(0, name);
// // //         if (_history.length > 8) _history.removeLast();
// // //       });
// // //     }
// // //   }

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _focusNode.addListener(() => setState(() {}));
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _searchCtrl.dispose();
// // //     _focusNode.dispose();
// // //     super.dispose();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: const Color(0xFFF5F7FA),
// // //       body: SafeArea(
// // //         child: Column(
// // //           children: [
// // //             _appBar(context),
// // //             _searchBar(),
// // //             Expanded(
// // //               child: _query.trim().isEmpty ? _homeView() : _searchResultsView(),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   // ════════════════════════════════════════
// // //   //  APP BAR
// // //   // ════════════════════════════════════════
// // //   Widget _appBar(BuildContext context) => Container(
// // //         decoration: const BoxDecoration(
// // //           gradient: LinearGradient(
// // //             colors: [kBlue, Color(0xFF1A73E8)],
// // //             begin: Alignment.centerLeft,
// // //             end: Alignment.centerRight,
// // //           ),
// // //         ),
// // //         padding: const EdgeInsets.fromLTRB(4, 8, 16, 12),
// // //         child: Row(
// // //           children: [
// // //             IconButton(
// // //               icon: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.white),
// // //               onPressed: () => Navigator.pop(context),
// // //             ),
// // //             const Expanded(
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 mainAxisSize: MainAxisSize.min,
// // //                 children: [
// // //                   Text('Buyers / Seller Messages',
// // //                       style: TextStyle(
// // //                           fontSize: 17,
// // //                           fontWeight: FontWeight.w800,
// // //                           color: Colors.white,
// // //                           letterSpacing: 0.2)),
// // //                   SizedBox(height: 2),
// // //                   Text('Browse products listed by sellers',
// // //                       style: TextStyle(fontSize: 11.5, color: Colors.white70)),
// // //                 ],
// // //               ),
// // //             ),
// // //             Container(
// // //               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// // //               decoration: BoxDecoration(
// // //                 color: Colors.white.withOpacity(0.18),
// // //                 borderRadius: BorderRadius.circular(20),
// // //                 border: Border.all(color: Colors.white.withOpacity(0.4)),
// // //               ),
// // //               child: Text(
// // //                 '${_sellerProducts.length} Products',
// // //                 style: const TextStyle(
// // //                     color: Colors.white,
// // //                     fontSize: 11,
// // //                     fontWeight: FontWeight.w600),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       );

// // //   // ════════════════════════════════════════
// // //   //  SEARCH BAR
// // //   // ════════════════════════════════════════
// // //   Widget _searchBar() => Container(
// // //         color: Colors.white,
// // //         padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
// // //         child: Container(
// // //           height: 48,
// // //           decoration: BoxDecoration(
// // //             color: const Color(0xFFF5F7FA),
// // //             borderRadius: BorderRadius.circular(13),
// // //             border: Border.all(
// // //               color: _focusNode.hasFocus ? kBlue : const Color(0xFFE0E4ED),
// // //               width: _focusNode.hasFocus ? 1.8 : 1.2,
// // //             ),
// // //             boxShadow: _focusNode.hasFocus
// // //                 ? [BoxShadow(color: kBlue.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 2))]
// // //                 : [],
// // //           ),
// // //           child: Row(
// // //             children: [
// // //               const SizedBox(width: 14),
// // //               Icon(Icons.search_rounded,
// // //                   color: _focusNode.hasFocus ? kBlue : const Color(0xFF9AA5B4),
// // //                   size: 21),
// // //               const SizedBox(width: 10),
// // //               Expanded(
// // //                 child: TextField(
// // //                   controller: _searchCtrl,
// // //                   focusNode: _focusNode,
// // //                   onChanged: _onSearch,
// // //                   onSubmitted: (v) {
// // //                     if (v.trim().isNotEmpty) _addToHistory(v.trim());
// // //                   },
// // //                   style: const TextStyle(
// // //                       fontSize: 14,
// // //                       color: kBlack,
// // //                       fontWeight: FontWeight.w500),
// // //                   decoration: const InputDecoration(
// // //                     hintText: 'Search your favourite product',
// // //                     hintStyle: TextStyle(
// // //                         color: Color(0xFFB0BEC5),
// // //                         fontSize: 13.5,
// // //                         fontWeight: FontWeight.w400),
// // //                     border: InputBorder.none,
// // //                     isDense: true,
// // //                     contentPadding: EdgeInsets.zero,
// // //                   ),
// // //                 ),
// // //               ),
// // //               if (_query.isNotEmpty)
// // //                 GestureDetector(
// // //                   onTap: () {
// // //                     _searchCtrl.clear();
// // //                     setState(() => _query = '');
// // //                   },
// // //                   child: Container(
// // //                     margin: const EdgeInsets.only(right: 10),
// // //                     width: 26, height: 26,
// // //                     decoration: BoxDecoration(
// // //                       color: const Color(0xFFE5E9F0),
// // //                       shape: BoxShape.circle,
// // //                     ),
// // //                     child: const Icon(Icons.close_rounded,
// // //                         color: kGrey, size: 15),
// // //                   ),
// // //                 )
// // //               else
// // //                 const SizedBox(width: 12),
// // //             ],
// // //           ),
// // //         ),
// // //       );

// // //   // ════════════════════════════════════════
// // //   //  HOME VIEW — all products + history
// // //   // ════════════════════════════════════════
// // //   Widget _homeView() => CustomScrollView(
// // //         physics: const BouncingScrollPhysics(),
// // //         slivers: [
// // //           // ── All Products Section ──
// // //           SliverToBoxAdapter(
// // //             child: Padding(
// // //               padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
// // //               child: Row(
// // //                 children: [
// // //                   Container(
// // //                     width: 4, height: 18,
// // //                     decoration: BoxDecoration(
// // //                       color: kBlue,
// // //                       borderRadius: BorderRadius.circular(4),
// // //                     ),
// // //                   ),
// // //                   const SizedBox(width: 8),
// // //                   const Text('Search Results',
// // //                       style: TextStyle(
// // //                           fontSize: 15,
// // //                           fontWeight: FontWeight.w800,
// // //                           color: kBlack)),
// // //                   const Spacer(),
// // //                   Text('${_sellerProducts.length} items',
// // //                       style: const TextStyle(
// // //                           fontSize: 12, color: kGrey, fontWeight: FontWeight.w500)),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),

// // //           SliverList(
// // //             delegate: SliverChildBuilderDelegate(
// // //               (_, i) => Padding(
// // //                 padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
// // //                 child: _productTile(_sellerProducts[i]),
// // //               ),
// // //               childCount: _sellerProducts.length,
// // //             ),
// // //           ),

// // //           // ── History Section ──
// // //           if (_history.isNotEmpty) ...[
// // //             SliverToBoxAdapter(
// // //               child: Padding(
// // //                 padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
// // //                 child: Row(
// // //                   children: [
// // //                     Container(
// // //                       width: 4, height: 18,
// // //                       decoration: BoxDecoration(
// // //                         color: kGrey,
// // //                         borderRadius: BorderRadius.circular(4),
// // //                       ),
// // //                     ),
// // //                     const SizedBox(width: 8),
// // //                     const Text('History',
// // //                         style: TextStyle(
// // //                             fontSize: 15,
// // //                             fontWeight: FontWeight.w800,
// // //                             color: kBlack)),
// // //                     const Spacer(),
// // //                     GestureDetector(
// // //                       onTap: () => setState(() => _history.clear()),
// // //                       child: const Text('Clear all',
// // //                           style: TextStyle(
// // //                               fontSize: 12,
// // //                               color: Colors.red,
// // //                               fontWeight: FontWeight.w600)),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //             SliverToBoxAdapter(
// // //               child: Padding(
// // //                 padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
// // //                 child: Wrap(
// // //                   spacing: 8, runSpacing: 8,
// // //                   children: _history.map((h) => GestureDetector(
// // //                     onTap: () {
// // //                       _searchCtrl.text = h;
// // //                       _onSearch(h);
// // //                     },
// // //                     child: Container(
// // //                       padding: const EdgeInsets.symmetric(
// // //                           horizontal: 14, vertical: 9),
// // //                       decoration: BoxDecoration(
// // //                         color: Colors.white,
// // //                         borderRadius: BorderRadius.circular(30),
// // //                         border: Border.all(color: const Color(0xFFE0E4ED)),
// // //                         boxShadow: [
// // //                           BoxShadow(
// // //                               color: Colors.black.withOpacity(0.04),
// // //                               blurRadius: 5,
// // //                               offset: const Offset(0, 1)),
// // //                         ],
// // //                       ),
// // //                       child: Row(
// // //                         mainAxisSize: MainAxisSize.min,
// // //                         children: [
// // //                           const Icon(Icons.history_rounded,
// // //                               size: 13, color: kGrey),
// // //                           const SizedBox(width: 5),
// // //                           Text(h,
// // //                               style: const TextStyle(
// // //                                   fontSize: 12.5,
// // //                                   color: kBlack,
// // //                                   fontWeight: FontWeight.w500)),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   )).toList(),
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ],
// // //       );

// // //   // ════════════════════════════════════════
// // //   //  SEARCH RESULTS VIEW
// // //   // ════════════════════════════════════════
// // //   Widget _searchResultsView() {
// // //     final list = _results;
// // //     if (list.isEmpty) {
// // //       return Center(
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             Container(
// // //               width: 80, height: 80,
// // //               decoration: const BoxDecoration(
// // //                   color: kBlueLite, shape: BoxShape.circle),
// // //               child: const Icon(Icons.search_off_rounded,
// // //                   color: kBlue, size: 36)),
// // //             const SizedBox(height: 18),
// // //             Text('No products for "$_query"',
// // //                 style: const TextStyle(
// // //                     fontSize: 16,
// // //                     fontWeight: FontWeight.w700,
// // //                     color: kBlack)),
// // //             const SizedBox(height: 6),
// // //             const Text('Try a different keyword',
// // //                 style: TextStyle(fontSize: 13, color: kGrey)),
// // //           ],
// // //         ),
// // //       );
// // //     }
// // //     return CustomScrollView(
// // //       physics: const BouncingScrollPhysics(),
// // //       slivers: [
// // //         SliverToBoxAdapter(
// // //           child: Padding(
// // //             padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
// // //             child: Row(
// // //               children: [
// // //                 Container(
// // //                   width: 4, height: 18,
// // //                   decoration: BoxDecoration(
// // //                       color: kBlue, borderRadius: BorderRadius.circular(4)),
// // //                 ),
// // //                 const SizedBox(width: 8),
// // //                 Expanded(
// // //                   child: RichText(
// // //                     text: TextSpan(
// // //                       style: const TextStyle(
// // //                           fontSize: 14,
// // //                           fontWeight: FontWeight.w700,
// // //                           color: kBlack),
// // //                       children: [
// // //                         TextSpan(text: '${list.length} results for  '),
// // //                         TextSpan(
// // //                           text: '"$_query"',
// // //                           style: const TextStyle(color: kBlue),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //         SliverList(
// // //           delegate: SliverChildBuilderDelegate(
// // //             (_, i) => Padding(
// // //               padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
// // //               child: _productTile(list[i]),
// // //             ),
// // //             childCount: list.length,
// // //           ),
// // //         ),
// // //         const SliverToBoxAdapter(child: SizedBox(height: 24)),
// // //       ],
// // //     );
// // //   }

// // //   // ════════════════════════════════════════
// // //   //  PRODUCT TILE — properly spaced
// // //   // ════════════════════════════════════════
// // //   Widget _productTile(Map<String, dynamic> p) {
// // //     final isLow = (p['stock'] as String).contains('Left');
// // //     return GestureDetector(
// // //       onTap: () => _addToHistory(p['name'] as String),
// // //       child: Container(
// // //         padding: const EdgeInsets.all(14),
// // //         decoration: BoxDecoration(
// // //           color: Colors.white,
// // //           borderRadius: BorderRadius.circular(16),
// // //           border: Border.all(color: const Color(0xFFEEF1F8)),
// // //           boxShadow: [
// // //             BoxShadow(
// // //               color: Colors.black.withOpacity(0.05),
// // //               blurRadius: 10,
// // //               offset: const Offset(0, 3),
// // //             ),
// // //           ],
// // //         ),
// // //         child: Row(
// // //           crossAxisAlignment: CrossAxisAlignment.center,
// // //           children: [
// // //             // ── Product Icon ──
// // //             Container(
// // //               width: 58, height: 58,
// // //               decoration: BoxDecoration(
// // //                 color: p['bg'] as Color,
// // //                 borderRadius: BorderRadius.circular(14),
// // //               ),
// // //               child: Icon(p['icon'] as IconData,
// // //                   size: 28, color: p['color'] as Color),
// // //             ),
// // //             const SizedBox(width: 14),

// // //             // ── Info ──
// // //             Expanded(
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   // Name
// // //                   Text(p['name'] as String,
// // //                       maxLines: 1,
// // //                       overflow: TextOverflow.ellipsis,
// // //                       style: const TextStyle(
// // //                           fontSize: 13.5,
// // //                           fontWeight: FontWeight.w700,
// // //                           color: kBlack,
// // //                           height: 1.3)),
// // //                   const SizedBox(height: 4),

// // //                   // Seller + Stock
// // //                   Row(
// // //                     children: [
// // //                       const Icon(Icons.storefront_rounded,
// // //                           size: 12, color: kGrey),
// // //                       const SizedBox(width: 4),
// // //                       Flexible(
// // //                         child: Text(p['seller'] as String,
// // //                             overflow: TextOverflow.ellipsis,
// // //                             style: const TextStyle(
// // //                                 fontSize: 11.5,
// // //                                 color: kGrey,
// // //                                 fontWeight: FontWeight.w500)),
// // //                       ),
// // //                       const SizedBox(width: 8),
// // //                       Container(
// // //                         padding: const EdgeInsets.symmetric(
// // //                             horizontal: 7, vertical: 2),
// // //                         decoration: BoxDecoration(
// // //                           color: isLow
// // //                               ? const Color(0xFFFEF3C7)
// // //                               : const Color(0xFFDCFCE7),
// // //                           borderRadius: BorderRadius.circular(6),
// // //                         ),
// // //                         child: Text(p['stock'] as String,
// // //                             style: TextStyle(
// // //                                 fontSize: 9.5,
// // //                                 fontWeight: FontWeight.w700,
// // //                                 color: isLow
// // //                                     ? const Color(0xFFD97706)
// // //                                     : const Color(0xFF16A34A))),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                   const SizedBox(height: 6),

// // //                   // Stars
// // //                   Row(
// // //                     children: [
// // //                       ...List.generate(5, (i) => Padding(
// // //                         padding: const EdgeInsets.only(right: 1),
// // //                         child: Icon(
// // //                           i < (p['rating'] as double).floor()
// // //                               ? Icons.star_rounded
// // //                               : Icons.star_border_rounded,
// // //                           size: 13,
// // //                           color: const Color(0xFFF59E0B),
// // //                         ),
// // //                       )),
// // //                       const SizedBox(width: 5),
// // //                       Text('${p['rating']}  (${p['reviews']})',
// // //                           style: const TextStyle(
// // //                               fontSize: 11,
// // //                               color: kGrey,
// // //                               fontWeight: FontWeight.w500)),
// // //                     ],
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),

// // //             const SizedBox(width: 10),

// // //             // ── Price + Button ──
// // //             Column(
// // //               crossAxisAlignment: CrossAxisAlignment.end,
// // //               mainAxisAlignment: MainAxisAlignment.center,
// // //               children: [
// // //                 Text(p['price'] as String,
// // //                     style: const TextStyle(
// // //                         fontSize: 13.5,
// // //                         fontWeight: FontWeight.w800,
// // //                         color: kBlue)),
// // //                 const SizedBox(height: 2),
// // //                 Text(p['oldPrice'] as String,
// // //                     style: const TextStyle(
// // //                         fontSize: 10.5,
// // //                         color: kGrey,
// // //                         decoration: TextDecoration.lineThrough)),
// // //                 const SizedBox(height: 8),
// // //                 Container(
// // //                   padding: const EdgeInsets.symmetric(
// // //                       horizontal: 14, vertical: 7),
// // //                   decoration: BoxDecoration(
// // //                     color: kBlue,
// // //                     borderRadius: BorderRadius.circular(9),
// // //                     boxShadow: [
// // //                       BoxShadow(
// // //                           color: kBlue.withOpacity(0.3),
// // //                           blurRadius: 6,
// // //                           offset: const Offset(0, 2)),
// // //                     ],
// // //                   ),
// // //                   child: const Text('Buy Now',
// // //                       style: TextStyle(
// // //                           fontSize: 11,
// // //                           color: Colors.white,
// // //                           fontWeight: FontWeight.w700)),
// // //                 ),
// // //               ],
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }














// // // lib/screens/search_screen.dart

// // import 'package:flutter/material.dart';
// // import '../constants/app_colors.dart';

// // class SearchScreen extends StatefulWidget {
// //   const SearchScreen({super.key});

// //   @override
// //   State<SearchScreen> createState() => _SearchScreenState();
// // }

// // class _SearchScreenState extends State<SearchScreen> {
// //   final _searchCtrl = TextEditingController();
// //   final _focusNode  = FocusNode();
// //   String _query     = '';
// //   String _sortBy    = 'All';

// //   final List<String> _categories = [
// //     'All', 'Equipment', 'Testing', 'COVID-19', 'Homecare',
// //   ];

// //   List<String> _history = [
// //     'Surgical products', 'Masks', 'Syringe',
// //     'Student store products', 'Beds',
// //   ];

// //   final List<Map<String, dynamic>> _sellerProducts = [
// //     {
// //       'name':     'Surgical Knife – Pack of 10',
// //       'seller':   'MedSupply Co.',
// //       'location': 'Chennai, TN',
// //       'price':    'Rs.1,299.00',
// //       'oldPrice': 'Rs.1,800.00',
// //       'discount': '28% OFF',
// //       'stock':    'In Stock',
// //       'rating':   4.5,
// //       'reviews':  128,
// //       'icon':     Icons.content_cut_rounded,
// //       'color':    Color(0xFF0284C7),
// //       'bg':       Color(0xFFE0F2FE),
// //       'cat':      'Equipment',
// //       'sold':     '240+ sold',
// //     },
// //     {
// //       'name':     'N95 Masks – Box of 50',
// //       'seller':   'HealthMart India',
// //       'location': 'Mumbai, MH',
// //       'price':    'Rs.499.00',
// //       'oldPrice': 'Rs.699.00',
// //       'discount': '28% OFF',
// //       'stock':    'In Stock',
// //       'rating':   4.8,
// //       'reviews':  342,
// //       'icon':     Icons.masks_rounded,
// //       'color':    Color(0xFF16A34A),
// //       'bg':       Color(0xFFDCFCE7),
// //       'cat':      'COVID-19',
// //       'sold':     '1.2k+ sold',
// //     },
// //     {
// //       'name':     'Hospital Beds – Recliner Type',
// //       'seller':   'Veesafe Stores',
// //       'location': 'Bengaluru, KA',
// //       'price':    'Rs.12,500.00',
// //       'oldPrice': 'Rs.15,000.00',
// //       'discount': '16% OFF',
// //       'stock':    '3 Left',
// //       'rating':   4.2,
// //       'reviews':  56,
// //       'icon':     Icons.bed_rounded,
// //       'color':    Color(0xFF7C3AED),
// //       'bg':       Color(0xFFEDE9FE),
// //       'cat':      'Equipment',
// //       'sold':     '30+ sold',
// //     },
// //     {
// //       'name':     'Sethascope Pro – Cardiology',
// //       'seller':   'MediCare Plus',
// //       'location': 'Hyderabad, TS',
// //       'price':    'Rs.3,250.00',
// //       'oldPrice': 'Rs.4,500.00',
// //       'discount': '27% OFF',
// //       'stock':    'In Stock',
// //       'rating':   4.9,
// //       'reviews':  89,
// //       'icon':     Icons.hearing_rounded,
// //       'color':    Color(0xFFD97706),
// //       'bg':       Color(0xFFFEF3C7),
// //       'cat':      'Testing',
// //       'sold':     '95+ sold',
// //     },
// //     {
// //       'name':     'Disposable Syringes – 100 pcs',
// //       'seller':   'PharmaDirect',
// //       'location': 'Pune, MH',
// //       'price':    'Rs.349.00',
// //       'oldPrice': 'Rs.499.00',
// //       'discount': '30% OFF',
// //       'stock':    'In Stock',
// //       'rating':   4.6,
// //       'reviews':  215,
// //       'icon':     Icons.vaccines_rounded,
// //       'color':    Color(0xFFE11D48),
// //       'bg':       Color(0xFFFFE4E6),
// //       'cat':      'Equipment',
// //       'sold':     '780+ sold',
// //     },
// //     {
// //       'name':     'Oxygen Cylinder & Mask',
// //       'seller':   'GlobalMed Supplies',
// //       'location': 'Delhi, DL',
// //       'price':    'Rs.2,199.00',
// //       'oldPrice': 'Rs.3,000.00',
// //       'discount': '26% OFF',
// //       'stock':    '5 Left',
// //       'rating':   4.4,
// //       'reviews':  76,
// //       'icon':     Icons.air_rounded,
// //       'color':    Color(0xFF0284C7),
// //       'bg':       Color(0xFFE0F2FE),
// //       'cat':      'Equipment',
// //       'sold':     '120+ sold',
// //     },
// //     {
// //       'name':     'Blood Testing Device',
// //       'seller':   'DiagnoPlus',
// //       'location': 'Kolkata, WB',
// //       'price':    'Rs.3,250.00',
// //       'oldPrice': 'Rs.4,000.00',
// //       'discount': '18% OFF',
// //       'stock':    'In Stock',
// //       'rating':   4.7,
// //       'reviews':  193,
// //       'icon':     Icons.bloodtype_rounded,
// //       'color':    Color(0xFFE11D48),
// //       'bg':       Color(0xFFFFE4E6),
// //       'cat':      'Testing',
// //       'sold':     '310+ sold',
// //     },
// //     {
// //       'name':     'Walking Stick – Steel',
// //       'seller':   'CareHome Products',
// //       'location': 'Ahmedabad, GJ',
// //       'price':    'Rs.1,499.00',
// //       'oldPrice': 'Rs.1,999.00',
// //       'discount': '25% OFF',
// //       'stock':    'In Stock',
// //       'rating':   4.3,
// //       'reviews':  44,
// //       'icon':     Icons.accessibility_new_rounded,
// //       'color':    Color(0xFF16A34A),
// //       'bg':       Color(0xFFDCFCE7),
// //       'cat':      'Homecare',
// //       'sold':     '60+ sold',
// //     },
// //     {
// //       'name':     'Wheel Chair Premium',
// //       'seller':   'MobilityFirst',
// //       'location': 'Jaipur, RJ',
// //       'price':    'Rs.5,999.00',
// //       'oldPrice': 'Rs.7,500.00',
// //       'discount': '20% OFF',
// //       'stock':    '2 Left',
// //       'rating':   4.6,
// //       'reviews':  67,
// //       'icon':     Icons.wheelchair_pickup_rounded,
// //       'color':    Color(0xFF7C3AED),
// //       'bg':       Color(0xFFEDE9FE),
// //       'cat':      'Homecare',
// //       'sold':     '85+ sold',
// //     },
// //     {
// //       'name':     'First Aid Kit – Full Set',
// //       'seller':   'SafetyFirst India',
// //       'location': 'Puducherry, PY',
// //       'price':    'Rs.1,499.00',
// //       'oldPrice': 'Rs.1,999.00',
// //       'discount': '25% OFF',
// //       'stock':    'In Stock',
// //       'rating':   4.8,
// //       'reviews':  301,
// //       'icon':     Icons.medical_services_rounded,
// //       'color':    Color(0xFFD97706),
// //       'bg':       Color(0xFFFEF3C7),
// //       'cat':      'Equipment',
// //       'sold':     '520+ sold',
// //     },
// //   ];

// //   List<Map<String, dynamic>> get _results {
// //     List<Map<String, dynamic>> list = _sellerProducts;
// //     if (_sortBy != 'All') {
// //       list = list.where((p) => p['cat'] == _sortBy).toList();
// //     }
// //     if (_query.trim().isNotEmpty) {
// //       list = list.where((p) =>
// //           (p['name'] as String).toLowerCase().contains(_query.toLowerCase()) ||
// //           (p['seller'] as String).toLowerCase().contains(_query.toLowerCase()) ||
// //           (p['cat'] as String).toLowerCase().contains(_query.toLowerCase())).toList();
// //     }
// //     return list;
// //   }

// //   void _onSearch(String val) => setState(() => _query = val);

// //   void _addToHistory(String name) {
// //     if (!_history.contains(name)) {
// //       setState(() {
// //         _history.insert(0, name);
// //         if (_history.length > 8) _history.removeLast();
// //       });
// //     }
// //   }

// //   void _messageSeller(BuildContext context, Map<String, dynamic> p) {
// //     _addToHistory(p['name'] as String);
// //     showModalBottomSheet(
// //       context: context,
// //       isScrollControlled: true,
// //       backgroundColor: Colors.transparent,
// //       builder: (_) {
// //         final ctrl = TextEditingController(
// //             text: 'Hi, I am interested in "${p['name']}". Is it available?');
// //         return Padding(
// //           padding: EdgeInsets.only(
// //               bottom: MediaQuery.of(context).viewInsets.bottom),
// //           child: Container(
// //             decoration: const BoxDecoration(
// //               color: Colors.white,
// //               borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
// //             ),
// //             padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Center(
// //                   child: Container(
// //                     width: 40, height: 4,
// //                     decoration: BoxDecoration(
// //                         color: kBorderGrey,
// //                         borderRadius: BorderRadius.circular(10)),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 18),
// //                 Row(
// //                   children: [
// //                     Container(
// //                       width: 44, height: 44,
// //                       decoration: BoxDecoration(
// //                         color: p['bg'] as Color,
// //                         borderRadius: BorderRadius.circular(12),
// //                       ),
// //                       child: Icon(p['icon'] as IconData,
// //                           size: 22, color: p['color'] as Color),
// //                     ),
// //                     const SizedBox(width: 12),
// //                     Expanded(
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(p['name'] as String,
// //                               style: const TextStyle(
// //                                   fontSize: 13.5,
// //                                   fontWeight: FontWeight.w700,
// //                                   color: kBlack)),
// //                           Text('Seller: ${p['seller']}',
// //                               style: const TextStyle(
// //                                   fontSize: 12, color: kGrey)),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 16),
// //                 TextField(
// //                   controller: ctrl,
// //                   maxLines: 3,
// //                   decoration: InputDecoration(
// //                     labelText: 'Your message to seller',
// //                     labelStyle: const TextStyle(color: kGrey, fontSize: 13),
// //                     filled: true,
// //                     fillColor: kBlueLite,
// //                     border: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(12),
// //                         borderSide: BorderSide.none),
// //                     focusedBorder: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(12),
// //                         borderSide: const BorderSide(color: kBlue, width: 1.5)),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 16),
// //                 SizedBox(
// //                   width: double.infinity,
// //                   child: ElevatedButton.icon(
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: kBlue,
// //                       padding: const EdgeInsets.symmetric(vertical: 14),
// //                       shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(12)),
// //                     ),
// //                     icon: const Icon(Icons.send_rounded,
// //                         color: Colors.white, size: 18),
// //                     label: const Text('Send Message to Seller',
// //                         style: TextStyle(
// //                             color: Colors.white,
// //                             fontWeight: FontWeight.w700,
// //                             fontSize: 14)),
// //                     onPressed: () {
// //                       Navigator.pop(context);
// //                       ScaffoldMessenger.of(context).showSnackBar(
// //                         SnackBar(
// //                           content: Text(
// //                               'Message sent to ${p['seller']}!'),
// //                           backgroundColor: const Color(0xFF16A34A),
// //                           behavior: SnackBarBehavior.floating,
// //                           shape: RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(12)),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     _focusNode.addListener(() => setState(() {}));
// //   }

// //   @override
// //   void dispose() {
// //     _searchCtrl.dispose();
// //     _focusNode.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF5F7FA),
// //       body: SafeArea(
// //         child: Column(
// //           children: [
// //             _appBar(context),
// //             _searchBar(),
// //             _categoryBar(),
// //             Expanded(child: _body(context)),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   // ════════════════════════════════════════
// //   //  APP BAR
// //   // ════════════════════════════════════════
// //   Widget _appBar(BuildContext context) => Container(
// //         decoration: const BoxDecoration(
// //           gradient: LinearGradient(
// //             colors: [kBlue, Color(0xFF1A73E8)],
// //             begin: Alignment.centerLeft,
// //             end: Alignment.centerRight,
// //           ),
// //         ),
// //         padding: const EdgeInsets.fromLTRB(4, 8, 16, 12),
// //         child: Row(
// //           children: [
// //             IconButton(
// //               icon: const Icon(Icons.arrow_back_ios,
// //                   size: 18, color: Colors.white),
// //               onPressed: () => Navigator.pop(context),
// //             ),
// //             const Expanded(
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: [
// //                   Text('Buyer / Seller Marketplace',
// //                       style: TextStyle(
// //                           fontSize: 17,
// //                           fontWeight: FontWeight.w800,
// //                           color: Colors.white)),
// //                   SizedBox(height: 2),
// //                   Text('Find & message sellers directly',
// //                       style: TextStyle(
// //                           fontSize: 11.5, color: Colors.white70)),
// //                 ],
// //               ),
// //             ),
// //             Container(
// //               padding: const EdgeInsets.symmetric(
// //                   horizontal: 10, vertical: 5),
// //               decoration: BoxDecoration(
// //                 color: Colors.white.withOpacity(0.18),
// //                 borderRadius: BorderRadius.circular(20),
// //                 border: Border.all(
// //                     color: Colors.white.withOpacity(0.4)),
// //               ),
// //               child: Text('${_sellerProducts.length} Listings',
// //                   style: const TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 11,
// //                       fontWeight: FontWeight.w600)),
// //             ),
// //           ],
// //         ),
// //       );

// //   // ════════════════════════════════════════
// //   //  SEARCH BAR
// //   // ════════════════════════════════════════
// //   Widget _searchBar() => Container(
// //         color: Colors.white,
// //         padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
// //         child: Container(
// //           height: 48,
// //           decoration: BoxDecoration(
// //             color: const Color(0xFFF5F7FA),
// //             borderRadius: BorderRadius.circular(12),
// //             border: Border.all(
// //               color: _focusNode.hasFocus
// //                   ? kBlue
// //                   : const Color(0xFFE0E4ED),
// //               width: _focusNode.hasFocus ? 1.8 : 1.2,
// //             ),
// //             boxShadow: _focusNode.hasFocus
// //                 ? [BoxShadow(
// //                     color: kBlue.withOpacity(0.1),
// //                     blurRadius: 8,
// //                     offset: const Offset(0, 2))]
// //                 : [],
// //           ),
// //           child: Row(
// //             children: [
// //               const SizedBox(width: 14),
// //               Icon(Icons.search_rounded,
// //                   color: _focusNode.hasFocus
// //                       ? kBlue
// //                       : const Color(0xFF9AA5B4),
// //                   size: 21),
// //               const SizedBox(width: 10),
// //               Expanded(
// //                 child: TextField(
// //                   controller: _searchCtrl,
// //                   focusNode: _focusNode,
// //                   onChanged: _onSearch,
// //                   onSubmitted: (v) {
// //                     if (v.trim().isNotEmpty) _addToHistory(v.trim());
// //                   },
// //                   style: const TextStyle(
// //                       fontSize: 14,
// //                       color: kBlack,
// //                       fontWeight: FontWeight.w500),
// //                   decoration: const InputDecoration(
// //                     hintText: 'Search products or sellers...',
// //                     hintStyle: TextStyle(
// //                         color: Color(0xFFB0BEC5), fontSize: 13.5),
// //                     border: InputBorder.none,
// //                     isDense: true,
// //                     contentPadding: EdgeInsets.zero,
// //                   ),
// //                 ),
// //               ),
// //               if (_query.isNotEmpty)
// //                 GestureDetector(
// //                   onTap: () {
// //                     _searchCtrl.clear();
// //                     setState(() => _query = '');
// //                   },
// //                   child: Container(
// //                     margin: const EdgeInsets.only(right: 10),
// //                     width: 26, height: 26,
// //                     decoration: const BoxDecoration(
// //                       color: Color(0xFFE5E9F0),
// //                       shape: BoxShape.circle,
// //                     ),
// //                     child: const Icon(Icons.close_rounded,
// //                         color: kGrey, size: 15),
// //                   ),
// //                 )
// //               else
// //                 const SizedBox(width: 12),
// //             ],
// //           ),
// //         ),
// //       );

// //   // ════════════════════════════════════════
// //   //  CATEGORY FILTER BAR
// //   // ════════════════════════════════════════
// //   Widget _categoryBar() => Container(
// //         color: Colors.white,
// //         padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
// //         child: SingleChildScrollView(
// //           scrollDirection: Axis.horizontal,
// //           physics: const BouncingScrollPhysics(),
// //           child: Row(
// //             children: _categories.map((cat) {
// //               final selected = _sortBy == cat;
// //               return GestureDetector(
// //                 onTap: () => setState(() => _sortBy = cat),
// //                 child: AnimatedContainer(
// //                   duration: const Duration(milliseconds: 200),
// //                   margin: const EdgeInsets.only(right: 8),
// //                   padding: const EdgeInsets.symmetric(
// //                       horizontal: 16, vertical: 7),
// //                   decoration: BoxDecoration(
// //                     color: selected ? kBlue : Colors.white,
// //                     borderRadius: BorderRadius.circular(30),
// //                     border: Border.all(
// //                       color: selected ? kBlue : const Color(0xFFDDE2EA),
// //                     ),
// //                     boxShadow: selected
// //                         ? [BoxShadow(
// //                             color: kBlue.withOpacity(0.25),
// //                             blurRadius: 8,
// //                             offset: const Offset(0, 2))]
// //                         : [],
// //                   ),
// //                   child: Text(cat,
// //                       style: TextStyle(
// //                           fontSize: 12.5,
// //                           fontWeight: FontWeight.w600,
// //                           color: selected
// //                               ? Colors.white
// //                               : const Color(0xFF555F6D))),
// //                 ),
// //               );
// //             }).toList(),
// //           ),
// //         ),
// //       );

// //   // ════════════════════════════════════════
// //   //  BODY
// //   // ════════════════════════════════════════
// //   Widget _body(BuildContext context) {
// //     final list = _results;
// //     if (list.isEmpty) {
// //       return Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Container(
// //               width: 80, height: 80,
// //               decoration: const BoxDecoration(
// //                   color: kBlueLite, shape: BoxShape.circle),
// //               child: const Icon(Icons.search_off_rounded,
// //                   color: kBlue, size: 36)),
// //             const SizedBox(height: 18),
// //             Text('No listings for "$_query"',
// //                 style: const TextStyle(
// //                     fontSize: 16,
// //                     fontWeight: FontWeight.w700,
// //                     color: kBlack)),
// //             const SizedBox(height: 6),
// //             const Text('Try a different keyword or category',
// //                 style: TextStyle(fontSize: 13, color: kGrey)),
// //           ],
// //         ),
// //       );
// //     }
// //     return CustomScrollView(
// //       physics: const BouncingScrollPhysics(),
// //       slivers: [
// //         // ── Header ──
// //         SliverToBoxAdapter(
// //           child: Padding(
// //             padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
// //             child: Row(
// //               children: [
// //                 Container(width: 4, height: 18,
// //                     decoration: BoxDecoration(
// //                         color: kBlue,
// //                         borderRadius: BorderRadius.circular(4))),
// //                 const SizedBox(width: 8),
// //                 Text(
// //                   _query.isEmpty
// //                       ? '${list.length} Listings Available'
// //                       : '${list.length} results for "$_query"',
// //                   style: const TextStyle(
// //                       fontSize: 14,
// //                       fontWeight: FontWeight.w700,
// //                       color: kBlack),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),

// //         // ── Product List ──
// //         SliverList(
// //           delegate: SliverChildBuilderDelegate(
// //             (_, i) => Padding(
// //               padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
// //               child: _productCard(context, list[i]),
// //             ),
// //             childCount: list.length,
// //           ),
// //         ),

// //         // ── History ──
// //         if (_history.isNotEmpty && _query.isEmpty) ...[
// //           SliverToBoxAdapter(
// //             child: Padding(
// //               padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
// //               child: Row(
// //                 children: [
// //                   Container(width: 4, height: 18,
// //                       decoration: BoxDecoration(
// //                           color: kGrey,
// //                           borderRadius: BorderRadius.circular(4))),
// //                   const SizedBox(width: 8),
// //                   const Text('Recent Searches',
// //                       style: TextStyle(
// //                           fontSize: 14,
// //                           fontWeight: FontWeight.w700,
// //                           color: kBlack)),
// //                   const Spacer(),
// //                   GestureDetector(
// //                     onTap: () => setState(() => _history.clear()),
// //                     child: const Text('Clear all',
// //                         style: TextStyle(
// //                             fontSize: 12,
// //                             color: Colors.red,
// //                             fontWeight: FontWeight.w600)),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           SliverToBoxAdapter(
// //             child: Padding(
// //               padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
// //               child: Wrap(
// //                 spacing: 8, runSpacing: 8,
// //                 children: _history.map((h) => GestureDetector(
// //                   onTap: () {
// //                     _searchCtrl.text = h;
// //                     _onSearch(h);
// //                   },
// //                   child: Container(
// //                     padding: const EdgeInsets.symmetric(
// //                         horizontal: 14, vertical: 9),
// //                     decoration: BoxDecoration(
// //                       color: Colors.white,
// //                       borderRadius: BorderRadius.circular(30),
// //                       border: Border.all(
// //                           color: const Color(0xFFE0E4ED)),
// //                       boxShadow: [
// //                         BoxShadow(
// //                             color: Colors.black.withOpacity(0.04),
// //                             blurRadius: 5,
// //                             offset: const Offset(0, 1)),
// //                       ],
// //                     ),
// //                     child: Row(
// //                       mainAxisSize: MainAxisSize.min,
// //                       children: [
// //                         const Icon(Icons.history_rounded,
// //                             size: 13, color: kGrey),
// //                         const SizedBox(width: 5),
// //                         Text(h,
// //                             style: const TextStyle(
// //                                 fontSize: 12.5,
// //                                 color: kBlack,
// //                                 fontWeight: FontWeight.w500)),
// //                       ],
// //                     ),
// //                   ),
// //                 )).toList(),
// //               ),
// //             ),
// //           ),
// //         ],

// //         const SliverToBoxAdapter(child: SizedBox(height: 20)),
// //       ],
// //     );
// //   }

// //   // ════════════════════════════════════════
// //   //  PRODUCT CARD — Amazon style
// //   // ════════════════════════════════════════
// //   Widget _productCard(BuildContext context, Map<String, dynamic> p) {
// //     final isLow = (p['stock'] as String).contains('Left');
// //     return Container(
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(16),
// //         border: Border.all(color: const Color(0xFFEEF1F8)),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.06),
// //             blurRadius: 12,
// //             offset: const Offset(0, 4),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // ── Top: Icon + Name + Price ──
// //           Padding(
// //             padding: const EdgeInsets.all(14),
// //             child: Row(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 // Icon box
// //                 Container(
// //                   width: 64, height: 64,
// //                   decoration: BoxDecoration(
// //                     color: p['bg'] as Color,
// //                     borderRadius: BorderRadius.circular(14),
// //                   ),
// //                   child: Icon(p['icon'] as IconData,
// //                       size: 30, color: p['color'] as Color),
// //                 ),
// //                 const SizedBox(width: 14),

// //                 // Name + seller + location
// //                 Expanded(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(p['name'] as String,
// //                           maxLines: 2,
// //                           overflow: TextOverflow.ellipsis,
// //                           style: const TextStyle(
// //                               fontSize: 14,
// //                               fontWeight: FontWeight.w700,
// //                               color: kBlack,
// //                               height: 1.35)),
// //                       const SizedBox(height: 5),
// //                       Row(
// //                         children: [
// //                           const Icon(Icons.storefront_rounded,
// //                               size: 12, color: kGrey),
// //                           const SizedBox(width: 4),
// //                           Flexible(
// //                             child: Text(p['seller'] as String,
// //                                 overflow: TextOverflow.ellipsis,
// //                                 style: const TextStyle(
// //                                     fontSize: 12,
// //                                     color: kBlue,
// //                                     fontWeight: FontWeight.w600)),
// //                           ),
// //                         ],
// //                       ),
// //                       const SizedBox(height: 3),
// //                       Row(
// //                         children: [
// //                           const Icon(Icons.location_on_rounded,
// //                               size: 12, color: kGrey),
// //                           const SizedBox(width: 3),
// //                           Text(p['location'] as String,
// //                               style: const TextStyle(
// //                                   fontSize: 11.5,
// //                                   color: kGrey)),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),

// //           // ── Divider ──
// //           const Divider(height: 1, color: Color(0xFFF0F2F8)),

// //           // ── Bottom: Rating + Price + Buttons ──
// //           Padding(
// //             padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
// //             child: Row(
// //               children: [
// //                 // Left: rating + sold + stock
// //                 Expanded(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       // Stars
// //                       Row(
// //                         children: [
// //                           ...List.generate(5, (i) => Icon(
// //                             i < (p['rating'] as double).floor()
// //                                 ? Icons.star_rounded
// //                                 : Icons.star_border_rounded,
// //                             size: 14,
// //                             color: const Color(0xFFF59E0B),
// //                           )),
// //                           const SizedBox(width: 5),
// //                           Text('${p['rating']}',
// //                               style: const TextStyle(
// //                                   fontSize: 12,
// //                                   fontWeight: FontWeight.w700,
// //                                   color: kBlack)),
// //                           const SizedBox(width: 4),
// //                           Text('(${p['reviews']})',
// //                               style: const TextStyle(
// //                                   fontSize: 11.5, color: kGrey)),
// //                         ],
// //                       ),
// //                       const SizedBox(height: 5),
// //                       Row(
// //                         children: [
// //                           // Sold count
// //                           Text(p['sold'] as String,
// //                               style: const TextStyle(
// //                                   fontSize: 11,
// //                                   color: kGrey,
// //                                   fontWeight: FontWeight.w500)),
// //                           const SizedBox(width: 8),
// //                           // Stock badge
// //                           Container(
// //                             padding: const EdgeInsets.symmetric(
// //                                 horizontal: 8, vertical: 3),
// //                             decoration: BoxDecoration(
// //                               color: isLow
// //                                   ? const Color(0xFFFEF3C7)
// //                                   : const Color(0xFFDCFCE7),
// //                               borderRadius: BorderRadius.circular(6),
// //                             ),
// //                             child: Text(p['stock'] as String,
// //                                 style: TextStyle(
// //                                     fontSize: 10,
// //                                     fontWeight: FontWeight.w700,
// //                                     color: isLow
// //                                         ? const Color(0xFFD97706)
// //                                         : const Color(0xFF16A34A))),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),

// //                 // Right: price + buttons
// //                 Column(
// //                   crossAxisAlignment: CrossAxisAlignment.end,
// //                   children: [
// //                     // Discount badge
// //                     Container(
// //                       padding: const EdgeInsets.symmetric(
// //                           horizontal: 7, vertical: 2),
// //                       decoration: BoxDecoration(
// //                         color: const Color(0xFFFFE4E6),
// //                         borderRadius: BorderRadius.circular(6),
// //                       ),
// //                       child: Text(p['discount'] as String,
// //                           style: const TextStyle(
// //                               fontSize: 10,
// //                               color: Color(0xFFE11D48),
// //                               fontWeight: FontWeight.w700)),
// //                     ),
// //                     const SizedBox(height: 3),
// //                     Text(p['price'] as String,
// //                         style: const TextStyle(
// //                             fontSize: 15,
// //                             fontWeight: FontWeight.w800,
// //                             color: kBlack)),
// //                     Text(p['oldPrice'] as String,
// //                         style: const TextStyle(
// //                             fontSize: 11,
// //                             color: kGrey,
// //                             decoration: TextDecoration.lineThrough)),
// //                     const SizedBox(height: 8),
// //                     // Message Seller button
// //                     GestureDetector(
// //                       onTap: () => _messageSeller(context, p),
// //                       child: Container(
// //                         padding: const EdgeInsets.symmetric(
// //                             horizontal: 16, vertical: 8),
// //                         decoration: BoxDecoration(
// //                           color: kBlue,
// //                           borderRadius: BorderRadius.circular(10),
// //                           boxShadow: [
// //                             BoxShadow(
// //                                 color: kBlue.withOpacity(0.3),
// //                                 blurRadius: 6,
// //                                 offset: const Offset(0, 2)),
// //                           ],
// //                         ),
// //                         child: const Row(
// //                           mainAxisSize: MainAxisSize.min,
// //                           children: [
// //                             Icon(Icons.chat_bubble_rounded,
// //                                 color: Colors.white, size: 13),
// //                             SizedBox(width: 5),
// //                             Text('Message Seller',
// //                                 style: TextStyle(
// //                                     fontSize: 11.5,
// //                                     color: Colors.white,
// //                                     fontWeight: FontWeight.w700)),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }












// // lib/screens/search_screen.dart

// import 'package:flutter/material.dart';
// import '../constants/app_colors.dart';
// import 'message_store.dart';
// import 'notification_store.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final _searchCtrl = TextEditingController();
//   final _focusNode  = FocusNode();
//   String _query     = '';
//   String _sortBy    = 'All';

//   final List<String> _categories = [
//     'All', 'Equipment', 'Testing', 'COVID-19', 'Homecare',
//   ];

//   List<String> _history = [
//     'Surgical products', 'Masks', 'Syringe',
//     'Student store products', 'Beds',
//   ];

//   final List<Map<String, dynamic>> _sellerProducts = [
//     {
//       'name':     'Surgical Knife – Pack of 10',
//       'seller':   'MedSupply Co.',
//       'location': 'Chennai, TN',
//       'price':    'Rs.1,299.00',
//       'oldPrice': 'Rs.1,800.00',
//       'discount': '28% OFF',
//       'stock':    'In Stock',
//       'rating':   4.5,
//       'reviews':  128,
//       'icon':     Icons.content_cut_rounded,
//       'color':    Color(0xFF0284C7),
//       'bg':       Color(0xFFE0F2FE),
//       'cat':      'Equipment',
//       'sold':     '240+ sold',
//     },
//     {
//       'name':     'N95 Masks – Box of 50',
//       'seller':   'HealthMart India',
//       'location': 'Mumbai, MH',
//       'price':    'Rs.499.00',
//       'oldPrice': 'Rs.699.00',
//       'discount': '28% OFF',
//       'stock':    'In Stock',
//       'rating':   4.8,
//       'reviews':  342,
//       'icon':     Icons.masks_rounded,
//       'color':    Color(0xFF16A34A),
//       'bg':       Color(0xFFDCFCE7),
//       'cat':      'COVID-19',
//       'sold':     '1.2k+ sold',
//     },
//     {
//       'name':     'Hospital Beds – Recliner Type',
//       'seller':   'Veesafe Stores',
//       'location': 'Bengaluru, KA',
//       'price':    'Rs.12,500.00',
//       'oldPrice': 'Rs.15,000.00',
//       'discount': '16% OFF',
//       'stock':    '3 Left',
//       'rating':   4.2,
//       'reviews':  56,
//       'icon':     Icons.bed_rounded,
//       'color':    Color(0xFF7C3AED),
//       'bg':       Color(0xFFEDE9FE),
//       'cat':      'Equipment',
//       'sold':     '30+ sold',
//     },
//     {
//       'name':     'Sethascope Pro – Cardiology',
//       'seller':   'MediCare Plus',
//       'location': 'Hyderabad, TS',
//       'price':    'Rs.3,250.00',
//       'oldPrice': 'Rs.4,500.00',
//       'discount': '27% OFF',
//       'stock':    'In Stock',
//       'rating':   4.9,
//       'reviews':  89,
//       'icon':     Icons.hearing_rounded,
//       'color':    Color(0xFFD97706),
//       'bg':       Color(0xFFFEF3C7),
//       'cat':      'Testing',
//       'sold':     '95+ sold',
//     },
//     {
//       'name':     'Disposable Syringes – 100 pcs',
//       'seller':   'PharmaDirect',
//       'location': 'Pune, MH',
//       'price':    'Rs.349.00',
//       'oldPrice': 'Rs.499.00',
//       'discount': '30% OFF',
//       'stock':    'In Stock',
//       'rating':   4.6,
//       'reviews':  215,
//       'icon':     Icons.vaccines_rounded,
//       'color':    Color(0xFFE11D48),
//       'bg':       Color(0xFFFFE4E6),
//       'cat':      'Equipment',
//       'sold':     '780+ sold',
//     },
//     {
//       'name':     'Oxygen Cylinder & Mask',
//       'seller':   'GlobalMed Supplies',
//       'location': 'Delhi, DL',
//       'price':    'Rs.2,199.00',
//       'oldPrice': 'Rs.3,000.00',
//       'discount': '26% OFF',
//       'stock':    '5 Left',
//       'rating':   4.4,
//       'reviews':  76,
//       'icon':     Icons.air_rounded,
//       'color':    Color(0xFF0284C7),
//       'bg':       Color(0xFFE0F2FE),
//       'cat':      'Equipment',
//       'sold':     '120+ sold',
//     },
//     {
//       'name':     'Blood Testing Device',
//       'seller':   'DiagnoPlus',
//       'location': 'Kolkata, WB',
//       'price':    'Rs.3,250.00',
//       'oldPrice': 'Rs.4,000.00',
//       'discount': '18% OFF',
//       'stock':    'In Stock',
//       'rating':   4.7,
//       'reviews':  193,
//       'icon':     Icons.bloodtype_rounded,
//       'color':    Color(0xFFE11D48),
//       'bg':       Color(0xFFFFE4E6),
//       'cat':      'Testing',
//       'sold':     '310+ sold',
//     },
//     {
//       'name':     'Walking Stick – Steel',
//       'seller':   'CareHome Products',
//       'location': 'Ahmedabad, GJ',
//       'price':    'Rs.1,499.00',
//       'oldPrice': 'Rs.1,999.00',
//       'discount': '25% OFF',
//       'stock':    'In Stock',
//       'rating':   4.3,
//       'reviews':  44,
//       'icon':     Icons.accessibility_new_rounded,
//       'color':    Color(0xFF16A34A),
//       'bg':       Color(0xFFDCFCE7),
//       'cat':      'Homecare',
//       'sold':     '60+ sold',
//     },
//     {
//       'name':     'Wheel Chair Premium',
//       'seller':   'MobilityFirst',
//       'location': 'Jaipur, RJ',
//       'price':    'Rs.5,999.00',
//       'oldPrice': 'Rs.7,500.00',
//       'discount': '20% OFF',
//       'stock':    '2 Left',
//       'rating':   4.6,
//       'reviews':  67,
//       'icon':     Icons.wheelchair_pickup_rounded,
//       'color':    Color(0xFF7C3AED),
//       'bg':       Color(0xFFEDE9FE),
//       'cat':      'Homecare',
//       'sold':     '85+ sold',
//     },
//     {
//       'name':     'First Aid Kit – Full Set',
//       'seller':   'SafetyFirst India',
//       'location': 'Puducherry, PY',
//       'price':    'Rs.1,499.00',
//       'oldPrice': 'Rs.1,999.00',
//       'discount': '25% OFF',
//       'stock':    'In Stock',
//       'rating':   4.8,
//       'reviews':  301,
//       'icon':     Icons.medical_services_rounded,
//       'color':    Color(0xFFD97706),
//       'bg':       Color(0xFFFEF3C7),
//       'cat':      'Equipment',
//       'sold':     '520+ sold',
//     },
//   ];

//   List<Map<String, dynamic>> get _results {
//     List<Map<String, dynamic>> list = _sellerProducts;
//     if (_sortBy != 'All') {
//       list = list.where((p) => p['cat'] == _sortBy).toList();
//     }
//     if (_query.trim().isNotEmpty) {
//       list = list.where((p) =>
//           (p['name'] as String).toLowerCase().contains(_query.toLowerCase()) ||
//           (p['seller'] as String).toLowerCase().contains(_query.toLowerCase()) ||
//           (p['cat'] as String).toLowerCase().contains(_query.toLowerCase())).toList();
//     }
//     return list;
//   }

//   void _onSearch(String val) => setState(() => _query = val);

//   void _addToHistory(String name) {
//     if (!_history.contains(name)) {
//       setState(() {
//         _history.insert(0, name);
//         if (_history.length > 8) _history.removeLast();
//       });
//     }
//   }

//   void _messageSeller(BuildContext context, Map<String, dynamic> p) {
//     _addToHistory(p['name'] as String);
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (_) {
//         final ctrl = TextEditingController(
//             text: 'Hi, I am interested in "${p['name']}". Is it available?');
//         return Padding(
//           padding: EdgeInsets.only(
//               bottom: MediaQuery.of(context).viewInsets.bottom),
//           child: Container(
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//             ),
//             padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Container(
//                     width: 40, height: 4,
//                     decoration: BoxDecoration(
//                         color: kBorderGrey,
//                         borderRadius: BorderRadius.circular(10)),
//                   ),
//                 ),
//                 const SizedBox(height: 18),
//                 Row(
//                   children: [
//                     Container(
//                       width: 44, height: 44,
//                       decoration: BoxDecoration(
//                         color: p['bg'] as Color,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Icon(p['icon'] as IconData,
//                           size: 22, color: p['color'] as Color),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(p['name'] as String,
//                               style: const TextStyle(
//                                   fontSize: 13.5,
//                                   fontWeight: FontWeight.w700,
//                                   color: kBlack)),
//                           Text('Seller: ${p['seller']}',
//                               style: const TextStyle(
//                                   fontSize: 12, color: kGrey)),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 TextField(
//                   controller: ctrl,
//                   maxLines: 3,
//                   decoration: InputDecoration(
//                     labelText: 'Your message to seller',
//                     labelStyle: const TextStyle(color: kGrey, fontSize: 13),
//                     filled: true,
//                     fillColor: kBlueLite,
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: BorderSide.none),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: kBlue, width: 1.5)),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton.icon(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: kBlue,
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12)),
//                     ),
//                     icon: const Icon(Icons.send_rounded,
//                         color: Colors.white, size: 18),
//                     label: const Text('Send Message to Seller',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w700,
//                             fontSize: 14)),
//                     onPressed: () {
//                       final now = DateTime.now();
//                       final hour = now.hour > 12 ? now.hour - 12 : (now.hour == 0 ? 12 : now.hour);
//                       final min  = now.minute.toString().padLeft(2, '0');
//                       final ampm = now.hour >= 12 ? 'PM' : 'AM';
//                       final timeStr = '$hour:$min $ampm';

//                       // ── Add to Messages tab ──
//                       MessageStore.messages.insert(0, {
//                         'product':   p['name'],
//                         'seller':    p['seller'],
//                         'myMessage': ctrl.text.trim(),
//                         'reply':     '',
//                         'time':      timeStr,
//                         'hasReply':  false,
//                         'icon':      p['icon'],
//                         'color':     p['color'],
//                         'bg':        p['bg'],
//                         'price':     p['price'],
//                       });

//                       // ── Add to Today notifications ──
//                       NotificationStore.todayNotifs.insert(0, {
//                         'icon':      Icons.chat_bubble_rounded,
//                         'iconBg':    p['bg'],
//                         'iconColor': p['color'],
//                         'title':     'Message sent to ${p['seller']}',
//                         'subtitle':  ctrl.text.trim(),
//                         'time':      timeStr,
//                         'unread':    true,
//                       });

//                       Navigator.pop(context);
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text('Message sent to ${p['seller']}!'),
//                           backgroundColor: const Color(0xFF16A34A),
//                           behavior: SnackBarBehavior.floating,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12)),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(() => setState(() {}));
//   }

//   @override
//   void dispose() {
//     _searchCtrl.dispose();
//     _focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F7FA),
//       body: SafeArea(
//         child: Column(
//           children: [
//             _appBar(context),
//             _searchBar(),
//             _categoryBar(),
//             Expanded(child: _body(context)),
//           ],
//         ),
//       ),
//     );
//   }

//   // ════════════════════════════════════════
//   //  APP BAR
//   // ════════════════════════════════════════
//   Widget _appBar(BuildContext context) => Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [kBlue, Color(0xFF1A73E8)],
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//           ),
//         ),
//         padding: const EdgeInsets.fromLTRB(4, 8, 16, 12),
//         child: Row(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.arrow_back_ios,
//                   size: 18, color: Colors.white),
//               onPressed: () => Navigator.pop(context),
//             ),
//             const Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text('Buyer / Seller Marketplace',
//                       style: TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.w800,
//                           color: Colors.white)),
//                   SizedBox(height: 2),
//                   Text('Find & message sellers directly',
//                       style: TextStyle(
//                           fontSize: 11.5, color: Colors.white70)),
//                 ],
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: 10, vertical: 5),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.18),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(
//                     color: Colors.white.withOpacity(0.4)),
//               ),
//               child: Text('${_sellerProducts.length} Listings',
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 11,
//                       fontWeight: FontWeight.w600)),
//             ),
//           ],
//         ),
//       );

//   // ════════════════════════════════════════
//   //  SEARCH BAR
//   // ════════════════════════════════════════
//   Widget _searchBar() => Container(
//         color: Colors.white,
//         padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
//         child: Container(
//           height: 48,
//           decoration: BoxDecoration(
//             color: const Color(0xFFF5F7FA),
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(
//               color: _focusNode.hasFocus
//                   ? kBlue
//                   : const Color(0xFFE0E4ED),
//               width: _focusNode.hasFocus ? 1.8 : 1.2,
//             ),
//             boxShadow: _focusNode.hasFocus
//                 ? [BoxShadow(
//                     color: kBlue.withOpacity(0.1),
//                     blurRadius: 8,
//                     offset: const Offset(0, 2))]
//                 : [],
//           ),
//           child: Row(
//             children: [
//               const SizedBox(width: 14),
//               Icon(Icons.search_rounded,
//                   color: _focusNode.hasFocus
//                       ? kBlue
//                       : const Color(0xFF9AA5B4),
//                   size: 21),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: TextField(
//                   controller: _searchCtrl,
//                   focusNode: _focusNode,
//                   onChanged: _onSearch,
//                   onSubmitted: (v) {
//                     if (v.trim().isNotEmpty) _addToHistory(v.trim());
//                   },
//                   style: const TextStyle(
//                       fontSize: 14,
//                       color: kBlack,
//                       fontWeight: FontWeight.w500),
//                   decoration: const InputDecoration(
//                     hintText: 'Search products or sellers...',
//                     hintStyle: TextStyle(
//                         color: Color(0xFFB0BEC5), fontSize: 13.5),
//                     border: InputBorder.none,
//                     isDense: true,
//                     contentPadding: EdgeInsets.zero,
//                   ),
//                 ),
//               ),
//               if (_query.isNotEmpty)
//                 GestureDetector(
//                   onTap: () {
//                     _searchCtrl.clear();
//                     setState(() => _query = '');
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.only(right: 10),
//                     width: 26, height: 26,
//                     decoration: const BoxDecoration(
//                       color: Color(0xFFE5E9F0),
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(Icons.close_rounded,
//                         color: kGrey, size: 15),
//                   ),
//                 )
//               else
//                 const SizedBox(width: 12),
//             ],
//           ),
//         ),
//       );

//   // ════════════════════════════════════════
//   //  CATEGORY FILTER BAR
//   // ════════════════════════════════════════
//   Widget _categoryBar() => Container(
//         color: Colors.white,
//         padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           physics: const BouncingScrollPhysics(),
//           child: Row(
//             children: _categories.map((cat) {
//               final selected = _sortBy == cat;
//               return GestureDetector(
//                 onTap: () => setState(() => _sortBy = cat),
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 200),
//                   margin: const EdgeInsets.only(right: 8),
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 16, vertical: 7),
//                   decoration: BoxDecoration(
//                     color: selected ? kBlue : Colors.white,
//                     borderRadius: BorderRadius.circular(30),
//                     border: Border.all(
//                       color: selected ? kBlue : const Color(0xFFDDE2EA),
//                     ),
//                     boxShadow: selected
//                         ? [BoxShadow(
//                             color: kBlue.withOpacity(0.25),
//                             blurRadius: 8,
//                             offset: const Offset(0, 2))]
//                         : [],
//                   ),
//                   child: Text(cat,
//                       style: TextStyle(
//                           fontSize: 12.5,
//                           fontWeight: FontWeight.w600,
//                           color: selected
//                               ? Colors.white
//                               : const Color(0xFF555F6D))),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       );

//   // ════════════════════════════════════════
//   //  BODY
//   // ════════════════════════════════════════
//   Widget _body(BuildContext context) {
//     final list = _results;
//     if (list.isEmpty) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 80, height: 80,
//               decoration: const BoxDecoration(
//                   color: kBlueLite, shape: BoxShape.circle),
//               child: const Icon(Icons.search_off_rounded,
//                   color: kBlue, size: 36)),
//             const SizedBox(height: 18),
//             Text('No listings for "$_query"',
//                 style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w700,
//                     color: kBlack)),
//             const SizedBox(height: 6),
//             const Text('Try a different keyword or category',
//                 style: TextStyle(fontSize: 13, color: kGrey)),
//           ],
//         ),
//       );
//     }
//     return CustomScrollView(
//       physics: const BouncingScrollPhysics(),
//       slivers: [
//         // ── Header ──
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
//             child: Row(
//               children: [
//                 Container(width: 4, height: 18,
//                     decoration: BoxDecoration(
//                         color: kBlue,
//                         borderRadius: BorderRadius.circular(4))),
//                 const SizedBox(width: 8),
//                 Text(
//                   _query.isEmpty
//                       ? '${list.length} Listings Available'
//                       : '${list.length} results for "$_query"',
//                   style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w700,
//                       color: kBlack),
//                 ),
//               ],
//             ),
//           ),
//         ),

//         // ── Product List ──
//         SliverList(
//           delegate: SliverChildBuilderDelegate(
//             (_, i) => Padding(
//               padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
//               child: _productCard(context, list[i]),
//             ),
//             childCount: list.length,
//           ),
//         ),

//         // ── History ──
//         if (_history.isNotEmpty && _query.isEmpty) ...[
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
//               child: Row(
//                 children: [
//                   Container(width: 4, height: 18,
//                       decoration: BoxDecoration(
//                           color: kGrey,
//                           borderRadius: BorderRadius.circular(4))),
//                   const SizedBox(width: 8),
//                   const Text('Recent Searches',
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w700,
//                           color: kBlack)),
//                   const Spacer(),
//                   GestureDetector(
//                     onTap: () => setState(() => _history.clear()),
//                     child: const Text('Clear all',
//                         style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.red,
//                             fontWeight: FontWeight.w600)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
//               child: Wrap(
//                 spacing: 8, runSpacing: 8,
//                 children: _history.map((h) => GestureDetector(
//                   onTap: () {
//                     _searchCtrl.text = h;
//                     _onSearch(h);
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 14, vertical: 9),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                       border: Border.all(
//                           color: const Color(0xFFE0E4ED)),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.black.withOpacity(0.04),
//                             blurRadius: 5,
//                             offset: const Offset(0, 1)),
//                       ],
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         const Icon(Icons.history_rounded,
//                             size: 13, color: kGrey),
//                         const SizedBox(width: 5),
//                         Text(h,
//                             style: const TextStyle(
//                                 fontSize: 12.5,
//                                 color: kBlack,
//                                 fontWeight: FontWeight.w500)),
//                       ],
//                     ),
//                   ),
//                 )).toList(),
//               ),
//             ),
//           ),
//         ],

//         const SliverToBoxAdapter(child: SizedBox(height: 20)),
//       ],
//     );
//   }

//   // ════════════════════════════════════════
//   //  PRODUCT CARD — Amazon style
//   // ════════════════════════════════════════
//   Widget _productCard(BuildContext context, Map<String, dynamic> p) {
//     final isLow = (p['stock'] as String).contains('Left');
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: const Color(0xFFEEF1F8)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             blurRadius: 12,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // ── Top: Icon + Name + Price ──
//           Padding(
//             padding: const EdgeInsets.all(14),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Icon box
//                 Container(
//                   width: 64, height: 64,
//                   decoration: BoxDecoration(
//                     color: p['bg'] as Color,
//                     borderRadius: BorderRadius.circular(14),
//                   ),
//                   child: Icon(p['icon'] as IconData,
//                       size: 30, color: p['color'] as Color),
//                 ),
//                 const SizedBox(width: 14),

//                 // Name + seller + location
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(p['name'] as String,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w700,
//                               color: kBlack,
//                               height: 1.35)),
//                       const SizedBox(height: 5),
//                       Row(
//                         children: [
//                           const Icon(Icons.storefront_rounded,
//                               size: 12, color: kGrey),
//                           const SizedBox(width: 4),
//                           Flexible(
//                             child: Text(p['seller'] as String,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: const TextStyle(
//                                     fontSize: 12,
//                                     color: kBlue,
//                                     fontWeight: FontWeight.w600)),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 3),
//                       Row(
//                         children: [
//                           const Icon(Icons.location_on_rounded,
//                               size: 12, color: kGrey),
//                           const SizedBox(width: 3),
//                           Text(p['location'] as String,
//                               style: const TextStyle(
//                                   fontSize: 11.5,
//                                   color: kGrey)),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // ── Divider ──
//           const Divider(height: 1, color: Color(0xFFF0F2F8)),

//           // ── Bottom: Rating + Price + Buttons ──
//           Padding(
//             padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
//             child: Row(
//               children: [
//                 // Left: rating + sold + stock
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Stars
//                       Row(
//                         children: [
//                           ...List.generate(5, (i) => Icon(
//                             i < (p['rating'] as double).floor()
//                                 ? Icons.star_rounded
//                                 : Icons.star_border_rounded,
//                             size: 14,
//                             color: const Color(0xFFF59E0B),
//                           )),
//                           const SizedBox(width: 5),
//                           Text('${p['rating']}',
//                               style: const TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w700,
//                                   color: kBlack)),
//                           const SizedBox(width: 4),
//                           Text('(${p['reviews']})',
//                               style: const TextStyle(
//                                   fontSize: 11.5, color: kGrey)),
//                         ],
//                       ),
//                       const SizedBox(height: 5),
//                       Row(
//                         children: [
//                           // Sold count
//                           Text(p['sold'] as String,
//                               style: const TextStyle(
//                                   fontSize: 11,
//                                   color: kGrey,
//                                   fontWeight: FontWeight.w500)),
//                           const SizedBox(width: 8),
//                           // Stock badge
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 8, vertical: 3),
//                             decoration: BoxDecoration(
//                               color: isLow
//                                   ? const Color(0xFFFEF3C7)
//                                   : const Color(0xFFDCFCE7),
//                               borderRadius: BorderRadius.circular(6),
//                             ),
//                             child: Text(p['stock'] as String,
//                                 style: TextStyle(
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.w700,
//                                     color: isLow
//                                         ? const Color(0xFFD97706)
//                                         : const Color(0xFF16A34A))),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Right: price + buttons
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     // Discount badge
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 7, vertical: 2),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFFFE4E6),
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: Text(p['discount'] as String,
//                           style: const TextStyle(
//                               fontSize: 10,
//                               color: Color(0xFFE11D48),
//                               fontWeight: FontWeight.w700)),
//                     ),
//                     const SizedBox(height: 3),
//                     Text(p['price'] as String,
//                         style: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w800,
//                             color: kBlack)),
//                     Text(p['oldPrice'] as String,
//                         style: const TextStyle(
//                             fontSize: 11,
//                             color: kGrey,
//                             decoration: TextDecoration.lineThrough)),
//                     const SizedBox(height: 8),
//                     // Message Seller button
//                     GestureDetector(
//                       onTap: () => _messageSeller(context, p),
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 8),
//                         decoration: BoxDecoration(
//                           color: kBlue,
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: kBlue.withOpacity(0.3),
//                                 blurRadius: 6,
//                                 offset: const Offset(0, 2)),
//                           ],
//                         ),
//                         child: const Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Icon(Icons.chat_bubble_rounded,
//                                 color: Colors.white, size: 13),
//                             SizedBox(width: 5),
//                             Text('Message Seller',
//                                 style: TextStyle(
//                                     fontSize: 11.5,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w700)),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

















// lib/screens/search_screen.dart

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'message_store.dart';
import 'notification_store.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchCtrl = TextEditingController();
  final _focusNode  = FocusNode();
  String _query     = '';
  String _sortBy    = 'All';

  final List<String> _categories = [
    'All', 'Equipment', 'Testing', 'COVID-19', 'Homecare',
  ];

  final List<String> _history = [
    'Surgical products', 'Masks', 'Syringe',
    'Student store products', 'Beds',
  ];

  final List<Map<String, dynamic>> _sellerProducts = [
    {
      'name':     'Surgical Knife – Pack of 10',
      'seller':   'MedSupply Co.',
      'location': 'Chennai, TN',
      'price':    'Rs.1,299.00',
      'oldPrice': 'Rs.1,800.00',
      'discount': '28% OFF',
      'stock':    'In Stock',
      'rating':   4.5,
      'reviews':  128,
      'icon':     Icons.content_cut_rounded,
      'color':    Color(0xFF0284C7),
      'bg':       Color(0xFFE0F2FE),
      'cat':      'Equipment',
      'sold':     '240+ sold',
    },
    {
      'name':     'N95 Masks – Box of 50',
      'seller':   'HealthMart India',
      'location': 'Mumbai, MH',
      'price':    'Rs.499.00',
      'oldPrice': 'Rs.699.00',
      'discount': '28% OFF',
      'stock':    'In Stock',
      'rating':   4.8,
      'reviews':  342,
      'icon':     Icons.masks_rounded,
      'color':    Color(0xFF16A34A),
      'bg':       Color(0xFFDCFCE7),
      'cat':      'COVID-19',
      'sold':     '1.2k+ sold',
    },
    {
      'name':     'Hospital Beds – Recliner Type',
      'seller':   'Veesafe Stores',
      'location': 'Bengaluru, KA',
      'price':    'Rs.12,500.00',
      'oldPrice': 'Rs.15,000.00',
      'discount': '16% OFF',
      'stock':    '3 Left',
      'rating':   4.2,
      'reviews':  56,
      'icon':     Icons.bed_rounded,
      'color':    Color(0xFF7C3AED),
      'bg':       Color(0xFFEDE9FE),
      'cat':      'Equipment',
      'sold':     '30+ sold',
    },
    {
      'name':     'Sethascope Pro – Cardiology',
      'seller':   'MediCare Plus',
      'location': 'Hyderabad, TS',
      'price':    'Rs.3,250.00',
      'oldPrice': 'Rs.4,500.00',
      'discount': '27% OFF',
      'stock':    'In Stock',
      'rating':   4.9,
      'reviews':  89,
      'icon':     Icons.hearing_rounded,
      'color':    Color(0xFFD97706),
      'bg':       Color(0xFFFEF3C7),
      'cat':      'Testing',
      'sold':     '95+ sold',
    },
    {
      'name':     'Disposable Syringes – 100 pcs',
      'seller':   'PharmaDirect',
      'location': 'Pune, MH',
      'price':    'Rs.349.00',
      'oldPrice': 'Rs.499.00',
      'discount': '30% OFF',
      'stock':    'In Stock',
      'rating':   4.6,
      'reviews':  215,
      'icon':     Icons.vaccines_rounded,
      'color':    Color(0xFFE11D48),
      'bg':       Color(0xFFFFE4E6),
      'cat':      'Equipment',
      'sold':     '780+ sold',
    },
    {
      'name':     'Oxygen Cylinder & Mask',
      'seller':   'GlobalMed Supplies',
      'location': 'Delhi, DL',
      'price':    'Rs.2,199.00',
      'oldPrice': 'Rs.3,000.00',
      'discount': '26% OFF',
      'stock':    '5 Left',
      'rating':   4.4,
      'reviews':  76,
      'icon':     Icons.air_rounded,
      'color':    Color(0xFF0284C7),
      'bg':       Color(0xFFE0F2FE),
      'cat':      'Equipment',
      'sold':     '120+ sold',
    },
    {
      'name':     'Blood Testing Device',
      'seller':   'DiagnoPlus',
      'location': 'Kolkata, WB',
      'price':    'Rs.3,250.00',
      'oldPrice': 'Rs.4,000.00',
      'discount': '18% OFF',
      'stock':    'In Stock',
      'rating':   4.7,
      'reviews':  193,
      'icon':     Icons.bloodtype_rounded,
      'color':    Color(0xFFE11D48),
      'bg':       Color(0xFFFFE4E6),
      'cat':      'Testing',
      'sold':     '310+ sold',
    },
    {
      'name':     'Walking Stick – Steel',
      'seller':   'CareHome Products',
      'location': 'Ahmedabad, GJ',
      'price':    'Rs.1,499.00',
      'oldPrice': 'Rs.1,999.00',
      'discount': '25% OFF',
      'stock':    'In Stock',
      'rating':   4.3,
      'reviews':  44,
      'icon':     Icons.accessibility_new_rounded,
      'color':    Color(0xFF16A34A),
      'bg':       Color(0xFFDCFCE7),
      'cat':      'Homecare',
      'sold':     '60+ sold',
    },
    {
      'name':     'Wheel Chair Premium',
      'seller':   'MobilityFirst',
      'location': 'Jaipur, RJ',
      'price':    'Rs.5,999.00',
      'oldPrice': 'Rs.7,500.00',
      'discount': '20% OFF',
      'stock':    '2 Left',
      'rating':   4.6,
      'reviews':  67,
      'icon':     Icons.wheelchair_pickup_rounded,
      'color':    Color(0xFF7C3AED),
      'bg':       Color(0xFFEDE9FE),
      'cat':      'Homecare',
      'sold':     '85+ sold',
    },
    {
      'name':     'First Aid Kit – Full Set',
      'seller':   'SafetyFirst India',
      'location': 'Puducherry, PY',
      'price':    'Rs.1,499.00',
      'oldPrice': 'Rs.1,999.00',
      'discount': '25% OFF',
      'stock':    'In Stock',
      'rating':   4.8,
      'reviews':  301,
      'icon':     Icons.medical_services_rounded,
      'color':    Color(0xFFD97706),
      'bg':       Color(0xFFFEF3C7),
      'cat':      'Equipment',
      'sold':     '520+ sold',
    },
  ];

  List<Map<String, dynamic>> get _results {
    List<Map<String, dynamic>> list = _sellerProducts;
    if (_sortBy != 'All') {
      list = list.where((p) => p['cat'] == _sortBy).toList();
    }
    if (_query.trim().isNotEmpty) {
      list = list.where((p) =>
          (p['name'] as String).toLowerCase().contains(_query.toLowerCase()) ||
          (p['seller'] as String).toLowerCase().contains(_query.toLowerCase()) ||
          (p['cat'] as String).toLowerCase().contains(_query.toLowerCase())).toList();
    }
    return list;
  }

  void _onSearch(String val) => setState(() => _query = val);

  void _addToHistory(String name) {
    if (!_history.contains(name)) {
      setState(() {
        _history.insert(0, name);
        if (_history.length > 8) _history.removeLast();
      });
    }
  }

  void _messageSeller(BuildContext context, Map<String, dynamic> p) {
    _addToHistory(p['name'] as String);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        final ctrl = TextEditingController(
            text: 'Hi, I am interested in "${p['name']}". Is it available?');
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40, height: 4,
                    decoration: BoxDecoration(
                        color: kBorderGrey,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Container(
                      width: 44, height: 44,
                      decoration: BoxDecoration(
                        color: p['bg'] as Color,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(p['icon'] as IconData,
                          size: 22, color: p['color'] as Color),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(p['name'] as String,
                              style: const TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w700,
                                  color: kBlack)),
                          Text('Seller: ${p['seller']}',
                              style: const TextStyle(
                                  fontSize: 12, color: kGrey)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: ctrl,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Your message to seller',
                    labelStyle: const TextStyle(color: kGrey, fontSize: 13),
                    filled: true,
                    fillColor: kBlueLite,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: kBlue, width: 1.5)),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kBlue,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    icon: const Icon(Icons.send_rounded,
                        color: Colors.white, size: 18),
                    label: const Text('Send Message to Seller',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14)),
                    onPressed: () {
                      final now = DateTime.now();
                      final hour = now.hour > 12 ? now.hour - 12 : (now.hour == 0 ? 12 : now.hour);
                      final min  = now.minute.toString().padLeft(2, '0');
                      final ampm = now.hour >= 12 ? 'PM' : 'AM';
                      final timeStr = '$hour:$min $ampm';

                      // ── Add to Messages tab ──
                      MessageStore.messages.insert(0, {
                        'product':   p['name'],
                        'seller':    p['seller'],
                        'myMessage': ctrl.text.trim(),
                        'reply':     '',
                        'time':      timeStr,
                        'hasReply':  false,
                        'icon':      p['icon'],
                        'color':     p['color'],
                        'bg':        p['bg'],
                        'price':     p['price'],
                      });

                      // ── Add to Today notifications ──
                      NotificationStore.addToday({
                        'icon':      Icons.chat_bubble_rounded,
                        'iconBg':    p['bg'],
                        'iconColor': p['color'],
                        'title':     'Message sent to ${p['seller']}',
                        'subtitle':  ctrl.text.trim(),
                        'time':      timeStr,
                        'unread':    true,
                      });

                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Message sent to ${p['seller']}!'),
                          backgroundColor: const Color(0xFF16A34A),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            _appBar(context),
            _searchBar(),
            _categoryBar(),
            Expanded(child: _body(context)),
          ],
        ),
      ),
    );
  }

  // ════════════════════════════════════════
  //  APP BAR
  // ════════════════════════════════════════
  Widget _appBar(BuildContext context) => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kBlue, Color(0xFF1A73E8)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(4, 8, 16, 12),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  size: 18, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Buyer / Seller Marketplace',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Colors.white)),
                  SizedBox(height: 2),
                  Text('Find & message sellers directly',
                      style: TextStyle(
                          fontSize: 11.5, color: Colors.white70)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.18),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Colors.white.withOpacity(0.4)),
              ),
              child: Text('${_sellerProducts.length} Listings',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      );

  // ════════════════════════════════════════
  //  SEARCH BAR
  // ════════════════════════════════════════
  Widget _searchBar() => Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F7FA),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _focusNode.hasFocus
                  ? kBlue
                  : const Color(0xFFE0E4ED),
              width: _focusNode.hasFocus ? 1.8 : 1.2,
            ),
            boxShadow: _focusNode.hasFocus
                ? [BoxShadow(
                    color: kBlue.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2))]
                : [],
          ),
          child: Row(
            children: [
              const SizedBox(width: 14),
              Icon(Icons.search_rounded,
                  color: _focusNode.hasFocus
                      ? kBlue
                      : const Color(0xFF9AA5B4),
                  size: 21),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _searchCtrl,
                  focusNode: _focusNode,
                  onChanged: _onSearch,
                  onSubmitted: (v) {
                    if (v.trim().isNotEmpty) _addToHistory(v.trim());
                  },
                  style: const TextStyle(
                      fontSize: 14,
                      color: kBlack,
                      fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                    hintText: 'Search products or sellers...',
                    hintStyle: TextStyle(
                        color: Color(0xFFB0BEC5), fontSize: 13.5),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              if (_query.isNotEmpty)
                GestureDetector(
                  onTap: () {
                    _searchCtrl.clear();
                    setState(() => _query = '');
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 26, height: 26,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE5E9F0),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close_rounded,
                        color: kGrey, size: 15),
                  ),
                )
              else
                const SizedBox(width: 12),
            ],
          ),
        ),
      );

  // ════════════════════════════════════════
  //  CATEGORY FILTER BAR
  // ════════════════════════════════════════
  Widget _categoryBar() => Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: _categories.map((cat) {
              final selected = _sortBy == cat;
              return GestureDetector(
                onTap: () => setState(() => _sortBy = cat),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 7),
                  decoration: BoxDecoration(
                    color: selected ? kBlue : Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: selected ? kBlue : const Color(0xFFDDE2EA),
                    ),
                    boxShadow: selected
                        ? [BoxShadow(
                            color: kBlue.withOpacity(0.25),
                            blurRadius: 8,
                            offset: const Offset(0, 2))]
                        : [],
                  ),
                  child: Text(cat,
                      style: TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                          color: selected
                              ? Colors.white
                              : const Color(0xFF555F6D))),
                ),
              );
            }).toList(),
          ),
        ),
      );

  // ════════════════════════════════════════
  //  BODY
  // ════════════════════════════════════════
  Widget _body(BuildContext context) {
    final list = _results;
    if (list.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80, height: 80,
              decoration: const BoxDecoration(
                  color: kBlueLite, shape: BoxShape.circle),
              child: const Icon(Icons.search_off_rounded,
                  color: kBlue, size: 36)),
            const SizedBox(height: 18),
            Text('No listings for "$_query"',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: kBlack)),
            const SizedBox(height: 6),
            const Text('Try a different keyword or category',
                style: TextStyle(fontSize: 13, color: kGrey)),
          ],
        ),
      );
    }
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // ── Header ──
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
            child: Row(
              children: [
                Container(width: 4, height: 18,
                    decoration: BoxDecoration(
                        color: kBlue,
                        borderRadius: BorderRadius.circular(4))),
                const SizedBox(width: 8),
                Text(
                  _query.isEmpty
                      ? '${list.length} Listings Available'
                      : '${list.length} results for "$_query"',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: kBlack),
                ),
              ],
            ),
          ),
        ),

        // ── Product List ──
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, i) => Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: _productCard(context, list[i]),
            ),
            childCount: list.length,
          ),
        ),

        // ── History ──
        if (_history.isNotEmpty && _query.isEmpty) ...[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
              child: Row(
                children: [
                  Container(width: 4, height: 18,
                      decoration: BoxDecoration(
                          color: kGrey,
                          borderRadius: BorderRadius.circular(4))),
                  const SizedBox(width: 8),
                  const Text('Recent Searches',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: kBlack)),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => setState(() => _history.clear()),
                    child: const Text('Clear all',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
              child: Wrap(
                spacing: 8, runSpacing: 8,
                children: _history.map((h) => GestureDetector(
                  onTap: () {
                    _searchCtrl.text = h;
                    _onSearch(h);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 9),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          color: const Color(0xFFE0E4ED)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 5,
                            offset: const Offset(0, 1)),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.history_rounded,
                            size: 13, color: kGrey),
                        const SizedBox(width: 5),
                        Text(h,
                            style: const TextStyle(
                                fontSize: 12.5,
                                color: kBlack,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                )).toList(),
              ),
            ),
          ),
        ],

        const SliverToBoxAdapter(child: SizedBox(height: 20)),
      ],
    );
  }

  // ════════════════════════════════════════
  //  PRODUCT CARD — Amazon style
  // ════════════════════════════════════════
  Widget _productCard(BuildContext context, Map<String, dynamic> p) {
    final isLow = (p['stock'] as String).contains('Left');
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEEF1F8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Top: Icon + Name + Price ──
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon box
                Container(
                  width: 64, height: 64,
                  decoration: BoxDecoration(
                    color: p['bg'] as Color,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(p['icon'] as IconData,
                      size: 30, color: p['color'] as Color),
                ),
                const SizedBox(width: 14),

                // Name + seller + location
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(p['name'] as String,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: kBlack,
                              height: 1.35)),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(Icons.storefront_rounded,
                              size: 12, color: kGrey),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(p['seller'] as String,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: kBlue,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          const Icon(Icons.location_on_rounded,
                              size: 12, color: kGrey),
                          const SizedBox(width: 3),
                          Text(p['location'] as String,
                              style: const TextStyle(
                                  fontSize: 11.5,
                                  color: kGrey)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ── Divider ──
          const Divider(height: 1, color: Color(0xFFF0F2F8)),

          // ── Bottom: Rating + Price + Buttons ──
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
            child: Row(
              children: [
                // Left: rating + sold + stock
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Stars
                      Row(
                        children: [
                          ...List.generate(5, (i) => Icon(
                            i < (p['rating'] as double).floor()
                                ? Icons.star_rounded
                                : Icons.star_border_rounded,
                            size: 14,
                            color: const Color(0xFFF59E0B),
                          )),
                          const SizedBox(width: 5),
                          Text('${p['rating']}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: kBlack)),
                          const SizedBox(width: 4),
                          Text('(${p['reviews']})',
                              style: const TextStyle(
                                  fontSize: 11.5, color: kGrey)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          // Sold count
                          Text(p['sold'] as String,
                              style: const TextStyle(
                                  fontSize: 11,
                                  color: kGrey,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(width: 8),
                          // Stock badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: isLow
                                  ? const Color(0xFFFEF3C7)
                                  : const Color(0xFFDCFCE7),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(p['stock'] as String,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: isLow
                                        ? const Color(0xFFD97706)
                                        : const Color(0xFF16A34A))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Right: price + buttons
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Discount badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE4E6),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(p['discount'] as String,
                          style: const TextStyle(
                              fontSize: 10,
                              color: Color(0xFFE11D48),
                              fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(height: 3),
                    Text(p['price'] as String,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: kBlack)),
                    Text(p['oldPrice'] as String,
                        style: const TextStyle(
                            fontSize: 11,
                            color: kGrey,
                            decoration: TextDecoration.lineThrough)),
                    const SizedBox(height: 8),
                    // Message Seller button
                    GestureDetector(
                      onTap: () => _messageSeller(context, p),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: kBlue,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: kBlue.withOpacity(0.3),
                                blurRadius: 6,
                                offset: const Offset(0, 2)),
                          ],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.chat_bubble_rounded,
                                color: Colors.white, size: 13),
                            SizedBox(width: 5),
                            Text('Message Seller',
                                style: TextStyle(
                                    fontSize: 11.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}