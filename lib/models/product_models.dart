enum ProductTag { active, hot, newTag }

class ProductModel {
  final String emoji;
  final String name;
  final String asin;
  final String price;
  final String qty;
  final ProductTag tag;

  const ProductModel({
    required this.emoji,
    required this.name,
    required this.asin,
    required this.price,
    required this.qty,
    required this.tag,
  });
}

final List<ProductModel> sampleProducts = [
  const ProductModel(
    emoji: '🛏️',
    name: 'Dr Trust USA Gold Standard Hospital Bed',
    asin: 'ASIN: DT-HB001',
    price: '\$2,604',
    qty: 'Qty: 12',
    tag: ProductTag.active,
  ),
  const ProductModel(
    emoji: '🩺',
    name: 'Livesay Wellness Scrubs Men & Women',
    asin: 'ASIN: LW-SC002',
    price: '\$2,604',
    qty: 'Qty: 31',
    tag: ProductTag.hot,
  ),
  const ProductModel(
    emoji: '🩸',
    name: 'Dr Trust Glucometer Sugar Check Testing',
    asin: 'ASIN: DT-GL003',
    price: '\$2,604',
    qty: 'Qty: 25',
    tag: ProductTag.newTag,
  ),
  const ProductModel(
    emoji: '🫁',
    name: 'Oxygen Cylinder & Mask Disposable',
    asin: 'ASIN: OX-CY004',
    price: '\$1,499',
    qty: 'Qty: 8',
    tag: ProductTag.active,
  ),
  const ProductModel(
    emoji: '♿',
    name: 'Wheel Chair Steel Premium',
    asin: 'ASIN: WC-ST005',
    price: '\$1,799',
    qty: 'Qty: 5',
    tag: ProductTag.active,
  ),
  const ProductModel(
    emoji: '🩻',
    name: 'Nebuliser & Vaporizer Combo Kit',
    asin: 'ASIN: NB-VP006',
    price: '\$449',
    qty: 'Qty: 20',
    tag: ProductTag.newTag,
  ),
];
