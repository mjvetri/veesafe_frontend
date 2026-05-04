// lib/widgets/product_row.dart
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../constants/app_colors.dart';
import 'product_card.dart';

class ProductRow extends StatelessWidget {
  final String title;
  final List<Product> products;
  final bool insideBlueBox;
  const ProductRow({super.key, required this.title, required this.products, this.insideBlueBox = false});

  @override
  Widget build(BuildContext context) {
    if (insideBlueBox) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _header(title),
        Container(
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 4),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.kBlue, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SizedBox(
            height: 260,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(10),
              itemCount: products.length,
              separatorBuilder: (_, _) => const SizedBox(width: 10),
              itemBuilder: (_, i) => ProductCard(product: products[i]),
            ),
          ),
        ),
        const SizedBox(height: 4),
      ]);
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _header(title),
      SizedBox(
        height: 260,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: products.length,
          separatorBuilder: (_, _) => const SizedBox(width: 10),
          itemBuilder: (_, i) => ProductCard(product: products[i]),
        ),
      ),
      const SizedBox(height: 4),
    ]);
  }

  Widget _header(String t) => Padding(
    padding: const EdgeInsets.fromLTRB(13, 14, 13, 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(t, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: AppColors.kBlack)),
        GestureDetector(
          onTap: () {},
          child: Row(children: const [
            Text('See all', style: TextStyle(fontSize: 12, color: AppColors.kGrey, fontWeight: FontWeight.w500)),
            Icon(Icons.chevron_right, size: 15, color: AppColors.kGrey),
          ]),
        ),
      ],
    ),
  );
}