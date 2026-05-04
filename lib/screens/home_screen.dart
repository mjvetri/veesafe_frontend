// lib/screens/home_screen.dart
import 'dart:io' as dart_io;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veesafe/screens/messages_screen.dart';
import 'package:veesafe/screens/your_orders_screen.dart';
import '../constants/app_colors.dart';
import '../models/product_model.dart';
import '../widgets/banner_widget.dart';
import '../widgets/product_row.dart';
import 'category_screen.dart';
import 'menu_screen.dart';
import 'edit_profile_screen.dart';
import 'category_products_screen.dart';
import 'notification_screen.dart';
import 'search_screen.dart';
import 'orders/orders_page.dart';
import 'your_orders_screen.dart';
import 'cart_screen.dart';
import 'message_store.dart';
import 'notification_screen.dart';
import 'product_detail_screen.dart';
import 'healthcare/healthcare_screen.dart';

const _imgBloodTest = 'assets/images/blood machine.jpg';
const _imgSurgical =
    'https://images.unsplash.com/photo-1584432810601-6c7f27d2362b?w=300&h=300&fit=crop';
const _imgRetina =
    'https://images.unsplash.com/photo-1576671081837-49000212a370?w=300&h=300&fit=crop';
const _imgFirstAid = 'assets/images/first aid kit.jpg';
const _imgOxyCyl = 'assets/images/Oxygen Medic Kit .jpg';
const _imgDisposable = 'assets/images/Disposable.jpg';
const _imgWalkStick = 'assets/images/Walking Stick.jpg';
const _imgWheelchair =
    'https://images.unsplash.com/photo-1573812461383-e5f8b759d12e?w=300&h=300&fit=crop';
const _imgLegMassage =
    'https://images.unsplash.com/photo-1519823551278-64ac92734fb1?w=300&h=300&fit=crop';
const _imgNebulizer =
    'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=300&h=300&fit=crop';
const _imgVapoRub =
    'https://images.unsplash.com/photo-1550572017-edd951b55104?w=300&h=300&fit=crop';
const _imgImmunity =
    'https://images.unsplash.com/photo-1512069772995-ec65ed45afd6?w=300&h=300&fit=crop';
const _imgOximeterE =
    'https://images.unsplash.com/photo-1559757175-5700dde675bc?w=300&h=300&fit=crop';
