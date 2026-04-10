// // // lib/screens/category_screen.dart
// // import 'package:flutter/material.dart';
// // import '../constants/app_colors.dart';
// // import '../models/product_model.dart';
// // import '../screens/product_detail_screen.dart';

// // // ── Banner images
// // const _b1 =
// //     'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=180&h=180&fit=crop';
// // const _b2 =
// //     'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=180&h=180&fit=crop';
// // const _b3 =
// //     'https://images.unsplash.com/photo-1631549916768-4119b2e5f926?w=180&h=180&fit=crop';
// // const _b4 =
// //     'https://images.unsplash.com/photo-1559757175-5700dde675bc?w=180&h=180&fit=crop';

// // class CategoryScreen extends StatefulWidget {
// //   const CategoryScreen({super.key});
// //   @override
// //   State<CategoryScreen> createState() => _CategoryScreenState();
// // }

// // class _CategoryScreenState extends State<CategoryScreen> {
// //   int _selectedChip = 0;
// //   final _searchCtrl = TextEditingController();
// //   String _searchQuery = '';

// //   final List<String> _chips = [
// //     'Covid Essentials',
// //     'Essential',
// //     'Mobility Aid',
// //     'Equipment',
// //     'Homecare',
// //   ];

// //   // ── Products as proper Product objects so they open ProductDetailScreen ──
// //   final Map<int, List<Product>> _categoryProducts = {
// //     0: [
// //       Product(
// //         name: 'Covid Test Kit',
// //         price: 'Rs.299.00',
// //         oldPrice: 'Rs.450.00',
// //         badge: '33% Off',
// //         badgeColor: kBlue,
// //         imageBg: Color(0xFFFFE4E6),
// //         imageIcon: Icons.coronavirus_rounded,
// //         imageIconColor: Color(0xFFE11D48),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1584036561566-baf8f5f1b144?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Face Mask Pack',
// //         price: 'Rs.199.00',
// //         oldPrice: 'Rs.299.00',
// //         badge: '33% Off',
// //         badgeColor: kGreen,
// //         imageBg: Color(0xFFDCFCE7),
// //         imageIcon: Icons.masks_rounded,
// //         imageIconColor: Color(0xFF16A34A),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Hand Sanitizer',
// //         price: 'Rs.149.00',
// //         oldPrice: 'Rs.199.00',
// //         badge: '25% Off',
// //         badgeColor: kBlue,
// //         imageBg: Color(0xFFE0F2FE),
// //         imageIcon: Icons.sanitizer_rounded,
// //         imageIconColor: Color(0xFF0284C7),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1584017911766-d821171b6f5a?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'PPE Kit',
// //         price: 'Rs.499.00',
// //         oldPrice: 'Rs.699.00',
// //         badge: '28% Off',
// //         badgeColor: kGreen,
// //         imageBg: Color(0xFFFFE4E6),
// //         imageIcon: Icons.health_and_safety_rounded,
// //         imageIconColor: Color(0xFFE11D48),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1585771724684-38269d6639fd?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Oximeter',
// //         price: 'Rs.899.00',
// //         oldPrice: 'Rs.1,299.00',
// //         badge: '30% Off',
// //         badgeColor: kBlue,
// //         imageBg: Color(0xFFEDE9FE),
// //         imageIcon: Icons.monitor_heart_rounded,
// //         imageIconColor: Color(0xFF7C3AED),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1559757175-5700dde675bc?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Thermometer',
// //         price: 'Rs.350.00',
// //         oldPrice: 'Rs.499.00',
// //         badge: '30% Off',
// //         badgeColor: kGreen,
// //         imageBg: Color(0xFFFEF3C7),
// //         imageIcon: Icons.thermostat_rounded,
// //         imageIconColor: Color(0xFFD97706),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1631549916768-4119b2e5f926?w=200&h=200&fit=crop',
// //       ),
// //     ],
// //     1: [
// //       Product(
// //         name: 'BP Monitor',
// //         price: 'Rs.1,299.00',
// //         oldPrice: 'Rs.1,800.00',
// //         badge: '27% Off',
// //         badgeColor: kBlue,
// //         imageBg: Color(0xFFFFE4E6),
// //         imageIcon: Icons.favorite_rounded,
// //         imageIconColor: Color(0xFFE11D48),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Glucometer',
// //         price: 'Rs.2,604.00',
// //         oldPrice: 'Rs.3,800.00',
// //         badge: '31% Off',
// //         badgeColor: kGreen,
// //         imageBg: Color(0xFFDCFCE7),
// //         imageIcon: Icons.bloodtype_rounded,
// //         imageIconColor: Color(0xFF16A34A),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'First Aid Kit',
// //         price: 'Rs.799.00',
// //         oldPrice: 'Rs.999.00',
// //         badge: '20% Off',
// //         badgeColor: kBlue,
// //         imageBg: Color(0xFFFEF3C7),
// //         imageIcon: Icons.medical_services_rounded,
// //         imageIconColor: Color(0xFFD97706),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1603398938378-e54eab446dde?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Nebulizer',
// //         price: 'Rs.1,499.00',
// //         oldPrice: 'Rs.2,000.00',
// //         badge: '25% Off',
// //         badgeColor: kGreen,
// //         imageBg: Color(0xFFE0F2FE),
// //         imageIcon: Icons.air_rounded,
// //         imageIconColor: Color(0xFF0284C7),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Stethoscope',
// //         price: 'Rs.999.00',
// //         oldPrice: 'Rs.1,499.00',
// //         badge: '33% Off',
// //         badgeColor: kBlue,
// //         imageBg: Color(0xFFEDE9FE),
// //         imageIcon: Icons.hearing_rounded,
// //         imageIconColor: Color(0xFF7C3AED),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1576671081837-49000212a370?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'VapoRub',
// //         price: 'Rs.220.00',
// //         oldPrice: 'Rs.299.00',
// //         badge: '26% Off',
// //         badgeColor: kGreen,
// //         imageBg: Color(0xFFF0FDF4),
// //         imageIcon: Icons.spa_rounded,
// //         imageIconColor: Color(0xFF16A34A),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1550572017-edd951b55104?w=200&h=200&fit=crop',
// //       ),
// //     ],
// //     2: [
// //       Product(
// //         name: 'Walking Stick',
// //         price: 'Rs.699.00',
// //         oldPrice: 'Rs.999.00',
// //         badge: '30% Off',
// //         badgeColor: kBlue,
// //         imageBg: Color(0xFFDCFCE7),
// //         imageIcon: Icons.accessibility_new_rounded,
// //         imageIconColor: Color(0xFF16A34A),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Wheel Chair',
// //         price: 'Rs.8,499.00',
// //         oldPrice: 'Rs.11,000.00',
// //         badge: '22% Off',
// //         badgeColor: kGreen,
// //         imageBg: Color(0xFFEDE9FE),
// //         imageIcon: Icons.wheelchair_pickup_rounded,
// //         imageIconColor: Color(0xFF7C3AED),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1573812461383-e5f8b759d12e?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Leg Massager',
// //         price: 'Rs.2,199.00',
// //         oldPrice: 'Rs.2,999.00',
// //         badge: '26% Off',
// //         badgeColor: kBlue,
// //         imageBg: Color(0xFFFFE4E6),
// //         imageIcon: Icons.self_improvement_rounded,
// //         imageIconColor: Color(0xFFE11D48),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1519823551278-64ac92734fb1?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Crutches',
// //         price: 'Rs.850.00',
// //         oldPrice: 'Rs.1,199.00',
// //         badge: '29% Off',
// //         badgeColor: kGreen,
// //         imageBg: Color(0xFFE0F2FE),
// //         imageIcon: Icons.elderly_rounded,
// //         imageIconColor: Color(0xFF0284C7),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Knee Support',
// //         price: 'Rs.499.00',
// //         oldPrice: 'Rs.699.00',
// //         badge: '28% Off',
// //         badgeColor: kBlue,
// //         imageBg: Color(0xFFFEF3C7),
// //         imageIcon: Icons.healing_rounded,
// //         imageIconColor: Color(0xFFD97706),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Back Brace',
// //         price: 'Rs.649.00',
// //         oldPrice: 'Rs.899.00',
// //         badge: '27% Off',
// //         badgeColor: kGreen,
// //         imageBg: Color(0xFFDCFCE7),
// //         imageIcon: Icons.sports_martial_arts_rounded,
// //         imageIconColor: Color(0xFF16A34A),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=200&h=200&fit=crop',
// //       ),
// //     ],
// //     3: [
// //       Product(
// //         name: 'Oxygen Cylinder',
// //         price: 'Rs.4,500.00',
// //         oldPrice: 'Rs.6,000.00',
// //         badge: '25% Off',
// //         badgeColor: kBlue,
// //         imageBg: Color(0xFFE0F2FE),
// //         imageIcon: Icons.air_rounded,
// //         imageIconColor: Color(0xFF0284C7),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1631549916768-4119b2e5f926?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Hospital Bed',
// //         price: 'Rs.18,000.00',
// //         oldPrice: 'Rs.24,000.00',
// //         badge: '25% Off',
// //         badgeColor: kGreen,
// //         imageBg: Color(0xFFEDE9FE),
// //         imageIcon: Icons.bed_rounded,
// //         imageIconColor: Color(0xFF7C3AED),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1576671081837-49000212a370?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Surgical Gloves',
// //         price: 'Rs.299.00',
// //         oldPrice: 'Rs.399.00',
// //         badge: '25% Off',
// //         badgeColor: kBlue,
// //         imageBg: Color(0xFFDCFCE7),
// //         imageIcon: Icons.back_hand_rounded,
// //         imageIconColor: Color(0xFF16A34A),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1585771724684-38269d6639fd?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Surgical Dress',
// //         price: 'Rs.1,499.00',
// //         oldPrice: 'Rs.1,999.00',
// //         badge: '25% Off',
// //         badgeColor: kGreen,
// //         imageBg: Color(0xFFFEF3C7),
// //         imageIcon: Icons.dry_cleaning_rounded,
// //         imageIconColor: Color(0xFFD97706),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1584036561566-baf8f5f1b144?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Retinascope',
// //         price: 'Rs.3,250.00',
// //         oldPrice: 'Rs.4,500.00',
// //         badge: '27% Off',
// //         badgeColor: kBlue,
// //         imageBg: Color(0xFFFFE4E6),
// //         imageIcon: Icons.remove_red_eye_rounded,
// //         imageIconColor: Color(0xFFE11D48),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1559757175-5700dde675bc?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Disposable Pack',
// //         price: 'Rs.599.00',
// //         oldPrice: 'Rs.799.00',
// //         badge: '25% Off',
// //         badgeColor: kGreen,
// //         imageBg: Color(0xFFE0F2FE),
// //         imageIcon: Icons.inventory_2_rounded,
// //         imageIconColor: Color(0xFF0284C7),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1603398938378-e54eab446dde?w=200&h=200&fit=crop',
// //       ),
// //     ],
// //     4: [
// //       Product(
// //         name: 'Air Purifier',
// //         price: 'Rs.3,999.00',
// //         oldPrice: 'Rs.5,499.00',
// //         badge: '27% Off',
// //         badgeColor: kBlue,
// //         imageBg: Color(0xFFE0F2FE),
// //         imageIcon: Icons.air_rounded,
// //         imageIconColor: Color(0xFF0284C7),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Heating Pad',
// //         price: 'Rs.799.00',
// //         oldPrice: 'Rs.1,099.00',
// //         badge: '27% Off',
// //         badgeColor: kGreen,
// //         imageBg: Color(0xFFFFE4E6),
// //         imageIcon: Icons.local_fire_department_rounded,
// //         imageIconColor: Color(0xFFE11D48),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Vaporizer',
// //         price: 'Rs.1,099.00',
// //         oldPrice: 'Rs.1,499.00',
// //         badge: '26% Off',
// //         badgeColor: kBlue,
// //         imageBg: Color(0xFFDCFCE7),
// //         imageIcon: Icons.cloud_rounded,
// //         imageIconColor: Color(0xFF16A34A),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Ice Pack',
// //         price: 'Rs.249.00',
// //         oldPrice: 'Rs.349.00',
// //         badge: '28% Off',
// //         badgeColor: kGreen,
// //         imageBg: Color(0xFFE0F2FE),
// //         imageIcon: Icons.ac_unit_rounded,
// //         imageIconColor: Color(0xFF0284C7),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Bed Rail Guard',
// //         price: 'Rs.1,599.00',
// //         oldPrice: 'Rs.2,199.00',
// //         badge: '27% Off',
// //         badgeColor: kBlue,
// //         imageBg: Color(0xFFEDE9FE),
// //         imageIcon: Icons.bed_rounded,
// //         imageIconColor: Color(0xFF7C3AED),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1576671081837-49000212a370?w=200&h=200&fit=crop',
// //       ),
// //       Product(
// //         name: 'Commode Chair',
// //         price: 'Rs.2,299.00',
// //         oldPrice: 'Rs.2,999.00',
// //         badge: '23% Off',
// //         badgeColor: kGreen,
// //         imageBg: Color(0xFFFEF3C7),
// //         imageIcon: Icons.chair_rounded,
// //         imageIconColor: Color(0xFFD97706),
// //         imageUrl:
// //             'https://images.unsplash.com/photo-1585771724684-38269d6639fd?w=200&h=200&fit=crop',
// //       ),
// //     ],
// //   };

