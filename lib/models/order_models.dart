enum OrderStatus { delivered, returning, pending }

class OrderModel {
  final String date;
  final String status;
  final OrderStatus statusType;
  final String productName;
  final String detail;
  final String btn1;
  final String btn2;

  const OrderModel({
    required this.date,
    required this.status,
    required this.statusType,
    required this.productName,
    required this.detail,
    required this.btn1,
    required this.btn2,
  });
}

final List<OrderModel> sampleOrders = [
  const OrderModel(
    date: 'Apr 1, 2026',
    status: 'Returning · Refunded',
    statusType: OrderStatus.returning,
    productName: 'Dr Trust USA Gold Standard Glucometer Sugar Check Testing Machine',
    detail: 'SKU: DT-GL003 · \$2,604.00 · Standard Delivery',
    btn1: 'Track Order',
    btn2: 'Contact Buyer',
  ),
  const OrderModel(
    date: 'Apr 8, 2026',
    status: 'Delivered',
    statusType: OrderStatus.delivered,
    productName: 'Dr Trust USA Gold Standard Hospital Bed Premium',
    detail: 'SKU: DT-HB001 · \$2,604.00 · Standard Delivery',
    btn1: 'Track Order',
    btn2: 'Details',
  ),
  const OrderModel(
    date: 'Apr 7, 2026',
    status: 'Delivered',
    statusType: OrderStatus.delivered,
    productName: 'Livesay Wellness Scrubs — Men and Women\'s wear',
    detail: 'SKU: LW-SC002 · \$2,604.00 · Free Delivery',
    btn1: 'Track Order',
    btn2: 'Details',
  ),
  const OrderModel(
    date: 'Apr 5, 2026',
    status: 'Pending',
    statusType: OrderStatus.pending,
    productName: 'Oxygen Cylinder & Mask — Disposable Medical Grade',
    detail: 'SKU: OX-CY004 · \$1,499.00 · Express Delivery',
    btn1: 'Track Order',
    btn2: 'Ship Now',
  ),
];
