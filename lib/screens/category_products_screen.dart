// // // // lib/screens/category_products_screen.dart

// // // import 'package:flutter/material.dart';
// // // import '../constants/app_colors.dart';
// // // import '../models/product_model.dart';
// // // import '../widgets/product_card.dart';

// // // class CategoryProductsScreen extends StatefulWidget {
// // //   final String categoryName;
// // //   final Color categoryColor;
// // //   final IconData categoryIcon;

// // //   const CategoryProductsScreen({
// // //     super.key,
// // //     required this.categoryName,
// // //     required this.categoryColor,
// // //     required this.categoryIcon,
// // //   });

// // //   @override
// // //   State<CategoryProductsScreen> createState() =>
// // //       _CategoryProductsScreenState();
// // // }

// // // class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
// // //   String _sortBy = 'Popular';
// // //   final List<String> _sortOptions = [
// // //     'Popular', 'Price: Low to High', 'Price: High to Low', 'Newest'
// // //   ];

// // //   // ── All products mapped per category ──
// // //   static const _imgBloodTest =
// // //       'assets/images/blood machine.jpg';
// // //   static const _imgSurgical =
// // //       'https://images.unsplash.com/photo-1584432810601-6c7f27d2362b?w=300&h=300&fit=crop';
// // //   static const _imgRetina =
// // //       'https://images.unsplash.com/photo-1576671081837-49000212a370?w=300&h=300&fit=crop';
// // //   static const _imgFirstAid =
// // //       'assets/images/first aid kit.jpg';
// // //   static const _imgOxyCyl =
// // //       'assets/images/Oxygen Medic Kit .jpg';
// // //   static const _imgDisposable =
// // //       'assets/images/Disposable.jpg';
// // //   static const _imgWalkStick =
// // //       'assets/images/Walking Stick.jpg';
// // //   static const _imgWheelchair =
// // //       'https://images.unsplash.com/photo-1573812461383-e5f8b759d12e?w=300&h=300&fit=crop';
// // //   static const _imgLegMassage =
// // //       'https://images.unsplash.com/photo-1519823551278-64ac92734fb1?w=300&h=300&fit=crop';
// // //   static const _imgNebulizer =
// // //       'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=300&h=300&fit=crop';
// // //   static const _imgGlucometer =
// // //       'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=300&h=300&fit=crop';

// // //   Map<String, List<Product>> get _categoryProducts => {
// // //         'Beauty': [
// // //           Product(name: 'Skin Care Kit',        price: 'Rs.899.00',  oldPrice: 'Rs.1,200.00', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgSurgical),
// // //           Product(name: 'Hair Care Set',         price: 'Rs.599.00',  oldPrice: 'Rs.799.00',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgDisposable),
// // //           Product(name: 'Face Wash Bundle',      price: 'Rs.450.00',  oldPrice: 'Rs.600.00',   badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgSurgical),
// // //           Product(name: 'Moisturizer SPF 50',    price: 'Rs.750.00',  oldPrice: 'Rs.999.00',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgDisposable),
// // //           Product(name: 'Vitamin C Serum',       price: 'Rs.1,200.00',oldPrice: 'Rs.1,500.00', badge: '20% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgSurgical),
// // //           Product(name: 'Lip Balm Pack',         price: 'Rs.299.00',  oldPrice: 'Rs.399.00',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgDisposable),
// // //         ],
// // //         'Lifestyle &\nFitness': [
// // //           Product(name: 'Yoga Mat Premium',      price: 'Rs.1,299.00',oldPrice: 'Rs.1,800.00', badge: '28% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
// // //           Product(name: 'Resistance Band Set',   price: 'Rs.599.00',  oldPrice: 'Rs.799.00',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
// // //           Product(name: 'Fitness Tracker',       price: 'Rs.2,499.00',oldPrice: 'Rs.3,200.00', badge: '22% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgGlucometer),
// // //           Product(name: 'Dumbbell Set 5kg',      price: 'Rs.1,599.00',oldPrice: 'Rs.2,000.00', badge: '20% Off', badgeColor: kGreen, imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
// // //           Product(name: 'Skipping Rope',         price: 'Rs.299.00',  oldPrice: 'Rs.399.00',   badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
// // //           Product(name: 'Protein Shaker',        price: 'Rs.449.00',  oldPrice: 'Rs.599.00',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgGlucometer),
// // //         ],
// // //         'Personal\nCare': [
// // //           Product(name: 'Electric Toothbrush',   price: 'Rs.999.00',  oldPrice: 'Rs.1,299.00', badge: '23% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgDisposable),
// // //           Product(name: 'Digital Thermometer',   price: 'Rs.399.00',  oldPrice: 'Rs.599.00',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgGlucometer),
// // //           Product(name: 'Nail Care Kit',         price: 'Rs.349.00',  oldPrice: 'Rs.499.00',   badge: '30% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgDisposable),
// // //           Product(name: 'Hair Trimmer',          price: 'Rs.799.00',  oldPrice: 'Rs.1,099.00', badge: '27% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgGlucometer),
// // //           Product(name: 'Body Massager',         price: 'Rs.1,199.00',oldPrice: 'Rs.1,599.00', badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgLegMassage),
// // //           Product(name: 'Sanitizer Pack 5x',     price: 'Rs.249.00',  oldPrice: 'Rs.349.00',   badge: '29% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgDisposable),
// // //         ],
// // //         'Mother &\nBaby': [
// // //           Product(name: 'Baby Monitor',          price: 'Rs.3,499.00',oldPrice: 'Rs.4,500.00', badge: '22% Off', badgeColor: kBlue,  imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
// // //           Product(name: 'Baby Thermometer',      price: 'Rs.699.00',  oldPrice: 'Rs.999.00',   badge: '30% Off', badgeColor: kGreen, imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
// // //           Product(name: 'Baby Nebulizer',        price: 'Rs.1,299.00',oldPrice: 'Rs.1,799.00', badge: '28% Off', badgeColor: kBlue,  imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgNebulizer),
// // //           Product(name: 'Maternity Belt',        price: 'Rs.899.00',  oldPrice: 'Rs.1,199.00', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgDisposable),
// // //           Product(name: 'Breast Pump Electric',  price: 'Rs.2,499.00',oldPrice: 'Rs.3,200.00', badge: '22% Off', badgeColor: kBlue,  imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
// // //           Product(name: 'Baby Weighing Scale',   price: 'Rs.1,099.00',oldPrice: 'Rs.1,499.00', badge: '27% Off', badgeColor: kGreen, imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
// // //         ],
// // //         'Testing\nProducts': [
// // //           Product(name: 'Blood Testing Device',  price: 'Rs.3,250.00',oldPrice: 'Rs.4,000.00', badge: '15% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgBloodTest),
// // //           Product(name: 'Glucometer Kit',        price: 'Rs.1,290.00',oldPrice: 'Rs.1,800.00', badge: '28% Off', badgeColor: kGreen, imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
// // //           Product(name: 'Pulse Oximeter',        price: 'Rs.899.00',  oldPrice: 'Rs.1,299.00', badge: '31% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
// // //           Product(name: 'BP Monitor Digital',    price: 'Rs.1,799.00',oldPrice: 'Rs.2,400.00', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
// // //           Product(name: 'Retinascope Full Set',  price: 'Rs.3,250.00',oldPrice: 'Rs.4,500.00', badge: '15% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgRetina),
// // //           Product(name: 'Urine Test Strips',     price: 'Rs.499.00',  oldPrice: 'Rs.699.00',   badge: '29% Off', badgeColor: kGreen, imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
// // //         ],
// // //         'Equipment &\nHomecare': [
// // //           Product(name: 'Oxygen Cylinder & Mask',price: 'Rs.2,199.00',oldPrice: 'Rs.3,000.00', badge: '26% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgOxyCyl),
// // //           Product(name: 'Walking Stick – Steel', price: 'Rs.1,499.00',oldPrice: 'Rs.1,999.00', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgWalkStick),
// // //           Product(name: 'Wheel Chair',           price: 'Rs.5,999.00',oldPrice: 'Rs.7,500.00', badge: '20% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgWheelchair),
// // //           Product(name: 'Leg Massager Pro',      price: 'Rs.2,800.00',oldPrice: 'Rs.3,500.00', badge: '20% Off', badgeColor: kGreen, imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgLegMassage),
// // //           Product(name: 'Nebulizer Machine',     price: 'Rs.1,850.00',oldPrice: 'Rs.2,400.00', badge: '22% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgNebulizer),
// // //           Product(name: 'First Aid Kit – Full',  price: 'Rs.1,499.00',oldPrice: 'Rs.1,999.00', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgFirstAid),
// // //         ],
// // //         'Oral Care': [
// // //           Product(name: 'Electric Toothbrush',   price: 'Rs.999.00',  oldPrice: 'Rs.1,299.00', badge: '23% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
// // //           Product(name: 'Teeth Whitening Kit',   price: 'Rs.799.00',  oldPrice: 'Rs.1,099.00', badge: '27% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
// // //           Product(name: 'Dental Floss Pack',     price: 'Rs.199.00',  oldPrice: 'Rs.299.00',   badge: '33% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
// // //           Product(name: 'Mouthwash 500ml',       price: 'Rs.349.00',  oldPrice: 'Rs.499.00',   badge: '30% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
// // //           Product(name: 'Tongue Cleaner Set',    price: 'Rs.149.00',  oldPrice: 'Rs.199.00',   badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
// // //           Product(name: 'Water Flosser',         price: 'Rs.1,499.00',oldPrice: 'Rs.1,999.00', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgGlucometer),
// // //         ],
// // //         'COVID - 19': [
// // //           Product(name: 'N95 Mask Pack 10x',     price: 'Rs.499.00',  oldPrice: 'Rs.699.00',   badge: '29% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
// // //           Product(name: 'COVID Test Kit',        price: 'Rs.299.00',  oldPrice: 'Rs.449.00',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgGlucometer),
// // //           Product(name: 'Oximeter Pulse',        price: 'Rs.899.00',  oldPrice: 'Rs.1,299.00', badge: '31% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgGlucometer),
// // //           Product(name: 'Sanitizer 500ml',       price: 'Rs.199.00',  oldPrice: 'Rs.299.00',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
// // //           Product(name: 'Face Shield Pack',      price: 'Rs.349.00',  oldPrice: 'Rs.499.00',   badge: '30% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
// // //           Product(name: 'Disposable Gloves 50x', price: 'Rs.299.00',  oldPrice: 'Rs.449.00',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
// // //         ],
// // //       };

// // //   List<Product> get _products {
// // //     final list = _categoryProducts[widget.categoryName] ?? [];
// // //     if (_sortBy == 'Price: Low to High') {
// // //       return [...list]..sort((a, b) => _parsePrice(a.price).compareTo(_parsePrice(b.price)));
// // //     } else if (_sortBy == 'Price: High to Low') {
// // //       return [...list]..sort((a, b) => _parsePrice(b.price).compareTo(_parsePrice(a.price)));
// // //     }
// // //     return list;
// // //   }

// // //   double _parsePrice(String price) =>
// // //       double.tryParse(price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: const Color(0xFFF5F7FA),
// // //       body: SafeArea(
// // //         child: Column(
// // //           children: [
// // //             _appBar(context),
// // //             _filterBar(),
// // //             Expanded(
// // //               child: _products.isEmpty
// // //                   ? _emptyState()
// // //                   : GridView.builder(
// // //                       physics: const BouncingScrollPhysics(),
// // //                       padding: const EdgeInsets.all(14),
// // //                       gridDelegate:
// // //                           const SliverGridDelegateWithFixedCrossAxisCount(
// // //                         crossAxisCount: 2,
// // //                         crossAxisSpacing: 12,
// // //                         mainAxisSpacing: 12,
// // //                         childAspectRatio: 0.72,
// // //                       ),
// // //                       itemCount: _products.length,
// // //                       itemBuilder: (_, i) => ProductCard(product: _products[i]),
// // //                     ),
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
// // //         padding: const EdgeInsets.fromLTRB(4, 6, 14, 10),
// // //         child: Row(
// // //           children: [
// // //             IconButton(
// // //               icon: const Icon(Icons.arrow_back_ios,
// // //                   size: 18, color: Colors.white),
// // //               onPressed: () => Navigator.pop(context),
// // //             ),
// // //             Container(
// // //               width: 34, height: 34,
// // //               decoration: BoxDecoration(
// // //                 color: Colors.white.withOpacity(0.2),
// // //                 borderRadius: BorderRadius.circular(10),
// // //               ),
// // //               child: Icon(widget.categoryIcon,
// // //                   size: 18, color: Colors.white),
// // //             ),
// // //             const SizedBox(width: 10),
// // //             Expanded(
// // //               child: Text(
// // //                 widget.categoryName.replaceAll('\n', ' '),
// // //                 style: const TextStyle(
// // //                     fontSize: 17,
// // //                     fontWeight: FontWeight.w800,
// // //                     color: Colors.white),
// // //               ),
// // //             ),
// // //             Container(
// // //               padding: const EdgeInsets.symmetric(
// // //                   horizontal: 10, vertical: 4),
// // //               decoration: BoxDecoration(
// // //                 color: Colors.white.withOpacity(0.2),
// // //                 borderRadius: BorderRadius.circular(20),
// // //               ),
// // //               child: Text(
// // //                 '${_products.length} items',
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
// // //   //  FILTER / SORT BAR
// // //   // ════════════════════════════════════════
// // //   Widget _filterBar() => Container(
// // //         color: Colors.white,
// // //         padding: const EdgeInsets.symmetric(
// // //             horizontal: 14, vertical: 10),
// // //         child: Row(
// // //           children: [
// // //             const Text('Sort by:',
// // //                 style: TextStyle(
// // //                     fontSize: 12,
// // //                     color: kGrey,
// // //                     fontWeight: FontWeight.w500)),
// // //             const SizedBox(width: 8),
// // //             Expanded(
// // //               child: SingleChildScrollView(
// // //                 scrollDirection: Axis.horizontal,
// // //                 physics: const BouncingScrollPhysics(),
// // //                 child: Row(
// // //                   children: _sortOptions.map((opt) {
// // //                     final isSelected = _sortBy == opt;
// // //                     return GestureDetector(
// // //                       onTap: () => setState(() => _sortBy = opt),
// // //                       child: AnimatedContainer(
// // //                         duration: const Duration(milliseconds: 200),
// // //                         margin: const EdgeInsets.only(right: 8),
// // //                         padding: const EdgeInsets.symmetric(
// // //                             horizontal: 12, vertical: 6),
// // //                         decoration: BoxDecoration(
// // //                           color: isSelected ? kBlue : kBlueLite,
// // //                           borderRadius: BorderRadius.circular(20),
// // //                           border: Border.all(
// // //                             color: isSelected
// // //                                 ? kBlue
// // //                                 : kBorderGrey,
// // //                           ),
// // //                         ),
// // //                         child: Text(opt,
// // //                             style: TextStyle(
// // //                                 fontSize: 11,
// // //                                 color: isSelected
// // //                                     ? Colors.white
// // //                                     : kBlue,
// // //                                 fontWeight: FontWeight.w600)),
// // //                       ),
// // //                     );
// // //                   }).toList(),
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       );

