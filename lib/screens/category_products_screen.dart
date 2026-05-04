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

  // Map<String, List<Product>> get _all => {
  //   'Beauty': [
  //     Product(name: 'Skin Care Kit',        price: 'Rs.899',  oldPrice: 'Rs.1,200', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgSurgical),
  //     Product(name: 'Hair Care Set',         price: 'Rs.599',  oldPrice: 'Rs.799',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgDisposable),
  //     Product(name: 'Face Wash Bundle',      price: 'Rs.450',  oldPrice: 'Rs.600',   badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgSurgical),
  //     Product(name: 'Moisturizer SPF 50',    price: 'Rs.750',  oldPrice: 'Rs.999',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgDisposable),
  //     Product(name: 'Vitamin C Serum',       price: 'Rs.1,200',oldPrice: 'Rs.1,500', badge: '20% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgSurgical),
  //     Product(name: 'Lip Balm Pack',         price: 'Rs.299',  oldPrice: 'Rs.399',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgDisposable),
  //   ],
  //   'Lifestyle &\nFitness': [
  //     Product(name: 'Yoga Mat Premium',      price: 'Rs.1,299',oldPrice: 'Rs.1,800', badge: '28% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
  //     Product(name: 'Resistance Band Set',   price: 'Rs.599',  oldPrice: 'Rs.799',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
  //     Product(name: 'Fitness Tracker',       price: 'Rs.2,499',oldPrice: 'Rs.3,200', badge: '22% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgGlucometer),
  //     Product(name: 'Dumbbell Set 5kg',      price: 'Rs.1,599',oldPrice: 'Rs.2,000', badge: '20% Off', badgeColor: kGreen, imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
  //     Product(name: 'Skipping Rope',         price: 'Rs.299',  oldPrice: 'Rs.399',   badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
  //     Product(name: 'Protein Shaker',        price: 'Rs.449',  oldPrice: 'Rs.599',   badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgGlucometer),
  //   ],
  //   'Personal\nCare': [
  //     Product(name: 'Electric Toothbrush',   price: 'Rs.999',  oldPrice: 'Rs.1,299', badge: '23% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgDisposable),
  //     Product(name: 'Digital Thermometer',   price: 'Rs.399',  oldPrice: 'Rs.599',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgGlucometer),
  //     Product(name: 'Nail Care Kit',         price: 'Rs.349',  oldPrice: 'Rs.499',   badge: '30% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgDisposable),
  //     Product(name: 'Hair Trimmer',          price: 'Rs.799',  oldPrice: 'Rs.1,099', badge: '27% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgGlucometer),
  //     Product(name: 'Body Massager',         price: 'Rs.1,199',oldPrice: 'Rs.1,599', badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgLegMassage),
  //     Product(name: 'Sanitizer Pack 5x',     price: 'Rs.249',  oldPrice: 'Rs.349',   badge: '29% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgDisposable),
  //   ],
  //   'Mother &\nBaby': [
  //     Product(name: 'Baby Monitor',          price: 'Rs.3,499',oldPrice: 'Rs.4,500', badge: '22% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
  //     Product(name: 'Baby Thermometer',      price: 'Rs.699',  oldPrice: 'Rs.999',   badge: '30% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
  //     Product(name: 'Baby Nebulizer',        price: 'Rs.1,299',oldPrice: 'Rs.1,799', badge: '28% Off', badgeColor: kBlue,  imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgNebulizer),
  //     Product(name: 'Maternity Belt',        price: 'Rs.899',  oldPrice: 'Rs.1,199', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgDisposable),
  //     Product(name: 'Breast Pump Electric',  price: 'Rs.2,499',oldPrice: 'Rs.3,200', badge: '22% Off', badgeColor: kBlue,  imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
  //     Product(name: 'Baby Weighing Scale',   price: 'Rs.1,099',oldPrice: 'Rs.1,499', badge: '27% Off', badgeColor: kGreen, imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
  //   ],
  //   'Testing\nProducts': [
  //     Product(name: 'Blood Testing Device',  price: 'Rs.3,250',oldPrice: 'Rs.4,000', badge: '15% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgBloodTest),
  //     Product(name: 'Glucometer Kit',        price: 'Rs.1,290',oldPrice: 'Rs.1,800', badge: '28% Off', badgeColor: kGreen, imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
  //     Product(name: 'Pulse Oximeter',        price: 'Rs.899',  oldPrice: 'Rs.1,299', badge: '31% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
  //     Product(name: 'BP Monitor Digital',    price: 'Rs.1,799',oldPrice: 'Rs.2,400', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
  //     Product(name: 'Retinascope Full Set',  price: 'Rs.3,250',oldPrice: 'Rs.4,500', badge: '15% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgRetina),
  //     Product(name: 'Urine Test Strips',     price: 'Rs.499',  oldPrice: 'Rs.699',   badge: '29% Off', badgeColor: kGreen, imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: kBlue, imageUrl: _imgGlucometer),
  //   ],
  //   'Equipment &\nHomecare': [
  //     Product(name: 'Oxygen Cylinder & Mask',price: 'Rs.2,199',oldPrice: 'Rs.3,000', badge: '26% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgOxyCyl),
  //     Product(name: 'Walking Stick – Steel', price: 'Rs.1,499',oldPrice: 'Rs.1,999', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgWalkStick),
  //     Product(name: 'Wheel Chair',           price: 'Rs.5,999',oldPrice: 'Rs.7,500', badge: '20% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgWheelchair),
  //     Product(name: 'Leg Massager Pro',      price: 'Rs.2,800',oldPrice: 'Rs.3,500', badge: '20% Off', badgeColor: kGreen, imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgLegMassage),
  //     Product(name: 'Nebulizer Machine',     price: 'Rs.1,850',oldPrice: 'Rs.2,400', badge: '22% Off', badgeColor: kBlue,  imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgNebulizer),
  //     Product(name: 'First Aid Kit – Full',  price: 'Rs.1,499',oldPrice: 'Rs.1,999', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgFirstAid),
  //   ],
  //   'Oral Care': [
  //     Product(name: 'Electric Toothbrush',   price: 'Rs.999',  oldPrice: 'Rs.1,299', badge: '23% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
  //     Product(name: 'Teeth Whitening Kit',   price: 'Rs.799',  oldPrice: 'Rs.1,099', badge: '27% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
  //     Product(name: 'Dental Floss Pack',     price: 'Rs.199',  oldPrice: 'Rs.299',   badge: '33% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
  //     Product(name: 'Mouthwash 500ml',       price: 'Rs.349',  oldPrice: 'Rs.499',   badge: '30% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
  //     Product(name: 'Tongue Cleaner Set',    price: 'Rs.149',  oldPrice: 'Rs.199',   badge: '25% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
  //     Product(name: 'Water Flosser',         price: 'Rs.1,499',oldPrice: 'Rs.1,999', badge: '25% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgGlucometer),
  //   ],
  //   'COVID - 19': [
  //     Product(name: 'N95 Mask Pack 10x',     price: 'Rs.499',  oldPrice: 'Rs.699',   badge: '29% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
  //     Product(name: 'COVID Test Kit',        price: 'Rs.299',  oldPrice: 'Rs.449',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgGlucometer),
  //     Product(name: 'Pulse Oximeter',        price: 'Rs.899',  oldPrice: 'Rs.1,299', badge: '31% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgGlucometer),
  //     Product(name: 'Sanitizer 500ml',       price: 'Rs.199',  oldPrice: 'Rs.299',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
  //     Product(name: 'Face Shield Pack',      price: 'Rs.349',  oldPrice: 'Rs.499',   badge: '30% Off', badgeColor: kBlue,  imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
  //     Product(name: 'Disposable Gloves 50x', price: 'Rs.299',  oldPrice: 'Rs.449',   badge: '33% Off', badgeColor: kGreen, imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
  //   ],
  // };