// //   final List<Map<String, dynamic>> _brands = [
// //     {'name': 'VetTab', 'icon': Icons.pets, 'color': Color(0xFF7C3AED)},
// //     {'name': 'LifeOnic', 'icon': Icons.favorite, 'color': Color(0xFF0EA5E9)},
// //     {'name': 'riboxx', 'icon': Icons.science, 'color': Color(0xFF059669)},
// //     {
// //       'name': 'MedPlus',
// //       'icon': Icons.local_pharmacy,
// //       'color': Color(0xFFDC2626),
// //     },
// //   ];

// //   final List<Map<String, dynamic>> _browseCategories = [
// //     {
// //       'name': 'Fitness &\nHealth care',
// //       'img':
// //           'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=200&h=200&fit=crop',
// //       'bg': Color(0xFFE3F2FD),
// //       'chip': 1,
// //     },
// //     {
// //       'name': 'Covid\nEssentials',
// //       'img':
// //           'https://images.unsplash.com/photo-1584036561566-baf8f5f1b144?w=200&h=200&fit=crop',
// //       'bg': Color(0xFFFFEBEE),
// //       'chip': 0,
// //     },
// //     {
// //       'name': 'Equipment',
// //       'img':
// //           'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=200&h=200&fit=crop',
// //       'bg': Color(0xFFF4F6FB),
// //       'chip': 3,
// //     },
// //     {
// //       'name': 'Mobility\nAid',
// //       'img':
// //           'https://images.unsplash.com/photo-1573812461383-e5f8b759d12e?w=200&h=200&fit=crop',
// //       'bg': Color(0xFFE8F5E9),
// //       'chip': 2,
// //     },
// //     {
// //       'name': 'Essential',
// //       'img':
// //           'https://images.unsplash.com/photo-1603398938378-e54eab446dde?w=200&h=200&fit=crop',
// //       'bg': Color(0xFFF3E5F5),
// //       'chip': 1,
// //     },
// //     {
// //       'name': 'Homecare',
// //       'img':
// //           'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=200&h=200&fit=crop',
// //       'bg': Color(0xFFFFF8E1),
// //       'chip': 4,
// //     },
// //   ];

// //   List<Product> get _filteredProducts {
// //     final products = _categoryProducts[_selectedChip] ?? [];
// //     if (_searchQuery.trim().isEmpty) return products;
// //     return products
// //         .where((p) => p.name.toLowerCase().contains(_searchQuery.toLowerCase()))
// //         .toList();
// //   }

// //   @override
// //   void dispose() {
// //     _searchCtrl.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF4F6FB),
// //       body: SafeArea(
// //         child: Column(
// //           children: [
// //             _appBar(context),
// //             Expanded(
// //               child: SingleChildScrollView(
// //                 physics: const BouncingScrollPhysics(),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     const SizedBox(height: 12),
// //                     _searchBar(),
// //                     const SizedBox(height: 12),
// //                     _browseAllRow(),
// //                     const SizedBox(height: 12),
// //                     _heroBanner(),
// //                     const SizedBox(height: 18),
// //                     _sectionHeader('Search by category'),
// //                     const SizedBox(height: 10),
// //                     _filterChipRow(),
// //                     const SizedBox(height: 12),
// //                     _productGrid(),
// //                     const SizedBox(height: 8),
// //                     _topBrands(),
// //                     const SizedBox(height: 8),
// //                     _sectionHeader('Browse by category'),
// //                     const SizedBox(height: 10),
// //                     _browseCategoryGrid(),
// //                     const SizedBox(height: 8),
// //                     _otherInformation(),
// //                     const SizedBox(height: 8),
// //                     _footer(),
// //                     const SizedBox(height: 8),
// //                     _carePlanCard(),
// //                     const SizedBox(height: 28),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   // ── App Bar ──
// //   Widget _appBar(BuildContext context) => Container(
// //     decoration: const BoxDecoration(
// //       color: kBlue,
// //       border: Border(bottom: BorderSide(color: Color(0x22000000), width: 1)),
// //     ),
// //     padding: const EdgeInsets.fromLTRB(4, 8, 14, 12),
// //     child: Row(
// //       children: [
// //         IconButton(
// //           icon: const Icon(
// //             Icons.arrow_back_ios_new_rounded,
// //             size: 18,
// //             color: Colors.white,
// //           ),
// //           onPressed: () => Navigator.pop(context),
// //           splashRadius: 20,
// //         ),
// //         const Expanded(
// //           child: Center(
// //             child: Text(
// //               'Category',
// //               style: TextStyle(
// //                 fontSize: 17,
// //                 fontWeight: FontWeight.w800,
// //                 color: Colors.white,
// //               ),
// //             ),
// //           ),
// //         ),
// //         const SizedBox(width: 48),
// //       ],
// //     ),
// //   );

// //   // ── Search Bar ──
// //   Widget _searchBar() => Padding(
// //     padding: const EdgeInsets.symmetric(horizontal: 16),
// //     child: Container(
// //       height: 46,
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(12),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.06),
// //             blurRadius: 8,
// //             offset: const Offset(0, 2),
// //           ),
// //         ],
// //       ),
// //       child: Row(
// //         children: [
// //           const SizedBox(width: 14),
// //           const Icon(Icons.search_rounded, color: kGrey, size: 20),
// //           const SizedBox(width: 10),
// //           Expanded(
// //             child: TextField(
// //               controller: _searchCtrl,
// //               onChanged: (v) => setState(() => _searchQuery = v),
// //               style: const TextStyle(fontSize: 13, color: kBlack),
// //               decoration: const InputDecoration(
// //                 hintText: 'Search products in this category...',
// //                 hintStyle: TextStyle(color: kGrey, fontSize: 13),
// //                 border: InputBorder.none,
// //                 isDense: true,
// //                 contentPadding: EdgeInsets.zero,
// //               ),
// //             ),
// //           ),
// //           if (_searchQuery.isNotEmpty)
// //             GestureDetector(
// //               onTap: () {
// //                 _searchCtrl.clear();
// //                 setState(() => _searchQuery = '');
// //               },
// //               child: const Padding(
// //                 padding: EdgeInsets.only(right: 12),
// //                 child: Icon(Icons.close_rounded, color: kGrey, size: 18),
// //               ),
// //             ),
// //         ],
// //       ),
// //     ),
// //   );