// // //   // ── Empty state ──
// // //   Widget _emptyState() => Center(
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             Container(
// // //               width: 80, height: 80,
// // //               decoration: BoxDecoration(
// // //                   color: kBlueLite, shape: BoxShape.circle),
// // //               child: Icon(widget.categoryIcon,
// // //                   color: kBlue, size: 36),
// // //             ),
// // //             const SizedBox(height: 16),
// // //             const Text('No products found',
// // //                 style: TextStyle(
// // //                     fontSize: 16,
// // //                     fontWeight: FontWeight.w700,
// // //                     color: kBlack)),
// // //             const SizedBox(height: 6),
// // //             const Text('Check back soon!',
// // //                 style: TextStyle(fontSize: 13, color: kGrey)),
// // //           ],
// // //         ),
// // //       );
      
// // // }







// // // lib/screens/category_products_screen.dart
// // import 'package:flutter/material.dart';
// // import '../constants/app_colors.dart';
// // import '../models/product_model.dart';

// // // ─────────────────────────────────────────────────────────────────────────────
// // //  PRODUCT DETAIL SCREEN
// // // ─────────────────────────────────────────────────────────────────────────────
// // class ProductDetailScreen extends StatefulWidget {
// //   final Product product;
// //   const ProductDetailScreen({super.key, required this.product});
// //   @override
// //   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// // }

// // class _ProductDetailScreenState extends State<ProductDetailScreen> {
// //   int _qty = 1;
// //   bool _liked = false;
// //   int _selectedDot = 0;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _liked = widget.product.liked;
// //   }

// //   double _parsePrice(String p) =>
// //       double.tryParse(p.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;

// //   @override
// //   Widget build(BuildContext context) {
// //     final p = widget.product;
// //     final double savings = _parsePrice(p.oldPrice) - _parsePrice(p.price);
// //     final int savingsPct = savings > 0
// //         ? (savings / _parsePrice(p.oldPrice) * 100).round()
// //         : 0;

// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF4F6FB),
// //       body: SafeArea(
// //         child: Column(children: [

// //           // ── AppBar
// //           Container(
// //             padding: const EdgeInsets.fromLTRB(4, 8, 12, 10),
// //             decoration: const BoxDecoration(
// //               color: Colors.white,
// //               border: Border(bottom: BorderSide(color: Color(0xFFEFF1F7), width: 1)),
// //             ),
// //             child: Row(children: [
// //               IconButton(
// //                 icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: Color(0xFF374151)),
// //                 onPressed: () => Navigator.pop(context),
// //                 splashRadius: 20,
// //               ),
// //               const Expanded(
// //                 child: Text('Product Details',
// //                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800,
// //                         color: Color(0xFF111827), letterSpacing: -0.2)),
// //               ),
// //               GestureDetector(
// //                 onTap: () => setState(() => _liked = !_liked),
// //                 child: Container(
// //                   width: 36, height: 36,
// //                   decoration: BoxDecoration(
// //                     color: _liked ? const Color(0xFFFFEEEE) : const Color(0xFFF4F6FB),
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //                   child: Icon(
// //                     _liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
// //                     size: 19, color: _liked ? Colors.red : const Color(0xFF6B7280),
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(width: 6),
// //               Container(
// //                 width: 36, height: 36,
// //                 decoration: BoxDecoration(color: const Color(0xFFF4F6FB), borderRadius: BorderRadius.circular(10)),
// //                 child: const Icon(Icons.share_outlined, size: 19, color: Color(0xFF374151)),
// //               ),
// //             ]),
// //           ),

// //           // ── Body
// //           Expanded(
// //             child: SingleChildScrollView(
// //               physics: const BouncingScrollPhysics(),
// //               child: Column(children: [

// //                 // ── Product Image
// //                 Container(
// //                   color: Colors.white,
// //                   padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
// //                   child: Column(children: [
// //                     Container(
// //                       height: 240,
// //                       width: double.infinity,
// //                       decoration: BoxDecoration(
// //                         color: const Color(0xFFF4F6FB),
// //                         borderRadius: BorderRadius.circular(16),
// //                       ),
// //                       child: ClipRRect(
// //                         borderRadius: BorderRadius.circular(16),
// //                         child: Image.network(p.imageUrl, fit: BoxFit.contain,
// //                           errorBuilder: (_, __, ___) => Center(
// //                               child: Icon(p.imageIcon, size: 80, color: const Color(0xFFD1D5DB))),
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 12),
// //                     Row(mainAxisAlignment: MainAxisAlignment.center,
// //                         children: List.generate(3, (i) => GestureDetector(
// //                           onTap: () => setState(() => _selectedDot = i),
// //                           child: AnimatedContainer(
// //                             duration: const Duration(milliseconds: 200),
// //                             margin: const EdgeInsets.symmetric(horizontal: 4),
// //                             width: i == _selectedDot ? 22 : 8,
// //                             height: 8,
// //                             decoration: BoxDecoration(
// //                               color: i == _selectedDot ? kBlue : const Color(0xFFD1D5DB),
// //                               borderRadius: BorderRadius.circular(4),
// //                             ),
// //                           ),
// //                         ))),
// //                   ]),
// //                 ),

// //                 const SizedBox(height: 8),

// //                 // ── Product Info
// //                 Container(
// //                   color: Colors.white,
// //                   padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
// //                   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //                     // Badges
// //                     Row(children: [
// //                       _pill(p.badge, p.badgeColor, Colors.white),
// //                       const SizedBox(width: 8),
// //                       _pill('In Stock', const Color(0xFFEBF9EE), const Color(0xFF166534)),
// //                     ]),
// //                     const SizedBox(height: 10),
// //                     // Name
// //                     Text(p.name,
// //                         style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800,
// //                             color: Color(0xFF111827), height: 1.3, letterSpacing: -0.3)),
// //                     const SizedBox(height: 10),
// //                     // Stars
// //                     Row(children: [
// //                       ...List.generate(4, (_) => const Icon(Icons.star_rounded, size: 15, color: Color(0xFFF59E0B))),
// //                       const Icon(Icons.star_half_rounded, size: 15, color: Color(0xFFF59E0B)),
// //                       const SizedBox(width: 6),
// //                       const Text('4.2', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: Color(0xFF111827))),
// //                       const SizedBox(width: 4),
// //                       const Text('(128 reviews)', style: TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
// //                     ]),
// //                     const SizedBox(height: 14),
// //                     // Price
// //                     Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
// //                       Text(p.price,
// //                           style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900,
// //                               color: Color(0xFF111827), letterSpacing: -0.5)),
// //                       const SizedBox(width: 10),
// //                       Padding(
// //                         padding: const EdgeInsets.only(bottom: 3),
// //                         child: Text(p.oldPrice,
// //                             style: const TextStyle(fontSize: 15, color: Color(0xFF9CA3AF),
// //                                 decoration: TextDecoration.lineThrough)),
// //                       ),
// //                       const SizedBox(width: 8),
// //                       if (savingsPct > 0)
// //                         Padding(
// //                           padding: const EdgeInsets.only(bottom: 3),
// //                           child: Container(
// //                             padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
// //                             decoration: BoxDecoration(color: const Color(0xFFEBF9EE), borderRadius: BorderRadius.circular(6)),
// //                             child: Text('$savingsPct% off',
// //                                 style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Color(0xFF166534))),
// //                           ),
// //                         ),
// //                     ]),
// //                     const SizedBox(height: 4),
// //                     if (savings > 0)
// //                       Text('You save ₹${savings.toStringAsFixed(0)}',
// //                           style: const TextStyle(fontSize: 12, color: Color(0xFF059669), fontWeight: FontWeight.w600)),
// //                   ]),
// //                 ),

// //                 const SizedBox(height: 8),

// //                 // ── Delivery & Offers
// //                 Container(
// //                   color: Colors.white,
// //                   padding: const EdgeInsets.all(16),
// //                   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //                     _sectionTitle('Delivery & Offers'),
// //                     const SizedBox(height: 12),
// //                     _deliveryRow(Icons.local_shipping_rounded, 'Free delivery',
// //                         'On orders above ₹499', const Color(0xFF059669)),
// //                     const SizedBox(height: 10),
// //                     _deliveryRow(Icons.bolt_rounded, 'Express delivery',
// //                         'Same day delivery in Chennai', kBlue),
// //                     const SizedBox(height: 10),
// //                     _deliveryRow(Icons.replay_rounded, 'Easy returns',
// //                         '7-day hassle-free returns', const Color(0xFFF59E0B)),
// //                   ]),
// //                 ),

// //                 const SizedBox(height: 8),

// //                 // ── Quantity
// //                 Container(
// //                   color: Colors.white,
// //                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
// //                   child: Row(children: [
// //                     const Expanded(
// //                       child: Text('Quantity',
// //                           style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,
// //                               color: Color(0xFF111827))),
// //                     ),
// //                     Container(
// //                       decoration: BoxDecoration(
// //                         border: Border.all(color: const Color(0xFFE5E7EB)),
// //                         borderRadius: BorderRadius.circular(10),
// //                       ),
// //                       child: Row(children: [
// //                         _qtyBtn(Icons.remove_rounded, () { if (_qty > 1) setState(() => _qty--); }),
// //                         Container(width: 42, height: 36, alignment: Alignment.center,
// //                             child: Text('$_qty',
// //                                 style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800,
// //                                     color: Color(0xFF111827)))),
// //                         _qtyBtn(Icons.add_rounded, () => setState(() => _qty++)),
// //                       ]),
// //                     ),
// //                   ]),
// //                 ),

// //                 const SizedBox(height: 8),

// //                 // ── Highlights
// //                 Container(
// //                   color: Colors.white,
// //                   padding: const EdgeInsets.all(16),
// //                   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //                     _sectionTitle('Product Highlights'),
// //                     const SizedBox(height: 12),
// //                     _highlight('Certified & quality-tested product'),
// //                     _highlight('Easy to use — suitable for home & clinical use'),
// //                     _highlight('1-year manufacturer warranty included'),
// //                     _highlight('Compact, lightweight and portable design'),
// //                     _highlight('ISO certified · Made in India'),
// //                   ]),
// //                 ),

// //                 const SizedBox(height: 8),

// //                 // ── Sold By
// //                 Container(
// //                   color: Colors.white,
// //                   padding: const EdgeInsets.all(16),
// //                   child: Row(children: [
// //                     Container(
// //                       width: 46, height: 46,
// //                       decoration: BoxDecoration(color: kBlueLite, borderRadius: BorderRadius.circular(14)),
// //                       child: const Icon(Icons.storefront_rounded, color: kBlue, size: 22),
// //                     ),
// //                     const SizedBox(width: 12),
// //                     const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //                       Text('Sold by', style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
// //                       Text('VeeSafe Official Store',
// //                           style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700, color: Color(0xFF111827))),
// //                       Text('97% positive · 2.4k+ orders shipped',
// //                           style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
// //                     ])),
// //                     GestureDetector(
// //                       onTap: () {},
// //                       child: Container(
// //                         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
// //                         decoration: BoxDecoration(
// //                           border: Border.all(color: kBlue, width: 1.2),
// //                           borderRadius: BorderRadius.circular(9),
// //                         ),
// //                         child: const Text('Visit Store',
// //                             style: TextStyle(fontSize: 11.5, color: kBlue, fontWeight: FontWeight.w700)),
// //                       ),
// //                     ),
// //                   ]),
// //                 ),

// //                 const SizedBox(height: 100),
// //               ]),
// //             ),
// //           ),
// //         ]),
// //       ),

// //       // ── Sticky CTA bar
// //       bottomNavigationBar: Container(
// //         padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
// //         decoration: const BoxDecoration(
// //           color: Colors.white,
// //           border: Border(top: BorderSide(color: Color(0xFFEFF1F7), width: 1)),
// //         ),
// //         child: Row(children: [
// //           // Wishlist
// //           GestureDetector(
// //             onTap: () => setState(() => _liked = !_liked),
// //             child: Container(
// //               width: 46, height: 46,
// //               decoration: BoxDecoration(
// //                 color: _liked ? const Color(0xFFFFEEEE) : const Color(0xFFF4F6FB),
// //                 borderRadius: BorderRadius.circular(12),
// //                 border: Border.all(
// //                   color: _liked ? Colors.red.withOpacity(0.3) : const Color(0xFFE5E7EB)),
// //               ),
// //               child: Icon(_liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
// //                   size: 20, color: _liked ? Colors.red : const Color(0xFF6B7280)),
// //             ),
// //           ),
// //           const SizedBox(width: 10),
// //           // Add to Cart
// //           Expanded(
// //             child: GestureDetector(
// //               onTap: () => _snack(context, '🛒  Added to cart!'),
// //               child: Container(
// //                 height: 46,
// //                 decoration: BoxDecoration(
// //                   color: kBlueLite,
// //                   borderRadius: BorderRadius.circular(12),
// //                   border: Border.all(color: kBlue.withOpacity(0.25)),
// //                 ),
// //                 child: const Center(
// //                   child: Text('Add to Cart',
// //                       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: kBlue)),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           const SizedBox(width: 10),
// //           // Buy Now
// //           Expanded(
// //             child: GestureDetector(
// //               onTap: () => _snack(context, '✅  Order placed successfully!'),
// //               child: Container(
// //                 height: 46,
// //                 decoration: BoxDecoration(
// //                   color: kBlue,
// //                   borderRadius: BorderRadius.circular(12),
// //                   boxShadow: [BoxShadow(color: kBlue.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4))],
// //                 ),
// //                 child: const Center(
// //                   child: Text('Buy Now',
// //                       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ]),
// //       ),
// //     );
// //   }

