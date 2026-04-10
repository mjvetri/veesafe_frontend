import 'package:flutter/material.dart';
import '../../../models/order_model.dart';

class OrderDetailContent extends StatelessWidget {
  final OrderProduct order;

  const OrderDetailContent({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Product Row ──────────────────────────────────────────────────
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFDDDDDD)),
              ),
              child: const Icon(
                Icons.medical_services_outlined,
                color: Color(0xFF888888),
                size: 34,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dr Trust USA Gold Standard Glucometer Sugar Check Testing Machine 3031 with 25 Strips',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF222222),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4CAF50),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          '4.2★',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '2477 ratings',
                        style: TextStyle(
                            fontSize: 11, color: Color(0xFF888888)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Qty: 1',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF444444),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        // ── Cancel Order Button ──────────────────────────────────────────
        if (order.canCancelOrder)
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFE53935)),
                foregroundColor: const Color(0xFFE53935),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
              child: const Text(
                'Cancel Order',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ),

        const SizedBox(height: 18),
        const Divider(color: Color(0xFFEEEEEE), height: 1),
        const SizedBox(height: 14),

        // ── Shipping Details ─────────────────────────────────────────────
        const Text(
          'Shipping Details',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color(0xFF222222),
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: const TextSpan(
            style: TextStyle(
                fontSize: 13, color: Color(0xFF555555), height: 1.5),
            children: [
              TextSpan(
                text: 'Shipping to : ',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Color(0xFF222222)),
              ),
              TextSpan(
                text:
                    'Sheetal, Akshaya Nagar 1st Block 1st Cross, Ramm...',
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),
        const Divider(color: Color(0xFFEEEEEE), height: 1),
        const SizedBox(height: 12),

        // ── Price Breakdown ──────────────────────────────────────────────
        _buildPriceRow('Items', '\$250.00'),
        _buildPriceRow('Delivery', '\$250.00'),
        _buildPriceRow('Total', '\$250.00'),
        _buildPriceRow(
          'Promotion Applied',
          '-\$780.00',
          valueColor: const Color(0xFF4CAF50),
        ),

        const SizedBox(height: 8),
        const Divider(color: Color(0xFFEEEEEE), height: 1),
        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Order Total :',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF222222)),
            ),
            Text(
              '\$2,604.00',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF222222)),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Your Savings :',
              style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF4CAF50),
                  fontWeight: FontWeight.w600),
            ),
            Text(
              '\$2,604.00 (47%)',
              style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF4CAF50),
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),

        const SizedBox(height: 18),
        const Divider(color: Color(0xFFEEEEEE), height: 1),
        const SizedBox(height: 14),

        // ── Manufacturer Address ─────────────────────────────────────────
        const Text(
          'Manufacturer / Market address',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF222222),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Sheetal',
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF222222)),
        ),
        const SizedBox(height: 4),
        const Text(
          'Akshaya Nagar 1st Block 1st Cross, Rammurthy Nagar, Bangalore-560016.',
          style: TextStyle(
              fontSize: 13, color: Color(0xFF555555), height: 1.5),
        ),
        const SizedBox(height: 4),
        const Text(
          '+91 8882187882',
          style: TextStyle(fontSize: 13, color: Color(0xFF555555)),
        ),
        const SizedBox(height: 4),
        const Text(
          'Country of Origin: India',
          style: TextStyle(fontSize: 13, color: Color(0xFF555555)),
        ),

        const SizedBox(height: 18),
        const Divider(color: Color(0xFFEEEEEE), height: 1),
        const SizedBox(height: 10),

        // ── Contact ──────────────────────────────────────────────────────
        const Text(
          'In case of any issues, contact us',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF222222),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Email ID: care@gmail.com',
          style: TextStyle(fontSize: 13, color: Color(0xFF555555)),
        ),
        const SizedBox(height: 4),
        const Text(
          'Akshaya Nagar 1st Block 1st Cross, Rammurthy Nagar, Bangalore-560016.',
          style: TextStyle(
              fontSize: 13, color: Color(0xFF555555), height: 1.5),
        ),
        const SizedBox(height: 4),
        const Text(
          '+91 8882187882',
          style: TextStyle(fontSize: 13, color: Color(0xFF555555)),
        ),
        const SizedBox(height: 14),
      ],
    );
  }

  Widget _buildPriceRow(String label, String value,
      {Color valueColor = const Color(0xFF444444)}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 13, color: Color(0xFF555555))),
          Text(value,
              style: TextStyle(
                  fontSize: 13,
                  color: valueColor,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