// //   // ── Browse All Row ──
// //   Widget _browseAllRow() => Padding(
// //     padding: const EdgeInsets.symmetric(horizontal: 16),
// //     child: Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(14),
// //         border: Border.all(color: const Color(0xFFEFF1F7), width: 1),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.04),
// //             blurRadius: 10,
// //             offset: const Offset(0, 3),
// //           ),
// //         ],
// //       ),
// //       child: Row(
// //         children: [
// //           Container(
// //             width: 42,
// //             height: 42,
// //             decoration: BoxDecoration(
// //               color: const Color(0xFFFFF8DC),
// //               borderRadius: BorderRadius.circular(12),
// //             ),
// //             child: const Icon(
// //               Icons.grid_view_rounded,
// //               color: Color(0xFFF9A825),
// //               size: 21,
// //             ),
// //           ),
// //           const SizedBox(width: 12),
// //           const Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   'Browse all categories',
// //                   style: TextStyle(
// //                     fontSize: 13.5,
// //                     fontWeight: FontWeight.w700,
// //                     color: Color(0xFF111827),
// //                   ),
// //                 ),
// //                 SizedBox(height: 2),
// //                 Text(
// //                   'Up to 69% off on health products',
// //                   style: TextStyle(fontSize: 11.5, color: Color(0xFF6B7280)),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Container(
// //             width: 28,
// //             height: 28,
// //             decoration: BoxDecoration(
// //               color: const Color(0xFFF4F6FB),
// //               borderRadius: BorderRadius.circular(8),
// //             ),
// //             child: const Icon(
// //               Icons.arrow_forward_ios_rounded,
// //               size: 12,
// //               color: Color(0xFF6B7280),
// //             ),
// //           ),
// //         ],
// //       ),
// //     ),
// //   );

// //   // ── Hero Banner ──
// //   Widget _heroBanner() => Column(
// //     children: [
// //       Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 16),
// //         child: Container(
// //           height: 140,
// //           decoration: BoxDecoration(
// //             color: const Color(0xFFEDE7F6),
// //             borderRadius: BorderRadius.circular(16),
// //             boxShadow: [
// //               BoxShadow(
// //                 color: Colors.black.withOpacity(0.05),
// //                 blurRadius: 10,
// //                 offset: const Offset(0, 3),
// //               ),
// //             ],
// //           ),
// //           child: Row(
// //             children: [
// //               Expanded(
// //                 flex: 5,
// //                 child: Padding(
// //                   padding: const EdgeInsets.fromLTRB(16, 14, 0, 14),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       const Text(
// //                         '50% OFF',
// //                         style: TextStyle(
// //                           fontSize: 10,
// //                           fontWeight: FontWeight.w600,
// //                           color: Color(0xFF6B7280),
// //                           letterSpacing: 0.4,
// //                         ),
// //                       ),
// //                       const SizedBox(height: 3),
// //                       const Text(
// //                         'Medical\nProduct',
// //                         style: TextStyle(
// //                           fontSize: 21,
// //                           fontWeight: FontWeight.w900,
// //                           color: Color(0xFF111827),
// //                           height: 1.15,
// //                         ),
// //                       ),
// //                       const SizedBox(height: 10),
// //                       GestureDetector(
// //                         onTap: () => setState(() => _selectedChip = 1),
// //                         child: Container(
// //                           padding: const EdgeInsets.symmetric(
// //                             horizontal: 16,
// //                             vertical: 7,
// //                           ),
// //                           decoration: BoxDecoration(
// //                             color: const Color(0xFF111827),
// //                             borderRadius: BorderRadius.circular(20),
// //                           ),
// //                           child: const Text(
// //                             'Buy Now',
// //                             style: TextStyle(
// //                               color: Colors.white,
// //                               fontSize: 11.5,
// //                               fontWeight: FontWeight.w700,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               Expanded(
// //                 flex: 4,
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(10),
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Row(
// //                         children: [
// //                           Expanded(child: _bBox(_b1)),
// //                           const SizedBox(width: 5),
// //                           Expanded(child: _bBox(_b2)),
// //                         ],
// //                       ),
// //                       const SizedBox(height: 5),
// //                       Row(
// //                         children: [
// //                           Expanded(child: _bBox(_b3)),
// //                           const SizedBox(width: 5),
// //                           Expanded(child: _bBox(_b4)),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //       const SizedBox(height: 10),
// //       Row(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: List.generate(
// //           3,
// //           (i) => AnimatedContainer(
// //             duration: const Duration(milliseconds: 200),
// //             margin: const EdgeInsets.symmetric(horizontal: 3),
// //             width: i == 0 ? 20 : 6,
// //             height: 6,
// //             decoration: BoxDecoration(
// //               color: i == 0 ? kBlue : const Color(0xFFD1D5DB),
// //               borderRadius: BorderRadius.circular(3),
// //             ),
// //           ),
// //         ),
// //       ),
// //     ],
// //   );

// //   Widget _bBox(String url) => Container(
// //     height: 50,
// //     decoration: BoxDecoration(
// //       color: Colors.white,
// //       borderRadius: BorderRadius.circular(9),
// //       boxShadow: [
// //         BoxShadow(
// //           color: Colors.black.withOpacity(0.07),
// //           blurRadius: 5,
// //           offset: const Offset(0, 2),
// //         ),
// //       ],
// //     ),
// //     child: ClipRRect(
// //       borderRadius: BorderRadius.circular(9),
// //       child: Image.network(
// //         url,
// //         fit: BoxFit.contain,
// //         errorBuilder: (_, _, _) =>
// //             const Icon(Icons.medical_services_outlined, color: kBlue, size: 18),
// //       ),
// //     ),
// //   );

// //   // ── Section Header ──
// //   Widget _sectionHeader(String t) => Padding(
// //     padding: const EdgeInsets.symmetric(horizontal: 16),
// //     child: Row(
// //       children: [
// //         Container(
// //           width: 3.5,
// //           height: 16,
// //           decoration: BoxDecoration(
// //             color: kBlue,
// //             borderRadius: BorderRadius.circular(4),
// //           ),
// //         ),
// //         const SizedBox(width: 8),
// //         Text(
// //           t,
// //           style: const TextStyle(
// //             fontSize: 15,
// //             fontWeight: FontWeight.w800,
// //             color: Color(0xFF111827),
// //           ),
// //         ),
// //       ],
// //     ),
// //   );

// //   Widget _sectionHeaderWithSeeAll(String t) => Padding(
// //     padding: const EdgeInsets.fromLTRB(16, 18, 16, 10),
// //     child: Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       children: [
// //         Row(
// //           children: [
// //             Container(
// //               width: 3.5,
// //               height: 16,
// //               decoration: BoxDecoration(
// //                 color: kBlue,
// //                 borderRadius: BorderRadius.circular(4),
// //               ),
// //             ),
// //             const SizedBox(width: 8),
// //             Text(
// //               t,
// //               style: const TextStyle(
// //                 fontSize: 15,
// //                 fontWeight: FontWeight.w800,
// //                 color: Color(0xFF111827),
// //               ),
// //             ),
// //           ],
// //         ),
// //         Row(
// //           children: [
// //             Text(
// //               'See all',
// //               style: TextStyle(
// //                 fontSize: 12,
// //                 color: kBlue,
// //                 fontWeight: FontWeight.w600,
// //               ),
// //             ),
// //             Icon(Icons.chevron_right_rounded, size: 15, color: kBlue),
// //           ],
// //         ),
// //       ],
// //     ),
// //   );

// //   // ── Filter Chips ──
// //   Widget _filterChipRow() => SizedBox(
// //     height: 38,
// //     child: ListView.separated(
// //       scrollDirection: Axis.horizontal,
// //       physics: const BouncingScrollPhysics(),
// //       padding: const EdgeInsets.symmetric(horizontal: 16),
// //       itemCount: _chips.length,
// //       separatorBuilder: (_, _) => const SizedBox(width: 8),
// //       itemBuilder: (_, i) {
// //         final sel = i == _selectedChip;
// //         return GestureDetector(
// //           onTap: () => setState(() {
// //             _selectedChip = i;
// //             _searchQuery = '';
// //             _searchCtrl.clear();
// //           }),
// //           child: AnimatedContainer(
// //             duration: const Duration(milliseconds: 180),
// //             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// //             decoration: BoxDecoration(
// //               color: sel ? kBlue : Colors.white,
// //               borderRadius: BorderRadius.circular(20),
// //               border: Border.all(color: sel ? kBlue : const Color(0xFFDDE1EB)),
// //               boxShadow: sel
// //                   ? [
// //                       BoxShadow(
// //                         color: kBlue.withOpacity(0.22),
// //                         blurRadius: 8,
// //                         offset: const Offset(0, 3),
// //                       ),
// //                     ]
// //                   : [],
// //             ),
// //             child: Text(
// //               _chips[i],
// //               style: TextStyle(
// //                 fontSize: 12,
// //                 fontWeight: FontWeight.w600,
// //                 color: sel ? Colors.white : const Color(0xFF6B7280),
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     ),
// //   );

// //   // ── Product Grid — navigates to ProductDetailScreen ──
// //   // Widget _productGrid() {
// //   //   final products = _filteredProducts;
// //   //   if (products.isEmpty) {
// //   //     return Padding(
// //   //       padding: const EdgeInsets.all(30),
// //   //       child: Center(child: Column(children: [
// //   //         const Icon(Icons.search_off_rounded, size: 50, color: kGrey),
// //   //         const SizedBox(height: 12),
// //   //         Text('No products found for "$_searchQuery"',
// //   //             style: const TextStyle(fontSize: 14, color: kGrey)),
// //   //       ])),
// //   //     );
// //   //   }
// //   //   return Padding(
// //   //     padding: const EdgeInsets.symmetric(horizontal: 16),
// //   //     child: GridView.builder(
// //   //       shrinkWrap: true,
// //   //       physics: const NeverScrollableScrollPhysics(),
// //   //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //   //         crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 12, childAspectRatio: 0.72,
// //   //       ),
// //   //       itemCount: products.length,
// //   //       itemBuilder: (_, i) {
// //   //         final p = products[i];
// //   //         return GestureDetector(
// //   //           onTap: () => Navigator.push(context,
// //   //               MaterialPageRoute(builder: (_) => ProductDetailScreen(product: p))),
// //   //           child: Container(
// //   //             decoration: BoxDecoration(
// //   //               color: Colors.white, borderRadius: BorderRadius.circular(14),
// //   //               border: Border.all(color: const Color(0xFFEFF1F7), width: 1),
// //   //               boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 3))],
// //   //             ),
// //   //             child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //   //               // Badge
// //   //               Stack(children: [
// //   //                 ClipRRect(
// //   //                   borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
// //   //                   child: Container(
// //   //                     height: 88, width: double.infinity,
// //   //                     color: p.imageBg,
// //   //                     child: p.imageUrl.startsWith('http')
// //   //                         ? Image.network(p.imageUrl, fit: BoxFit.contain,
// //   //                             loadingBuilder: (_, c, prog) => prog == null ? c
// //   //                                 : Center(child: SizedBox(width: 18, height: 18,
// //   //                                     child: CircularProgressIndicator(strokeWidth: 2, color: p.imageIconColor))),
// //   //                             errorBuilder: (_, _, _) => Center(child: Icon(p.imageIcon, color: p.imageIconColor, size: 32)))
// //   //                         : Center(child: Icon(p.imageIcon, color: p.imageIconColor, size: 32)),
// //   //                   ),
// //   //                 ),
// //   //                 Positioned(top: 6, left: 6, child: Container(
// //   //                   padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
// //   //                   decoration: BoxDecoration(color: p.badgeColor, borderRadius: BorderRadius.circular(4)),
// //   //                   child: Text(p.badge, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.w700)),
// //   //                 )),
// //   //               ]),
// //   //               // Info
// //   //               Padding(
// //   //                 padding: const EdgeInsets.fromLTRB(8, 6, 8, 8),
// //   //                 child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //   //                   Text(p.name, maxLines: 2, overflow: TextOverflow.ellipsis,
// //   //                       style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.w700, color: Color(0xFF111827), height: 1.3)),
// //   //                   const SizedBox(height: 4),
// //   //                   Text(p.price, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: kBlue)),
// //   //                   Text(p.oldPrice, style: const TextStyle(fontSize: 9, color: kGrey, decoration: TextDecoration.lineThrough)),
// //   //                 ]),
// //   //               ),
// //   //             ]),
// //   //           ),
// //   //         );
// //   //       },
// //   //     ),
// //   //   );
// //   // }