// //   Widget _pill(String text, Color bg, Color textColor) => Container(
// //     padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
// //     decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(7)),
// //     child: Text(text, style: TextStyle(color: textColor, fontSize: 10.5, fontWeight: FontWeight.w700)),
// //   );

// //   Widget _sectionTitle(String t) => Row(children: [
// //     Container(width: 3.5, height: 16,
// //         decoration: BoxDecoration(color: kBlue, borderRadius: BorderRadius.circular(4))),
// //     const SizedBox(width: 8),
// //     Text(t, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800,
// //         color: Color(0xFF111827), letterSpacing: -0.2)),
// //   ]);

// //   Widget _deliveryRow(IconData icon, String title, String sub, Color color) => Row(children: [
// //     Container(width: 36, height: 36,
// //         decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
// //         child: Icon(icon, size: 18, color: color)),
// //     const SizedBox(width: 12),
// //     Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //       Text(title, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: Color(0xFF111827))),
// //       Text(sub, style: const TextStyle(fontSize: 11.5, color: Color(0xFF6B7280))),
// //     ]),
// //   ]);

// //   Widget _qtyBtn(IconData icon, VoidCallback onTap) => GestureDetector(
// //     onTap: onTap,
// //     child: SizedBox(width: 36, height: 36,
// //         child: Icon(icon, size: 17, color: const Color(0xFF374151))),
// //   );

// //   Widget _highlight(String text) => Padding(
// //     padding: const EdgeInsets.only(bottom: 8),
// //     child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //       Container(margin: const EdgeInsets.only(top: 4),
// //           width: 6, height: 6,
// //           decoration: BoxDecoration(color: kBlue, shape: BoxShape.circle)),
// //       const SizedBox(width: 10),
// //       Expanded(child: Text(text,
// //           style: const TextStyle(fontSize: 12.5, color: Color(0xFF374151), height: 1.45))),
// //     ]),
// //   );

// //   void _snack(BuildContext context, String msg) {
// //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //       content: Text(msg, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
// //       backgroundColor: kBlue,
// //       behavior: SnackBarBehavior.floating,
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //       margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
// //       duration: const Duration(seconds: 2),
// //     ));
// //   }
// // }


// // // ─────────────────────────────────────────────────────────────────────────────
// // //  CATEGORY PRODUCTS SCREEN
// // // ─────────────────────────────────────────────────────────────────────────────
// // class CategoryProductsScreen extends StatefulWidget {
// //   final String categoryName;
// //   final Color categoryColor;
// //   final IconData categoryIcon;

// //   const CategoryProductsScreen({
// //     super.key,
// //     required this.categoryName,
// //     required this.categoryColor,
// //     required this.categoryIcon,
// //   });

// //   @override
// //   State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
// // }

// // class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
// //   String _sortBy = 'Popular';
// //   final List<String> _sortOptions = [
// //     'Popular', 'Price: Low to High', 'Price: High to Low', 'Newest',
// //   ];

// //   // ── Image constants
// //   static const _imgBloodTest  = 'assets/images/blood machine.jpg';
// //   static const _imgSurgical   = 'https://images.unsplash.com/photo-1584432810601-6c7f27d2362b?w=300&h=300&fit=crop';
// //   static const _imgRetina     = 'https://images.unsplash.com/photo-1576671081837-49000212a370?w=300&h=300&fit=crop';
// //   static const _imgFirstAid   = 'assets/images/first aid kit.jpg';
// //   static const _imgOxyCyl     = 'assets/images/Oxygen Medic Kit .jpg';
// //   static const _imgDisposable = 'assets/images/Disposable.jpg';
// //   static const _imgWalkStick  = 'assets/images/Walking Stick.jpg';
// //   static const _imgWheelchair = 'https://images.unsplash.com/photo-1573812461383-e5f8b759d12e?w=300&h=300&fit=crop';
// //   static const _imgLegMassage = 'https://images.unsplash.com/photo-1519823551278-64ac92734fb1?w=300&h=300&fit=crop';
// //   static const _imgNebulizer  = 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=300&h=300&fit=crop';
// //   static const _imgGlucometer = 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=300&h=300&fit=crop';

// //   Map<String, List<Product>> get _all => {
// //     'Beauty': [
// //       Product(name: 'Skin Care Kit',        price: 'Rs.899',  oldPrice: 'Rs.1,200', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgSurgical),
// //       Product(name: 'Hair Care Set',         price: 'Rs.599',  oldPrice: 'Rs.799',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgDisposable),
// //       Product(name: 'Face Wash Bundle',      price: 'Rs.450',  oldPrice: 'Rs.600',   badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgSurgical),
// //       Product(name: 'Moisturizer SPF 50',    price: 'Rs.750',  oldPrice: 'Rs.999',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgDisposable),
// //       Product(name: 'Vitamin C Serum',       price: 'Rs.1,200',oldPrice: 'Rs.1,500', badge: '20% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgSurgical),
// //       Product(name: 'Lip Balm Pack',         price: 'Rs.299',  oldPrice: 'Rs.399',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgDisposable),
// //     ],
// //     'Lifestyle &\nFitness': [
// //       Product(name: 'Yoga Mat Premium',      price: 'Rs.1,299',oldPrice: 'Rs.1,800', badge: '28% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
// //       Product(name: 'Resistance Band Set',   price: 'Rs.599',  oldPrice: 'Rs.799',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
// //       Product(name: 'Fitness Tracker',       price: 'Rs.2,499',oldPrice: 'Rs.3,200', badge: '22% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgGlucometer),
// //       Product(name: 'Dumbbell Set 5kg',      price: 'Rs.1,599',oldPrice: 'Rs.2,000', badge: '20% Off', badgeColor: kGreen, imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
// //       Product(name: 'Skipping Rope',         price: 'Rs.299',  oldPrice: 'Rs.399',   badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
// //       Product(name: 'Protein Shaker',        price: 'Rs.449',  oldPrice: 'Rs.599',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgGlucometer),
// //     ],
// //     'Personal\nCare': [
// //       Product(name: 'Electric Toothbrush',   price: 'Rs.999',  oldPrice: 'Rs.1,299', badge: '23% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgDisposable),
// //       Product(name: 'Digital Thermometer',   price: 'Rs.399',  oldPrice: 'Rs.599',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgGlucometer),
// //       Product(name: 'Nail Care Kit',         price: 'Rs.349',  oldPrice: 'Rs.499',   badge: '30% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgDisposable),
// //       Product(name: 'Hair Trimmer',          price: 'Rs.799',  oldPrice: 'Rs.1,099', badge: '27% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgGlucometer),
// //       Product(name: 'Body Massager',         price: 'Rs.1,199',oldPrice: 'Rs.1,599', badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgLegMassage),
// //       Product(name: 'Sanitizer Pack 5x',     price: 'Rs.249',  oldPrice: 'Rs.349',   badge: '29% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgDisposable),
// //     ],
// //     'Mother &\nBaby': [
// //       Product(name: 'Baby Monitor',          price: 'Rs.3,499',oldPrice: 'Rs.4,500', badge: '22% Off', badgeColor: kBlue,  imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
// //       Product(name: 'Baby Thermometer',      price: 'Rs.699',  oldPrice: 'Rs.999',   badge: '30% Off', badgeColor: kGreen, imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
// //       Product(name: 'Baby Nebulizer',        price: 'Rs.1,299',oldPrice: 'Rs.1,799', badge: '28% Off', badgeColor: kBlue,  imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgNebulizer),
// //       Product(name: 'Maternity Belt',        price: 'Rs.899',  oldPrice: 'Rs.1,199', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgDisposable),
// //       Product(name: 'Breast Pump Electric',  price: 'Rs.2,499',oldPrice: 'Rs.3,200', badge: '22% Off', badgeColor: kBlue,  imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
// //       Product(name: 'Baby Weighing Scale',   price: 'Rs.1,099',oldPrice: 'Rs.1,499', badge: '27% Off', badgeColor: kGreen, imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
// //     ],
// //     'Testing\nProducts': [
// //       Product(name: 'Blood Testing Device',  price: 'Rs.3,250',oldPrice: 'Rs.4,000', badge: '15% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgBloodTest),
// //       Product(name: 'Glucometer Kit',        price: 'Rs.1,290',oldPrice: 'Rs.1,800', badge: '28% Off', badgeColor: kGreen, imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
// //       Product(name: 'Pulse Oximeter',        price: 'Rs.899',  oldPrice: 'Rs.1,299', badge: '31% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
// //       Product(name: 'BP Monitor Digital',    price: 'Rs.1,799',oldPrice: 'Rs.2,400', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
// //       Product(name: 'Retinascope Full Set',  price: 'Rs.3,250',oldPrice: 'Rs.4,500', badge: '15% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgRetina),
// //       Product(name: 'Urine Test Strips',     price: 'Rs.499',  oldPrice: 'Rs.699',   badge: '29% Off', badgeColor: kGreen, imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
// //     ],
// //     'Equipment &\nHomecare': [
// //       Product(name: 'Oxygen Cylinder & Mask',price: 'Rs.2,199',oldPrice: 'Rs.3,000', badge: '26% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgOxyCyl),
// //       Product(name: 'Walking Stick – Steel', price: 'Rs.1,499',oldPrice: 'Rs.1,999', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgWalkStick),
// //       Product(name: 'Wheel Chair',           price: 'Rs.5,999',oldPrice: 'Rs.7,500', badge: '20% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgWheelchair),
// //       Product(name: 'Leg Massager Pro',      price: 'Rs.2,800',oldPrice: 'Rs.3,500', badge: '20% Off', badgeColor: kGreen, imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgLegMassage),
// //       Product(name: 'Nebulizer Machine',     price: 'Rs.1,850',oldPrice: 'Rs.2,400', badge: '22% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgNebulizer),
// //       Product(name: 'First Aid Kit – Full',  price: 'Rs.1,499',oldPrice: 'Rs.1,999', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgFirstAid),
// //     ],
// //     'Oral Care': [
// //       Product(name: 'Electric Toothbrush',   price: 'Rs.999',  oldPrice: 'Rs.1,299', badge: '23% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
// //       Product(name: 'Teeth Whitening Kit',   price: 'Rs.799',  oldPrice: 'Rs.1,099', badge: '27% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
// //       Product(name: 'Dental Floss Pack',     price: 'Rs.199',  oldPrice: 'Rs.299',   badge: '33% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
// //       Product(name: 'Mouthwash 500ml',       price: 'Rs.349',  oldPrice: 'Rs.499',   badge: '30% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
// //       Product(name: 'Tongue Cleaner Set',    price: 'Rs.149',  oldPrice: 'Rs.199',   badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
// //       Product(name: 'Water Flosser',         price: 'Rs.1,499',oldPrice: 'Rs.1,999', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgGlucometer),
// //     ],
// //     'COVID - 19': [
// //       Product(name: 'N95 Mask Pack 10x',     price: 'Rs.499',  oldPrice: 'Rs.699',   badge: '29% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
// //       Product(name: 'COVID Test Kit',        price: 'Rs.299',  oldPrice: 'Rs.449',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgGlucometer),
// //       Product(name: 'Pulse Oximeter',        price: 'Rs.899',  oldPrice: 'Rs.1,299', badge: '31% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgGlucometer),
// //       Product(name: 'Sanitizer 500ml',       price: 'Rs.199',  oldPrice: 'Rs.299',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
// //       Product(name: 'Face Shield Pack',      price: 'Rs.349',  oldPrice: 'Rs.499',   badge: '30% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
// //       Product(name: 'Disposable Gloves 50x', price: 'Rs.299',  oldPrice: 'Rs.449',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
// //     ],
// //   };

// //   List<Product> get _products {
// //     final list = _all[widget.categoryName] ?? [];
// //     if (_sortBy == 'Price: Low to High') {
// //       return [...list]..sort((a, b) => _parsePrice(a.price).compareTo(_parsePrice(b.price)));
// //     } else if (_sortBy == 'Price: High to Low') {
// //       return [...list]..sort((a, b) => _parsePrice(b.price).compareTo(_parsePrice(a.price)));
// //     }
// //     return list;
// //   }

// //   double _parsePrice(String p) =>
// //       double.tryParse(p.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;

// //   // ═══════════════════════════════════════════════════════════════════════════
// //   //  BUILD
// //   // ═══════════════════════════════════════════════════════════════════════════
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF4F6FB),
// //       body: SafeArea(
// //         child: Column(children: [
// //           _appBar(context),
// //           _filterBar(),
// //           Expanded(
// //             child: _products.isEmpty
// //                 ? _emptyState()
// //                 : SingleChildScrollView(
// //                     physics: const BouncingScrollPhysics(),
// //                     child: Column(children: [
// //                       const SizedBox(height: 12),
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 16),
// //                         child: GridView.builder(
// //                           shrinkWrap: true,
// //                           physics: const NeverScrollableScrollPhysics(),
// //                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //                             crossAxisCount: 2,
// //                             crossAxisSpacing: 12,
// //                             mainAxisSpacing: 12,
// //                             childAspectRatio: 0.70,
// //                           ),
// //                           itemCount: _products.length,
// //                           itemBuilder: (_, i) => _productCard(_products[i]),
// //                         ),
// //                       ),
// //                       const SizedBox(height: 16),
// //                       _trustSection(),
// //                       const SizedBox(height: 24),
// //                     ]),
// //                   ),
// //           ),
// //         ]),
// //       ),
// //     );
// //   }

