

// lib/models/product_model.dart

import 'package:flutter/material.dart';

class Product {
  final String name;
  final String price;
  final String oldPrice;
  final String badge;
  final Color badgeColor;
  final Color imageBg;
  final IconData imageIcon;
  final Color imageIconColor;
  final String imageUrl; // network image URL
  bool liked;

  Product({
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.badge,
    required this.badgeColor,
    required this.imageBg,
    required this.imageIcon,
    required this.imageIconColor,
    required this.imageUrl,
    this.liked = false,
  });
}