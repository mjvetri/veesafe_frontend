




// // // lib/widgets/product_card.dart
// // import 'package:flutter/material.dart';
// // import '../models/product_model.dart';
// // import '../constants/app_colors.dart';

// // class ProductCard extends StatefulWidget {
// //   final Product product;
// //   const ProductCard({super.key, required this.product});
// //   @override
// //   State<ProductCard> createState() => _ProductCardState();
// // }

// // class _ProductCardState extends State<ProductCard> {
// //   @override
// //   Widget build(BuildContext context) {
// //     final p = widget.product;
// //     return Container(
// //       width: 145,
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(12),
// //         boxShadow: [
// //           BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 8, offset: const Offset(0, 3)),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Image area
// //           Stack(children: [
// //             ClipRRect(
// //               borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
// //               child: Container(
// //                 height: 105,
// //                 width: double.infinity,
// //                 color: const Color(0xFFF5F6FA),
// //                 child: Image.network(
// //                   p.imageUrl,
// //                   fit: BoxFit.contain,
// //                   loadingBuilder: (_, child, prog) {
// //                     if (prog == null) return child;
// //                     return const Center(child: SizedBox(width: 20, height: 20,
// //                         child: CircularProgressIndicator(strokeWidth: 2, color: kBlue)));
// //                   },
// //                   errorBuilder: (_, __, ___) => Center(
// //                       child: Icon(p.imageIcon, size: 44, color: const Color(0xFFCCCCCC))),
// //                 ),
// //               ),
// //             ),
// //             // Badge top-left
// //             Positioned(
// //               top: 7, left: 7,
// //               child: Container(
// //                 padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
// //                 decoration: BoxDecoration(color: p.badgeColor, borderRadius: BorderRadius.circular(5)),
// //                 child: Text(p.badge, style: const TextStyle(color: Colors.white, fontSize: 8.5, fontWeight: FontWeight.w700)),
// //               ),
// //             ),
// //             // Heart top-right
// //             Positioned(
// //               top: 7, right: 7,
// //               child: GestureDetector(
// //                 onTap: () => setState(() => p.liked = !p.liked),
// //                 child: Container(
// //                   width: 26, height: 26,
// //                   decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     shape: BoxShape.circle,
// //                     boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.10), blurRadius: 4)],
// //                   ),
// //                   child: Icon(
// //                     p.liked ? Icons.favorite : Icons.favorite_border,
// //                     size: 13,
// //                     color: p.liked ? Colors.red : const Color(0xFFCCCCCC),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ]),

// //           // Details
// //           Padding(
// //             padding: const EdgeInsets.fromLTRB(9, 7, 9, 8),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(p.name,
// //                     maxLines: 2, overflow: TextOverflow.ellipsis,
// //                     style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: kBlack, height: 1.3)),
// //                 const SizedBox(height: 6),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   crossAxisAlignment: CrossAxisAlignment.center,
// //                   children: [
// //                     Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //                       Text(p.price, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: kBlack)),
// //                       Text(p.oldPrice, style: const TextStyle(fontSize: 9, color: Color(0xFFAAAAAA), decoration: TextDecoration.lineThrough)),
// //                     ]),
// //                     // Green circle + button exactly like screenshots
// //                     GestureDetector(
// //                       onTap: () {},
// //                       child: Container(
// //                         width: 27, height: 27,
// //                         decoration: const BoxDecoration(color: kGreen, shape: BoxShape.circle),
// //                         child: const Icon(Icons.add, color: Colors.white, size: 17),
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
//                   color: const Color(0xFFF5F6FA),
//                   child: Image.network(
//                     p.imageUrl,
//                     fit: BoxFit.contain,
//                     loadingBuilder: (_, child, prog) {
//                       if (prog == null) return child;
//                       return const Center(child: SizedBox(width: 20, height: 20,
//                           child: CircularProgressIndicator(strokeWidth: 2, color: kBlue)));
//                     },
//                     errorBuilder: (_, __, ___) => Center(
//                         child: Icon(p.imageIcon, size: 44, color: const Color(0xFFCCCCCC))),
//                   ),
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
//                       style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: kBlack, height: 1.3)),
//                   const SizedBox(height: 6),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                         Text(p.price, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: kBlack)),
//                         Text(p.oldPrice, style: const TextStyle(fontSize: 9, color: Color(0xFFAAAAAA), decoration: TextDecoration.lineThrough)),
//                       ]),
//                       // + button → opens product detail
//                       GestureDetector(
//                         onTap: () => Navigator.push(context,
//                             MaterialPageRoute(builder: (_) => ProductDetailScreen(product: p))),
//                         child: Container(
//                           width: 27, height: 27,
//                           decoration: const BoxDecoration(color: kGreen, shape: BoxShape.circle),
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
        width: 145,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 8, offset: const Offset(0, 3)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image area
            Stack(children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Container(
                  height: 105,
                  width: double.infinity,
                  color: p.imageBg,
                  child: p.imageUrl.startsWith('http')
                      ? Image.network(
                          p.imageUrl,
                          fit: BoxFit.contain,
                          loadingBuilder: (_, child, prog) {
                            if (prog == null) return child;
                            return Center(child: SizedBox(width: 20, height: 20,
                                child: CircularProgressIndicator(strokeWidth: 2, color: p.imageIconColor)));
                          },
                          errorBuilder: (_, _, _) => Center(
                              child: Icon(p.imageIcon, size: 44, color: p.imageIconColor)),
                        )
                      : p.imageUrl.startsWith('assets')
                          ? Image.asset(p.imageUrl, fit: BoxFit.contain,
                              errorBuilder: (_, _, _) => Center(
                                  child: Icon(p.imageIcon, size: 44, color: p.imageIconColor)))
                          : Center(child: Icon(p.imageIcon, size: 44, color: p.imageIconColor)),
                ),
              ),
              // Badge top-left
              Positioned(
                top: 7, left: 7,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(color: p.badgeColor, borderRadius: BorderRadius.circular(5)),
                  child: Text(p.badge, style: const TextStyle(color: Colors.white, fontSize: 8.5, fontWeight: FontWeight.w700)),
                ),
              ),
              // Heart top-right
              Positioned(
                top: 7, right: 7,
                child: GestureDetector(
                  onTap: () => setState(() => p.liked = !p.liked),
                  child: Container(
                    width: 26, height: 26,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.10), blurRadius: 4)],
                    ),
                    child: Icon(
                      p.liked ? Icons.favorite : Icons.favorite_border,
                      size: 13,
                      color: p.liked ? Colors.red : const Color(0xFFCCCCCC),
                    ),
                  ),
                ),
              ),
            ]),

            // Details
            Padding(
              padding: const EdgeInsets.fromLTRB(9, 7, 9, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(p.name,
                      maxLines: 2, overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: kBlack, height: 1.3)),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(p.price, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: kBlack)),
                        Text(p.oldPrice, style: const TextStyle(fontSize: 9, color: Color(0xFFAAAAAA), decoration: TextDecoration.lineThrough)),
                      ]),
                      // + button → opens product detail
                      GestureDetector(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => ProductDetailScreen(product: p))),
                        child: Container(
                          width: 27, height: 27,
                          decoration: const BoxDecoration(color: kGreen, shape: BoxShape.circle),
                          child: const Icon(Icons.add, color: Colors.white, size: 17),
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
    );
  }
}