// //   // ── AppBar — no item count badge
// //   Widget _appBar(BuildContext context) => Container(
// //     decoration: const BoxDecoration(
// //       color: kBlue,
// //       border: Border(bottom: BorderSide(color: Color(0x22000000), width: 1)),
// //     ),
// //     padding: const EdgeInsets.fromLTRB(4, 8, 14, 12),
// //     child: Row(children: [
// //       IconButton(
// //         icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: Colors.white),
// //         onPressed: () => Navigator.pop(context),
// //         splashRadius: 20,
// //       ),
// //       Container(
// //         width: 34, height: 34,
// //         decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
// //         child: Icon(widget.categoryIcon, size: 18, color: Colors.white),
// //       ),
// //       const SizedBox(width: 10),
// //       Expanded(
// //         child: Text(widget.categoryName.replaceAll('\n', ' '),
// //             style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800,
// //                 color: Colors.white, letterSpacing: -0.2)),
// //       ),
// //       Container(
// //         width: 36, height: 36,
// //         decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(10)),
// //         child: const Icon(Icons.search_rounded, size: 19, color: Colors.white),
// //       ),
// //     ]),
// //   );

// //   // ── Sort bar
// //   Widget _filterBar() => Container(
// //     padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
// //     decoration: const BoxDecoration(
// //       color: Colors.white,
// //       border: Border(bottom: BorderSide(color: Color(0xFFEFF1F7), width: 1)),
// //     ),
// //     child: Row(children: [
// //       Container(
// //         width: 26, height: 26,
// //         decoration: BoxDecoration(color: kBlueLite, borderRadius: BorderRadius.circular(7)),
// //         child: const Icon(Icons.sort_rounded, size: 14, color: kBlue),
// //       ),
// //       const SizedBox(width: 8),
// //       const Text('Sort:', style: TextStyle(fontSize: 12, color: Color(0xFF6B7280), fontWeight: FontWeight.w600)),
// //       const SizedBox(width: 8),
// //       Expanded(
// //         child: SingleChildScrollView(
// //           scrollDirection: Axis.horizontal,
// //           physics: const BouncingScrollPhysics(),
// //           child: Row(
// //             children: _sortOptions.map((opt) {
// //               final sel = _sortBy == opt;
// //               return GestureDetector(
// //                 onTap: () => setState(() => _sortBy = opt),
// //                 child: AnimatedContainer(
// //                   duration: const Duration(milliseconds: 180),
// //                   margin: const EdgeInsets.only(right: 8),
// //                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
// //                   decoration: BoxDecoration(
// //                     color: sel ? kBlue : const Color(0xFFF4F6FB),
// //                     borderRadius: BorderRadius.circular(20),
// //                     border: Border.all(color: sel ? kBlue : const Color(0xFFE5E7EB)),
// //                     boxShadow: sel
// //                         ? [BoxShadow(color: kBlue.withOpacity(0.2), blurRadius: 6, offset: const Offset(0, 2))]
// //                         : [],
// //                   ),
// //                   child: Text(opt,
// //                       style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600,
// //                           color: sel ? Colors.white : const Color(0xFF6B7280))),
// //                 ),
// //               );
// //             }).toList(),
// //           ),
// //         ),
// //       ),
// //     ]),
// //   );

// //   // ── Product card — taps open ProductDetailScreen
// //   Widget _productCard(Product p) => GestureDetector(
// //     onTap: () => Navigator.push(context,
// //         MaterialPageRoute(builder: (_) => ProductDetailScreen(product: p))),
// //     child: Container(
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(16),
// //         border: Border.all(color: const Color(0xFFEFF1F7), width: 1),
// //         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 3))],
// //       ),
// //       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //         // Image area
// //         Stack(children: [
// //           ClipRRect(
// //             borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
// //             child: Container(
// //               height: 130, width: double.infinity,
// //               color: const Color(0xFFF4F6FB),
// //               child: Image.network(p.imageUrl, fit: BoxFit.cover,
// //                 loadingBuilder: (_, child, prog) {
// //                   if (prog == null) return child;
// //                   return const Center(child: SizedBox(width: 20, height: 20,
// //                       child: CircularProgressIndicator(strokeWidth: 2, color: kBlue)));
// //                 },
// //                 errorBuilder: (_, __, ___) => Center(
// //                     child: Icon(p.imageIcon, size: 50, color: const Color(0xFFD1D5DB))),
// //               ),
// //             ),
// //           ),
// //           // Badge
// //           Positioned(top: 8, left: 8,
// //             child: Container(
// //               padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
// //               decoration: BoxDecoration(color: p.badgeColor, borderRadius: BorderRadius.circular(6)),
// //               child: Text(p.badge,
// //                   style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700)),
// //             ),
// //           ),
// //           // Heart
// //           Positioned(top: 8, right: 8,
// //             child: StatefulBuilder(
// //               builder: (_, setL) => GestureDetector(
// //                 onTap: () => setL(() => p.liked = !p.liked),
// //                 child: Container(
// //                   width: 28, height: 28,
// //                   decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle,
// //                       boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.10), blurRadius: 5)]),
// //                   child: Icon(p.liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
// //                       size: 14, color: p.liked ? Colors.red : const Color(0xFFD1D5DB)),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ]),
// //         // Info
// //         Padding(
// //           padding: const EdgeInsets.fromLTRB(10, 9, 10, 10),
// //           child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //             Text(p.name,
// //                 maxLines: 2, overflow: TextOverflow.ellipsis,
// //                 style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700,
// //                     color: Color(0xFF111827), height: 1.3)),
// //             const SizedBox(height: 5),
// //             // Stars
// //             Row(children: [
// //               ...List.generate(4, (_) => const Icon(Icons.star_rounded, size: 11, color: Color(0xFFF59E0B))),
// //               const Icon(Icons.star_half_rounded, size: 11, color: Color(0xFFF59E0B)),
// //               const SizedBox(width: 4),
// //               const Text('4.2', style: TextStyle(fontSize: 10, color: Color(0xFF6B7280))),
// //             ]),
// //             const SizedBox(height: 7),
// //             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
// //               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //                 Text(p.price,
// //                     style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: Color(0xFF111827))),
// //                 Text(p.oldPrice,
// //                     style: const TextStyle(fontSize: 10, color: Color(0xFF9CA3AF),
// //                         decoration: TextDecoration.lineThrough)),
// //               ]),
// //               // Add button
// //               Container(
// //                 width: 30, height: 30,
// //                 decoration: BoxDecoration(color: kGreen, borderRadius: BorderRadius.circular(9),
// //                     boxShadow: [BoxShadow(color: kGreen.withOpacity(0.3), blurRadius: 6, offset: const Offset(0, 2))]),
// //                 child: const Icon(Icons.add_rounded, color: Colors.white, size: 18),
// //               ),
// //             ]),
// //           ]),
// //         ),
// //       ]),
// //     ),
// //   );

// //   // ── Trust section below grid
// //   Widget _trustSection() => Padding(
// //     padding: const EdgeInsets.symmetric(horizontal: 16),
// //     child: Column(children: [
// //       // Why VeeSafe
// //       Container(
// //         width: double.infinity,
// //         padding: const EdgeInsets.all(16),
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.circular(16),
// //           border: Border.all(color: const Color(0xFFEFF1F7)),
// //           boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 2))],
// //         ),
// //         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //           Row(children: [
// //             Container(width: 3.5, height: 16,
// //                 decoration: BoxDecoration(color: kBlue, borderRadius: BorderRadius.circular(4))),
// //             const SizedBox(width: 8),
// //             const Text('Why shop on VeeSafe?',
// //                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800,
// //                     color: Color(0xFF111827), letterSpacing: -0.2)),
// //           ]),
// //           const SizedBox(height: 14),
// //           Row(children: [
// //             _trustBadge(Icons.verified_rounded,     '100%\nGenuine',  const Color(0xFF059669), const Color(0xFFEBF9EE)),
// //             const SizedBox(width: 10),
// //             _trustBadge(Icons.local_shipping_rounded,'Fast\nDelivery', kBlue,                  kBlueLite),
// //             const SizedBox(width: 10),
// //             _trustBadge(Icons.replay_rounded,        'Easy\nReturns', const Color(0xFFF59E0B), const Color(0xFFFFF8DC)),
// //             const SizedBox(width: 10),
// //             _trustBadge(Icons.headset_mic_rounded,  '24/7\nSupport',  const Color(0xFF8E24AA), const Color(0xFFF3E5F5)),
// //           ]),
// //         ]),
// //       ),
// //       const SizedBox(height: 12),
// //       // Expert help banner
// //       Container(
// //         width: double.infinity,
// //         padding: const EdgeInsets.all(16),
// //         decoration: BoxDecoration(
// //           color: kBlue,
// //           borderRadius: BorderRadius.circular(16),
// //           boxShadow: [BoxShadow(color: kBlue.withOpacity(0.25), blurRadius: 12, offset: const Offset(0, 4))],
// //         ),
// //         child: Row(children: [
// //           Container(
// //             width: 48, height: 48,
// //             decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(14)),
// //             child: const Icon(Icons.headset_mic_rounded, color: Colors.white, size: 24),
// //           ),
// //           const SizedBox(width: 14),
// //           const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //             Text('Need help choosing?',
// //                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.white)),
// //             SizedBox(height: 2),
// //             Text('Our medical experts are available 24/7',
// //                 style: TextStyle(fontSize: 11.5, color: Colors.white70)),
// //           ])),
// //           Container(
// //             padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
// //             decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
// //             child: const Text('Chat',
// //                 style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: kBlue)),
// //           ),
// //         ]),
// //       ),
// //     ]),
// //   );

// //   Widget _trustBadge(IconData icon, String label, Color color, Color bg) => Expanded(
// //     child: Container(
// //       padding: const EdgeInsets.symmetric(vertical: 10),
// //       decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12)),
// //       child: Column(children: [
// //         Icon(icon, size: 20, color: color),
// //         const SizedBox(height: 5),
// //         Text(label, textAlign: TextAlign.center,
// //             style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: color, height: 1.3)),
// //       ]),
// //     ),
// //   );

// //   // ── Empty state
// //   Widget _emptyState() => Center(
// //     child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
// //       Container(width: 90, height: 90,
// //           decoration: const BoxDecoration(color: kBlueLite, shape: BoxShape.circle),
// //           child: Icon(widget.categoryIcon, color: kBlue, size: 40)),
// //       const SizedBox(height: 18),
// //       const Text('No products found',
// //           style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Color(0xFF111827))),
// //       const SizedBox(height: 6),
// //       const Text('Check back soon for new arrivals!',
// //           style: TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
// //     ]),
// //   );
// // }










// // lib/screens/category_products_screen.dart
// import 'package:flutter/material.dart';
// import '../constants/app_colors.dart';
// import '../models/product_model.dart';

// // ─────────────────────────────────────────────────────────────────────────────
// //  PRODUCT DETAIL SCREEN  —  Premium redesign
// // ─────────────────────────────────────────────────────────────────────────────
// class ProductDetailScreen extends StatefulWidget {
//   final Product product;
//   const ProductDetailScreen({super.key, required this.product});
//   @override
//   State<ProductDetailScreen> createState() => _ProductDetailScreenState();
// }

// class _ProductDetailScreenState extends State<ProductDetailScreen> {
//   int  _qty        = 1;
//   bool _liked      = false;
//   int  _imgIndex   = 0;
//   bool _descExpanded = false;

//   static const _orange = Color(0xFFFF6B35);
//   static const _green  = Color(0xFF12B76A);

//   @override
//   void initState() {
//     super.initState();
//     _liked = widget.product.liked;
//   }

//   double _parsePrice(String p) =>
//       double.tryParse(p.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;

//   @override
//   Widget build(BuildContext context) {
//     final p          = widget.product;
//     final double mrp = _parsePrice(p.oldPrice);
//     final double sp  = _parsePrice(p.price);
//     final double sav = mrp - sp;
//     final int pct    = sav > 0 ? (sav / mrp * 100).round() : 0;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF4F6FB),
//       body: SafeArea(
//         child: Column(children: [
//           // ══════════════════════════════════════════
//           //  TRANSPARENT-STYLE APP BAR
//           // ══════════════════════════════════════════
//           Container(
//             padding: const EdgeInsets.fromLTRB(4, 6, 10, 8),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               border: Border(bottom: BorderSide(color: Color(0xFFEFF1F7), width: 1)),
//             ),
//             child: Row(children: [
//               IconButton(
//                 icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: Color(0xFF1C1C1E)),
//                 onPressed: () => Navigator.pop(context),
//                 splashRadius: 20,
//               ),
//               const Expanded(
//                 child: Text('Product Details',
//                     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800,
//                         color: Color(0xFF1C1C1E), letterSpacing: -0.3)),
//               ),
//               // Share
//               _topBtn(Icons.share_outlined, const Color(0xFF6B7280), () {}),
//               const SizedBox(width: 6),
//               // Wishlist
//               GestureDetector(
//                 onTap: () => setState(() => _liked = !_liked),
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 200),
//                   width: 36, height: 36,
//                   decoration: BoxDecoration(
//                     color: _liked ? const Color(0xFFFFEEEE) : const Color(0xFFF4F6FB),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Icon(
//                     _liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
//                     size: 19, color: _liked ? Colors.red : const Color(0xFF6B7280),
//                   ),
//                 ),
//               ),
//             ]),
//           ),

//           // ══════════════════════════════════════════
//           //  BODY
//           // ══════════════════════════════════════════
//           Expanded(
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

