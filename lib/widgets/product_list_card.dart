import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/product_model.dart';

class ProductListCard extends StatelessWidget {
  final List<ProductModel> products;
  final String title;
  final VoidCallback? onViewAll;

  const ProductListCard({
    super.key,
    required this.products,
    required this.title,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 10),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: AppColors.navy)),
                GestureDetector(
                  onTap: onViewAll,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.iconNavy,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('View All ›',
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: AppColors.navy)),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),
          ...products.map((p) => _ProductRow(product: p)),
        ],
      ),
    );
  }
}

class _ProductRow extends StatelessWidget {
  final ProductModel product;
  const _ProductRow({required this.product});

  @override
  Widget build(BuildContext context) {
    Color tagBg, tagFg;
    String tagText;
    switch (product.tag) {
      case ProductTag.active:
        tagBg = AppColors.tagActiveBg;
        tagFg = AppColors.tagActiveFg;
        tagText = 'Active';
        break;
      case ProductTag.hot:
        tagBg = AppColors.tagHotBg;
        tagFg = AppColors.red;
        tagText = 'HOT';
        break;
      case ProductTag.newTag:
        tagBg = AppColors.tagNewBg;
        tagFg = AppColors.tagNewFg;
        tagText = 'NEW';
        break;
    }

    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF1F5F9))),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.iconNavy,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: Text(product.emoji,
                    style: const TextStyle(fontSize: 20))),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: AppColors.navy)),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Flexible(
                      child: Text(product.asin,
                          style: const TextStyle(
                              fontSize: 9,
                              color: AppColors.muted,
                              fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                      decoration: BoxDecoration(
                        color: tagBg,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(tagText,
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w800,
                              color: tagFg)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(product.price,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: AppColors.navy)),
              Text(product.qty,
                  style: const TextStyle(
                      fontSize: 9,
                      color: AppColors.sub,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}