// //   Widget _productGrid() {
// //     final products = _filteredProducts;
// //     if (products.isEmpty) {
// //       return Padding(
// //         padding: const EdgeInsets.all(30),
// //         child: Center(
// //           child: Column(
// //             children: [
// //               const Icon(Icons.search_off_rounded, size: 50, color: kGrey),
// //               const SizedBox(height: 12),
// //               Text(
// //                 'No products found for "$_searchQuery"',
// //                 style: const TextStyle(fontSize: 14, color: kGrey),
// //               ),
// //             ],
// //           ),
// //         ),
// //       );
// //     }
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 16),
// //       child: GridView.builder(
// //         shrinkWrap: true,
// //         physics: const NeverScrollableScrollPhysics(),
// //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //           crossAxisCount: 3,
// //           crossAxisSpacing: 8,
// //           mainAxisSpacing: 8,
// //           childAspectRatio: 0.68,
// //         ),
// //         itemCount: products.length,
// //         itemBuilder: (_, i) {
// //           final p = products[i];
// //           final ratings = [4.1, 4.3, 4.5, 4.2, 4.4, 4.0];
// //           final rating = ratings[i % ratings.length];
// //           final badges = ['NEW', 'HOT', 'SALE', 'TOP'];
// //           final badge = badges[i % badges.length];
// //           return GestureDetector(
// //             onTap: () => Navigator.push(
// //               context,
// //               MaterialPageRoute(
// //                 builder: (_) => ProductDetailScreen(product: p),
// //               ),
// //             ),
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(16),
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: Colors.black.withOpacity(0.07),
// //                     blurRadius: 12,
// //                     offset: const Offset(0, 4),
// //                   ),
// //                 ],
// //               ),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   // ── Image ──
// //                   Expanded(
// //                     flex: 5,
// //                     child: ClipRRect(
// //                       borderRadius: const BorderRadius.vertical(
// //                         top: Radius.circular(16),
// //                       ),
// //                       child: Container(
// //                         width: double.infinity,
// //                         color: p.imageBg,
// //                         child: p.imageUrl.startsWith('http')
// //                             ? Image.network(
// //                                 p.imageUrl,
// //                                 fit: BoxFit.cover,
// //                                 loadingBuilder: (_, child, prog) => prog == null
// //                                     ? child
// //                                     : Center(
// //                                         child: SizedBox(
// //                                           width: 20,
// //                                           height: 20,
// //                                           child: CircularProgressIndicator(
// //                                             strokeWidth: 2,
// //                                             color: p.imageIconColor,
// //                                           ),
// //                                         ),
// //                                       ),
// //                                 errorBuilder: (_, __, ___) => Center(
// //                                   child: Icon(
// //                                     p.imageIcon,
// //                                     color: p.imageIconColor,
// //                                     size: 48,
// //                                   ),
// //                                 ),
// //                               )
// //                             : Center(
// //                                 child: Icon(
// //                                   p.imageIcon,
// //                                   color: p.imageIconColor,
// //                                   size: 48,
// //                                 ),
// //                               ),
// //                       ),
// //                     ),
// //                   ),

// //                   // ── Info ──
// //                   Expanded(
// //                     flex: 4,
// //                     child: Padding(
// //                       padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         children: [
// //                           // Price
// //                           Text(
// //                             p.price,
// //                             style: const TextStyle(
// //                               fontSize: 11,
// //                               fontWeight: FontWeight.w900,
// //                               color: kBlue,
// //                             ),
// //                           ),
// //                           // Rating stars
// //                           Row(
// //                             children: [
// //                               const Icon(
// //                                 Icons.star_rounded,
// //                                 color: Color(0xFFF59E0B),
// //                                 size: 16,
// //                               ),
// //                               const SizedBox(width: 3),
// //                               Text(
// //                                 rating.toString(),
// //                                 style: const TextStyle(
// //                                   fontSize: 10,
// //                                   fontWeight: FontWeight.w600,
// //                                   color: Color(0xFF374151),
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                           // Badge
// //                           Container(
// //                             padding: const EdgeInsets.symmetric(
// //                               horizontal: 8,
// //                               vertical: 3,
// //                             ),
// //                             decoration: BoxDecoration(
// //                               color: kBlue,
// //                               borderRadius: BorderRadius.circular(8),
// //                             ),
// //                             child: Text(
// //                               badge,
// //                               style: const TextStyle(
// //                                 color: Colors.white,
// //                                 fontSize: 11,
// //                                 fontWeight: FontWeight.w800,
// //                                 letterSpacing: 0.5,
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }

// //   // ── Top Brands ──
// //   Widget _topBrands() => Column(
// //     crossAxisAlignment: CrossAxisAlignment.start,
// //     children: [
// //       _sectionHeaderWithSeeAll('Top Brands'),
// //       Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 16),
// //         child: Container(
// //           decoration: BoxDecoration(
// //             color: kDarkNavy,
// //             borderRadius: BorderRadius.circular(16),
// //             boxShadow: [
// //               BoxShadow(
// //                 color: kDarkNavy.withOpacity(0.25),
// //                 blurRadius: 14,
// //                 offset: const Offset(0, 5),
// //               ),
// //             ],
// //           ),
// //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
// //           child: SingleChildScrollView(
// //             scrollDirection: Axis.horizontal,
// //             physics: const BouncingScrollPhysics(),
// //             child: Row(
// //               children: _brands
// //                   .map(
// //                     (b) => Padding(
// //                       padding: const EdgeInsets.only(right: 24),
// //                       child: Column(
// //                         children: [
// //                           Container(
// //                             width: 58,
// //                             height: 58,
// //                             decoration: BoxDecoration(
// //                               color: Colors.white,
// //                               shape: BoxShape.circle,
// //                               boxShadow: [
// //                                 BoxShadow(
// //                                   color: Colors.black.withOpacity(0.1),
// //                                   blurRadius: 10,
// //                                   offset: const Offset(0, 3),
// //                                 ),
// //                               ],
// //                             ),
// //                             child: Icon(
// //                               b['icon'] as IconData,
// //                               color: b['color'] as Color,
// //                               size: 26,
// //                             ),
// //                           ),
// //                           const SizedBox(height: 7),
// //                           Text(
// //                             b['name'] as String,
// //                             style: const TextStyle(
// //                               color: Colors.white,
// //                               fontSize: 11,
// //                               fontWeight: FontWeight.w600,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   )
// //                   .toList(),
// //             ),
// //           ),
// //         ),
// //       ),
// //     ],
// //   );

// //   // ── Browse Category Grid — clicking scrolls to that chip ──
// //   Widget _browseCategoryGrid() => Padding(
// //     padding: const EdgeInsets.symmetric(horizontal: 16),
// //     child: GridView.builder(
// //       shrinkWrap: true,
// //       physics: const NeverScrollableScrollPhysics(),
// //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //         crossAxisCount: 3,
// //         crossAxisSpacing: 10,
// //         mainAxisSpacing: 12,
// //         childAspectRatio: 0.82,
// //       ),
// //       itemCount: _browseCategories.length,
// //       itemBuilder: (_, i) {
// //         final c = _browseCategories[i];
// //         return GestureDetector(
// //           onTap: () => setState(() => _selectedChip = c['chip'] as int),
// //           child: Container(
// //             decoration: BoxDecoration(
// //               color: Colors.white,
// //               borderRadius: BorderRadius.circular(14),
// //               border: Border.all(color: kBlue.withOpacity(0.15), width: 1.5),
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: kBlue.withOpacity(0.06),
// //                   blurRadius: 10,
// //                   offset: const Offset(0, 3),
// //                 ),
// //               ],
// //             ),
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Container(
// //                   width: 72,
// //                   height: 72,
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(12),
// //                     border: Border.all(color: kBlue, width: 2),
// //                   ),
// //                   child: ClipRRect(
// //                     borderRadius: BorderRadius.circular(10),
// //                     child: Image.network(
// //                       c['img'] as String,
// //                       fit: BoxFit.cover,
// //                       loadingBuilder: (_, child, prog) {
// //                         if (prog == null) return child;
// //                         return Container(
// //                           color: c['bg'] as Color,
// //                           child: const Center(
// //                             child: SizedBox(
// //                               width: 16,
// //                               height: 16,
// //                               child: CircularProgressIndicator(
// //                                 strokeWidth: 2,
// //                                 color: kBlue,
// //                               ),
// //                             ),
// //                           ),
// //                         );
// //                       },
// //                       errorBuilder: (_, _, _) => Container(
// //                         color: c['bg'] as Color,
// //                         child: const Icon(
// //                           Icons.category_rounded,
// //                           color: kBlue,
// //                           size: 28,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 8),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 4),
// //                   child: Text(
// //                     c['name'] as String,
// //                     textAlign: TextAlign.center,
// //                     style: const TextStyle(
// //                       fontSize: 11,
// //                       fontWeight: FontWeight.w700,
// //                       color: Color(0xFF111827),
// //                       height: 1.3,
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     ),
// //   );