//                 // ── 1. BIG PRODUCT IMAGE + THUMBNAILS ROW
//                 Container(
//                   color: Colors.white,
//                   child: Column(children: [
//                     // Main image hero
//                     Stack(children: [
//                       Container(
//                         height: 280,
//                         width: double.infinity,
//                         color: const Color(0xFFF7F8FC),
//                         child: Padding(
//                           padding: const EdgeInsets.all(20),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(20),
//                             child: Image.network(p.imageUrl, fit: BoxFit.contain,
//                               errorBuilder: (_, __, ___) => Center(
//                                   child: Icon(p.imageIcon, size: 100,
//                                       color: const Color(0xFFD1D5DB))),
//                             ),
//                           ),
//                         ),
//                       ),
//                       // Discount badge — top-left
//                       Positioned(
//                         top: 14, left: 14,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                           decoration: BoxDecoration(
//                             color: _orange,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Text('$pct% OFF',
//                               style: const TextStyle(color: Colors.white, fontSize: 11,
//                                   fontWeight: FontWeight.w900, letterSpacing: 0.3)),
//                         ),
//                       ),
//                       // In-Stock badge — top-right
//                       Positioned(
//                         top: 14, right: 14,
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                           decoration: BoxDecoration(
//                             color: const Color(0xFFEBFBF1),
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(color: _green.withOpacity(0.3)),
//                           ),
//                           child: Row(mainAxisSize: MainAxisSize.min, children: [
//                             Container(width: 6, height: 6,
//                                 decoration: const BoxDecoration(color: _green, shape: BoxShape.circle)),
//                             const SizedBox(width: 5),
//                             const Text('In Stock',
//                                 style: TextStyle(color: _green, fontSize: 10.5,
//                                     fontWeight: FontWeight.w700)),
//                           ]),
//                         ),
//                       ),
//                     ]),
//                     // Thumbnail strip
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: List.generate(4, (i) => GestureDetector(
//                           onTap: () => setState(() => _imgIndex = i),
//                           child: AnimatedContainer(
//                             duration: const Duration(milliseconds: 180),
//                             margin: const EdgeInsets.symmetric(horizontal: 5),
//                             width: 52, height: 52,
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFF7F8FC),
//                               borderRadius: BorderRadius.circular(10),
//                               border: Border.all(
//                                 color: i == _imgIndex ? kBlue : const Color(0xFFE5E7EB),
//                                 width: i == _imgIndex ? 2 : 1,
//                               ),
//                               boxShadow: i == _imgIndex
//                                   ? [BoxShadow(color: kBlue.withOpacity(0.15), blurRadius: 8)]
//                                   : [],
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(6),
//                               child: Image.network(p.imageUrl, fit: BoxFit.contain,
//                                 errorBuilder: (_, __, ___) =>
//                                     Icon(p.imageIcon, size: 24, color: const Color(0xFFD1D5DB)),
//                               ),
//                             ),
//                           ),
//                         )),
//                       ),
//                     ),
//                   ]),
//                 ),

//                 const SizedBox(height: 8),

//                 // ── 2. NAME + RATING + PRICE BLOCK
//                 Container(
//                   color: Colors.white,
//                   padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                     // Product name
//                     Text(p.name,
//                         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900,
//                             color: Color(0xFF1C1C1E), height: 1.25, letterSpacing: -0.4)),
//                     const SizedBox(height: 10),

//                     // Stars + review count + sold count
//                     Row(children: [
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFFF9A825),
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         child: Row(mainAxisSize: MainAxisSize.min, children: const [
//                           Icon(Icons.star_rounded, size: 13, color: Colors.white),
//                           SizedBox(width: 3),
//                           Text('4.2', style: TextStyle(color: Colors.white, fontSize: 12,
//                               fontWeight: FontWeight.w800)),
//                         ]),
//                       ),
//                       const SizedBox(width: 8),
//                       const Text('128 Ratings', style: TextStyle(fontSize: 12,
//                           color: Color(0xFF6B7280), fontWeight: FontWeight.w500)),
//                       Container(margin: const EdgeInsets.symmetric(horizontal: 8),
//                           width: 1, height: 14, color: const Color(0xFFD1D5DB)),
//                       const Text('2.4k+ Sold', style: TextStyle(fontSize: 12,
//                           color: Color(0xFF6B7280), fontWeight: FontWeight.w500)),
//                     ]),

//                     const SizedBox(height: 16),
//                     const Divider(color: Color(0xFFF3F4F6), thickness: 1),
//                     const SizedBox(height: 14),

//                     // Price row
//                     Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
//                       Text(p.price,
//                           style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900,
//                               color: Color(0xFF1C1C1E), letterSpacing: -0.8)),
//                       const SizedBox(width: 12),
//                       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                         Text('MRP ${p.oldPrice}',
//                             style: const TextStyle(fontSize: 13, color: Color(0xFF9CA3AF),
//                                 decoration: TextDecoration.lineThrough)),
//                         if (sav > 0)
//                           Text('Save ₹${sav.toStringAsFixed(0)}',
//                               style: const TextStyle(fontSize: 12, color: _green,
//                                   fontWeight: FontWeight.w700)),
//                       ]),
//                     ]),

//                     const SizedBox(height: 6),
//                     const Text('Inclusive of all taxes',
//                         style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),

//                     const SizedBox(height: 14),

//                     // Offer strip
//                     Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFFFF8F0),
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: _orange.withOpacity(0.2)),
//                       ),
//                       child: Row(children: [
//                         const Icon(Icons.local_offer_rounded, size: 16, color: _orange),
//                         const SizedBox(width: 8),
//                         const Expanded(
//                           child: Text('Bank offer: 5% cashback with VeeSafe Pay',
//                               style: TextStyle(fontSize: 12, color: Color(0xFF374151),
//                                   fontWeight: FontWeight.w600)),
//                         ),
//                         const Text('View all', style: TextStyle(fontSize: 11,
//                             color: kBlue, fontWeight: FontWeight.w700)),
//                       ]),
//                     ),
//                   ]),
//                 ),

//                 const SizedBox(height: 8),

//                 // ── 3. QUANTITY + DELIVERY DATE ROW
//                 Container(
//                   color: Colors.white,
//                   padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                     // Qty selector
//                     Row(children: [
//                       const Text('Quantity',
//                           style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700,
//                               color: Color(0xFF374151))),
//                       const Spacer(),
//                       Container(
//                         height: 38,
//                         decoration: BoxDecoration(
//                           color: const Color(0xFFF4F6FB),
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(color: const Color(0xFFE5E7EB)),
//                         ),
//                         child: Row(mainAxisSize: MainAxisSize.min, children: [
//                           _qtyBtn(Icons.remove_rounded,
//                               () { if (_qty > 1) setState(() => _qty--); }),
//                           Container(
//                             width: 40, height: 38,
//                             alignment: Alignment.center,
//                             decoration: const BoxDecoration(
//                               border: Border.symmetric(
//                                 vertical: BorderSide(color: Color(0xFFE5E7EB)),
//                               ),
//                             ),
//                             child: Text('$_qty',
//                                 style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800,
//                                     color: Color(0xFF1C1C1E))),
//                           ),
//                           _qtyBtn(Icons.add_rounded, () => setState(() => _qty++)),
//                         ]),
//                       ),
//                     ]),
//                     const SizedBox(height: 14),
//                     // Delivery info chips row
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       physics: const BouncingScrollPhysics(),
//                       child: Row(children: [
//                         _deliveryChip(Icons.bolt_rounded, 'Same Day', const Color(0xFF7C3AED), const Color(0xFFF5F3FF)),
//                         const SizedBox(width: 8),
//                         _deliveryChip(Icons.local_shipping_rounded, 'Free Shipping', _green, const Color(0xFFEBFBF1)),
//                         const SizedBox(width: 8),
//                         _deliveryChip(Icons.replay_rounded, '7-Day Return', _orange, const Color(0xFFFFF5EE)),
//                         const SizedBox(width: 8),
//                         _deliveryChip(Icons.verified_rounded, 'Genuine', kBlue, kBlueLite),
//                       ]),
//                     ),
//                   ]),
//                 ),

//                 const SizedBox(height: 8),

//                 // ── 4. PRODUCT DESCRIPTION (collapsible)
//                 Container(
//                   color: Colors.white,
//                   padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                     _secTitle('Product Description'),
//                     const SizedBox(height: 10),
//                     AnimatedCrossFade(
//                       duration: const Duration(milliseconds: 250),
//                       crossFadeState: _descExpanded
//                           ? CrossFadeState.showSecond
//                           : CrossFadeState.showFirst,
//                       firstChild: Text(
//                         '${p.name} is a premium quality medical product designed for home and clinical use. Certified by leading health authorities in India...',
//                         maxLines: 3,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(fontSize: 13, color: Color(0xFF6B7280), height: 1.6),
//                       ),
//                       secondChild: const Text(
//                         'This product is a premium quality medical product designed for home and clinical use. Certified by leading health authorities in India. Easy to use with accurate readings. Comes with a 1-year manufacturer warranty. Compact and lightweight design, suitable for travel. ISO certified and Made in India. Includes user manual and carry pouch.',
//                         style: TextStyle(fontSize: 13, color: Color(0xFF6B7280), height: 1.6),
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () => setState(() => _descExpanded = !_descExpanded),
//                       style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
//                       child: Text(_descExpanded ? 'Show less ▲' : 'Read more ▼',
//                           style: const TextStyle(fontSize: 12, color: kBlue, fontWeight: FontWeight.w700)),
//                     ),
//                     const SizedBox(height: 4),
//                   ]),
//                 ),

//                 const SizedBox(height: 8),

//                 // ── 5. KEY HIGHLIGHTS (icon grid)
//                 Container(
//                   color: Colors.white,
//                   padding: const EdgeInsets.all(16),
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                     _secTitle('Key Highlights'),
//                     const SizedBox(height: 14),
//                     GridView.count(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       crossAxisCount: 2,
//                       childAspectRatio: 3.4,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10,
//                       children: [
//                         _highlightTile(Icons.verified_user_rounded,  'ISO Certified',        kBlue),
//                         _highlightTile(Icons.workspace_premium_rounded,'1-Year Warranty',    const Color(0xFF7C3AED)),
//                         _highlightTile(Icons.settings_suggest_rounded,'Easy to Use',         _green),
//                         _highlightTile(Icons.flight_takeoff_rounded,  'Lightweight',         _orange),
//                         _highlightTile(Icons.local_hospital_rounded,  'Clinically Tested',   const Color(0xFFDC2626)),
//                         _highlightTile(Icons.flag_rounded,            'Made in India',        const Color(0xFF059669)),
//                       ],
//                     ),
//                   ]),
//                 ),

//                 const SizedBox(height: 8),

//                 // ── 6. RATINGS OVERVIEW
//                 Container(
//                   color: Colors.white,
//                   padding: const EdgeInsets.all(16),
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                     _secTitle('Ratings & Reviews'),
//                     const SizedBox(height: 14),
//                     Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                       // Big number
//                       Column(children: [
//                         const Text('4.2',
//                             style: TextStyle(fontSize: 52, fontWeight: FontWeight.w900,
//                                 color: Color(0xFF1C1C1E), height: 1, letterSpacing: -2)),
//                         const SizedBox(height: 4),
//                         Row(children: List.generate(5, (i) => Icon(
//                             i < 4 ? Icons.star_rounded : Icons.star_half_rounded,
//                             size: 14, color: const Color(0xFFF9A825)))),
//                         const SizedBox(height: 2),
//                         const Text('128 ratings', style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF))),
//                       ]),
//                       const SizedBox(width: 20),
//                       // Bar chart
//                       Expanded(child: Column(children: [
//                         _ratingBar(5, 0.72),
//                         _ratingBar(4, 0.55),
//                         _ratingBar(3, 0.20),
//                         _ratingBar(2, 0.08),
//                         _ratingBar(1, 0.04),
//                       ])),
//                     ]),
//                     const SizedBox(height: 16),
//                     const Divider(color: Color(0xFFF3F4F6), thickness: 1),
//                     const SizedBox(height: 12),
//                     // Sample review card
//                     _reviewCard('Ramesh K.', 5, 'Excellent product! Works perfectly. Very easy to use and the readings are accurate. Delivery was also fast.',
//                         '2 days ago'),
//                     const SizedBox(height: 10),
//                     _reviewCard('Priya S.', 4, 'Good quality for the price. Packaging was intact. Would recommend to others.',
//                         '1 week ago'),
//                   ]),
//                 ),

//                 const SizedBox(height: 8),

//                 // ── 7. SOLD BY
//                 Container(
//                   color: Colors.white,
//                   padding: const EdgeInsets.all(16),
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                     _secTitle('Seller Information'),
//                     const SizedBox(height: 12),
//                     Row(children: [
//                       Container(
//                         width: 52, height: 52,
//                         decoration: BoxDecoration(
//                           color: kBlueLite,
//                           borderRadius: BorderRadius.circular(14),
//                           border: Border.all(color: kBlue.withOpacity(0.2)),
//                         ),
//                         child: const Icon(Icons.storefront_rounded, color: kBlue, size: 26),
//                       ),
//                       const SizedBox(width: 12),
//                       const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                         Text('VeeSafe Official Store',
//                             style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800,
//                                 color: Color(0xFF1C1C1E))),
//                         SizedBox(height: 2),
//                         Row(children: [
//                           Icon(Icons.star_rounded, size: 12, color: Color(0xFFF9A825)),
//                           SizedBox(width: 3),
//                           Text('4.8  ·  97% positive  ·  2.4k+ orders',
//                               style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
//                         ]),
//                       ])),
//                       OutlinedButton(
//                         onPressed: () {},
//                         style: OutlinedButton.styleFrom(
//                           foregroundColor: kBlue,
//                           side: const BorderSide(color: kBlue),
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
//                           padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
//                           minimumSize: Size.zero,
//                           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                           textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
//                         ),
//                         child: const Text('Visit'),
//                       ),
//                     ]),
//                   ]),
//                 ),

//                 const SizedBox(height: 100), // space above sticky bar
//               ]),
//             ),
//           ),
//         ]),
//       ),

//       // ══════════════════════════════════════════
//       //  STICKY BOTTOM BAR
//       // ══════════════════════════════════════════
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           border: Border(top: BorderSide(color: Color(0xFFEFF1F7), width: 1)),
//         ),
//         child: Row(children: [
//           // Cart icon button
//           GestureDetector(
//             onTap: () => _snack(context, '🛒  Added to cart!'),
//             child: Container(
//               width: 50, height: 50,
//               decoration: BoxDecoration(
//                 color: kBlueLite,
//                 borderRadius: BorderRadius.circular(14),
//                 border: Border.all(color: kBlue.withOpacity(0.25)),
//               ),
//               child: const Icon(Icons.shopping_cart_outlined, color: kBlue, size: 22),
//             ),
//           ),
//           const SizedBox(width: 10),
//           // Buy Now — full width
//           Expanded(
//             child: GestureDetector(
//               onTap: () => _snack(context, '✅  Order placed! Estimated delivery in 2 days.'),
//               child: Container(
//                 height: 50,
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [kBlue, Color(0xFF1A73E8)],
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                   ),
//                   borderRadius: BorderRadius.circular(14),
//                   boxShadow: [BoxShadow(color: kBlue.withOpacity(0.35), blurRadius: 14, offset: const Offset(0, 5))],
//                 ),
//                 child: const Center(
//                   child: Text('Buy Now  →',
//                       style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800,
//                           color: Colors.white, letterSpacing: 0.2)),
//                 ),
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }

