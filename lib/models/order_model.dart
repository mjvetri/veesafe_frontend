class OrderProduct {
  final String name;
  final String status;
  final String statusDate;
  final double price;
  final int quantity;
  final bool canCancelOrder;

  const OrderProduct({
    required this.name,
    required this.status,
    required this.statusDate,
    required this.price,
    required this.quantity,
    this.canCancelOrder = false,
  });
}

class ShippingDetails {
  final String name;
  final String address;
  final double items;
  final double delivery;
  final double total;
  final double promotionApplied;
  final double orderTotal;
  final double savings;
  final double savingsPercent;

  const ShippingDetails({
    required this.name,
    required this.address,
    required this.items,
    required this.delivery,
    required this.total,
    required this.promotionApplied,
    required this.orderTotal,
    required this.savings,
    required this.savingsPercent,
  });
}

// ── Dummy Data ──────────────────────────────────────────────────────────────

final List<OrderProduct> dummyOrders = [
  const OrderProduct(
    name: 'Dr Trust USA Gold Standard Glucometer...',
    status: 'Delivered',
    statusDate: 'Delivered on Feb 14',
    price: 250.00,
    quantity: 1,
  ),
  const OrderProduct(
    name: 'Dr Trust USA Gold Standard Glucometer...',
    status: 'Delivered',
    statusDate: 'Delivered on Feb 14',
    price: 250.00,
    quantity: 1,
  ),
  const OrderProduct(
    name: 'Dr Trust USA Gold Standard Glucometer...',
    status: 'Delivered',
    statusDate: 'Delivered on Feb 14',
    price: 250.00,
    quantity: 1,
    canCancelOrder: true,
  ),
];

const shippingInfo = ShippingDetails(
  name: 'Sheetal',
  address:
      'Akshaya Nagar 1st Block 1st Cross, Rammurthy Nagar, Bangalore-560016.',
  items: 250.00,
  delivery: 250.00,
  total: 250.00,
  promotionApplied: -780.00,
  orderTotal: 2604.00,
  savings: 2604.00,
  savingsPercent: 47,
);