// //   // ── Other Information ──
// //   Widget _otherInformation() => Padding(
// //     padding: const EdgeInsets.symmetric(horizontal: 16),
// //     child: Container(
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(16),
// //         border: Border.all(color: const Color(0xFFEFF1F7)),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.04),
// //             blurRadius: 10,
// //             offset: const Offset(0, 3),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Row(
// //             children: [
// //               Container(
// //                 width: 3.5,
// //                 height: 16,
// //                 decoration: BoxDecoration(
// //                   color: kBlue,
// //                   borderRadius: BorderRadius.circular(4),
// //                 ),
// //               ),
// //               const SizedBox(width: 8),
// //               const Text(
// //                 'Other Information',
// //                 style: TextStyle(
// //                   fontSize: 14,
// //                   fontWeight: FontWeight.w800,
// //                   color: Color(0xFF111827),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           const SizedBox(height: 10),
// //           const Text(
// //             'We are glad we can help you with your medical needs. Our team of experts is here to make sure you get the best quality products and services at affordable prices.',
// //             style: TextStyle(
// //               fontSize: 12,
// //               color: Color(0xFF6B7280),
// //               height: 1.65,
// //             ),
// //           ),
// //           const SizedBox(height: 16),
// //           const Text(
// //             'Manufacturer / Market address',
// //             style: TextStyle(
// //               fontSize: 12.5,
// //               fontWeight: FontWeight.w700,
// //               color: Color(0xFF111827),
// //             ),
// //           ),
// //           const SizedBox(height: 8),
// //           _infoRow(Icons.business_rounded, 'Sheetal Healthcare Pvt. Ltd.'),
// //           const SizedBox(height: 4),
// //           _infoRow(
// //             Icons.location_on_rounded,
// //             'Akshaya Nagar 1st Block, Rammurthy Nagar, Bangalore-560016',
// //           ),
// //           const SizedBox(height: 4),
// //           _infoRow(Icons.phone_rounded, '+91 8902357892'),
// //           const SizedBox(height: 4),
// //           _infoRow(Icons.flag_rounded, 'Country of Origin: India'),
// //           const SizedBox(height: 14),
// //           const Divider(color: Color(0xFFEFF1F7), thickness: 1),
// //           const SizedBox(height: 14),
// //           const Text(
// //             'In case of any issues, contact us',
// //             style: TextStyle(
// //               fontSize: 12.5,
// //               fontWeight: FontWeight.w700,
// //               color: Color(0xFF111827),
// //             ),
// //           ),
// //           const SizedBox(height: 8),
// //           _infoRow(Icons.email_rounded, 'care@veesafe.com'),
// //           const SizedBox(height: 4),
// //           _infoRow(Icons.phone_rounded, '+91 8802167892'),
// //         ],
// //       ),
// //     ),
// //   );

// //   Widget _infoRow(IconData icon, String text) => Row(
// //     crossAxisAlignment: CrossAxisAlignment.start,
// //     children: [
// //       Icon(icon, size: 13, color: kBlue),
// //       const SizedBox(width: 7),
// //       Expanded(
// //         child: Text(
// //           text,
// //           style: const TextStyle(
// //             fontSize: 11.5,
// //             color: Color(0xFF6B7280),
// //             height: 1.55,
// //           ),
// //         ),
// //       ),
// //     ],
// //   );