//   // ── Helpers ──────────────────────────────────────────────────────────────
//   Widget _topBtn(IconData icon, Color color, VoidCallback onTap) =>
//       GestureDetector(
//         onTap: onTap,
//         child: Container(
//           width: 36, height: 36,
//           decoration: BoxDecoration(
//               color: const Color(0xFFF4F6FB), borderRadius: BorderRadius.circular(10)),
//           child: Icon(icon, size: 18, color: color),
//         ),
//       );

//   Widget _secTitle(String t) => Row(children: [
//     Container(width: 3.5, height: 16,
//         decoration: BoxDecoration(color: kBlue, borderRadius: BorderRadius.circular(4))),
//     const SizedBox(width: 8),
//     Text(t, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800,
//         color: Color(0xFF1C1C1E), letterSpacing: -0.2)),
//   ]);

//   Widget _deliveryChip(IconData icon, String label, Color color, Color bg) =>
//       Container(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
//         decoration: BoxDecoration(
//           color: bg,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: color.withOpacity(0.2)),
//         ),
//         child: Row(mainAxisSize: MainAxisSize.min, children: [
//           Icon(icon, size: 14, color: color),
//           const SizedBox(width: 5),
//           Text(label,
//               style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: color)),
//         ]),
//       );

//   Widget _highlightTile(IconData icon, String label, Color color) =>
//       Container(
//         decoration: BoxDecoration(
//           color: color.withOpacity(0.07),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(children: [
//           const SizedBox(width: 10),
//           Icon(icon, size: 16, color: color),
//           const SizedBox(width: 8),
//           Flexible(child: Text(label,
//               style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: color))),
//         ]),
//       );

//   Widget _ratingBar(int star, double fraction) => Padding(
//     padding: const EdgeInsets.only(bottom: 5),
//     child: Row(children: [
//       Text('$star', style: const TextStyle(fontSize: 11, color: Color(0xFF6B7280),
//           fontWeight: FontWeight.w600)),
//       const SizedBox(width: 4),
//       const Icon(Icons.star_rounded, size: 10, color: Color(0xFFF9A825)),
//       const SizedBox(width: 6),
//       Expanded(child: ClipRRect(
//         borderRadius: BorderRadius.circular(4),
//         child: LinearProgressIndicator(
//           value: fraction,
//           minHeight: 6,
//           backgroundColor: const Color(0xFFF3F4F6),
//           valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFF9A825)),
//         ),
//       )),
//       const SizedBox(width: 6),
//       Text('${(fraction * 128).round()}',
//           style: const TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
//     ]),
//   );

//   Widget _reviewCard(String name, int stars, String body, String time) =>
//       Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: const Color(0xFFF9FAFB),
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: const Color(0xFFF3F4F6)),
//         ),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Row(children: [
//             Container(
//               width: 32, height: 32,
//               decoration: BoxDecoration(
//                 color: kBlue.withOpacity(0.12),
//                 shape: BoxShape.circle,
//               ),
//               child: Center(
//                 child: Text(name[0],
//                     style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: kBlue)),
//               ),
//             ),
//             const SizedBox(width: 9),
//             Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Text(name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700,
//                   color: Color(0xFF1C1C1E))),
//               Row(children: [
//                 ...List.generate(stars, (_) =>
//                     const Icon(Icons.star_rounded, size: 11, color: Color(0xFFF9A825))),
//                 const SizedBox(width: 5),
//                 Text(time, style: const TextStyle(fontSize: 10, color: Color(0xFF9CA3AF))),
//               ]),
//             ])),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFEBFBF1),
//                 borderRadius: BorderRadius.circular(6),
//               ),
//               child: const Text('Verified', style: TextStyle(fontSize: 9.5,
//                   fontWeight: FontWeight.w700, color: _green)),
//             ),
//           ]),
//           const SizedBox(height: 8),
//           Text(body, style: const TextStyle(fontSize: 12.5, color: Color(0xFF6B7280), height: 1.5)),
//         ]),
//       );

//   Widget _qtyBtn(IconData icon, VoidCallback onTap) => GestureDetector(
//     onTap: onTap,
//     child: SizedBox(width: 38, height: 38,
//         child: Icon(icon, size: 17, color: const Color(0xFF374151))),
//   );

//   void _snack(BuildContext context, String msg) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text(msg, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
//       backgroundColor: kBlue,
//       behavior: SnackBarBehavior.floating,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
//       duration: const Duration(seconds: 2),
//     ));
//   }
// }


// // ─────────────────────────────────────────────────────────────────────────────
// //  CATEGORY PRODUCTS SCREEN
// // ─────────────────────────────────────────────────────────────────────────────
// class CategoryProductsScreen extends StatefulWidget {
//   final String categoryName;
//   final Color categoryColor;
//   final IconData categoryIcon;

//   const CategoryProductsScreen({
//     super.key,
//     required this.categoryName,
//     required this.categoryColor,
//     required this.categoryIcon,
//   });

//   @override
//   State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
// }

// class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
//   String _sortBy = 'Popular';
//   final List<String> _sortOptions = [
//     'Popular', 'Price: Low to High', 'Price: High to Low', 'Newest',
//   ];

//   // ── Image constants
//   static const _imgBloodTest  = 'assets/images/blood machine.jpg';
//   static const _imgSurgical   = 'https://images.unsplash.com/photo-1584432810601-6c7f27d2362b?w=300&h=300&fit=crop';
//   static const _imgRetina     = 'https://images.unsplash.com/photo-1576671081837-49000212a370?w=300&h=300&fit=crop';
//   static const _imgFirstAid   = 'assets/images/first aid kit.jpg';
//   static const _imgOxyCyl     = 'assets/images/Oxygen Medic Kit .jpg';
//   static const _imgDisposable = 'assets/images/Disposable.jpg';
//   static const _imgWalkStick  = 'assets/images/Walking Stick.jpg';
//   static const _imgWheelchair = 'https://images.unsplash.com/photo-1573812461383-e5f8b759d12e?w=300&h=300&fit=crop';
//   static const _imgLegMassage = 'https://images.unsplash.com/photo-1519823551278-64ac92734fb1?w=300&h=300&fit=crop';
//   static const _imgNebulizer  = 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=300&h=300&fit=crop';
//   static const _imgGlucometer = 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=300&h=300&fit=crop';

//   Map<String, List<Product>> get _all => {
//     'Beauty': [
//       Product(name: 'Skin Care Kit',        price: 'Rs.899',  oldPrice: 'Rs.1,200', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgSurgical),
//       Product(name: 'Hair Care Set',         price: 'Rs.599',  oldPrice: 'Rs.799',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgDisposable),
//       Product(name: 'Face Wash Bundle',      price: 'Rs.450',  oldPrice: 'Rs.600',   badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgSurgical),
//       Product(name: 'Moisturizer SPF 50',    price: 'Rs.750',  oldPrice: 'Rs.999',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgDisposable),
//       Product(name: 'Vitamin C Serum',       price: 'Rs.1,200',oldPrice: 'Rs.1,500', badge: '20% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgSurgical),
//       Product(name: 'Lip Balm Pack',         price: 'Rs.299',  oldPrice: 'Rs.399',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgDisposable),
//     ],
//     'Lifestyle &\nFitness': [
//       Product(name: 'Yoga Mat Premium',      price: 'Rs.1,299',oldPrice: 'Rs.1,800', badge: '28% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
//       Product(name: 'Resistance Band Set',   price: 'Rs.599',  oldPrice: 'Rs.799',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
//       Product(name: 'Fitness Tracker',       price: 'Rs.2,499',oldPrice: 'Rs.3,200', badge: '22% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgGlucometer),
//       Product(name: 'Dumbbell Set 5kg',      price: 'Rs.1,599',oldPrice: 'Rs.2,000', badge: '20% Off', badgeColor: kGreen, imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
//       Product(name: 'Skipping Rope',         price: 'Rs.299',  oldPrice: 'Rs.399',   badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
//       Product(name: 'Protein Shaker',        price: 'Rs.449',  oldPrice: 'Rs.599',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgGlucometer),
//     ],
//     'Personal\nCare': [
//       Product(name: 'Electric Toothbrush',   price: 'Rs.999',  oldPrice: 'Rs.1,299', badge: '23% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgDisposable),
//       Product(name: 'Digital Thermometer',   price: 'Rs.399',  oldPrice: 'Rs.599',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgGlucometer),
//       Product(name: 'Nail Care Kit',         price: 'Rs.349',  oldPrice: 'Rs.499',   badge: '30% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgDisposable),
//       Product(name: 'Hair Trimmer',          price: 'Rs.799',  oldPrice: 'Rs.1,099', badge: '27% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgGlucometer),
//       Product(name: 'Body Massager',         price: 'Rs.1,199',oldPrice: 'Rs.1,599', badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgLegMassage),
//       Product(name: 'Sanitizer Pack 5x',     price: 'Rs.249',  oldPrice: 'Rs.349',   badge: '29% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgDisposable),
//     ],
//     'Mother &\nBaby': [
//       Product(name: 'Baby Monitor',          price: 'Rs.3,499',oldPrice: 'Rs.4,500', badge: '22% Off', badgeColor: kBlue,  imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
//       Product(name: 'Baby Thermometer',      price: 'Rs.699',  oldPrice: 'Rs.999',   badge: '30% Off', badgeColor: kGreen, imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
//       Product(name: 'Baby Nebulizer',        price: 'Rs.1,299',oldPrice: 'Rs.1,799', badge: '28% Off', badgeColor: kBlue,  imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgNebulizer),
//       Product(name: 'Maternity Belt',        price: 'Rs.899',  oldPrice: 'Rs.1,199', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgDisposable),
//       Product(name: 'Breast Pump Electric',  price: 'Rs.2,499',oldPrice: 'Rs.3,200', badge: '22% Off', badgeColor: kBlue,  imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
//       Product(name: 'Baby Weighing Scale',   price: 'Rs.1,099',oldPrice: 'Rs.1,499', badge: '27% Off', badgeColor: kGreen, imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
//     ],
//     'Testing\nProducts': [
//       Product(name: 'Blood Testing Device',  price: 'Rs.3,250',oldPrice: 'Rs.4,000', badge: '15% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgBloodTest),
//       Product(name: 'Glucometer Kit',        price: 'Rs.1,290',oldPrice: 'Rs.1,800', badge: '28% Off', badgeColor: kGreen, imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
//       Product(name: 'Pulse Oximeter',        price: 'Rs.899',  oldPrice: 'Rs.1,299', badge: '31% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
//       Product(name: 'BP Monitor Digital',    price: 'Rs.1,799',oldPrice: 'Rs.2,400', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
//       Product(name: 'Retinascope Full Set',  price: 'Rs.3,250',oldPrice: 'Rs.4,500', badge: '15% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgRetina),
//       Product(name: 'Urine Test Strips',     price: 'Rs.499',  oldPrice: 'Rs.699',   badge: '29% Off', badgeColor: kGreen, imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
//     ],
//     'Equipment &\nHomecare': [
//       Product(name: 'Oxygen Cylinder & Mask',price: 'Rs.2,199',oldPrice: 'Rs.3,000', badge: '26% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgOxyCyl),
//       Product(name: 'Walking Stick – Steel', price: 'Rs.1,499',oldPrice: 'Rs.1,999', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgWalkStick),
//       Product(name: 'Wheel Chair',           price: 'Rs.5,999',oldPrice: 'Rs.7,500', badge: '20% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgWheelchair),
//       Product(name: 'Leg Massager Pro',      price: 'Rs.2,800',oldPrice: 'Rs.3,500', badge: '20% Off', badgeColor: kGreen, imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgLegMassage),
//       Product(name: 'Nebulizer Machine',     price: 'Rs.1,850',oldPrice: 'Rs.2,400', badge: '22% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgNebulizer),
//       Product(name: 'First Aid Kit – Full',  price: 'Rs.1,499',oldPrice: 'Rs.1,999', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgFirstAid),
//     ],
//     'Oral Care': [
//       Product(name: 'Electric Toothbrush',   price: 'Rs.999',  oldPrice: 'Rs.1,299', badge: '23% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
//       Product(name: 'Teeth Whitening Kit',   price: 'Rs.799',  oldPrice: 'Rs.1,099', badge: '27% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
//       Product(name: 'Dental Floss Pack',     price: 'Rs.199',  oldPrice: 'Rs.299',   badge: '33% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
//       Product(name: 'Mouthwash 500ml',       price: 'Rs.349',  oldPrice: 'Rs.499',   badge: '30% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
//       Product(name: 'Tongue Cleaner Set',    price: 'Rs.149',  oldPrice: 'Rs.199',   badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
//       Product(name: 'Water Flosser',         price: 'Rs.1,499',oldPrice: 'Rs.1,999', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgGlucometer),
//     ],
//     'COVID - 19': [
//       Product(name: 'N95 Mask Pack 10x',     price: 'Rs.499',  oldPrice: 'Rs.699',   badge: '29% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
//       Product(name: 'COVID Test Kit',        price: 'Rs.299',  oldPrice: 'Rs.449',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgGlucometer),
//       Product(name: 'Pulse Oximeter',        price: 'Rs.899',  oldPrice: 'Rs.1,299', badge: '31% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgGlucometer),
//       Product(name: 'Sanitizer 500ml',       price: 'Rs.199',  oldPrice: 'Rs.299',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
//       Product(name: 'Face Shield Pack',      price: 'Rs.349',  oldPrice: 'Rs.499',   badge: '30% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
//       Product(name: 'Disposable Gloves 50x', price: 'Rs.299',  oldPrice: 'Rs.449',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
//     ],
//   };

