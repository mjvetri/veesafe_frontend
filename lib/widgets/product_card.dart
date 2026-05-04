// // lib/widgets/product_card.dart
// import 'package:flutter/material.dart';
// import '../models/product_model.dart';
// import '../constants/app_colors.dart';
// import '../screens/product_detail_screen.dart';

// class ProductCard extends StatefulWidget {
//   final Product product;
//   const ProductCard({super.key, required this.product});
//   @override
//   State<ProductCard> createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   @override
//   Widget build(BuildContext context) {
//     final p = widget.product;
//     return GestureDetector(
//       onTap: () => Navigator.push(context,
//           MaterialPageRoute(builder: (_) => ProductDetailScreen(product: p))),
//       child: Container(
//         width: 145,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 8, offset: const Offset(0, 3)),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Image area
//             Stack(children: [
//               ClipRRect(
//                 borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//                 child: Container(
//                   height: 105,
//                   width: double.infinity,
//                   color: p.imageBg,
//                   child: p.imageUrl.startsWith('http')
//                       ? Image.network(
//                           p.imageUrl,
//                           fit: BoxFit.contain,
//                           loadingBuilder: (_, child, prog) {
//                             if (prog == null) return child;
//                             return Center(child: SizedBox(width: 20, height: 20,
//                                 child: CircularProgressIndicator(strokeWidth: 2, color: p.imageIconColor)));
//                           },
//                           errorBuilder: (_, _, _) => Center(
//                               child: Icon(p.imageIcon, size: 44, color: p.imageIconColor)),
//                         )
//                       : p.imageUrl.startsWith('assets')
//                           ? Image.asset(p.imageUrl, fit: BoxFit.contain,
//                               errorBuilder: (_, _, _) => Center(
//                                   child: Icon(p.imageIcon, size: 44, color: p.imageIconColor)))
//                           : Center(child: Icon(p.imageIcon, size: 44, color: p.imageIconColor)),
//                 ),
//               ),
//               // Badge top-left
//               Positioned(
//                 top: 7, left: 7,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                   decoration: BoxDecoration(color: p.badgeColor, borderRadius: BorderRadius.circular(5)),
//                   child: Text(p.badge, style: const TextStyle(color: Colors.white, fontSize: 8.5, fontWeight: FontWeight.w700)),
//                 ),
//               ),
//               // Heart top-right
//               Positioned(
//                 top: 7, right: 7,
//                 child: GestureDetector(
//                   onTap: () => setState(() => p.liked = !p.liked),
//                   child: Container(
//                     width: 26, height: 26,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                       boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.10), blurRadius: 4)],
//                     ),
//                     child: Icon(
//                       p.liked ? Icons.favorite : Icons.favorite_border,
//                       size: 13,
//                       color: p.liked ? Colors.red : const Color(0xFFCCCCCC),
//                     ),
//                   ),
//                 ),
//               ),
//             ]),

//             // Details
//             Padding(
//               padding: const EdgeInsets.fromLTRB(9, 7, 9, 8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(p.name,
//                       maxLines: 2, overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.kBlack, height: 1.3)),
//                   const SizedBox(height: 6),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                         Text(p.price, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.kBlack)),
//                         Text(p.oldPrice, style: const TextStyle(fontSize: 9, color: Color(0xFFAAAAAA), decoration: TextDecoration.lineThrough)),
//                       ]),
//                       // + button → opens product detail
//                       GestureDetector(
//                         onTap: () => Navigator.push(context,
//                             MaterialPageRoute(builder: (_) => ProductDetailScreen(product: p))),
//                         child: Container(
//                           width: 27, height: 27,
//                           decoration: const BoxDecoration(color: AppColors.kGreen, shape: BoxShape.circle),
//                           child: const Icon(Icons.add, color: Colors.white, size: 17),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

















// lib/widgets/product_card.dart
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../constants/app_colors.dart';
import '../screens/product_detail_screen.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final p = widget.product;
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => ProductDetailScreen(product: p))),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, 3)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Image area (top ~60% of card) ──
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: SizedBox(
                height: 130,
                width: double.infinity,
                child: p.imageUrl.startsWith('http')
                    ? Image.network(
                        p.imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (_, child, prog) {
                          if (prog == null) return child;
                          return Container(
                            color: p.imageBg,
                            child: Center(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: p.imageIconColor),
                              ),
                            ),
                          );
                        },
                        errorBuilder: (_, _, _) => Container(
                          color: p.imageBg,
                          child: Center(
                              child: Icon(p.imageIcon,
                                  size: 44, color: p.imageIconColor)),
                        ),
                      )
                    : p.imageUrl.startsWith('assets')
                        ? Image.asset(
                            p.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => Container(
                              color: p.imageBg,
                              child: Center(
                                  child: Icon(p.imageIcon,
                                      size: 44, color: p.imageIconColor)),
                            ),
                          )
                        : Container(
                            color: p.imageBg,
                            child: Center(
                                child: Icon(p.imageIcon,
                                    size: 44, color: p.imageIconColor)),
                          ),
              ),
            ),

            // ── Info area (bottom ~40% of card) ──
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product name
                  Text(
                    p.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w700,
                        color: AppColors.kBlack,
                        height: 1.3),
                  ),
                  const SizedBox(height: 6),

                  // Price bold
                  Text(
                    p.price,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        color: AppColors.kBlack),
                  ),

                  // Old price + star rating on same row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        p.oldPrice,
                        style: const TextStyle(
                            fontSize: 10,
                            color: AppColors.kGrey,
                            decoration: TextDecoration.lineThrough),
                      ),
                      Row(children: const [
                        Icon(Icons.star_rounded,
                            color: Color(0xFFF59E0B), size: 13),
                        SizedBox(width: 2),
                        Text('4.1',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppColors.kGrey)),
                      ]),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Badge pill at bottom left
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: p.badgeColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      p.badge,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}