// //   // ── Footer ──
// //   Widget _footer() => Padding(
// //     padding: const EdgeInsets.symmetric(horizontal: 16),
// //     child: Container(
// //       width: double.infinity,
// //       padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(16),
// //         border: Border.all(color: const Color(0xFFEFF1F7)),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.03),
// //             blurRadius: 10,
// //             offset: const Offset(0, 3),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         children: [
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Container(
// //                 width: 32,
// //                 height: 32,
// //                 decoration: BoxDecoration(
// //                   color: kBlueLite,
// //                   borderRadius: BorderRadius.circular(9),
// //                 ),
// //                 child: const Icon(
// //                   Icons.medical_services_rounded,
// //                   color: kBlue,
// //                   size: 17,
// //                 ),
// //               ),
// //               const SizedBox(width: 8),
// //               RichText(
// //                 text: const TextSpan(
// //                   children: [
// //                     TextSpan(
// //                       text: 'Vee',
// //                       style: TextStyle(
// //                         fontSize: 18,
// //                         fontWeight: FontWeight.w900,
// //                         color: Color(0xFF111827),
// //                       ),
// //                     ),
// //                     TextSpan(
// //                       text: 'safe',
// //                       style: TextStyle(
// //                         fontSize: 18,
// //                         fontWeight: FontWeight.w900,
// //                         color: kBlue,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //           const SizedBox(height: 10),
// //           const Text(
// //             'Making Healthcare',
// //             style: TextStyle(
// //               fontSize: 14,
// //               fontWeight: FontWeight.w700,
// //               color: Color(0xFF111827),
// //             ),
// //           ),
// //           const SizedBox(height: 4),
// //           const Text(
// //             'UNDERSTANDABLE · ACCESSIBLE · AFFORDABLE',
// //             textAlign: TextAlign.center,
// //             style: TextStyle(
// //               fontSize: 9.5,
// //               fontWeight: FontWeight.w600,
// //               color: kBlue,
// //               letterSpacing: 0.6,
// //             ),
// //           ),
// //           const SizedBox(height: 14),
// //           const Divider(color: Color(0xFFEFF1F7), thickness: 1),
// //           const SizedBox(height: 10),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: const [
// //               Text(
// //                 'Made with ',
// //                 style: TextStyle(fontSize: 11.5, color: Color(0xFF6B7280)),
// //               ),
// //               Icon(Icons.favorite_rounded, color: Colors.red, size: 12),
// //               Text(
// //                 ' by ',
// //                 style: TextStyle(fontSize: 11.5, color: Color(0xFF6B7280)),
// //               ),
// //               Text(
// //                 'veesafe',
// //                 style: TextStyle(
// //                   fontSize: 11.5,
// //                   color: kBlue,
// //                   fontWeight: FontWeight.w700,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     ),
// //   );

// //   // ── Care Plan Card ──
// //   Widget _carePlanCard() => Padding(
// //     padding: const EdgeInsets.symmetric(horizontal: 16),
// //     child: Container(
// //       padding: const EdgeInsets.all(18),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(16),
// //         border: Border.all(color: kBlue, width: 1.5),
// //         boxShadow: [
// //           BoxShadow(
// //             color: kBlue.withOpacity(0.08),
// //             blurRadius: 12,
// //             offset: const Offset(0, 4),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Row(
// //             children: [
// //               Container(
// //                 padding: const EdgeInsets.symmetric(
// //                   horizontal: 12,
// //                   vertical: 5,
// //                 ),
// //                 decoration: BoxDecoration(
// //                   color: kBlue,
// //                   borderRadius: BorderRadius.circular(8),
// //                 ),
// //                 child: const Text(
// //                   'Care Plan',
// //                   style: TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 12,
// //                     fontWeight: FontWeight.w700,
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(width: 10),
// //               const Text(
// //                 'Starting ₹45 / month',
// //                 style: TextStyle(fontSize: 11.5, color: Color(0xFF6B7280)),
// //               ),
// //             ],
// //           ),
// //           const SizedBox(height: 14),
// //           const Text(
// //             'Extra 5% savings on all medicine\norders, free shipping & more.',
// //             style: TextStyle(
// //               fontSize: 16,
// //               fontWeight: FontWeight.w800,
// //               color: Color(0xFF111827),
// //               height: 1.35,
// //             ),
// //           ),
// //           const SizedBox(height: 14),
// //           const Divider(color: Color(0xFFEFF1F7), thickness: 1),
// //           const SizedBox(height: 12),
// //           _bullet(
// //             Icons.local_shipping_rounded,
// //             'Same day and next day delivery',
// //           ),
// //           const SizedBox(height: 8),
// //           _bullet(Icons.star_rounded, 'Get rewards on every purchase'),
// //           const SizedBox(height: 16),
// //           GestureDetector(
// //             onTap: () => ScaffoldMessenger.of(context).showSnackBar(
// //               SnackBar(
// //                 content: const Text('🎉 Welcome to Veesafe Care Plan!'),
// //                 backgroundColor: kBlue,
// //                 behavior: SnackBarBehavior.floating,
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(12),
// //                 ),
// //               ),
// //             ),
// //             child: Container(
// //               height: 44,
// //               width: 130,
// //               decoration: BoxDecoration(
// //                 color: kBlue,
// //                 borderRadius: BorderRadius.circular(12),
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: kBlue.withOpacity(0.3),
// //                     blurRadius: 10,
// //                     offset: const Offset(0, 4),
// //                   ),
// //                 ],
// //               ),
// //               child: const Center(
// //                 child: Text(
// //                   'Join Now',
// //                   style: TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 14,
// //                     fontWeight: FontWeight.w700,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           const SizedBox(height: 10),
// //           const Text(
// //             "T&Cs apply",
// //             style: TextStyle(fontSize: 10.5, color: Color(0xFF9CA3AF)),
// //           ),
// //         ],
// //       ),
// //     ),
// //   );

// //   Widget _bullet(IconData icon, String text) => Row(
// //     children: [
// //       Container(
// //         width: 26,
// //         height: 26,
// //         decoration: BoxDecoration(
// //           color: kBlueLite,
// //           borderRadius: BorderRadius.circular(7),
// //         ),
// //         child: Icon(icon, size: 14, color: kBlue),
// //       ),
// //       const SizedBox(width: 10),
// //       Expanded(
// //         child: Text(
// //           text,
// //           style: const TextStyle(
// //             fontSize: 12.5,
// //             color: Color(0xFF374151),
// //             fontWeight: FontWeight.w500,
// //           ),
// //         ),
// //       ),
// //     ],
// //   );
// // }














// lib/screens/category_screen.dart
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/product_model.dart';
import '../screens/product_detail_screen.dart';

const _b1 = 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=180&h=180&fit=crop';
const _b2 = 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=180&h=180&fit=crop';
const _b3 = 'https://images.unsplash.com/photo-1631549916768-4119b2e5f926?w=180&h=180&fit=crop';
const _b4 = 'https://images.unsplash.com/photo-1559757175-5700dde675bc?w=180&h=180&fit=crop';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _selectedChip = 0;
  final _searchCtrl = TextEditingController();
  String _searchQuery = '';

  final List<String> _chips = [
    'Covid Essentials', 'Essential', 'Mobility Aid', 'Equipment', 'Homecare',
  ];

  final Map<int, List<Product>> _categoryProducts = {
    0: [
      Product(name: 'Covid Test Kit',  price: 'Rs.299.00',   oldPrice: 'Rs.450.00',   badge: '33% Off', badgeColor: kBlue,  imageBg: Color(0xFFFFE4E6), imageIcon: Icons.coronavirus_rounded,        imageIconColor: Color(0xFFE11D48), imageUrl: 'https://images.unsplash.com/photo-1584036561566-baf8f5f1b144?w=200&h=200&fit=crop'),
      Product(name: 'Face Mask Pack',  price: 'Rs.199.00',   oldPrice: 'Rs.299.00',   badge: '33% Off', badgeColor: kGreen, imageBg: Color(0xFFDCFCE7), imageIcon: Icons.masks_rounded,              imageIconColor: Color(0xFF16A34A), imageUrl: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=200&h=200&fit=crop'),
      Product(name: 'Hand Sanitizer',  price: 'Rs.149.00',   oldPrice: 'Rs.199.00',   badge: '25% Off', badgeColor: kBlue,  imageBg: Color(0xFFE0F2FE), imageIcon: Icons.sanitizer_rounded,          imageIconColor: Color(0xFF0284C7), imageUrl: 'https://images.unsplash.com/photo-1584017911766-d821171b6f5a?w=200&h=200&fit=crop'),
      Product(name: 'PPE Kit',         price: 'Rs.499.00',   oldPrice: 'Rs.699.00',   badge: '28% Off', badgeColor: kGreen, imageBg: Color(0xFFFFE4E6), imageIcon: Icons.health_and_safety_rounded,  imageIconColor: Color(0xFFE11D48), imageUrl: 'https://images.unsplash.com/photo-1585771724684-38269d6639fd?w=200&h=200&fit=crop'),
      Product(name: 'Oximeter',        price: 'Rs.899.00',   oldPrice: 'Rs.1,299.00', badge: '30% Off', badgeColor: kBlue,  imageBg: Color(0xFFEDE9FE), imageIcon: Icons.monitor_heart_rounded,      imageIconColor: Color(0xFF7C3AED), imageUrl: 'https://images.unsplash.com/photo-1559757175-5700dde675bc?w=200&h=200&fit=crop'),
      Product(name: 'Thermometer',     price: 'Rs.350.00',   oldPrice: 'Rs.499.00',   badge: '30% Off', badgeColor: kGreen, imageBg: Color(0xFFFEF3C7), imageIcon: Icons.thermostat_rounded,         imageIconColor: Color(0xFFD97706), imageUrl: 'https://images.unsplash.com/photo-1631549916768-4119b2e5f926?w=200&h=200&fit=crop'),
    ],
    1: [
      Product(name: 'BP Monitor',      price: 'Rs.1,299.00', oldPrice: 'Rs.1,800.00', badge: '27% Off', badgeColor: kBlue,  imageBg: Color(0xFFFFE4E6), imageIcon: Icons.favorite_rounded,           imageIconColor: Color(0xFFE11D48), imageUrl: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=200&h=200&fit=crop'),
      Product(name: 'Glucometer',      price: 'Rs.2,604.00', oldPrice: 'Rs.3,800.00', badge: '31% Off', badgeColor: kGreen, imageBg: Color(0xFFDCFCE7), imageIcon: Icons.bloodtype_rounded,          imageIconColor: Color(0xFF16A34A), imageUrl: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=200&h=200&fit=crop'),
      Product(name: 'First Aid Kit',   price: 'Rs.799.00',   oldPrice: 'Rs.999.00',   badge: '20% Off', badgeColor: kBlue,  imageBg: Color(0xFFFEF3C7), imageIcon: Icons.medical_services_rounded,   imageIconColor: Color(0xFFD97706), imageUrl: 'https://images.unsplash.com/photo-1603398938378-e54eab446dde?w=200&h=200&fit=crop'),
      Product(name: 'Nebulizer',       price: 'Rs.1,499.00', oldPrice: 'Rs.2,000.00', badge: '25% Off', badgeColor: kGreen, imageBg: Color(0xFFE0F2FE), imageIcon: Icons.air_rounded,                imageIconColor: Color(0xFF0284C7), imageUrl: 'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=200&h=200&fit=crop'),
      Product(name: 'Stethoscope',     price: 'Rs.999.00',   oldPrice: 'Rs.1,499.00', badge: '33% Off', badgeColor: kBlue,  imageBg: Color(0xFFEDE9FE), imageIcon: Icons.hearing_rounded,            imageIconColor: Color(0xFF7C3AED), imageUrl: 'https://images.unsplash.com/photo-1576671081837-49000212a370?w=200&h=200&fit=crop'),
      Product(name: 'VapoRub',         price: 'Rs.220.00',   oldPrice: 'Rs.299.00',   badge: '26% Off', badgeColor: kGreen, imageBg: Color(0xFFF0FDF4), imageIcon: Icons.spa_rounded,                imageIconColor: Color(0xFF16A34A), imageUrl: 'https://images.unsplash.com/photo-1550572017-edd951b55104?w=200&h=200&fit=crop'),
    ],
    2: [
      Product(name: 'Walking Stick',   price: 'Rs.699.00',   oldPrice: 'Rs.999.00',   badge: '30% Off', badgeColor: kBlue,  imageBg: Color(0xFFDCFCE7), imageIcon: Icons.accessibility_new_rounded,  imageIconColor: Color(0xFF16A34A), imageUrl: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=200&h=200&fit=crop'),
      Product(name: 'Wheel Chair',     price: 'Rs.8,499.00', oldPrice: 'Rs.11,000.00',badge: '22% Off', badgeColor: kGreen, imageBg: Color(0xFFEDE9FE), imageIcon: Icons.wheelchair_pickup_rounded,  imageIconColor: Color(0xFF7C3AED), imageUrl: 'https://images.unsplash.com/photo-1573812461383-e5f8b759d12e?w=200&h=200&fit=crop'),
      Product(name: 'Leg Massager',    price: 'Rs.2,199.00', oldPrice: 'Rs.2,999.00', badge: '26% Off', badgeColor: kBlue,  imageBg: Color(0xFFFFE4E6), imageIcon: Icons.self_improvement_rounded,   imageIconColor: Color(0xFFE11D48), imageUrl: 'https://images.unsplash.com/photo-1519823551278-64ac92734fb1?w=200&h=200&fit=crop'),
      Product(name: 'Crutches',        price: 'Rs.850.00',   oldPrice: 'Rs.1,199.00', badge: '29% Off', badgeColor: kGreen, imageBg: Color(0xFFE0F2FE), imageIcon: Icons.elderly_rounded,            imageIconColor: Color(0xFF0284C7), imageUrl: 'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=200&h=200&fit=crop'),
      Product(name: 'Knee Support',    price: 'Rs.499.00',   oldPrice: 'Rs.699.00',   badge: '28% Off', badgeColor: kBlue,  imageBg: Color(0xFFFEF3C7), imageIcon: Icons.healing_rounded,            imageIconColor: Color(0xFFD97706), imageUrl: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=200&h=200&fit=crop'),
      Product(name: 'Back Brace',      price: 'Rs.649.00',   oldPrice: 'Rs.899.00',   badge: '27% Off', badgeColor: kGreen, imageBg: Color(0xFFDCFCE7), imageIcon: Icons.sports_martial_arts_rounded, imageIconColor: Color(0xFF16A34A), imageUrl: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=200&h=200&fit=crop'),
    ],
    3: [
      Product(name: 'Oxygen Cylinder', price: 'Rs.4,500.00', oldPrice: 'Rs.6,000.00', badge: '25% Off', badgeColor: kBlue,  imageBg: Color(0xFFE0F2FE), imageIcon: Icons.air_rounded,                imageIconColor: Color(0xFF0284C7), imageUrl: 'https://images.unsplash.com/photo-1631549916768-4119b2e5f926?w=200&h=200&fit=crop'),
      Product(name: 'Hospital Bed',    price: 'Rs.18,000.00',oldPrice: 'Rs.24,000.00',badge: '25% Off', badgeColor: kGreen, imageBg: Color(0xFFEDE9FE), imageIcon: Icons.bed_rounded,                imageIconColor: Color(0xFF7C3AED), imageUrl: 'https://images.unsplash.com/photo-1576671081837-49000212a370?w=200&h=200&fit=crop'),
      Product(name: 'Surgical Gloves', price: 'Rs.299.00',   oldPrice: 'Rs.399.00',   badge: '25% Off', badgeColor: kBlue,  imageBg: Color(0xFFDCFCE7), imageIcon: Icons.back_hand_rounded,          imageIconColor: Color(0xFF16A34A), imageUrl: 'https://images.unsplash.com/photo-1585771724684-38269d6639fd?w=200&h=200&fit=crop'),
      Product(name: 'Surgical Dress',  price: 'Rs.1,499.00', oldPrice: 'Rs.1,999.00', badge: '25% Off', badgeColor: kGreen, imageBg: Color(0xFFFEF3C7), imageIcon: Icons.dry_cleaning_rounded,       imageIconColor: Color(0xFFD97706), imageUrl: 'https://images.unsplash.com/photo-1584036561566-baf8f5f1b144?w=200&h=200&fit=crop'),
      Product(name: 'Retinascope',     price: 'Rs.3,250.00', oldPrice: 'Rs.4,500.00', badge: '27% Off', badgeColor: kBlue,  imageBg: Color(0xFFFFE4E6), imageIcon: Icons.remove_red_eye_rounded,     imageIconColor: Color(0xFFE11D48), imageUrl: 'https://images.unsplash.com/photo-1559757175-5700dde675bc?w=200&h=200&fit=crop'),
      Product(name: 'Disposable Pack', price: 'Rs.599.00',   oldPrice: 'Rs.799.00',   badge: '25% Off', badgeColor: kGreen, imageBg: Color(0xFFE0F2FE), imageIcon: Icons.inventory_2_rounded,        imageIconColor: Color(0xFF0284C7), imageUrl: 'https://images.unsplash.com/photo-1603398938378-e54eab446dde?w=200&h=200&fit=crop'),
    ],
    4: [
      Product(name: 'Air Purifier',    price: 'Rs.3,999.00', oldPrice: 'Rs.5,499.00', badge: '27% Off', badgeColor: kBlue,  imageBg: Color(0xFFE0F2FE), imageIcon: Icons.air_rounded,                imageIconColor: Color(0xFF0284C7), imageUrl: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=200&h=200&fit=crop'),
      Product(name: 'Heating Pad',     price: 'Rs.799.00',   oldPrice: 'Rs.1,099.00', badge: '27% Off', badgeColor: kGreen, imageBg: Color(0xFFFFE4E6), imageIcon: Icons.local_fire_department_rounded,imageIconColor: Color(0xFFE11D48), imageUrl: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=200&h=200&fit=crop'),
      Product(name: 'Vaporizer',       price: 'Rs.1,099.00', oldPrice: 'Rs.1,499.00', badge: '26% Off', badgeColor: kBlue,  imageBg: Color(0xFFDCFCE7), imageIcon: Icons.cloud_rounded,              imageIconColor: Color(0xFF16A34A), imageUrl: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=200&h=200&fit=crop'),
      Product(name: 'Ice Pack',        price: 'Rs.249.00',   oldPrice: 'Rs.349.00',   badge: '28% Off', badgeColor: kGreen, imageBg: Color(0xFFE0F2FE), imageIcon: Icons.ac_unit_rounded,            imageIconColor: Color(0xFF0284C7), imageUrl: 'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=200&h=200&fit=crop'),
      Product(name: 'Bed Rail Guard',  price: 'Rs.1,599.00', oldPrice: 'Rs.2,199.00', badge: '27% Off', badgeColor: kBlue,  imageBg: Color(0xFFEDE9FE), imageIcon: Icons.bed_rounded,                imageIconColor: Color(0xFF7C3AED), imageUrl: 'https://images.unsplash.com/photo-1576671081837-49000212a370?w=200&h=200&fit=crop'),
      Product(name: 'Commode Chair',   price: 'Rs.2,299.00', oldPrice: 'Rs.2,999.00', badge: '23% Off', badgeColor: kGreen, imageBg: Color(0xFFFEF3C7), imageIcon: Icons.chair_rounded,              imageIconColor: Color(0xFFD97706), imageUrl: 'https://images.unsplash.com/photo-1585771724684-38269d6639fd?w=200&h=200&fit=crop'),
    ],
  };

  final List<Map<String, dynamic>> _brands = [
    {'name': 'VetTab',   'icon': Icons.pets,           'color': Color(0xFF7C3AED)},
    {'name': 'LifeOnic', 'icon': Icons.favorite,       'color': Color(0xFF0EA5E9)},
    {'name': 'riboxx',   'icon': Icons.science,        'color': Color(0xFF059669)},
    {'name': 'MedPlus',  'icon': Icons.local_pharmacy, 'color': Color(0xFFDC2626)},
  ];

  final List<Map<String, dynamic>> _browseCategories = [
    {'name': 'Fitness &\nHealth care', 'img': 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=200&h=200&fit=crop', 'bg': Color(0xFFE3F2FD), 'chip': 1},
    {'name': 'Covid\nEssentials',      'img': 'https://images.unsplash.com/photo-1584036561566-baf8f5f1b144?w=200&h=200&fit=crop', 'bg': Color(0xFFFFEBEE), 'chip': 0},
    {'name': 'Equipment',              'img': 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=200&h=200&fit=crop', 'bg': Color(0xFFF4F6FB), 'chip': 3},
    {'name': 'Mobility\nAid',          'img': 'https://images.unsplash.com/photo-1573812461383-e5f8b759d12e?w=200&h=200&fit=crop', 'bg': Color(0xFFE8F5E9), 'chip': 2},
    {'name': 'Essential',              'img': 'https://images.unsplash.com/photo-1603398938378-e54eab446dde?w=200&h=200&fit=crop', 'bg': Color(0xFFF3E5F5), 'chip': 1},
    {'name': 'Homecare',               'img': 'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=200&h=200&fit=crop',   'bg': Color(0xFFFFF8E1), 'chip': 4},
  ];

  final List<double> _ratings = [4.1, 4.3, 4.5, 4.2, 4.4, 4.0];
  final List<String> _badgeLabels = ['NEW', 'HOT', 'SALE', 'TOP', 'BEST', 'PICK'];

  List<Product> get _filteredProducts {
    final products = _categoryProducts[_selectedChip] ?? [];
    if (_searchQuery.trim().isEmpty) return products;
    return products
        .where((p) => p.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      body: SafeArea(
        left: false, right: false,
        child: Column(
          children: [
            _appBar(context),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 14),
                    _searchBar(),
                    const SizedBox(height: 14),
                    _browseAllRow(),
                    const SizedBox(height: 14),
                    _heroBanner(),
                    const SizedBox(height: 20),
                    _sectionHeader('Search by category'),
                    const SizedBox(height: 10),
                    _filterChipRow(),
                    const SizedBox(height: 14),
                    _productGrid(),
                    const SizedBox(height: 20),
                    _topBrands(),
                    const SizedBox(height: 20),
                    _sectionHeader('Browse by category'),
                    const SizedBox(height: 12),
                    _browseCategoryGrid(),
                    const SizedBox(height: 20),
                    _otherInformation(),
                    const SizedBox(height: 14),
                    _footer(),
                    const SizedBox(height: 14),
                    _carePlanCard(),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) => Container(
    decoration: const BoxDecoration(
      color: kBlue,
      border: Border(bottom: BorderSide(color: Color(0x22000000), width: 1)),
    ),
    padding: const EdgeInsets.fromLTRB(4, 8, 14, 12),
    child: Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: Colors.white),
          onPressed: () => Navigator.pop(context),
          splashRadius: 20,
        ),
        const Expanded(
          child: Center(
            child: Text('Category',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white)),
          ),
        ),
        const SizedBox(width: 48),
      ],
    ),
  );

  Widget _searchBar() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          const Icon(Icons.search_rounded, color: kGrey, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _searchCtrl,
              onChanged: (v) => setState(() => _searchQuery = v),
              style: const TextStyle(fontSize: 13, color: kBlack),
              decoration: const InputDecoration(
                hintText: 'Search products in this category...',
                hintStyle: TextStyle(color: kGrey, fontSize: 13),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          if (_searchQuery.isNotEmpty)
            GestureDetector(
              onTap: () { _searchCtrl.clear(); setState(() => _searchQuery = ''); },
              child: const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(Icons.close_rounded, color: kGrey, size: 18),
              ),
            ),
        ],
      ),
    ),
  );

  Widget _browseAllRow() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEFF1F7)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Row(
        children: [
          Container(
            width: 42, height: 42,
            decoration: BoxDecoration(color: const Color(0xFFFFF8DC), borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.grid_view_rounded, color: Color(0xFFF9A825), size: 21),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Browse all categories',
                    style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700, color: Color(0xFF111827))),
                SizedBox(height: 2),
                Text('Up to 69% off on health products',
                    style: TextStyle(fontSize: 11.5, color: Color(0xFF6B7280))),
              ],
            ),
          ),
          Container(
            width: 28, height: 28,
            decoration: BoxDecoration(color: const Color(0xFFF4F6FB), borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.arrow_forward_ios_rounded, size: 12, color: Color(0xFF6B7280)),
          ),
        ],
      ),
    ),
  );

  Widget _heroBanner() => Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            color: const Color(0xFFEDE7F6),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 3))],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 0, 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('50% OFF',
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFF6B7280), letterSpacing: 0.4)),
                      const SizedBox(height: 3),
                      const Text('Medical\nProduct',
                          style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900, color: Color(0xFF111827), height: 1.15)),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => setState(() => _selectedChip = 1),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                          decoration: BoxDecoration(color: const Color(0xFF111827), borderRadius: BorderRadius.circular(20)),
                          child: const Text('Buy Now',
                              style: TextStyle(color: Colors.white, fontSize: 11.5, fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [Expanded(child: _bBox(_b1)), const SizedBox(width: 5), Expanded(child: _bBox(_b2))]),
                      const SizedBox(height: 5),
                      Row(children: [Expanded(child: _bBox(_b3)), const SizedBox(width: 5), Expanded(child: _bBox(_b4))]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (i) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: i == 0 ? 20 : 6, height: 6,
          decoration: BoxDecoration(
            color: i == 0 ? kBlue : const Color(0xFFD1D5DB),
            borderRadius: BorderRadius.circular(3),
          ),
        )),
      ),
    ],
  );

  Widget _bBox(String url) => Container(
    height: 50,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(9),
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 5, offset: const Offset(0, 2))],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(9),
      child: Image.network(url, fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => const Icon(Icons.medical_services_outlined, color: kBlue, size: 18)),
    ),
  );

  Widget _sectionHeader(String t) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: [
        Container(width: 3.5, height: 16,
            decoration: BoxDecoration(color: kBlue, borderRadius: BorderRadius.circular(4))),
        const SizedBox(width: 8),
        Text(t, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Color(0xFF111827))),
      ],
    ),
  );

  Widget _sectionHeaderWithSeeAll(String t) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Container(width: 3.5, height: 16,
              decoration: BoxDecoration(color: kBlue, borderRadius: BorderRadius.circular(4))),
          const SizedBox(width: 8),
          Text(t, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Color(0xFF111827))),
        ]),
        Row(children: [
          Text('See all', style: TextStyle(fontSize: 12, color: kBlue, fontWeight: FontWeight.w600)),
          Icon(Icons.chevron_right_rounded, size: 15, color: kBlue),
        ]),
      ],
    ),
  );

  Widget _filterChipRow() => SizedBox(
    height: 38,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _chips.length,
      separatorBuilder: (_, __) => const SizedBox(width: 8),
      itemBuilder: (_, i) {
        final sel = i == _selectedChip;
        return GestureDetector(
          onTap: () => setState(() { _selectedChip = i; _searchQuery = ''; _searchCtrl.clear(); }),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: sel ? kBlue : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: sel ? kBlue : const Color(0xFFDDE1EB)),
              boxShadow: sel
                  ? [BoxShadow(color: kBlue.withOpacity(0.22), blurRadius: 8, offset: const Offset(0, 3))]
                  : [],
            ),
            child: Text(_chips[i],
                style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w600,
                  color: sel ? Colors.white : const Color(0xFF6B7280),
                )),
          ),
        );
      },
    ),
  );

  // ════════════════════════════════════════
  //  PRODUCT GRID — fixed, no empty space
  // ════════════════════════════════════════
  Widget _productGrid() {
    final products = _filteredProducts;
    if (products.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [
              const Icon(Icons.search_off_rounded, size: 50, color: kGrey),
              const SizedBox(height: 12),
              Text('No products found for "$_searchQuery"',
                  style: const TextStyle(fontSize: 14, color: kGrey)),
            ],
          ),
        ),
      );
    }

    // Use Wrap so each card is exactly as tall as its content — zero empty space
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: List.generate(products.length, (i) {
          final p      = products[i];
          final rating = _ratings[i % _ratings.length];
          final badge  = _badgeLabels[i % _badgeLabels.length];

          // Each card is exactly 1/3 of row width minus spacing
          final cardWidth = (MediaQuery.of(context).size.width - 32 - 20) / 3;

          return GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => ProductDetailScreen(product: p))),
            child: SizedBox(
              width: cardWidth,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFEFF1F7)),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 3)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // shrinks to content height
                  children: [
                    // Image
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        color: p.imageBg,
                        child: p.imageUrl.startsWith('http')
                            ? Image.network(
                                p.imageUrl,
                                fit: BoxFit.cover,
                                loadingBuilder: (_, child, prog) => prog == null
                                    ? child
                                    : Center(child: SizedBox(width: 16, height: 16,
                                        child: CircularProgressIndicator(strokeWidth: 2, color: p.imageIconColor))),
                                errorBuilder: (_, __, ___) =>
                                    Center(child: Icon(p.imageIcon, color: p.imageIconColor, size: 32)),
                              )
                            : Center(child: Icon(p.imageIcon, color: p.imageIconColor, size: 32)),
                      ),
                    ),
                    // Info — tight padding, no spacer, no fixed height
                    Padding(
                      padding: const EdgeInsets.fromLTRB(7, 6, 7, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Name
                          Text(
                            p.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF111827),
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Price
                          Text(
                            p.price,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              color: kBlue,
                            ),
                          ),
                          const SizedBox(height: 2),
                          // Old price
                          Text(
                            p.oldPrice,
                            style: const TextStyle(
                              fontSize: 9,
                              color: kGrey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Discount badge
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                              color: p.badgeColor.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              p.badge,
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w700,
                                color: p.badgeColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Rating + label
                          Row(
                            children: [
                              const Icon(Icons.star_rounded, color: Color(0xFFF59E0B), size: 12),
                              const SizedBox(width: 2),
                              Text(
                                rating.toString(),
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF374151),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: kBlue,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  badge,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 0.3,
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
              ),
            ),
          );
        }),
      ),
    );
  }

    Widget _topBrands() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _sectionHeaderWithSeeAll('Top Brands'),
      const SizedBox(height: 12),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            color: kDarkNavy,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: kDarkNavy.withOpacity(0.25), blurRadius: 14, offset: const Offset(0, 5))],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _brands.map((b) => Column(
              children: [
                Container(
                  width: 54, height: 54,
                  decoration: BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 3))],
                  ),
                  child: Icon(b['icon'] as IconData, color: b['color'] as Color, size: 24),
                ),
                const SizedBox(height: 7),
                Text(b['name'] as String,
                    style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
              ],
            )).toList(),
          ),
        ),
      ),
    ],
  );

  Widget _browseCategoryGrid() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.85,
      ),
      itemCount: _browseCategories.length,
      itemBuilder: (_, i) {
        final c = _browseCategories[i];
        return GestureDetector(
          onTap: () => setState(() => _selectedChip = c['chip'] as int),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: kBlue.withOpacity(0.15), width: 1.5),
              boxShadow: [BoxShadow(color: kBlue.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 3))],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 64, height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: kBlue, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      c['img'] as String, fit: BoxFit.cover,
                      loadingBuilder: (_, child, prog) {
                        if (prog == null) return child;
                        return Container(color: c['bg'] as Color,
                            child: const Center(child: SizedBox(width: 14, height: 14,
                                child: CircularProgressIndicator(strokeWidth: 2, color: kBlue))));
                      },
                      errorBuilder: (_, __, ___) => Container(color: c['bg'] as Color,
                          child: const Icon(Icons.category_rounded, color: kBlue, size: 26)),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(c['name'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.w700, color: Color(0xFF111827), height: 1.3)),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );

  Widget _otherInformation() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEFF1F7)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(width: 3.5, height: 16,
                decoration: BoxDecoration(color: kBlue, borderRadius: BorderRadius.circular(4))),
            const SizedBox(width: 8),
            const Text('Other Information',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Color(0xFF111827))),
          ]),
          const SizedBox(height: 10),
          const Text(
            'We are glad we can help you with your medical needs. Our team of experts is here to make sure you get the best quality products and services at affordable prices.',
            style: TextStyle(fontSize: 12, color: Color(0xFF6B7280), height: 1.65),
          ),
          const SizedBox(height: 16),
          const Text('Manufacturer / Market address',
              style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: Color(0xFF111827))),
          const SizedBox(height: 8),
          _infoRow(Icons.business_rounded, 'Sheetal Healthcare Pvt. Ltd.'),
          const SizedBox(height: 4),
          _infoRow(Icons.location_on_rounded, 'Akshaya Nagar 1st Block, Rammurthy Nagar, Bangalore-560016'),
          const SizedBox(height: 4),
          _infoRow(Icons.phone_rounded, '+91 8902357892'),
          const SizedBox(height: 4),
          _infoRow(Icons.flag_rounded, 'Country of Origin: India'),
          const SizedBox(height: 14),
          const Divider(color: Color(0xFFEFF1F7), thickness: 1),
          const SizedBox(height: 14),
          const Text('In case of any issues, contact us',
              style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: Color(0xFF111827))),
          const SizedBox(height: 8),
          _infoRow(Icons.email_rounded, 'care@veesafe.com'),
          const SizedBox(height: 4),
          _infoRow(Icons.phone_rounded, '+91 8802167892'),
        ],
      ),
    ),
  );

  Widget _infoRow(IconData icon, String text) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, size: 13, color: kBlue),
      const SizedBox(width: 7),
      Expanded(child: Text(text,
          style: const TextStyle(fontSize: 11.5, color: Color(0xFF6B7280), height: 1.55))),
    ],
  );

  Widget _footer() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEFF1F7)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 32, height: 32,
                decoration: BoxDecoration(color: kBlueLite, borderRadius: BorderRadius.circular(9)),
                child: const Icon(Icons.medical_services_rounded, color: kBlue, size: 17),
              ),
              const SizedBox(width: 8),
              RichText(text: const TextSpan(children: [
                TextSpan(text: 'Vee', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color(0xFF111827))),
                TextSpan(text: 'safe', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: kBlue)),
              ])),
            ],
          ),
          const SizedBox(height: 10),
          const Text('Making Healthcare',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF111827))),
          const SizedBox(height: 4),
          const Text('UNDERSTANDABLE · ACCESSIBLE · AFFORDABLE',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.w600, color: kBlue, letterSpacing: 0.6)),
          const SizedBox(height: 14),
          const Divider(color: Color(0xFFEFF1F7), thickness: 1),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Made with ', style: TextStyle(fontSize: 11.5, color: Color(0xFF6B7280))),
              Icon(Icons.favorite_rounded, color: Colors.red, size: 12),
              Text(' by ', style: TextStyle(fontSize: 11.5, color: Color(0xFF6B7280))),
              Text('veesafe', style: TextStyle(fontSize: 11.5, color: kBlue, fontWeight: FontWeight.w700)),
            ],
          ),
        ],
      ),
    ),
  );

  Widget _carePlanCard() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kBlue, width: 1.5),
        boxShadow: [BoxShadow(color: kBlue.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(color: kBlue, borderRadius: BorderRadius.circular(8)),
              child: const Text('Care Plan',
                  style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
            ),
            const SizedBox(width: 10),
            const Text('Starting ₹45 / month',
                style: TextStyle(fontSize: 11.5, color: Color(0xFF6B7280))),
          ]),
          const SizedBox(height: 14),
          const Text('Extra 5% savings on all medicine\norders, free shipping & more.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF111827), height: 1.35)),
          const SizedBox(height: 14),
          const Divider(color: Color(0xFFEFF1F7), thickness: 1),
          const SizedBox(height: 12),
          _bullet(Icons.local_shipping_rounded, 'Same day and next day delivery'),
          const SizedBox(height: 8),
          _bullet(Icons.star_rounded, 'Get rewards on every purchase'),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text('🎉 Welcome to Veesafe Care Plan!'),
              backgroundColor: kBlue,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            )),
            child: Container(
              height: 44, width: 130,
              decoration: BoxDecoration(
                color: kBlue,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: kBlue.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4))],
              ),
              child: const Center(
                child: Text('Join Now',
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text("T&Cs apply", style: TextStyle(fontSize: 10.5, color: Color(0xFF9CA3AF))),
        ],
      ),
    ),
  );

  Widget _bullet(IconData icon, String text) => Row(
    children: [
      Container(
        width: 26, height: 26,
        decoration: BoxDecoration(color: kBlueLite, borderRadius: BorderRadius.circular(7)),
        child: Icon(icon, size: 14, color: kBlue),
      ),
      const SizedBox(width: 10),
      Expanded(child: Text(text,
          style: const TextStyle(fontSize: 12.5, color: Color(0xFF374151), fontWeight: FontWeight.w500))),
    ],
  );
}