//   List<Product> get _products {
//     final list = _all[widget.categoryName] ?? [];
//     if (_sortBy == 'Price: Low to High') {
//       return [...list]..sort((a, b) => _parsePrice(a.price).compareTo(_parsePrice(b.price)));
//     } else if (_sortBy == 'Price: High to Low') {
//       return [...list]..sort((a, b) => _parsePrice(b.price).compareTo(_parsePrice(a.price)));
//     }
//     return list;
//   }

//   double _parsePrice(String p) =>
//       double.tryParse(p.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;

//   // ═══════════════════════════════════════════════════════════════════════════
//   //  BUILD
//   // ═══════════════════════════════════════════════════════════════════════════
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF4F6FB),
//       body: SafeArea(
//         child: Column(children: [
//           _appBar(context),
//           _filterBar(),
//           Expanded(
//             child: _products.isEmpty
//                 ? _emptyState()
//                 : SingleChildScrollView(
//                     physics: const BouncingScrollPhysics(),
//                     child: Column(children: [
//                       const SizedBox(height: 12),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: GridView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             crossAxisSpacing: 12,
//                             mainAxisSpacing: 12,
//                             childAspectRatio: 0.70,
//                           ),
//                           itemCount: _products.length,
//                           itemBuilder: (_, i) => _productCard(_products[i]),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       _trustSection(),
//                       const SizedBox(height: 24),
//                     ]),
//                   ),
//           ),
//         ]),
//       ),
//     );
//   }

//   // ── AppBar — no item count badge
//   Widget _appBar(BuildContext context) => Container(
//     decoration: const BoxDecoration(
//       color: kBlue,
//       border: Border(bottom: BorderSide(color: Color(0x22000000), width: 1)),
//     ),
//     padding: const EdgeInsets.fromLTRB(4, 8, 14, 12),
//     child: Row(children: [
//       IconButton(
//         icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: Colors.white),
//         onPressed: () => Navigator.pop(context),
//         splashRadius: 20,
//       ),
//       Container(
//         width: 34, height: 34,
//         decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
//         child: Icon(widget.categoryIcon, size: 18, color: Colors.white),
//       ),
//       const SizedBox(width: 10),
//       Expanded(
//         child: Text(widget.categoryName.replaceAll('\n', ' '),
//             style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800,
//                 color: Colors.white, letterSpacing: -0.2)),
//       ),
//       Container(
//         width: 36, height: 36,
//         decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(10)),
//         child: const Icon(Icons.search_rounded, size: 19, color: Colors.white),
//       ),
//     ]),
//   );

//   // ── Sort bar
//   Widget _filterBar() => Container(
//     padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
//     decoration: const BoxDecoration(
//       color: Colors.white,
//       border: Border(bottom: BorderSide(color: Color(0xFFEFF1F7), width: 1)),
//     ),
//     child: Row(children: [
//       Container(
//         width: 26, height: 26,
//         decoration: BoxDecoration(color: kBlueLite, borderRadius: BorderRadius.circular(7)),
//         child: const Icon(Icons.sort_rounded, size: 14, color: kBlue),
//       ),
//       const SizedBox(width: 8),
//       const Text('Sort:', style: TextStyle(fontSize: 12, color: Color(0xFF6B7280), fontWeight: FontWeight.w600)),
//       const SizedBox(width: 8),
//       Expanded(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           physics: const BouncingScrollPhysics(),
//           child: Row(
//             children: _sortOptions.map((opt) {
//               final sel = _sortBy == opt;
//               return GestureDetector(
//                 onTap: () => setState(() => _sortBy = opt),
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 180),
//                   margin: const EdgeInsets.only(right: 8),
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: sel ? kBlue : const Color(0xFFF4F6FB),
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(color: sel ? kBlue : const Color(0xFFE5E7EB)),
//                     boxShadow: sel
//                         ? [BoxShadow(color: kBlue.withOpacity(0.2), blurRadius: 6, offset: const Offset(0, 2))]
//                         : [],
//                   ),
//                   child: Text(opt,
//                       style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600,
//                           color: sel ? Colors.white : const Color(0xFF6B7280))),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     ]),
//   );

//   // ── Product card — taps open ProductDetailScreen
//   Widget _productCard(Product p) => GestureDetector(
//     onTap: () => Navigator.push(context,
//         MaterialPageRoute(builder: (_) => ProductDetailScreen(product: p))),
//     child: Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: const Color(0xFFEFF1F7), width: 1),
//         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 3))],
//       ),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         // Image area
//         Stack(children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//             child: Container(
//               height: 130, width: double.infinity,
//               color: const Color(0xFFF4F6FB),
//               child: Image.network(p.imageUrl, fit: BoxFit.cover,
//                 loadingBuilder: (_, child, prog) {
//                   if (prog == null) return child;
//                   return const Center(child: SizedBox(width: 20, height: 20,
//                       child: CircularProgressIndicator(strokeWidth: 2, color: kBlue)));
//                 },
//                 errorBuilder: (_, __, ___) => Center(
//                     child: Icon(p.imageIcon, size: 50, color: const Color(0xFFD1D5DB))),
//               ),
//             ),
//           ),
//           // Badge
//           Positioned(top: 8, left: 8,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
//               decoration: BoxDecoration(color: p.badgeColor, borderRadius: BorderRadius.circular(6)),
//               child: Text(p.badge,
//                   style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700)),
//             ),
//           ),
//           // Heart
//           Positioned(top: 8, right: 8,
//             child: StatefulBuilder(
//               builder: (_, setL) => GestureDetector(
//                 onTap: () => setL(() => p.liked = !p.liked),
//                 child: Container(
//                   width: 28, height: 28,
//                   decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle,
//                       boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.10), blurRadius: 5)]),
//                   child: Icon(p.liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
//                       size: 14, color: p.liked ? Colors.red : const Color(0xFFD1D5DB)),
//                 ),
//               ),
//             ),
//           ),
//         ]),
//         // Info
//         Padding(
//           padding: const EdgeInsets.fromLTRB(10, 9, 10, 10),
//           child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Text(p.name,
//                 maxLines: 2, overflow: TextOverflow.ellipsis,
//                 style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700,
//                     color: Color(0xFF111827), height: 1.3)),
//             const SizedBox(height: 5),
//             // Stars
//             Row(children: [
//               ...List.generate(4, (_) => const Icon(Icons.star_rounded, size: 11, color: Color(0xFFF59E0B))),
//               const Icon(Icons.star_half_rounded, size: 11, color: Color(0xFFF59E0B)),
//               const SizedBox(width: 4),
//               const Text('4.2', style: TextStyle(fontSize: 10, color: Color(0xFF6B7280))),
//             ]),
//             const SizedBox(height: 7),
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 Text(p.price,
//                     style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: Color(0xFF111827))),
//                 Text(p.oldPrice,
//                     style: const TextStyle(fontSize: 10, color: Color(0xFF9CA3AF),
//                         decoration: TextDecoration.lineThrough)),
//               ]),
//               // Add button
//               Container(
//                 width: 30, height: 30,
//                 decoration: BoxDecoration(color: kGreen, borderRadius: BorderRadius.circular(9),
//                     boxShadow: [BoxShadow(color: kGreen.withOpacity(0.3), blurRadius: 6, offset: const Offset(0, 2))]),
//                 child: const Icon(Icons.add_rounded, color: Colors.white, size: 18),
//               ),
//             ]),
//           ]),
//         ),
//       ]),
//     ),
//   );

//   // ── Trust section below grid
//   Widget _trustSection() => Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 16),
//     child: Column(children: [
//       // Why VeeSafe
//       Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: const Color(0xFFEFF1F7)),
//           boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 2))],
//         ),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Row(children: [
//             Container(width: 3.5, height: 16,
//                 decoration: BoxDecoration(color: kBlue, borderRadius: BorderRadius.circular(4))),
//             const SizedBox(width: 8),
//             const Text('Why shop on VeeSafe?',
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800,
//                     color: Color(0xFF111827), letterSpacing: -0.2)),
//           ]),
//           const SizedBox(height: 14),
//           Row(children: [
//             _trustBadge(Icons.verified_rounded,     '100%\nGenuine',  const Color(0xFF059669), const Color(0xFFEBF9EE)),
//             const SizedBox(width: 10),
//             _trustBadge(Icons.local_shipping_rounded,'Fast\nDelivery', kBlue,                  kBlueLite),
//             const SizedBox(width: 10),
//             _trustBadge(Icons.replay_rounded,        'Easy\nReturns', const Color(0xFFF59E0B), const Color(0xFFFFF8DC)),
//             const SizedBox(width: 10),
//             _trustBadge(Icons.headset_mic_rounded,  '24/7\nSupport',  const Color(0xFF8E24AA), const Color(0xFFF3E5F5)),
//           ]),
//         ]),
//       ),
//       const SizedBox(height: 12),
//       // Expert help banner
//       Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: kBlue,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [BoxShadow(color: kBlue.withOpacity(0.25), blurRadius: 12, offset: const Offset(0, 4))],
//         ),
//         child: Row(children: [
//           Container(
//             width: 48, height: 48,
//             decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(14)),
//             child: const Icon(Icons.headset_mic_rounded, color: Colors.white, size: 24),
//           ),
//           const SizedBox(width: 14),
//           const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Text('Need help choosing?',
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.white)),
//             SizedBox(height: 2),
//             Text('Our medical experts are available 24/7',
//                 style: TextStyle(fontSize: 11.5, color: Colors.white70)),
//           ])),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//             decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
//             child: const Text('Chat',
//                 style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: kBlue)),
//           ),
//         ]),
//       ),
//     ]),
//   );

//   Widget _trustBadge(IconData icon, String label, Color color, Color bg) => Expanded(
//     child: Container(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12)),
//       child: Column(children: [
//         Icon(icon, size: 20, color: color),
//         const SizedBox(height: 5),
//         Text(label, textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: color, height: 1.3)),
//       ]),
//     ),
//   );

//   // ── Empty state
//   Widget _emptyState() => Center(
//     child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//       Container(width: 90, height: 90,
//           decoration: const BoxDecoration(color: kBlueLite, shape: BoxShape.circle),
//           child: Icon(widget.categoryIcon, color: kBlue, size: 40)),
//       const SizedBox(height: 18),
//       const Text('No products found',
//           style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Color(0xFF111827))),
//       const SizedBox(height: 6),
//       const Text('Check back soon for new arrivals!',
//           style: TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
//     ]),
//   );
// }




















// lib/screens/category_products_screen.dart
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/product_model.dart';
import 'product_detail_screen.dart';

class CategoryProductsScreen extends StatefulWidget {
  final String categoryName;
  final Color categoryColor;
  final IconData categoryIcon;

  const CategoryProductsScreen({
    super.key,
    required this.categoryName,
    required this.categoryColor,
    required this.categoryIcon,
  });

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  String _sortBy = 'Popular';
  final List<String> _sortOptions = [
    'Popular', 'Price: Low to High', 'Price: High to Low', 'Newest',
  ];

  static const _imgBloodTest  = 'assets/images/blood machine.jpg';
  static const _imgSurgical   = 'https://images.unsplash.com/photo-1584432810601-6c7f27d2362b?w=300&h=300&fit=crop';
  static const _imgRetina     = 'https://images.unsplash.com/photo-1576671081837-49000212a370?w=300&h=300&fit=crop';
  static const _imgFirstAid   = 'assets/images/first aid kit.jpg';
  static const _imgOxyCyl     = 'assets/images/Oxygen Medic Kit .jpg';
  static const _imgDisposable = 'assets/images/teeth.jpg';
  static const _imgWalkStick  = 'assets/images/Walking Stick.jpg';
  static const _imgWheelchair = 'https://images.unsplash.com/photo-1573812461383-e5f8b759d12e?w=300&h=300&fit=crop';
  static const _imgLegMassage = 'https://images.unsplash.com/photo-1519823551278-64ac92734fb1?w=300&h=300&fit=crop';
  static const _imgNebulizer  = 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=300&h=300&fit=crop';
  static const _imgGlucometer = 'assets/images/teeth.jpg';