const _imgGlucometer =
    'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=300&h=300&fit=crop';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> trending = [
    Product(
      name: 'Blood Testing Device',
      price: 'Rs.3,250.00',
      oldPrice: 'Rs.4,000.00',
      badge: '15% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.bloodtype,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgBloodTest,
    ),
    Product(
      name: 'Surgical Dress Combo',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.2,000.00',
      badge: '25% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.dry_cleaning,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgSurgical,
    ),
    Product(
      name: 'Retinascope Full Set',
      price: 'Rs.3,250.00',
      oldPrice: 'Rs.4,500.00',
      badge: '15% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.remove_red_eye,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgRetina,
    ),
    Product(
      name: 'First Aid Kit – Full',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.1,999.00',
      badge: '25% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.medical_services,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgFirstAid,
    ),
    Product(
      name: 'Oxygen Cylinder & Mask',
      price: 'Rs.2,199.00',
      oldPrice: 'Rs.3,000.00',
      badge: '26% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.air,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgOxyCyl,
    ),
    Product(
      name: 'Wheel Chair Premium',
      price: 'Rs.5,999.00',
      oldPrice: 'Rs.7,500.00',
      badge: '20% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.wheelchair_pickup,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgWheelchair,
    ),
    Product(
      name: 'Leg Massager Pro',
      price: 'Rs.2,800.00',
      oldPrice: 'Rs.3,500.00',
      badge: '20% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.self_improvement,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgLegMassage,
    ),
    Product(
      name: 'Glucometer Kit',
      price: 'Rs.1,290.00',
      oldPrice: 'Rs.1,800.00',
      badge: '28% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.monitor_heart,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgGlucometer,
    ),
  ];
  final List<Product> recentlyViewed = [
    Product(
      name: 'First Aid Kit – Full Set',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.1,999.00',
      badge: '25% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.medical_services,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgFirstAid,
    ),
    Product(
      name: 'Oxygen Cylinder & Mask',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.1,999.00',
      badge: '40% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.air,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgOxyCyl,
    ),
    Product(
      name: 'Disposable Gloves Pack',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.1,999.00',
      badge: '15% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.back_hand,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgDisposable,
    ),
    Product(
      name: 'Blood Testing Device',
      price: 'Rs.3,250.00',
      oldPrice: 'Rs.4,000.00',
      badge: '15% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.bloodtype,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgBloodTest,
    ),
    Product(
      name: 'Walking Stick – Steel',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.1,999.00',
      badge: '25% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.accessibility_new,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgWalkStick,
    ),
    Product(
      name: 'Retinascope Full Set',
      price: 'Rs.3,250.00',
      oldPrice: 'Rs.4,500.00',
      badge: '15% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.remove_red_eye,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgRetina,
    ),
    Product(
      name: 'Nebulizer Machine',
      price: 'Rs.1,850.00',
      oldPrice: 'Rs.2,400.00',
      badge: '22% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.masks,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgNebulizer,
    ),
    Product(
      name: 'Glucometer Kit',
      price: 'Rs.1,290.00',
      oldPrice: 'Rs.1,800.00',
      badge: '28% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.monitor_heart,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgGlucometer,
    ),
  ];
  final List<Product> recentlyLiked = [
    Product(
      name: 'Walking Stick – Steel',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.1,999.00',
      badge: '25% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.accessibility_new,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgWalkStick,
      liked: true,
    ),
    Product(
      name: 'Wheel Chair',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.1,999.00',
      badge: '30% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.wheelchair_pickup,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgWheelchair,
      liked: true,
    ),
    Product(
      name: 'Leg Massager',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.1,999.00',
      badge: '25% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.self_improvement,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgLegMassage,
    ),
    Product(
      name: 'Retinascope Full Set',
      price: 'Rs.3,250.00',
      oldPrice: 'Rs.4,500.00',
      badge: '15% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.remove_red_eye,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgRetina,
      liked: true,
    ),
    Product(
      name: 'First Aid Kit',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.1,999.00',
      badge: '25% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.medical_services,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgFirstAid,
      liked: true,
    ),
    Product(
      name: 'Oxygen Cylinder',
      price: 'Rs.2,199.00',
      oldPrice: 'Rs.3,000.00',
      badge: '26% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.air,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgOxyCyl,
      liked: true,
    ),
    Product(
      name: 'Nebulizer Machine',
      price: 'Rs.1,850.00',
      oldPrice: 'Rs.2,400.00',
      badge: '22% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.masks,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgNebulizer,
    ),
    Product(
      name: 'Disposable Gloves',
      price: 'Rs.499.00',
      oldPrice: 'Rs.799.00',
      badge: '37% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.back_hand,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgDisposable,
    ),
  ];
  final List<Product> newArrivals = [
    Product(
      name: 'Retinascope Full Set',
      price: 'Rs.3,250.00',
      oldPrice: 'Rs.4,000.00',
      badge: '15% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.remove_red_eye,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgRetina,
      liked: true,
    ),
    Product(
      name: 'Surgical Dress Combo',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.2,000.00',
      badge: '25% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.dry_cleaning,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgSurgical,
    ),
    Product(
      name: 'Blood Test',
      price: 'Rs.1,290.00',
      oldPrice: 'Rs.1,800.00',
      badge: '30% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.bloodtype,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgBloodTest,
    ),
    Product(
      name: 'Nebulizer Machine',
      price: 'Rs.1,850.00',
      oldPrice: 'Rs.2,400.00',
      badge: '22% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.masks,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgNebulizer,
    ),
    Product(
      name: 'Leg Massager Pro',
      price: 'Rs.2,800.00',
      oldPrice: 'Rs.3,500.00',
      badge: '20% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.self_improvement,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgLegMassage,
    ),
    Product(
      name: 'Oxygen Cylinder',
      price: 'Rs.2,199.00',
      oldPrice: 'Rs.3,000.00',
      badge: '26% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.air,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgOxyCyl,
    ),
    Product(
      name: 'Disposable Gloves',
      price: 'Rs.499.00',
      oldPrice: 'Rs.799.00',
      badge: '37% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.back_hand,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgDisposable,
    ),
    Product(
      name: 'Glucometer Kit',
      price: 'Rs.1,290.00',
      oldPrice: 'Rs.1,800.00',
      badge: '28% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.monitor_heart,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgGlucometer,
    ),
  ];
  final List<Product> hotDeals = [
    Product(
      name: 'Retinascope Full Set',
      price: 'Rs.3,250.00',
      oldPrice: 'Rs.4,000.00',
      badge: '15% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.remove_red_eye,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgRetina,
      liked: true,
    ),
    Product(
      name: 'Surgical Dress Combo',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.2,000.00',
      badge: '25% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.dry_cleaning,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgSurgical,
    ),
    Product(
      name: 'Blood Test',
      price: 'Rs.1,290.00',
      oldPrice: 'Rs.1,800.00',
      badge: '30% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.bloodtype,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgBloodTest,
    ),
    Product(
      name: 'First Aid Kit',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.1,999.00',
      badge: '25% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.medical_services,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgFirstAid,
    ),
    Product(
      name: 'Wheel Chair',
      price: 'Rs.5,999.00',
      oldPrice: 'Rs.7,500.00',
      badge: '20% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.wheelchair_pickup,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgWheelchair,
    ),
    Product(
      name: 'Walking Stick – Steel',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.1,999.00',
      badge: '25% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.accessibility_new,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgWalkStick,
    ),
    Product(
      name: 'Oxygen Cylinder',
      price: 'Rs.2,199.00',
      oldPrice: 'Rs.3,000.00',
      badge: '26% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.air,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgOxyCyl,
    ),
    Product(
      name: 'Glucometer Kit',
      price: 'Rs.1,290.00',
      oldPrice: 'Rs.1,800.00',
      badge: '28% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.monitor_heart,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgGlucometer,
    ),
  ];
  final List<Product> recentlyViewed2 = [
    Product(
      name: 'First Aid Kit – Full Set',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.1,999.00',
      badge: '35% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.medical_services,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgFirstAid,
      liked: true,
    ),
    Product(
      name: 'Oxygen Cylinder & Mask',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.1,999.00',
      badge: '40% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.air,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgOxyCyl,
    ),
    Product(
      name: 'Disposable Gloves Pack',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.1,999.00',
      badge: '15% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.back_hand,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgDisposable,
    ),
    Product(
      name: 'Blood Testing Device',
      price: 'Rs.3,250.00',
      oldPrice: 'Rs.4,000.00',
      badge: '15% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.bloodtype,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgBloodTest,
    ),
    Product(
      name: 'Nebulizer Machine',
      price: 'Rs.1,850.00',
      oldPrice: 'Rs.2,400.00',
      badge: '22% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.masks,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgNebulizer,
      liked: true,
    ),
    Product(
      name: 'Leg Massager Pro',
      price: 'Rs.2,800.00',
      oldPrice: 'Rs.3,500.00',
      badge: '20% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.self_improvement,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgLegMassage,
    ),
    Product(
      name: 'Surgical Dress Combo',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.2,000.00',
      badge: '25% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.dry_cleaning,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgSurgical,
    ),
    Product(
      name: 'Glucometer Kit',
      price: 'Rs.1,290.00',
      oldPrice: 'Rs.1,800.00',
      badge: '28% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.monitor_heart,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgGlucometer,
    ),
  ];
  final List<Product> oldAge = [
    Product(
      name: 'Walking Stick – Steel',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.1,999.00',
      badge: '25% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.accessibility_new,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgWalkStick,
    ),
    Product(
      name: 'Wheel Chair',
      price: 'Rs.5,999.00',
      oldPrice: 'Rs.7,500.00',
      badge: '30% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.wheelchair_pickup,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgWheelchair,
      liked: true,
    ),
    Product(
      name: 'Leg Massager',
      price: 'Rs.2,800.00',
      oldPrice: 'Rs.3,500.00',
      badge: '25% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.self_improvement,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgLegMassage,
    ),
    Product(
      name: 'Oxygen Cylinder',
      price: 'Rs.2,199.00',
      oldPrice: 'Rs.3,000.00',
      badge: '26% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.air,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgOxyCyl,
    ),
    Product(
      name: 'First Aid Kit',
      price: 'Rs.1,499.00',
      oldPrice: 'Rs.1,999.00',
      badge: '25% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.medical_services,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgFirstAid,
    ),
    Product(
      name: 'Nebulizer Machine',
      price: 'Rs.1,850.00',
      oldPrice: 'Rs.2,400.00',
      badge: '22% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.masks,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgNebulizer,
    ),
    Product(
      name: 'Blood Testing Device',
      price: 'Rs.3,250.00',
      oldPrice: 'Rs.4,000.00',
      badge: '15% Off',
      badgeColor: AppColors.kBlue,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.bloodtype,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgBloodTest,
    ),
    Product(
      name: 'Disposable Gloves',
      price: 'Rs.499.00',
      oldPrice: 'Rs.799.00',
      badge: '37% Off',
      badgeColor: AppColors.kGreen,
      imageBg: Color(0xFFF5F6FA),
      imageIcon: Icons.back_hand,
      imageIconColor: AppColors.kBlue,
      imageUrl: _imgDisposable,
    ),
  ];
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Beauty',
      'icon': Icons.face_retouching_natural,
      'bg': Color(0xFFFFE0EB),
      'color': Color(0xFFE91E63),
    },
    {
      'name': 'Lifestyle &\nFitness',
      'icon': Icons.fitness_center,
      'bg': Color(0xFFE0F7FA),
      'color': Color(0xFF00BCD4),
    },
    {
      'name': 'Personal\nCare',
      'icon': Icons.spa,
      'bg': Color(0xFFFFF9C4),
      'color': Color(0xFFFBC02D),
    },
    {
      'name': 'Mother &\nBaby',
      'icon': Icons.child_care,
      'bg': Color(0xFFEDE7F6),
      'color': Color(0xFF9C27B0),
    },
    {
      'name': 'Testing\nProducts',
      'icon': Icons.biotech,
      'bg': Color(0xFFE3F2FD),
      'color': AppColors.kBlue,
    },
    {
      'name': 'Equipment &\nHomecare',
      'icon': Icons.home_repair_service,
      'bg': Color(0xFFE8F5E9),
      'color': Color(0xFF388E3C),
    },
    {
      'name': 'Oral Care',
      'icon': Icons.local_hospital,
      'bg': Color(0xFFFFE0B2),
      'color': Color(0xFFE65100),
    },
    {
      'name': 'COVID - 19',
      'icon': Icons.coronavirus,
      'bg': Color(0xFFFFEBEE),
      'color': Color(0xFFC62828),
    },
  ];
  final List<Map<String, dynamic>> essentials = [
    {
      'name': 'Nebulizer &\nVapourizer',
      'img': _imgNebulizer,
      'bg': Color(0xFFE0F2FE),
    },
    {'name': 'Fever & Cold', 'img': _imgVapoRub, 'bg': Color(0xFFFEF9C3)},
    {'name': 'Immunity\nBooster', 'img': _imgImmunity, 'bg': Color(0xFFDCFCE7)},
    {
      'name': 'Oximeters\n& More',
      'img': _imgOximeterE,
      'bg': Color(0xFFFFE4E6),
    },
  ];
  final List<Map<String, dynamic>> brands = [
    {'name': 'VetTab', 'icon': Icons.pets, 'color': Color(0xFF7C3AED)},
    {'name': 'LifeOnic', 'icon': Icons.favorite, 'color': Color(0xFF0EA5E9)},
    {'name': 'riboxx', 'icon': Icons.science, 'color': Color(0xFF059669)},
    {'name': 'VetTab', 'icon': Icons.pets, 'color': Color(0xFF7C3AED)},
  ];
  final List<Map<String, dynamic>> pendingOrders = [
    {
      'name':
          'Dr Trust USA Gold Standard Glucometer Sugar Check Testing Machine...',
      'price': '\$2,604.00',
      'qty': 2,
    },
    {
      'name':
          'Dr Trust USA Gold Standard Glucometer Sugar Check Testing Machine...',
      'price': '\$2,604.00',
      'qty': 2,
    },
    {
      'name':
          'Dr Trust USA Gold Standard Glucometer Sugar Check Testing Machine...',
      'price': '\$2,604.00',
      'qty': 1,
    },
    {
      'name':
          'Dr Trust USA Gold Standard Glucometer Sugar Check Testing Machine...',
      'price': '\$2,604.00',
      'qty': 1,
    },
  ];

  int _navIdx = 0;
  String _searchQuery = '';
  final List<Product> _actuallyViewedProducts = [];

  void _trackView(Product p) {
    if (!_actuallyViewedProducts.any((e) => e.name == p.name)) {
      setState(() => _actuallyViewedProducts.insert(0, p));
    }
  }

  // ════════════════════════════════════════
  //  LOGOUT
  // ════════════════════════════════════════
  Future<void> _handleLogout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    if (context.mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    }
  }

  // ════════════════════════════════════════
  //  BUILD — Scaffold with floating nav
  // ════════════════════════════════════════
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: _navIdx == 0
                ? _homePage()
                : _navIdx == 1
                ? const YourOrdersScreen()
                : _navIdx == 2
                ? const MessagesScreen()
                : const CartScreen(),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: _floatingBottomNav(),
          ),
        ],
      ),
    );
  }

  // ════════════════════════════════════════
  //  FLOATING BOTTOM NAV
  // ════════════════════════════════════════
  void _showPlusSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Create & Explore',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1A1A2E),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'What would you like to do today?',
              style: TextStyle(fontSize: 13, color: Color(0xFF888888)),
            ),
            const SizedBox(height: 24),
            // Watch Shorts
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const _ShortsScreen()),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.kBlue, Color(0xFF1A73E8)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.kBlue.withOpacity(0.35),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.play_circle_filled_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Watch Shorts',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Explore medical tips & product demos',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white70,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Upload a Short
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 300), () {
                  if (mounted) _showShortsUploadSheet();
                });
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F4FF),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.kBlue.withOpacity(0.25)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.kBlueLite,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.video_call_rounded,
                        color: AppColors.kBlue,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Upload a Short',
                            style: TextStyle(
                              color: Color(0xFF1A1A2E),
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'Share your medical tips with everyone',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.kBlue.withOpacity(0.5),
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _showShortsUploadSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1A1A2E),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Upload Your Short',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Share medical tips or product demos',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.white54),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.pop(context);
                      final picker = ImagePicker();
                      final XFile? video = await picker.pickVideo(
                        source: ImageSource.camera,
                      );
                      if (video == null) return;
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('✅ Video uploaded successfully!'),
                          backgroundColor: const Color(0xFF16A34A),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.kBlue, Color(0xFF1A73E8)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.kBlue.withOpacity(0.4),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.videocam_rounded,
                            color: Colors.white,
                            size: 34,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Record',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Use camera',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.pop(context);
                      final picker = ImagePicker();
                      final XFile? video = await picker.pickVideo(
                        source: ImageSource.gallery,
                      );
                      if (video == null) return;
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('✅ Video uploaded successfully!'),
                          backgroundColor: const Color(0xFF16A34A),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A3E),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.kBlue.withOpacity(0.4),
                        ),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.upload_rounded,
                            color: AppColors.kBlue,
                            size: 34,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Upload',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'From gallery',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _floatingBottomNav() {
    final navItems = [
      {
        'idx': 0,
        'icon': Icons.home_outlined,
        'activeIcon': Icons.home_rounded,
        'label': 'Home',
      },
      {
        'idx': 1,
        'icon': Icons.receipt_long_outlined,
        'activeIcon': Icons.receipt_long_rounded,
        'label': 'Orders',
      },
      {
        'idx': 2,
        'icon': Icons.chat_bubble_outline_rounded,
        'activeIcon': Icons.chat_bubble_rounded,
        'label': 'Messages',
      },
      {
        'idx': 3,
        'icon': Icons.shopping_cart_outlined,
        'activeIcon': Icons.shopping_cart_rounded,
        'label': 'Cart',
      },
    ];

    final leftItems = navItems.sublist(0, 2);
    final rightItems = navItems.sublist(2, 4);

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(36),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.13),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
              BoxShadow(
                color: AppColors.kBlue.withOpacity(0.07),
                blurRadius: 12,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(36),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...leftItems.map((item) => _navTabItem(item)),
                const SizedBox(width: 56),
                ...rightItems.map((item) => _navTabItem(item)),
              ],
            ),
          ),
        ),
        Positioned(
          top: -20,
          child: GestureDetector(
            onTap: _showPlusSheet,
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.kBlue,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kBlue.withOpacity(0.45),
                    blurRadius: 16,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _navTabItem(Map<String, Object> item) {
    final idx = item['idx'] as int;
    final isActive = _navIdx == idx;
    final icon = item['icon'] as IconData;
    final activeIcon = item['activeIcon'] as IconData;
    final label = item['label'] as String;

    return GestureDetector(
      onTap: () => setState(() => _navIdx = idx),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 68,
        height: 68,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 6),
            isActive
                ? Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.kBlue,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.5),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.kBlue.withOpacity(0.35),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(activeIcon, color: Colors.white, size: 22),
                  )
                : Icon(icon, size: 26, color: const Color(0xFF5A5A5A)),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.5,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                color: isActive ? AppColors.kBlue : const Color(0xFF5A5A5A),
              ),
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }

  // ════════════════════════════════════════
  //  HOME PAGE CONTENT
  // ════════════════════════════════════════
  Widget _homePage() => SafeArea(
    left: false,
    right: false,
    child: Column(
      children: [
        _appBar(),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _searchBar(),
                if (_searchQuery.isNotEmpty) ...[
                  _inlineSearchResults(_searchQuery),
                ] else ...[
                  _storiesRow(),
                  _quickButtons(),
                  _title('Today Offers'),
                  const HeroBanner(bgColor: Color(0xFFFCE4EC)),
                  _popularCategories(),
                  const HeroBanner(bgColor: Color(0xFFEDE7F6)),
                  ProductRow(title: 'Trending Offers', products: trending),
                  const HeroBanner(bgColor: Color(0xFFE8EAF6)),
                  ProductRow(
                    title: 'Recently Viewed Products',
                    products: recentlyViewed,
                  ),
                  ProductRow(title: 'Recently Liked', products: recentlyLiked),
                  const HeroBanner(bgColor: Color(0xFFFCE4EC)),
                  ProductRow(title: 'New Arrivals', products: newArrivals),
                  ProductRow(
                    title: 'Hot Deals',
                    products: hotDeals,
                    insideBlueBox: true,
                  ),
                  _topBrands(),
                  ProductRow(
                    title: 'Recently Viewed Products',
                    products: recentlyViewed2,
                  ),
                  ProductRow(title: 'Old Age Needed', products: oldAge),
                  _homeHealthcareSection(),
                  _essentialNeeds(),
                  const HeroBanner(bgColor: Color(0xFFEDE7F6)),
                  _pendingOrders(),

                  _footer(),
                  const SizedBox(height: 8),
                ],
              ],
            ),
          ),
        ),
      ],
    ),
  );

  // ════════════════════════════════════════
  //  APP BAR
  // ════════════════════════════════════════
  Widget _appBar() => Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    padding: const EdgeInsets.fromLTRB(14, 10, 12, 10),
    child: Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const EditProfileScreen()),
          ),
          child: Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.kBlue, width: 2),
              color: AppColors.kBlueLite,
              boxShadow: [
                BoxShadow(
                  color: AppColors.kBlue.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(Icons.person, color: AppColors.kBlue, size: 22),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Vee',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        color: AppColors.kBlack,
                      ),
                    ),
                    TextSpan(
                      text: 'safe',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        color: AppColors.kBlue,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: const [
                  Icon(
                    Icons.location_on_rounded,
                    size: 11,
                    color: AppColors.kBlue,
                  ),
                  SizedBox(width: 2),
                  Text(
                    'Chennai - 600042',
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.kGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        _iconBtn(
          Icons.menu_rounded,
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const MenuScreen()),
          ),
        ),
        _iconBtn(Icons.logout_rounded, () => _handleLogout(context)),
        Stack(
          clipBehavior: Clip.none,
          children: [
            _iconBtn(
              Icons.notifications_outlined,
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationScreen()),
              ).then((_) => setState(() {})),
            ),
            Positioned(
              right: 4,
              top: 4,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.2),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _iconBtn(IconData icon, VoidCallback onTap) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: 36,
      height: 36,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: const Color(0xFF2D2D2D), size: 20),
    ),
  );

  // ════════════════════════════════════════
  //  SEARCH BAR
  // ════════════════════════════════════════
  final TextEditingController _searchController = TextEditingController();

  void _onSearch() {
    setState(() => _searchQuery = _searchController.text.trim());
  }

  Future<void> _openGoogleLens() async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4285F4), Color(0xFF1A73E8)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF4285F4).withOpacity(0.4),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(14),
                    child: CustomPaint(painter: _GoogleLensPainter()),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Search by Image',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Take a photo or pick from gallery',
                    style: TextStyle(fontSize: 12, color: Color(0xFF888888)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () async {
                Navigator.pop(context);
                await _pickImageAndOpenLens(ImageSource.camera);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 18,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4285F4), Color(0xFF1A73E8)],
                  ),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF4285F4).withOpacity(0.35),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                      size: 26,
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Open Camera',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Take a photo to search',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white70,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () async {
                Navigator.pop(context);
                await _pickImageAndOpenLens(ImageSource.gallery);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 18,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F7FA),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color(0xFF4285F4).withOpacity(0.25),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.photo_library_rounded,
                      color: Color(0xFF4285F4),
                      size: 26,
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Choose from Gallery',
                            style: TextStyle(
                              color: Color(0xFF1A1A2E),
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Pick an existing photo to search',
                            style: TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color(0xFF4285F4),
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImageAndOpenLens(ImageSource source) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: source,
      imageQuality: 90,
    );
    if (image == null) return;
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _LensResultScreen(imagePath: image.path),
      ),
    );
  }

  List<Product> get _allProducts {
    final seen = <String>{};
    final all = [
      ...trending,
      ...recentlyViewed,
      ...newArrivals,
      ...hotDeals,
      ...oldAge,
      ...recentlyLiked,
      ...recentlyViewed2,
    ];
    return all.where((p) => seen.add(p.name)).toList();
  }

  Widget _inlineSearchResults(String query) {
    final results = _allProducts
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toSet()
        .toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${results.length} result${results.length == 1 ? '' : 's'} for "$query"',
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.kGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _searchController.clear();
                  setState(() => _searchQuery = '');
                },
                child: const Text(
                  'Clear',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.kBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          results.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.search_off_rounded,
                          size: 56,
                          color: AppColors.kBorderGrey,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'No results for "$query"',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.kBlack,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Try a different keyword',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.kGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: results.length,
                  itemBuilder: (_, i) {
                    final p = results[i];
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_) => _trackView(p),
                    );
                    return GestureDetector(
                      // CORRECT CODE:
                      onTap: () {
                        _trackView(p);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(product: p),
                          ),
                        );
                      },

                      // child: Container(
                      //                         decoration: BoxDecoration(
                      //                           color: Colors.white,
                      //                           borderRadius: BorderRadius.circular(14),
                      //                           boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8, offset: const Offset(0, 2))],
                      //                         ),
                      //                         child: Column(
                      //                           crossAxisAlignment: CrossAxisAlignment.start,
                      //                           children: [
                      //                             Stack(
                      //                               children: [
                      //                                 ClipRRect(
                      //                                   borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                      //                                   child: SizedBox(
                      //                                     height: 120, width: double.infinity,
                      //                                     child: p.imageUrl.startsWith('http')
                      //                                         ? Image.network(p.imageUrl, fit: BoxFit.cover, errorBuilder: (_, _, _) => Container(color: p.imageBg, child: Icon(p.imageIcon, color: p.imageIconColor, size: 38)))
                      //                                         : Image.asset(p.imageUrl, fit: BoxFit.cover, errorBuilder: (_, _, _) => Container(color: p.imageBg, child: Icon(p.imageIcon, color: p.imageIconColor, size: 38))),
                      //                                   ),
                      //                                 ),
                      //                                 Positioned(
                      //                                   top: 8, left: 8,
                      //                                   child: Container(
                      //                                     padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                      //                                     decoration: BoxDecoration(color: p.badgeColor, borderRadius: BorderRadius.circular(6)),
                      //                                     child: Text(p.badge, style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w700)),
                      //                                   ),
                      //                                 ),
                      //                               ],
                      //                             ),
                      //                             Padding(padding: const EdgeInsets.fromLTRB(10, 8, 10, 2),
                      //                                 child: Text(p.name, maxLines: 2, overflow: TextOverflow.ellipsis,
                      //                                     style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.kBlack, height: 1.3))),
                      //                             Padding(
                      //                               padding: const EdgeInsets.fromLTRB(10, 2, 10, 0),
                      //                               child: Row(children: [
                      //                                 Text(p.price, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: AppColors.kBlue)),
                      //                                 const SizedBox(width: 5),
                      //                                 Text(p.oldPrice, style: const TextStyle(fontSize: 10, color: AppColors.kGrey, decoration: TextDecoration.lineThrough)),
                      //                               ]),
                      //                             ),
                      //                             const Spacer(),
                      //                             Padding(
                      //                               padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      //                               child: Container(
                      //                                 width: double.infinity, height: 30,
                      //                                 decoration: BoxDecoration(color: AppColors.kBlue, borderRadius: BorderRadius.circular(8)),
                      //                                 child: const Center(child: Text('Add to Cart', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700))),
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.07),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image — takes top 65% of card
                            Expanded(
                              flex: 65,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: p.imageUrl.startsWith('http')
                                      ? Image.network(
                                          p.imageUrl,
                                          fit: BoxFit.cover,
                                          errorBuilder: (_, _, _) => Container(
                                            color: p.imageBg,
                                            child: Icon(
                                              p.imageIcon,
                                              color: p.imageIconColor,
                                              size: 38,
                                            ),
                                          ),
                                        )
                                      : Image.asset(
                                          p.imageUrl,
                                          fit: BoxFit.cover,
                                          errorBuilder: (_, _, _) => Container(
                                            color: p.imageBg,
                                            child: Icon(
                                              p.imageIcon,
                                              color: p.imageIconColor,
                                              size: 38,
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            // Info section
                            Expanded(
                              flex: 35,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  10,
                                  8,
                                  10,
                                  10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      p.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.kBlack,
                                        height: 1.3,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          p.price,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w900,
                                            color: AppColors.kBlack,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              p.oldPrice,
                                              style: const TextStyle(
                                                fontSize: 10,
                                                color: AppColors.kGrey,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                            // Star rating
                                            Row(
                                              children: const [
                                                Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFFF59E0B),
                                                  size: 13,
                                                ),
                                                SizedBox(width: 2),
                                                Text(
                                                  '4.1',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.kGrey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        // Badge pill at bottom
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 3,
                                          ),
                                          decoration: BoxDecoration(
                                            color: p.badgeColor,
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          child: Text(
                                            p.badge,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 9,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }

  Widget _searchBar() => Padding(
    padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: const Color(0xFFE8ECF4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          const Icon(Icons.search, color: AppColors.kGrey, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _searchController,
              onSubmitted: (_) => _onSearch(),
              onChanged: (val) => setState(() => _searchQuery = val.trim()),
              style: const TextStyle(fontSize: 13, color: AppColors.kBlack),
              decoration: const InputDecoration(
                hintText: 'Search your favourite product',
                hintStyle: TextStyle(color: Color(0xFFAAAAAA), fontSize: 13),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          Container(width: 1, height: 24, color: const Color(0xFFE8ECF4)),
          GestureDetector(
            onTap: _openGoogleLens,
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(25),
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: CustomPaint(painter: _GoogleLensPainter()),
            ),
          ),
          GestureDetector(
            onTap: _onSearch,
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: AppColors.kBlue,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kBlue.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
    ),
  );

  // ════════════════════════════════════════
  //  QUICK BUTTONS
  // ════════════════════════════════════════
  Widget _quickButtons() => Padding(
    padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
    child: Row(
      children: [
        Expanded(
          child: _quickBtn(
            Icons.assignment_outlined,
            'Bulk Enquiries',
            () => _showBulkEnquirySheet(),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _quickBtn(
            Icons.history_rounded,
            'Recently Viewed',
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    _RecentlyViewedScreen(products: _actuallyViewedProducts),
              ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget _quickBtn(IconData icon, String label, VoidCallback onTap) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: 42,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.kBlue, Color(0xFF1A73E8)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.kBlue.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 16),
              const SizedBox(width: 7),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.5,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _title(String t) => Padding(
    padding: const EdgeInsets.fromLTRB(14, 12, 14, 6),
    child: Row(
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            color: AppColors.kBlue,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          t,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: AppColors.kBlack,
          ),
        ),
      ],
    ),
  );

  Widget _header(String t) => Padding(
    padding: const EdgeInsets.fromLTRB(14, 16, 14, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 18,
              decoration: BoxDecoration(
                color: AppColors.kBlue,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              t,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: AppColors.kBlack,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CategoryScreen()),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.kBlueLite,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: const [
                Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.kBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 2),
                Icon(Icons.chevron_right, size: 14, color: AppColors.kBlue),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  // ════════════════════════════════════════
  //  POPULAR CATEGORIES
  // ════════════════════════════════════════
  Widget _popularCategories() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(14, 16, 14, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 4,
                  height: 18,
                  decoration: BoxDecoration(
                    color: AppColors.kBlue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Popular Categories',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: AppColors.kBlack,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CategoryScreen()),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.kBlueLite,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: const [
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.kBlue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(Icons.chevron_right, size: 14, color: AppColors.kBlue),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 8),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 12,
            childAspectRatio: 0.78,
          ),
          itemCount: categories.length,
          itemBuilder: (_, i) {
            final c = categories[i];
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CategoryProductsScreen(
                    categoryName: c['name'] as String,
                    categoryColor: c['color'] as Color,
                    categoryIcon: c['icon'] as IconData,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: c['bg'] as Color,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: (c['color'] as Color).withOpacity(0.15),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Icon(
                      c['icon'] as IconData,
                      size: 26,
                      color: c['color'] as Color,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    c['name'] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 9.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                      height: 1.3,
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

  // ════════════════════════════════════════
  //  TOP BRANDS
  // ════════════════════════════════════════
  Widget _topBrands() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _header('Top Brands'),
      Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(14, 0, 14, 4),
        decoration: BoxDecoration(
          color: AppColors.kDarkNavy,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.kDarkNavy.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: brands
                .map(
                  (b) => Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.12),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Icon(
                            b['icon'] as IconData,
                            color: b['color'] as Color,
                            size: 26,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          b['name'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    ],
  );

  // ════════════════════════════════════════
  //  ESSENTIAL NEEDS
  // ════════════════════════════════════════
  Widget _essentialNeeds() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _header('Essential Needs'),
      Container(
        margin: const EdgeInsets.fromLTRB(14, 0, 14, 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.kGreen,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.kGreen.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: essentials
              .map(
                (e) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 68,
                        height: 68,
                        child: Image.network(
                          e['img'] as String,
                          fit: BoxFit.contain,
                          loadingBuilder: (_, child, prog) {
                            if (prog == null) return child;
                            return Container(
                              color: e['bg'] as Color,
                              child: const Center(
                                child: SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: AppColors.kBlue,
                                  ),
                                ),
                              ),
                            );
                          },
                          errorBuilder: (_, _, _) => Container(
                            color: e['bg'] as Color,
                            child: const Icon(
                              Icons.image_outlined,
                              color: AppColors.kBlue,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        e['name'] as String,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w700,
                          color: AppColors.kBlack,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    ],
  );

  // ════════════════════════════════════════
  //  PENDING ORDERS
  // ════════════════════════════════════════
  Widget _pendingOrders() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _header('Pending Orders'),
      Padding(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 6),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          itemCount: pendingOrders.length,
          itemBuilder: (_, i) {
            final o = pendingOrders[i];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFEEEEEE)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Image.network(
                          _imgGlucometer,
                          fit: BoxFit.cover,
                          loadingBuilder: (_, child, prog) {
                            if (prog == null) return child;
                            return Container(
                              color: const Color(0xFFF0F0F0),
                              child: const Center(
                                child: SizedBox(
                                  width: 14,
                                  height: 14,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: AppColors.kBlue,
                                  ),
                                ),
                              ),
                            );
                          },
                          errorBuilder: (_, _, _) => Container(
                            color: const Color(0xFFF0F0F0),
                            child: const Icon(
                              Icons.monitor_heart,
                              color: AppColors.kBlue,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            o['name'] as String,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF222222),
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            o['price'] as String,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: AppColors.kBlue,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.kBlueLite,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'x${o['qty']}',
                              style: const TextStyle(
                                color: AppColors.kBlue,
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );

  Widget _homeHealthcareSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(14, 16, 14, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 4,
                  height: 18,
                  decoration: BoxDecoration(
                    color: AppColors.kBlue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Home Healthcare',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: AppColors.kBlack,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomeHealthcareScreen()),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.kBlueLite,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.kBlue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(Icons.chevron_right, size: 14, color: AppColors.kBlue),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Quick access cards
      Padding(
        padding: const EdgeInsets.fromLTRB(14, 0, 14, 8),
        child: Row(
          children: [
            Expanded(
              child: _hcQuickCard(
                icon: Icons.local_hospital_rounded,
                bg: const Color(0xFFE3F2FD),
                iconColor: AppColors.kBlue,
                label: 'Book\nNurse',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HomeHealthcareScreen(),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _hcQuickCard(
                icon: Icons.support_agent_rounded,
                bg: const Color(0xFFE8F5E9),
                iconColor: const Color(0xFF2E7D32),
                label: 'Book\nCaretaker',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HomeHealthcareScreen(),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _hcQuickCard(
                icon: Icons.elderly_rounded,
                bg: const Color(0xFFFCE4EC),
                iconColor: const Color(0xFFC62828),
                label: 'Senior\nCitizen',
                badge: '⭐',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HomeHealthcareScreen(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );

  Widget _hcQuickCard({
    required IconData icon,
    required Color bg,
    required Color iconColor,
    required String label,
    String? badge,
    required VoidCallback onTap,
  }) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEEEEEE)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 22, color: iconColor),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w700,
              color: AppColors.kBlack,
              height: 1.3,
            ),
          ),
          if (badge != null) ...[
            const SizedBox(height: 4),
            Text(badge, style: const TextStyle(fontSize: 11)),
          ],
        ],
      ),
    ),
  );

  // ════════════════════════════════════════
  //  FOOTER
  // ════════════════════════════════════════
  Widget _footer() => Container(
    width: double.infinity,
    margin: const EdgeInsets.fromLTRB(14, 12, 14, 0),
    padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [AppColors.kBlue.withOpacity(0.05), AppColors.kBlueLite],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: AppColors.kBlue.withOpacity(0.1)),
    ),
    child: Column(
      children: [
        const Text(
          'Making healthcare',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: AppColors.kBlack,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'UNDERSTANDABLE , ACCESSIBLE & AFFORDABLE',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10.5,
            fontWeight: FontWeight.w700,
            color: AppColors.kBlue,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Made with ',
              style: TextStyle(fontSize: 12, color: AppColors.kGrey),
            ),
            Icon(Icons.favorite_rounded, color: Colors.red, size: 13),
            Text(
              ' by veesafe',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.kGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    ),
  );

  // ════════════════════════════════════════
  //  BULK ENQUIRY SHEET
  // ════════════════════════════════════════
  void _showBulkEnquirySheet() {
    final nameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final productCtrl = TextEditingController();
    final qtyCtrl = TextEditingController();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
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
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.kBorderGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Bulk Enquiry',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.kBlack,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Fill in the details and we\'ll get back to you shortly.',
                style: TextStyle(fontSize: 12, color: AppColors.kGrey),
              ),
              const SizedBox(height: 16),
              _enquiryField(
                'Your Name',
                nameCtrl,
                Icons.person_outline_rounded,
              ),
              const SizedBox(height: 12),
              _enquiryField(
                'Phone Number',
                phoneCtrl,
                Icons.phone_outlined,
                type: TextInputType.phone,
              ),
              const SizedBox(height: 12),
              _enquiryField(
                'Product Name',
                productCtrl,
                Icons.medical_services_outlined,
              ),
              const SizedBox(height: 12),
              _enquiryField(
                'Quantity Required',
                qtyCtrl,
                Icons.inventory_2_outlined,
                type: TextInputType.number,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kBlue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          '✅ Bulk enquiry submitted! We\'ll contact you soon.',
                        ),
                        backgroundColor: const Color(0xFF16A34A),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Submit Enquiry',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _enquiryField(
    String label,
    TextEditingController ctrl,
    IconData icon, {
    TextInputType type = TextInputType.text,
  }) => TextField(
    controller: ctrl,
    keyboardType: type,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: AppColors.kGrey, fontSize: 13),
      prefixIcon: Icon(icon, color: AppColors.kGrey, size: 18),
      filled: true,
      fillColor: AppColors.kBlueLite,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.kBlue, width: 1.5),
      ),
      isDense: true,
    ),
  );

  // ════════════════════════════════════════
  //  STORIES ROW
  // ════════════════════════════════════════
  static const List<Map<String, dynamic>> _stories = [
    {
      'name': 'Veesafe',
      'icon': Icons.health_and_safety_rounded,
      'color': Color(0xFF113A7A),
      'isNew': true,
    },
    {
      'name': 'MedSupply',
      'icon': Icons.medical_services_rounded,
      'color': Color(0xFF16A34A),
      'isNew': true,
    },
    {
      'name': 'PharmaDrct',
      'icon': Icons.vaccines_rounded,
      'color': Color(0xFFD97706),
      'isNew': true,
    },
    {
      'name': 'MobilityF',
      'icon': Icons.wheelchair_pickup_rounded,
      'color': Color(0xFF7C3AED),
      'isNew': false,
    },
    {
      'name': 'DiagnoPlus',
      'icon': Icons.bloodtype_rounded,
      'color': Color(0xFFE11D48),
      'isNew': false,
    },
    {
      'name': 'CareHome',
      'icon': Icons.medical_services_rounded,
      'color': Color(0xFF0284C7),
      'isNew': false,
    },
    {
      'name': 'GlobalMed',
      'icon': Icons.local_hospital_rounded,
      'color': Color(0xFF059669),
      'isNew': true,
    },
  ];

  Widget _storiesRow() => Container(
    color: Colors.white,
    padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: _stories.map((s) {
          final color = s['color'] as Color;
          final isNew = s['isNew'] as bool;
          return GestureDetector(
            onTap: () => _showStoryDialog(s),
            child: Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 66,
                    height: 66,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: isNew
                          ? LinearGradient(
                              colors: [color, color.withOpacity(0.5)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : null,
                      color: isNew ? null : const Color(0xFFCBD5E1),
                      boxShadow: isNew
                          ? [
                              BoxShadow(
                                color: color.withOpacity(0.4),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : [],
                    ),
                    padding: const EdgeInsets.all(3),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(2),
                      child: CircleAvatar(
                        backgroundColor: isNew
                            ? color
                            : const Color(0xFFCBD5E1),
                        child: Icon(
                          s['icon'] as IconData,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 64,
                    child: Text(
                      s['name'] as String,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: isNew
                            ? AppColors.kBlack
                            : const Color(0xFF9CA3AF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    ),
  );

  void _showStoryDialog(Map<String, dynamic> s) {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black,
        pageBuilder: (_, _, _) => _FullStoryScreen(story: s),
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (_, anim, _, child) =>
            FadeTransition(opacity: anim, child: child),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════
//  FULL SCREEN STORY VIEWER
// ════════════════════════════════════════════════════════════════
class _FullStoryScreen extends StatefulWidget {
  final Map<String, dynamic> story;
  const _FullStoryScreen({required this.story});
  @override
  State<_FullStoryScreen> createState() => _FullStoryScreenState();
}

class _FullStoryScreenState extends State<_FullStoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _progressCtrl;
  bool _liked = false;
  bool _paused = false;
  int _slide = 0;
  final List<Map<String, dynamic>> _slides = [
    {
      'title': 'Top Products',
      'subtitle': 'Best sellers this week',
      'tag': '🔥 Trending',
    },
    {
      'title': 'Special Offers',
      'subtitle': 'Up to 40% off today only',
      'tag': '💰 Hot Deal',
    },
    {
      'title': 'New Arrivals',
      'subtitle': 'Just launched — shop now',
      'tag': '✨ New',
    },
  ];

  @override
  void initState() {
    super.initState();
    _progressCtrl =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..addStatusListener((s) {
            if (s == AnimationStatus.completed) _nextSlide();
          });
    _progressCtrl.forward();
  }

  void _nextSlide() {
    if (_slide < _slides.length - 1) {
      setState(() => _slide++);
      _progressCtrl.reset();
      _progressCtrl.forward();
    } else {
      Navigator.pop(context);
    }
  }

  void _prevSlide() {
    if (_slide > 0) {
      setState(() => _slide--);
      _progressCtrl.reset();
      _progressCtrl.forward();
    }
  }

  @override
  void dispose() {
    _progressCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.story['color'] as Color;
    final icon = widget.story['icon'] as IconData;
    final name = widget.story['name'] as String;
    final slide = _slides[_slide];
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (_) {
          _paused = true;
          _progressCtrl.stop();
        },
        onTapUp: (d) {
          _paused = false;
          if (d.globalPosition.dx < size.width / 2)
            _prevSlide();
          else
            _nextSlide();
        },
        onLongPressStart: (_) {
          setState(() => _paused = true);
          _progressCtrl.stop();
        },
        onLongPressEnd: (_) {
          setState(() => _paused = false);
          _progressCtrl.forward();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.95),
                color.withOpacity(0.7),
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
          child: SafeArea(
            left: false,
            right: false,
            child: Column(
              children: [
                // Progress bars
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                  child: Row(
                    children: List.generate(
                      _slides.length,
                      (i) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: SizedBox(
                              height: 3,
                              child: i < _slide
                                  ? Container(color: Colors.white)
                                  : i == _slide
                                  ? AnimatedBuilder(
                                      animation: _progressCtrl,
                                      builder: (_, _) =>
                                          LinearProgressIndicator(
                                            value: _progressCtrl.value,
                                            backgroundColor: Colors.white
                                                .withOpacity(0.3),
                                            valueColor:
                                                const AlwaysStoppedAnimation(
                                                  Colors.white,
                                                ),
                                          ),
                                    )
                                  : Container(
                                      color: Colors.white.withOpacity(0.3),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white.withOpacity(0.2),
                        child: Icon(icon, color: Colors.white, size: 20),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const Text(
                            'Sponsored',
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => setState(() => _liked = !_liked),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _liked
                                ? Colors.red.withOpacity(0.2)
                                : Colors.black26,
                            border: Border.all(
                              color: _liked ? Colors.red : Colors.white30,
                            ),
                          ),
                          child: Icon(
                            _liked
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            color: _liked ? Colors.red : Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black26,
                          ),
                          child: const Icon(
                            Icons.close_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Center icon
                Expanded(
                  child: Center(
                    child: TweenAnimationBuilder<double>(
                      key: ValueKey(_slide),
                      tween: Tween(begin: 0.6, end: 1.0),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.elasticOut,
                      builder: (_, scale, _) => Transform.scale(
                        scale: scale,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.06),
                              ),
                            ),
                            Container(
                              width: 165,
                              height: 165,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.10),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.15),
                                  width: 1.5,
                                ),
                              ),
                            ),
                            Container(
                              width: 125,
                              height: 125,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.15),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.4),
                                  width: 2,
                                ),
                              ),
                              child: Icon(icon, size: 58, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Bottom info
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.6),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.18),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          slide['tag'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        slide['subtitle'] as String,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        slide['title'] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _slides.length,
                          (i) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            width: i == _slide ? 20 : 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: i == _slide
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.35),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Shop Now',
                                style: TextStyle(
                                  color: color,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: color,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════
//  GOOGLE LENS ICON PAINTER
// ════════════════════════════════════════════════════════════════
class _GoogleLensPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    const blue = Color(0xFF4285F4);
    const red = Color(0xFFEA4335);
    const yellow = Color(0xFFFBBC05);
    const green = Color(0xFF34A853);
    final arm = w * 0.30;
    final rad = w * 0.12;
    final pad = w * 0.04;
    final sw = w * 0.14;

    Paint p(Color c) => Paint()
      ..color = c
      ..style = PaintingStyle.stroke
      ..strokeWidth = sw
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(
      Path()
        ..moveTo(pad, pad + arm)
        ..lineTo(pad, pad + rad)
        ..arcToPoint(
          Offset(pad + rad, pad),
          radius: Radius.circular(rad),
          clockwise: true,
        )
        ..lineTo(pad + arm, pad),
      p(red),
    );
    canvas.drawPath(
      Path()
        ..moveTo(w - pad - arm, pad)
        ..lineTo(w - pad - rad, pad)
        ..arcToPoint(
          Offset(w - pad, pad + rad),
          radius: Radius.circular(rad),
          clockwise: true,
        )
        ..lineTo(w - pad, pad + arm),
      p(yellow),
    );
    canvas.drawPath(
      Path()
        ..moveTo(pad, h - pad - arm)
        ..lineTo(pad, h - pad - rad)
        ..arcToPoint(
          Offset(pad + rad, h - pad),
          radius: Radius.circular(rad),
          clockwise: false,
        )
        ..lineTo(pad + arm, h - pad),
      p(blue),
    );
    canvas.drawCircle(
      Offset(w * 0.46, h * 0.50),
      w * 0.20,
      Paint()
        ..color = blue
        ..style = PaintingStyle.fill,
    );
    canvas.drawCircle(
      Offset(w * 0.74, h * 0.72),
      w * 0.09,
      Paint()
        ..color = green
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ════════════════════════════════════════════════════════════════
//  LENS RESULT SCREEN
// ════════════════════════════════════════════════════════════════
class _LensResultScreen extends StatefulWidget {
  final String imagePath;
  const _LensResultScreen({required this.imagePath});
  @override
  State<_LensResultScreen> createState() => _LensResultScreenState();
}

class _LensResultScreenState extends State<_LensResultScreen> {
  bool _searching = true;
  String _result = '';

  @override
  void initState() {
    super.initState();
    _analyzeImage();
  }

  Future<void> _analyzeImage() async {
    await Future.delayed(const Duration(milliseconds: 1200));
    if (!mounted) return;
    setState(() {
      _searching = false;
      _result = 'Opening Google Lens...';
    });
    final Uri lensUri = Uri.parse('googlelens://');
    final Uri fallback = Uri.parse('https://lens.google.com');
    try {
      if (await canLaunchUrl(lensUri)) {
        await launchUrl(lensUri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(fallback, mode: LaunchMode.externalApplication);
      }
    } catch (_) {
      await launchUrl(fallback, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            widget.imagePath,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) =>
                Image.file(dart_io.File(widget.imagePath), fit: BoxFit.cover),
          ),
          Container(color: Colors.black.withOpacity(0.35)),
          Center(
            child: SizedBox(
              width: 220,
              height: 220,
              child: CustomPaint(painter: _ScanBracketPainter()),
            ),
          ),
          SafeArea(
            left: false,
            right: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CustomPaint(
                        size: const Size(24, 24),
                        painter: _GoogleLensPainter(),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Lens',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const SizedBox(width: 38),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.grid_view_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'select text',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: _analyzeImage,
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.black26,
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.search_rounded,
                        color: Color(0xFF4285F4),
                        size: 32,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (_searching)
                    const Text(
                      'Analysing image...',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    )
                  else
                    Text(
                      _result,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 130,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 1,
                itemBuilder: (_, _) => Container(
                  width: 56,
                  height: 56,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                      image: FileImage(dart_io.File(widget.imagePath)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScanBracketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;
    final arm = size.width * 0.22;
    final rad = size.width * 0.08;
    const pad = 0.0;
    final w = size.width;
    final h = size.height;
    canvas.drawPath(
      Path()
        ..moveTo(pad, pad + arm)
        ..lineTo(pad, pad + rad)
        ..arcToPoint(
          Offset(pad + rad, pad),
          radius: Radius.circular(rad),
          clockwise: true,
        )
        ..lineTo(pad + arm, pad),
      paint,
    );
    canvas.drawPath(
      Path()
        ..moveTo(w - pad - arm, pad)
        ..lineTo(w - pad - rad, pad)
        ..arcToPoint(
          Offset(w - pad, pad + rad),
          radius: Radius.circular(rad),
          clockwise: true,
        )
        ..lineTo(w - pad, pad + arm),
      paint,
    );
    canvas.drawPath(
      Path()
        ..moveTo(pad, h - pad - arm)
        ..lineTo(pad, h - pad - rad)
        ..arcToPoint(
          Offset(pad + rad, h - pad),
          radius: Radius.circular(rad),
          clockwise: false,
        )
        ..lineTo(pad + arm, h - pad),
      paint,
    );
    canvas.drawPath(
      Path()
        ..moveTo(w - pad - arm, h - pad)
        ..lineTo(w - pad - rad, h - pad)
        ..arcToPoint(
          Offset(w - pad, h - pad - rad),
          radius: Radius.circular(rad),
          clockwise: false,
        )
        ..lineTo(w - pad, h - pad - arm),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ════════════════════════════════════════════════════════════════
//  RECENTLY VIEWED SCREEN
// ════════════════════════════════════════════════════════════════
class _RecentlyViewedScreen extends StatelessWidget {
  final List<Product> products;
  const _RecentlyViewedScreen({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_rounded, color: Color(0xFF1A1A2E)),
        ),
        title: const Text(
          'Recently Viewed',
          style: TextStyle(
            color: Color(0xFF1A1A2E),
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Icon(
                  Icons.history_rounded,
                  color: AppColors.kBlue,
                  size: 18,
                ),
                const SizedBox(width: 4),
                Text(
                  '${products.length} items',
                  style: const TextStyle(
                    color: AppColors.kBlue,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: products.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: AppColors.kBlueLite,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.history_rounded,
                      color: AppColors.kBlue,
                      size: 38,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'No recently viewed products',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.kBlack,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Products you view will appear here',
                    style: TextStyle(fontSize: 13, color: AppColors.kGrey),
                  ),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(14),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.72,
              ),
              itemCount: products.length,
              itemBuilder: (_, i) {
                final p = products[i];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(14),
                            ),
                            child: SizedBox(
                              height: 130,
                              width: double.infinity,
                              child: p.imageUrl.startsWith('http')
                                  ? Image.network(
                                      p.imageUrl,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, _, _) => Container(
                                        color: p.imageBg,
                                        child: Icon(
                                          p.imageIcon,
                                          color: p.imageIconColor,
                                          size: 40,
                                        ),
                                      ),
                                    )
                                  : Image.asset(
                                      p.imageUrl,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, _, _) => Container(
                                        color: p.imageBg,
                                        child: Icon(
                                          p.imageIcon,
                                          color: p.imageIconColor,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: p.badgeColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                p.badge,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 6,
                            right: 6,
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                p.liked
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                                color: p.liked ? Colors.red : AppColors.kGrey,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                        child: Text(
                          p.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.kBlack,
                            height: 1.3,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 4, 10, 0),
                        child: Row(
                          children: [
                            Text(
                              p.price,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: AppColors.kBlue,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              p.oldPrice,
                              style: const TextStyle(
                                fontSize: 10,
                                color: AppColors.kGrey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Container(
                          width: double.infinity,
                          height: 32,
                          decoration: BoxDecoration(
                            color: AppColors.kBlue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

// ════════════════════════════════════════════════════════════════
//  SEARCH RESULTS SCREEN
// ════════════════════════════════════════════════════════════════
class _SearchResultsScreen extends StatefulWidget {
  final String query;
  const _SearchResultsScreen({required this.query});
  @override
  State<_SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<_SearchResultsScreen> {
  late TextEditingController _ctrl;

  static const List<Map<String, dynamic>> _allProducts = [
    {
      'name': 'Blood Testing Device',
      'price': 'Rs.3,250.00',
      'old': 'Rs.4,000.00',
      'badge': '15% Off',
    },
    {
      'name': 'Surgical Dress Combo',
      'price': 'Rs.1,499.00',
      'old': 'Rs.2,000.00',
      'badge': '25% Off',
    },
    {
      'name': 'Retinascope Full Set',
      'price': 'Rs.3,250.00',
      'old': 'Rs.4,500.00',
      'badge': '15% Off',
    },
    {
      'name': 'First Aid Kit – Full',
      'price': 'Rs.1,499.00',
      'old': 'Rs.1,999.00',
      'badge': '25% Off',
    },
    {
      'name': 'Oxygen Cylinder & Mask',
      'price': 'Rs.2,199.00',
      'old': 'Rs.3,000.00',
      'badge': '26% Off',
    },
    {
      'name': 'Wheel Chair Premium',
      'price': 'Rs.5,999.00',
      'old': 'Rs.7,500.00',
      'badge': '20% Off',
    },
    {
      'name': 'Leg Massager Pro',
      'price': 'Rs.2,800.00',
      'old': 'Rs.3,500.00',
      'badge': '20% Off',
    },
    {
      'name': 'Glucometer Kit',
      'price': 'Rs.1,290.00',
      'old': 'Rs.1,800.00',
      'badge': '28% Off',
    },
    {
      'name': 'Disposable Gloves Pack',
      'price': 'Rs.499.00',
      'old': 'Rs.799.00',
      'badge': '37% Off',
    },
    {
      'name': 'Walking Stick – Steel',
      'price': 'Rs.1,499.00',
      'old': 'Rs.1,999.00',
      'badge': '25% Off',
    },
    {
      'name': 'Nebulizer Machine',
      'price': 'Rs.1,850.00',
      'old': 'Rs.2,400.00',
      'badge': '22% Off',
    },
  ];

  late List<Map<String, dynamic>> _results;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController(text: widget.query);
    _results = _search(widget.query);
  }

  List<Map<String, dynamic>> _search(String q) {
    if (q.trim().isEmpty) return _allProducts;
    return _allProducts
        .where(
          (p) => (p['name'] as String).toLowerCase().contains(q.toLowerCase()),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_rounded, color: Color(0xFF1A1A2E)),
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFF5F7FA),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFE8ECF4)),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              const Icon(Icons.search, color: AppColors.kGrey, size: 18),
              const SizedBox(width: 6),
              Expanded(
                child: TextField(
                  controller: _ctrl,
                  autofocus: false,
                  onSubmitted: (v) => setState(() => _results = _search(v)),
                  style: const TextStyle(fontSize: 13, color: AppColors.kBlack),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => _results = _search(_ctrl.text)),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.kBlue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: _results.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.search_off_rounded,
                    size: 64,
                    color: AppColors.kBorderGrey,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'No results for "${_ctrl.text}"',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.kBlack,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Try a different keyword',
                    style: TextStyle(fontSize: 13, color: AppColors.kGrey),
                  ),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
                  child: Text(
                    '${_results.length} results found',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.kGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.fromLTRB(14, 4, 14, 14),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.75,
                        ),
                    itemCount: _results.length,
                    itemBuilder: (_, i) {
                      final p = _results[i];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 120,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.kBlueLite,
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(14),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.medical_services_outlined,
                                    color: AppColors.kBlue,
                                    size: 44,
                                  ),
                                ),
                                Positioned(
                                  top: 8,
                                  left: 8,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.kBlue,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      p['badge'] as String,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                              child: Text(
                                p['name'] as String,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.kBlack,
                                  height: 1.3,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 4, 10, 0),
                              child: Row(
                                children: [
                                  Text(
                                    p['price'] as String,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.kBlue,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    p['old'] as String,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: AppColors.kGrey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              child: Container(
                                width: double.infinity,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: AppColors.kBlue,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Add to Cart',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

// ════════════════════════════════════════════════════════════════
//  SHORTS SCREEN
// ════════════════════════════════════════════════════════════════
class _ShortsScreen extends StatefulWidget {
  const _ShortsScreen();
  @override
  State<_ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<_ShortsScreen> {
  final PageController _pageCtrl = PageController();
  int _currentIdx = 0;
  final Set<int> _likedIdx = {};

  final List<Map<String, dynamic>> _shorts = [
    {
      'user': 'Dr. Ramesh',
      'handle': '@dr.ramesh',
      'title': 'How to use a Glucometer at home 🩸',
      'likes': 12400,
      'comments': 340,
      'shares': 890,
      'gradient': [Color(0xFF0D47A1), Color(0xFF1565C0)],
      'icon': Icons.monitor_heart,
      'tag': 'Testing Products',
      'verified': true,
    },
    {
      'user': 'Priya Medicals',
      'handle': '@priyamedicals',
      'title': 'First Aid Kit essentials you NEED 🏥',
      'likes': 8100,
      'comments': 210,
      'shares': 560,
      'gradient': [Color(0xFF1B5E20), Color(0xFF2E7D32)],
      'icon': Icons.medical_services,
      'tag': 'First Aid',
      'verified': false,
    },
    {
      'user': 'HealthStore Tamil',
      'handle': '@healthstoretamil',
      'title': 'Nebulizer demo for kids 👶',
      'likes': 5900,
      'comments': 180,
      'shares': 420,
      'gradient': [Color(0xFF4A148C), Color(0xFF6A1B9A)],
      'icon': Icons.masks,
      'tag': 'Respiratory',
      'verified': true,
    },
    {
      'user': 'MediCare Plus',
      'handle': '@medicareplus',
      'title': 'Oxygen cylinder setup guide 💨',
      'likes': 9200,
      'comments': 290,
      'shares': 730,
      'gradient': [Color(0xFF004D40), Color(0xFF00695C)],
      'icon': Icons.air,
      'tag': 'Equipment',
      'verified': true,
    },
    {
      'user': 'WheelChair World',
      'handle': '@wheelchairworld',
      'title': 'Premium wheelchair review 2025 ♿',
      'likes': 3700,
      'comments': 95,
      'shares': 210,
      'gradient': [Color(0xFFBF360C), Color(0xFFE64A19)],
      'icon': Icons.wheelchair_pickup,
      'tag': 'Mobility',
      'verified': false,
    },
  ];

  String _formatCount(int n) =>
      n >= 1000 ? '${(n / 1000).toStringAsFixed(1)}K' : '$n';

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickAndUpload(ImageSource src) async {
    final picker = ImagePicker();
    final XFile? video = await picker.pickVideo(source: src);
    if (video == null) return;
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('✅ Video uploaded successfully!'),
        backgroundColor: const Color(0xFF16A34A),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _showUploadSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1A1A2E),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Upload Your Short',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Share medical tips or product demos with everyone',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.white54),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      _pickAndUpload(ImageSource.camera);
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.kBlue, Color(0xFF1A73E8)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.kBlue.withOpacity(0.4),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.videocam_rounded,
                            color: Colors.white,
                            size: 34,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Record',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Use camera',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      _pickAndUpload(ImageSource.gallery);
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A3E),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.kBlue.withOpacity(0.4),
                        ),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.upload_rounded,
                            color: AppColors.kBlue,
                            size: 34,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Upload',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'From gallery',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageCtrl,
            scrollDirection: Axis.vertical,
            onPageChanged: (i) => setState(() => _currentIdx = i),
            itemCount: _shorts.length,
            itemBuilder: (_, i) {
              final s = _shorts[i];
              final gradColors = s['gradient'] as List<Color>;
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [...gradColors, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 0.45, 1.0],
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.08),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              s['icon'] as IconData,
                              size: 72,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.white30),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  s['tag'] as String,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 72,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(16, 60, 16, 32),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.85),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: gradColors[0],
                                  child: Icon(
                                    s['icon'] as IconData,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            s['user'] as String,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          if (s['verified'] as bool) ...[
                                            const SizedBox(width: 4),
                                            const Icon(
                                              Icons.verified_rounded,
                                              color: Color(0xFF4285F4),
                                              size: 14,
                                            ),
                                          ],
                                        ],
                                      ),
                                      Text(
                                        s['handle'] as String,
                                        style: const TextStyle(
                                          color: Colors.white54,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    'Follow',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              s['title'] as String,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: const [
                                Icon(
                                  Icons.music_note_rounded,
                                  color: Colors.white70,
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Original Sound • Veesafe',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          // Top bar
          SafeArea(
            left: false,
            right: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: Colors.black45,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Shorts',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 36),
                ],
              ),
            ),
          ),
          // Right action buttons
          Positioned(
            right: 10,
            bottom: 100,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    if (_likedIdx.contains(_currentIdx))
                      _likedIdx.remove(_currentIdx);
                    else
                      _likedIdx.add(_currentIdx);
                  }),
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: _likedIdx.contains(_currentIdx)
                              ? Colors.red.withOpacity(0.3)
                              : Colors.black45,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white24),
                        ),
                        child: Icon(
                          _likedIdx.contains(_currentIdx)
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: _likedIdx.contains(_currentIdx)
                              ? Colors.red
                              : Colors.white,
                          size: 26,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _formatCount(
                          (_shorts[_currentIdx]['likes'] as int) +
                              (_likedIdx.contains(_currentIdx) ? 1 : 0),
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                _sideBtn(
                  Icons.chat_bubble_rounded,
                  _formatCount(_shorts[_currentIdx]['comments'] as int),
                  Colors.white,
                ),
                const SizedBox(height: 18),
                _sideBtn(
                  Icons.reply_rounded,
                  _formatCount(_shorts[_currentIdx]['shares'] as int),
                  Colors.white,
                ),
                const SizedBox(height: 18),
                _sideBtn(Icons.shopping_bag_rounded, 'Shop', AppColors.kBlue),
                const SizedBox(height: 18),
                _sideBtn(Icons.more_horiz_rounded, '', Colors.white),
              ],
            ),
          ),
          // Progress dots
          Positioned(
            right: 4,
            top: MediaQuery.of(context).size.height * 0.38,
            child: Column(
              children: List.generate(
                _shorts.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  width: 3,
                  height: i == _currentIdx ? 20 : 5,
                  decoration: BoxDecoration(
                    color: i == _currentIdx ? Colors.white : Colors.white30,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sideBtn(IconData icon, String label, Color color) => Column(
    children: [
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black45,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white24),
        ),
        child: Icon(icon, color: color, size: 24),
      ),
      if (label.isNotEmpty) ...[
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ],
  );
}