Map<String, List<Product>> get _all => {
    'Beauty': [
      Product(name: 'Skin Care Kit',        price: 'Rs.899',  oldPrice: 'Rs.1,200', badge: '25% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgSurgical),
      Product(name: 'Hair Care Set',         price: 'Rs.599',  oldPrice: 'Rs.799',   badge: '25% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgDisposable),
      Product(name: 'Face Wash Bundle',      price: 'Rs.450',  oldPrice: 'Rs.600',   badge: '25% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgSurgical),
      Product(name: 'Moisturizer SPF 50',    price: 'Rs.750',  oldPrice: 'Rs.999',   badge: '25% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgDisposable),
      Product(name: 'Vitamin C Serum',       price: 'Rs.1,200',oldPrice: 'Rs.1,500', badge: '20% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgSurgical),
      Product(name: 'Lip Balm Pack',         price: 'Rs.299',  oldPrice: 'Rs.399',   badge: '25% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFFFE0EB), imageIcon: Icons.face_retouching_natural, imageIconColor: const Color(0xFFE91E63), imageUrl: _imgDisposable),
    ],
    'Lifestyle &\nFitness': [
      Product(name: 'Yoga Mat Premium',      price: 'Rs.1,299',oldPrice: 'Rs.1,800', badge: '28% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
      Product(name: 'Resistance Band Set',   price: 'Rs.599',  oldPrice: 'Rs.799',   badge: '25% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
      Product(name: 'Fitness Tracker',       price: 'Rs.2,499',oldPrice: 'Rs.3,200', badge: '22% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgGlucometer),
      Product(name: 'Dumbbell Set 5kg',      price: 'Rs.1,599',oldPrice: 'Rs.2,000', badge: '20% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
      Product(name: 'Skipping Rope',         price: 'Rs.299',  oldPrice: 'Rs.399',   badge: '25% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgLegMassage),
      Product(name: 'Protein Shaker',        price: 'Rs.449',  oldPrice: 'Rs.599',   badge: '25% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFE0F7FA), imageIcon: Icons.fitness_center, imageIconColor: const Color(0xFF00BCD4), imageUrl: _imgGlucometer),
    ],
    'Personal\nCare': [
      Product(name: 'Electric Toothbrush',   price: 'Rs.999',  oldPrice: 'Rs.1,299', badge: '23% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgDisposable),
      Product(name: 'Digital Thermometer',   price: 'Rs.399',  oldPrice: 'Rs.599',   badge: '33% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgGlucometer),
      Product(name: 'Nail Care Kit',         price: 'Rs.349',  oldPrice: 'Rs.499',   badge: '30% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgDisposable),
      Product(name: 'Hair Trimmer',          price: 'Rs.799',  oldPrice: 'Rs.1,099', badge: '27% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgGlucometer),
      Product(name: 'Body Massager',         price: 'Rs.1,199',oldPrice: 'Rs.1,599', badge: '25% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgLegMassage),
      Product(name: 'Sanitizer Pack 5x',     price: 'Rs.249',  oldPrice: 'Rs.349',   badge: '29% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFFFF9C4), imageIcon: Icons.spa, imageIconColor: const Color(0xFFFBC02D), imageUrl: _imgDisposable),
    ],
    'Mother &\nBaby': [
      Product(name: 'Baby Monitor',          price: 'Rs.3,499',oldPrice: 'Rs.4,500', badge: '22% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
      Product(name: 'Baby Thermometer',      price: 'Rs.699',  oldPrice: 'Rs.999',   badge: '30% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
      Product(name: 'Baby Nebulizer',        price: 'Rs.1,299',oldPrice: 'Rs.1,799', badge: '28% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgNebulizer),
      Product(name: 'Maternity Belt',        price: 'Rs.899',  oldPrice: 'Rs.1,199', badge: '25% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgDisposable),
      Product(name: 'Breast Pump Electric',  price: 'Rs.2,499',oldPrice: 'Rs.3,200', badge: '22% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
      Product(name: 'Baby Weighing Scale',   price: 'Rs.1,099',oldPrice: 'Rs.1,499', badge: '27% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFEDE7F6), imageIcon: Icons.child_care, imageIconColor: const Color(0xFF9C27B0), imageUrl: _imgGlucometer),
    ],
    'Testing\nProducts': [
      Product(name: 'Blood Testing Device',  price: 'Rs.3,250',oldPrice: 'Rs.4,000', badge: '15% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: AppColors.kBlue, imageUrl: _imgBloodTest),
      Product(name: 'Glucometer Kit',        price: 'Rs.1,290',oldPrice: 'Rs.1,800', badge: '28% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: AppColors.kBlue, imageUrl: _imgGlucometer),
      Product(name: 'Pulse Oximeter',        price: 'Rs.899',  oldPrice: 'Rs.1,299', badge: '31% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: AppColors.kBlue, imageUrl: _imgGlucometer),
      Product(name: 'BP Monitor Digital',    price: 'Rs.1,799',oldPrice: 'Rs.2,400', badge: '25% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: AppColors.kBlue, imageUrl: _imgGlucometer),
      Product(name: 'Retinascope Full Set',  price: 'Rs.3,250',oldPrice: 'Rs.4,500', badge: '15% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: AppColors.kBlue, imageUrl: _imgRetina),
      Product(name: 'Urine Test Strips',     price: 'Rs.499',  oldPrice: 'Rs.699',   badge: '29% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFE3F2FD), imageIcon: Icons.biotech, imageIconColor: AppColors.kBlue, imageUrl: _imgGlucometer),
    ],
    'Equipment &\nHomecare': [
      Product(name: 'Oxygen Cylinder & Mask',price: 'Rs.2,199',oldPrice: 'Rs.3,000', badge: '26% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgOxyCyl),
      Product(name: 'Walking Stick – Steel', price: 'Rs.1,499',oldPrice: 'Rs.1,999', badge: '25% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgWalkStick),
      Product(name: 'Wheel Chair',           price: 'Rs.5,999',oldPrice: 'Rs.7,500', badge: '20% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgWheelchair),
      Product(name: 'Leg Massager Pro',      price: 'Rs.2,800',oldPrice: 'Rs.3,500', badge: '20% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgLegMassage),
      Product(name: 'Nebulizer Machine',     price: 'Rs.1,850',oldPrice: 'Rs.2,400', badge: '22% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgNebulizer),
      Product(name: 'First Aid Kit – Full',  price: 'Rs.1,499',oldPrice: 'Rs.1,999', badge: '25% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFE8F5E9), imageIcon: Icons.home_repair_service, imageIconColor: const Color(0xFF388E3C), imageUrl: _imgFirstAid),
    ],
    'Oral Care': [
      Product(name: 'Electric Toothbrush',   price: 'Rs.999',  oldPrice: 'Rs.1,299', badge: '23% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
      Product(name: 'Teeth Whitening Kit',   price: 'Rs.799',  oldPrice: 'Rs.1,099', badge: '27% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
      Product(name: 'Dental Floss Pack',     price: 'Rs.199',  oldPrice: 'Rs.299',   badge: '33% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
      Product(name: 'Mouthwash 500ml',       price: 'Rs.349',  oldPrice: 'Rs.499',   badge: '30% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
      Product(name: 'Tongue Cleaner Set',    price: 'Rs.149',  oldPrice: 'Rs.199',   badge: '25% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgDisposable),
      Product(name: 'Water Flosser',         price: 'Rs.1,499',oldPrice: 'Rs.1,999', badge: '25% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFFFE0B2), imageIcon: Icons.local_hospital, imageIconColor: const Color(0xFFE65100), imageUrl: _imgGlucometer),
    ],
    'COVID - 19': [
      Product(name: 'N95 Mask Pack 10x',     price: 'Rs.499',  oldPrice: 'Rs.699',   badge: '29% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
      Product(name: 'COVID Test Kit',        price: 'Rs.299',  oldPrice: 'Rs.449',   badge: '33% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgGlucometer),
      Product(name: 'Pulse Oximeter',        price: 'Rs.899',  oldPrice: 'Rs.1,299', badge: '31% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgGlucometer),
      Product(name: 'Sanitizer 500ml',       price: 'Rs.199',  oldPrice: 'Rs.299',   badge: '33% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
      Product(name: 'Face Shield Pack',      price: 'Rs.349',  oldPrice: 'Rs.499',   badge: '30% Off', badgeColor: AppColors.kBlue,  imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
      Product(name: 'Disposable Gloves 50x', price: 'Rs.299',  oldPrice: 'Rs.449',   badge: '33% Off', badgeColor: AppColors.kGreen, imageBg: const Color(0xFFFFEBEE), imageIcon: Icons.coronavirus, imageIconColor: const Color(0xFFC62828), imageUrl: _imgDisposable),
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
                            mainAxisSpacing: 12, childAspectRatio: 0.75,
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
    decoration: const BoxDecoration(color: AppColors.kBlue,
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
        decoration: BoxDecoration(color: AppColors.kBlueLite, borderRadius: BorderRadius.circular(7)),
        child: const Icon(Icons.sort_rounded, size: 14, color: AppColors.kBlue)),
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
                  color: sel ? AppColors.kBlue : const Color(0xFFF4F6FB),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: sel ? AppColors.kBlue : const Color(0xFFE5E7EB)),
                  boxShadow: sel ? [BoxShadow(color: AppColors.kBlue.withOpacity(0.2), blurRadius: 6, offset: const Offset(0, 2))] : [],
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

  // Widget _productCard(Product p) => GestureDetector(
  //   onTap: () => Navigator.push(context,
  //       MaterialPageRoute(builder: (_) => ProductDetailScreen(product: p))),
  //   child: Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white, borderRadius: BorderRadius.circular(16),
  //       border: Border.all(color: const Color(0xFFEFF1F7), width: 1),
  //       boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 3))],
  //     ),
  //     child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //       Stack(children: [
  //         ClipRRect(
  //           borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
  //           child: Container(
  //             height: 130, width: double.infinity,
  //             color: p.imageBg,
  //             child: p.imageUrl.startsWith('http')
  //                 ? Image.network(p.imageUrl, fit: BoxFit.cover,
  //                     loadingBuilder: (_, child, prog) => prog == null ? child
  //                         : Center(child: SizedBox(width: 20, height: 20,
  //                             child: CircularProgressIndicator(strokeWidth: 2, color: p.imageIconColor))),
  //                     errorBuilder: (_, _, _) => Center(child: Icon(p.imageIcon, size: 50, color: p.imageIconColor)))
  //                 : p.imageUrl.startsWith('assets')
  //                     ? Image.asset(p.imageUrl, fit: BoxFit.cover,
  //                         errorBuilder: (_, _, _) => Center(child: Icon(p.imageIcon, size: 50, color: p.imageIconColor)))
  //                     : Center(child: Icon(p.imageIcon, size: 50, color: p.imageIconColor)),
  //           ),
  //         ),
  //         Positioned(top: 8, left: 8,
  //           child: Container(
  //             padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
  //             decoration: BoxDecoration(color: p.badgeColor, borderRadius: BorderRadius.circular(6)),
  //             child: Text(p.badge, style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700)),
  //           )),
  //         Positioned(top: 8, right: 8,
  //           child: StatefulBuilder(
  //             builder: (_, setL) => GestureDetector(
  //               onTap: () => setL(() => p.liked = !p.liked),
  //               child: Container(
  //                 width: 28, height: 28,
  //                 decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle,
  //                     boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.10), blurRadius: 5)]),
  //                 child: Icon(p.liked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
  //                     size: 14, color: p.liked ? Colors.red : const Color(0xFFD1D5DB)),
  //               ),
  //             ),
  //           )),
  //       ]),
  //       Padding(
  //         padding: const EdgeInsets.fromLTRB(10, 9, 10, 10),
  //         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //           Text(p.name, maxLines: 2, overflow: TextOverflow.ellipsis,
  //               style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF111827), height: 1.3)),
  //           const SizedBox(height: 5),
  //           Row(children: [
  //             ...List.generate(4, (_) => const Icon(Icons.star_rounded, size: 11, color: Color(0xFFF59E0B))),
  //             const Icon(Icons.star_half_rounded, size: 11, color: Color(0xFFF59E0B)),
  //             const SizedBox(width: 4),
  //             const Text('4.2', style: TextStyle(fontSize: 10, color: Color(0xFF6B7280))),
  //           ]),
  //           const SizedBox(height: 7),
  //           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //             Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //               Text(p.price, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: Color(0xFF111827))),
  //               Text(p.oldPrice, style: const TextStyle(fontSize: 10, color: Color(0xFF9CA3AF), decoration: TextDecoration.lineThrough)),
  //             ]),
  //             Container(
  //               width: 30, height: 30,
  //               decoration: BoxDecoration(color: AppColors.kGreen, borderRadius: BorderRadius.circular(9),
  //                   boxShadow: [BoxShadow(color: AppColors.kGreen.withOpacity(0.3), blurRadius: 6, offset: const Offset(0, 2))]),
  //               child: const Icon(Icons.add_rounded, color: Colors.white, size: 18)),
  //           ]),
  //         ]),
  //       ),
  //     ]),
  //   ),
  // );















Widget _productCard(Product p) => GestureDetector(
  onTap: () => Navigator.push(context,
      MaterialPageRoute(builder: (_) => ProductDetailScreen(product: p))),
  child: Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, 3))],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: SizedBox(
            height: 130, width: double.infinity,
            child: p.imageUrl.startsWith('http')
                ? Image.network(p.imageUrl, fit: BoxFit.cover,
                    loadingBuilder: (_, child, prog) => prog == null ? child
                        : Container(color: p.imageBg,
                            child: Center(child: SizedBox(width: 20, height: 20,
                                child: CircularProgressIndicator(strokeWidth: 2, color: p.imageIconColor)))),
                    errorBuilder: (_, _, _) => Container(color: p.imageBg,
                        child: Center(child: Icon(p.imageIcon, size: 50, color: p.imageIconColor))))
                : p.imageUrl.startsWith('assets')
                    ? Image.asset(p.imageUrl, fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => Container(color: p.imageBg,
                            child: Center(child: Icon(p.imageIcon, size: 50, color: p.imageIconColor))))
                    : Container(color: p.imageBg,
                        child: Center(child: Icon(p.imageIcon, size: 50, color: p.imageIconColor))),
          ),
        ),
        // Info
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(p.name, maxLines: 2, overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700,
                      color: Color(0xFF111827), height: 1.3)),
              const SizedBox(height: 6),
              Text(p.price,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w900,
                      color: Colors.black)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(p.oldPrice,
                      style: const TextStyle(fontSize: 10, color: AppColors.kGrey,
                          decoration: TextDecoration.lineThrough)),
                  Row(children: const [
                    Icon(Icons.star_rounded, color: Color(0xFFF59E0B), size: 13),
                    SizedBox(width: 2),
                    Text('4.2', style: TextStyle(fontSize: 10,
                        fontWeight: FontWeight.w600, color: AppColors.kGrey)),
                  ]),
                ],
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                    color: p.badgeColor, borderRadius: BorderRadius.circular(6)),
                child: Text(p.badge,
                    style: const TextStyle(color: Colors.white, fontSize: 9,
                        fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ),
      ],
    ),
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
                decoration: BoxDecoration(color: AppColors.kBlue, borderRadius: BorderRadius.circular(4))),
            const SizedBox(width: 8),
            const Text('Why shop on VeeSafe?',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Color(0xFF111827))),
          ]),
          const SizedBox(height: 14),
          Row(children: [
            _trustBadge(Icons.verified_rounded,      '100%\nGenuine',  const Color(0xFF059669), const Color(0xFFEBF9EE)),
            const SizedBox(width: 10),
            _trustBadge(Icons.local_shipping_rounded, 'Fast\nDelivery', AppColors.kBlue,AppColors.kBlueLite),
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
        decoration: BoxDecoration(color: AppColors.kBlue, borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: AppColors.kBlue.withOpacity(0.25), blurRadius: 12, offset: const Offset(0, 4))]),
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
            child: const Text('Chat', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: AppColors.kBlue))),
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
          decoration: const BoxDecoration(color: AppColors.kBlueLite, shape: BoxShape.circle),
          child: Icon(widget.categoryIcon, color: AppColors.kBlue, size: 40)),
      const SizedBox(height: 18),
      const Text('No products found',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Color(0xFF111827))),
      const SizedBox(height: 6),
      const Text('Check back soon for new arrivals!',
          style: TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
    ]),
  );
}