  Map<String, List<Product>> get _all => {
    'Beauty': [
      Product(name: 'Skin Care Kit',        price: 'Rs.899',  oldPrice: 'Rs.1,200', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgSurgical),
      Product(name: 'Hair Care Set',         price: 'Rs.599',  oldPrice: 'Rs.799',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgDisposable),
      Product(name: 'Face Wash Bundle',      price: 'Rs.450',  oldPrice: 'Rs.600',   badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgSurgical),
      Product(name: 'Moisturizer SPF 50',    price: 'Rs.750',  oldPrice: 'Rs.999',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgDisposable),
      Product(name: 'Vitamin C Serum',       price: 'Rs.1,200',oldPrice: 'Rs.1,500', badge: '20% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgSurgical),
      Product(name: 'Lip Balm Pack',         price: 'Rs.299',  oldPrice: 'Rs.399',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgDisposable),
    ],
    'Lifestyle &\nFitness': [
      Product(name: 'Yoga Mat Premium',      price: 'Rs.1,299',oldPrice: 'Rs.1,800', badge: '28% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
      Product(name: 'Resistance Band Set',   price: 'Rs.599',  oldPrice: 'Rs.799',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
      Product(name: 'Fitness Tracker',       price: 'Rs.2,499',oldPrice: 'Rs.3,200', badge: '22% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgGlucometer),
      Product(name: 'Dumbbell Set 5kg',      price: 'Rs.1,599',oldPrice: 'Rs.2,000', badge: '20% Off', badgeColor: kGreen, imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
      Product(name: 'Skipping Rope',         price: 'Rs.299',  oldPrice: 'Rs.399',   badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
      Product(name: 'Protein Shaker',        price: 'Rs.449',  oldPrice: 'Rs.599',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgGlucometer),
    ],
    'Personal\nCare': [
      Product(name: 'Electric Toothbrush',   price: 'Rs.999',  oldPrice: 'Rs.1,299', badge: '23% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgDisposable),
      Product(name: 'Digital Thermometer',   price: 'Rs.399',  oldPrice: 'Rs.599',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgGlucometer),
      Product(name: 'Nail Care Kit',         price: 'Rs.349',  oldPrice: 'Rs.499',   badge: '30% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgDisposable),
      Product(name: 'Hair Trimmer',          price: 'Rs.799',  oldPrice: 'Rs.1,099', badge: '27% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgGlucometer),
      Product(name: 'Body Massager',         price: 'Rs.1,199',oldPrice: 'Rs.1,599', badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgLegMassage),
      Product(name: 'Sanitizer Pack 5x',     price: 'Rs.249',  oldPrice: 'Rs.349',   badge: '29% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgDisposable),
    ],
    'Mother &\nBaby': [
      Product(name: 'Baby Monitor',          price: 'Rs.3,499',oldPrice: 'Rs.4,500', badge: '22% Off', badgeColor: kBlue,  imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
      Product(name: 'Baby Thermometer',      price: 'Rs.699',  oldPrice: 'Rs.999',   badge: '30% Off', badgeColor: kGreen, imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
      Product(name: 'Baby Nebulizer',        price: 'Rs.1,299',oldPrice: 'Rs.1,799', badge: '28% Off', badgeColor: kBlue,  imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgNebulizer),
      Product(name: 'Maternity Belt',        price: 'Rs.899',  oldPrice: 'Rs.1,199', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgDisposable),
      Product(name: 'Breast Pump Electric',  price: 'Rs.2,499',oldPrice: 'Rs.3,200', badge: '22% Off', badgeColor: kBlue,  imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
      Product(name: 'Baby Weighing Scale',   price: 'Rs.1,099',oldPrice: 'Rs.1,499', badge: '27% Off', badgeColor: kGreen, imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
    ],
    'Testing\nProducts': [
      Product(name: 'Blood Testing Device',  price: 'Rs.3,250',oldPrice: 'Rs.4,000', badge: '15% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgBloodTest),
      Product(name: 'Glucometer Kit',        price: 'Rs.1,290',oldPrice: 'Rs.1,800', badge: '28% Off', badgeColor: kGreen, imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
      Product(name: 'Pulse Oximeter',        price: 'Rs.899',  oldPrice: 'Rs.1,299', badge: '31% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
      Product(name: 'BP Monitor Digital',    price: 'Rs.1,799',oldPrice: 'Rs.2,400', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
      Product(name: 'Retinascope Full Set',  price: 'Rs.3,250',oldPrice: 'Rs.4,500', badge: '15% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgRetina),
      Product(name: 'Urine Test Strips',     price: 'Rs.499',  oldPrice: 'Rs.699',   badge: '29% Off', badgeColor: kGreen, imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
    ],
    'Equipment &\nHomecare': [
      Product(name: 'Oxygen Cylinder & Mask',price: 'Rs.2,199',oldPrice: 'Rs.3,000', badge: '26% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgOxyCyl),
      Product(name: 'Walking Stick – Steel', price: 'Rs.1,499',oldPrice: 'Rs.1,999', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgWalkStick),
      Product(name: 'Wheel Chair',           price: 'Rs.5,999',oldPrice: 'Rs.7,500', badge: '20% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgWheelchair),
      Product(name: 'Leg Massager Pro',      price: 'Rs.2,800',oldPrice: 'Rs.3,500', badge: '20% Off', badgeColor: kGreen, imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgLegMassage),
      Product(name: 'Nebulizer Machine',     price: 'Rs.1,850',oldPrice: 'Rs.2,400', badge: '22% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgNebulizer),
      Product(name: 'First Aid Kit – Full',  price: 'Rs.1,499',oldPrice: 'Rs.1,999', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgFirstAid),
    ],
    'Oral Care': [
      Product(name: 'Electric Toothbrush',   price: 'Rs.999',  oldPrice: 'Rs.1,299', badge: '23% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
      Product(name: 'Teeth Whitening Kit',   price: 'Rs.799',  oldPrice: 'Rs.1,099', badge: '27% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
      Product(name: 'Dental Floss Pack',     price: 'Rs.199',  oldPrice: 'Rs.299',   badge: '33% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
      Product(name: 'Mouthwash 500ml',       price: 'Rs.349',  oldPrice: 'Rs.499',   badge: '30% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
      Product(name: 'Tongue Cleaner Set',    price: 'Rs.149',  oldPrice: 'Rs.199',   badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
      Product(name: 'Water Flosser',         price: 'Rs.1,499',oldPrice: 'Rs.1,999', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgGlucometer),
    ],
    'COVID - 19': [
      Product(name: 'N95 Mask Pack 10x',     price: 'Rs.499',  oldPrice: 'Rs.699',   badge: '29% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
      Product(name: 'COVID Test Kit',        price: 'Rs.299',  oldPrice: 'Rs.449',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgGlucometer),
      Product(name: 'Pulse Oximeter',        price: 'Rs.899',  oldPrice: 'Rs.1,299', badge: '31% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgGlucometer),
      Product(name: 'Sanitizer 500ml',       price: 'Rs.199',  oldPrice: 'Rs.299',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
      Product(name: 'Face Shield Pack',      price: 'Rs.349',  oldPrice: 'Rs.499',   badge: '30% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
      Product(name: 'Disposable Gloves 50x', price: 'Rs.299',  oldPrice: 'Rs.449',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
    ],
  };

  List<Product> get _products {
    final list = _all[widget.categoryName] ?? [];
    if (_sortBy == 'Price: Low to High') {
      return [...list]..sort((a, b) => _parsePrice(a.price).compareTo(_parsePrice(b.price)));
    }
    if (_sortBy == 'Price: High to Low') {
      return [...list]..sort((a, b) => _parsePrice(b.price).compareTo(_parsePrice(a.price)));
    }
    return list;
  }

  double _parsePrice(String p) =>
      double.tryParse(p.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      body: SafeArea(
        child: Column(children: [
          _appBar(context),
          _filterBar(),
          Expanded(
            child: _products.isEmpty
                ? _emptyState()
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(children: [
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, crossAxisSpacing: 12,
                            mainAxisSpacing: 12, childAspectRatio: 0.70,
                          ),
                          itemCount: _products.length,
                          itemBuilder: (_, i) => _productCard(_products[i]),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _trustSection(),
                      const SizedBox(height: 24),
                    ]),
                  ),
          ),
        ]),
      ),
    );
  }

  Widget _appBar(BuildContext context) => Container(
    decoration: const BoxDecoration(color: kBlue,
        border: Border(bottom: BorderSide(color: Color(0x22000000), width: 1))),
    padding: const EdgeInsets.fromLTRB(4, 8, 14, 12),
    child: Row(children: [
      IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: Colors.white),
        onPressed: () => Navigator.pop(context), splashRadius: 20,
      ),
      Container(width: 34, height: 34,
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(10)),
        child: Icon(widget.categoryIcon, size: 18, color: Colors.white)),
      const SizedBox(width: 10),
      Expanded(child: Text(widget.categoryName.replaceAll('\n', ' '),
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white))),
      Container(width: 36, height: 36,
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(10)),
        child: const Icon(Icons.search_rounded, size: 19, color: Colors.white)),
    ]),
  );

  Widget _filterBar() => Container(
    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
    decoration: const BoxDecoration(color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFEFF1F7), width: 1))),
    child: Row(children: [
      Container(width: 26, height: 26,
        decoration: BoxDecoration(color: kBlueLite, borderRadius: BorderRadius.circular(7)),
        child: const Icon(Icons.sort_rounded, size: 14, color: kBlue)),
      const SizedBox(width: 8),
      const Text('Sort:', style: TextStyle(fontSize: 12, color: Color(0xFF6B7280), fontWeight: FontWeight.w600)),
      const SizedBox(width: 8),
      Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(children: _sortOptions.map((opt) {
            final sel = _sortBy == opt;
            return GestureDetector(
              onTap: () => setState(() => _sortBy = opt),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: sel ? kBlue : const Color(0xFFF4F6FB),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: sel ? kBlue : const Color(0xFFE5E7EB)),
                  boxShadow: sel ? [BoxShadow(color: kBlue.withOpacity(0.2), blurRadius: 6, offset: const Offset(0, 2))] : [],
                ),
                child: Text(opt, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600,
                    color: sel ? Colors.white : const Color(0xFF6B7280))),
              ),
            );
          }).toList()),
        ),
      ),
    ]),
  );

  Widget _productCard(Product p) => GestureDetector(
    onTap: () => Navigator.push(context,
        MaterialPageRoute(builder: (_) => ProductDetailScreen(product: p))),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEFF1F7), width: 1),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Container(
              height: 130, width: double.infinity,
              color: p.imageBg,
              child: p.imageUrl.startsWith('http')
                  ? Image.network(p.imageUrl, fit: BoxFit.cover,
                      loadingBuilder: (_, child, prog) => prog == null ? child
                          : Center(child: SizedBox(width: 20, height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2, color: p.imageIconColor))),
                      errorBuilder: (_, _, _) => Center(child: Icon(p.imageIcon, size: 50, color: p.imageIconColor)))
                  : p.imageUrl.startsWith('assets')
                      ? Image.asset(p.imageUrl, fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => Center(child: Icon(p.imageIcon, size: 50, color: p.imageIconColor)))
                      : Center(child: Icon(p.imageIcon, size: 50, color: p.imageIconColor)),
            ),
          ),
          Positioned(top: 8, left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
              decoration: BoxDecoration(color: p.badgeColor, borderRadius: BorderRadius.circular(6)),
              child: Text(p.badge, style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700)),
            )),
          Positioned(top: 8, right: 8,
            child: StatefulBuilder(
              builder: (_, setL) => GestureDetector(
                onTap: () => setL(() => p.liked = !p.liked),
                child: Container(
                  width: 28, height: 28,
                  decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.10), blurRadius: 5)]),
                  child: Icon(p.liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                      size: 14, color: p.liked ? Colors.red : const Color(0xFFD1D5DB)),
                ),
              ),
            )),
        ]),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 9, 10, 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(p.name, maxLines: 2, overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF111827), height: 1.3)),
            const SizedBox(height: 5),
            Row(children: [
              ...List.generate(4, (_) => const Icon(Icons.star_rounded, size: 11, color: Color(0xFFF59E0B))),
              const Icon(Icons.star_half_rounded, size: 11, color: Color(0xFFF59E0B)),
              const SizedBox(width: 4),
              const Text('4.2', style: TextStyle(fontSize: 10, color: Color(0xFF6B7280))),
            ]),
            const SizedBox(height: 7),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(p.price, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: Color(0xFF111827))),
                Text(p.oldPrice, style: const TextStyle(fontSize: 10, color: Color(0xFF9CA3AF), decoration: TextDecoration.lineThrough)),
              ]),
              Container(
                width: 30, height: 30,
                decoration: BoxDecoration(color: kGreen, borderRadius: BorderRadius.circular(9),
                    boxShadow: [BoxShadow(color: kGreen.withOpacity(0.3), blurRadius: 6, offset: const Offset(0, 2))]),
                child: const Icon(Icons.add_rounded, color: Colors.white, size: 18)),
            ]),
          ]),
        ),
      ]),
    ),
  );

  Widget _trustSection() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(children: [
      Container(
        width: double.infinity, padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEFF1F7)),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 2))]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(width: 3.5, height: 16,
                decoration: BoxDecoration(color: kBlue, borderRadius: BorderRadius.circular(4))),
            const SizedBox(width: 8),
            const Text('Why shop on VeeSafe?',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Color(0xFF111827))),
          ]),
          const SizedBox(height: 14),
          Row(children: [
            _trustBadge(Icons.verified_rounded,      '100%\nGenuine',  const Color(0xFF059669), const Color(0xFFEBF9EE)),
            const SizedBox(width: 10),
            _trustBadge(Icons.local_shipping_rounded, 'Fast\nDelivery', kBlue,                  kBlueLite),
            const SizedBox(width: 10),
            _trustBadge(Icons.replay_rounded,         'Easy\nReturns', const Color(0xFFF59E0B), const Color(0xFFFFF8DC)),
            const SizedBox(width: 10),
            _trustBadge(Icons.headset_mic_rounded,   '24/7\nSupport',  const Color(0xFF8E24AA), const Color(0xFFF3E5F5)),
          ]),
        ]),
      ),
      const SizedBox(height: 12),
      Container(
        width: double.infinity, padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: kBlue, borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: kBlue.withOpacity(0.25), blurRadius: 12, offset: const Offset(0, 4))]),
        child: Row(children: [
          Container(width: 48, height: 48,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(14)),
            child: const Icon(Icons.headset_mic_rounded, color: Colors.white, size: 24)),
          const SizedBox(width: 14),
          const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Need help choosing?',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.white)),
            SizedBox(height: 2),
            Text('Our medical experts are available 24/7',
                style: TextStyle(fontSize: 11.5, color: Colors.white70)),
          ])),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: const Text('Chat', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: kBlue))),
        ]),
      ),
    ]),
  );

  Widget _trustBadge(IconData icon, String label, Color color, Color bg) => Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12)),
      child: Column(children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(height: 5),
        Text(label, textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: color, height: 1.3)),
      ]),
    ),
  );

  Widget _emptyState() => Center(
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(width: 90, height: 90,
          decoration: const BoxDecoration(color: kBlueLite, shape: BoxShape.circle),
          child: Icon(widget.categoryIcon, color: kBlue, size: 40)),
      const SizedBox(height: 18),
      const Text('No products found',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Color(0xFF111827))),
      const SizedBox(height: 6),
      const Text('Check back soon for new arrivals!',
          style: TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
    ]),
  );
}