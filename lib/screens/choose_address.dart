import 'package:flutter/material.dart';
import 'checkout_placeorder_screen.dart';

// ✅ Uses CheckoutPlaceorderScreen (lowercase 'o') — matches the class definition

class ChooseAddressScreen extends StatefulWidget {
  const ChooseAddressScreen({super.key});

  @override
  State<ChooseAddressScreen> createState() => _ChooseAddressScreenState();
}

class _ChooseAddressScreenState extends State<ChooseAddressScreen> {
  int _selected = 0;

  final List<Map<String, String>> _addresses = [
    {
      'type':  'Home',
      'name':  'Anirudh',
      'line1': 'Akshoya Nagar 1st Block 1st Cross,',
      'line2': 'Rammurthy Nagar, Bangalore- 560016.',
      'phone': '+91 9862367892',
    },
    {
      'type':  'Office',
      'name':  'Anirudh',
      'line1': 'Akshoya Nagar 1st Block 1st Cross,',
      'line2': 'Rammurthy Nagar, Bangalore- 560016.',
      'phone': '+91 9862367892',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      body: Column(
        children: [
          _buildHeader(context, sw),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: sw * 0.04, vertical: sw * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Add New Address
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: sw * 0.04),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                              color: const Color(0xFF1A2B5E)
                                  .withValues(alpha: 0.3),
                              width: 1.5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black
                                    .withValues(alpha: 0.05),
                                blurRadius: 8,
                                offset: const Offset(0, 3)),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_circle_outline_rounded,
                                color: const Color(0xFF1A2B5E),
                                size: sw * 0.05),
                            SizedBox(width: sw * 0.025),
                            Text('Add New Address',
                                style: TextStyle(
                                    fontSize: sw * 0.035,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF1A2B5E))),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: sw * 0.04),
                    Text('Saved Addresses',
                        style: TextStyle(
                            fontSize: sw * 0.038,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF1A2340))),
                    SizedBox(height: sw * 0.025),
                    ...List.generate(
                        _addresses.length,
                        (i) => Padding(
                              padding:
                                  EdgeInsets.only(bottom: sw * 0.03),
                              child: _buildCard(i, sw),
                            )),
                    SizedBox(height: sw * 0.06),
                  ],
                ),
              ),
            ),
          ),
          _buildBottomBar(context, sw),
        ],
      ),
    );
  }

  // ── Header ───────────────────────────────────────────────────────────────

  Widget _buildHeader(BuildContext context, double sw) {
    return Container(
      color: const Color(0xFF1A2B5E),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              sw * 0.04, sw * 0.025, sw * 0.04, sw * 0.035),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.maybePop(context),
                child: Container(
                  width: sw * 0.088,
                  height: sw * 0.088,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(sw * 0.022),
                    border: Border.all(
                        color: Colors.white.withValues(alpha: 0.25)),
                  ),
                  child: Icon(Icons.chevron_left_rounded,
                      color: Colors.white, size: sw * 0.055),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text('Choose Address',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: sw * 0.043,
                          fontWeight: FontWeight.w700)),
                ),
              ),
              SizedBox(width: sw * 0.088),
            ],
          ),
        ),
      ),
    );
  }

  // ── Address Card ─────────────────────────────────────────────────────────

  Widget _buildCard(int index, double sw) {
    final addr = _addresses[index];
    final sel = _selected == index;
    return GestureDetector(
      onTap: () => setState(() => _selected = index),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(sw * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: sel
                ? const Color(0xFF1A2B5E)
                : const Color(0xFFE2E8F0),
            width: sel ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
                color:
                    Colors.black.withValues(alpha: sel ? 0.08 : 0.04),
                blurRadius: sel ? 12 : 6,
                offset: const Offset(0, 3)),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Radio
            Container(
              width: sw * 0.048,
              height: sw * 0.048,
              margin: EdgeInsets.only(top: sw * 0.005),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: sel
                      ? const Color(0xFF1A2B5E)
                      : const Color(0xFF8A94A6),
                  width: 2,
                ),
              ),
              child: sel
                  ? Center(
                      child: Container(
                        width: sw * 0.024,
                        height: sw * 0.024,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1A2B5E),
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            SizedBox(width: sw * 0.03),
            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: sw * 0.025, vertical: sw * 0.007),
                    decoration: BoxDecoration(
                      color: sel
                          ? const Color(0xFF1A2B5E)
                          : const Color(0xFF1A2B5E)
                              .withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(addr['type']!,
                        style: TextStyle(
                            color: sel
                                ? Colors.white
                                : const Color(0xFF1A2B5E),
                            fontSize: sw * 0.026,
                            fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(height: sw * 0.015),
                  Text(addr['line1']!,
                      style: TextStyle(
                          fontSize: sw * 0.03,
                          color: const Color(0xFF2D3748))),
                  Text(addr['line2']!,
                      style: TextStyle(
                          fontSize: sw * 0.03,
                          color: const Color(0xFF2D3748))),
                  SizedBox(height: sw * 0.008),
                  Text(addr['name']!,
                      style: TextStyle(
                          fontSize: sw * 0.03,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2D3748))),
                  SizedBox(height: sw * 0.005),
                  Text(addr['phone']!,
                      style: TextStyle(
                          fontSize: sw * 0.03,
                          color: const Color(0xFF8A94A6))),
                  SizedBox(height: sw * 0.02),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text('Edit',
                            style: TextStyle(
                                fontSize: sw * 0.03,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF1A2B5E))),
                      ),
                      SizedBox(width: sw * 0.04),
                      GestureDetector(
                        onTap: () {},
                        child: Text('Remove',
                            style: TextStyle(
                                fontSize: sw * 0.03,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFE53E3E))),
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

  // ── Bottom Bar ───────────────────────────────────────────────────────────

  Widget _buildBottomBar(BuildContext context, double sw) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 16,
              offset: const Offset(0, -4))
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sw * 0.04, vertical: sw * 0.03),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              // ✅ CheckoutPlaceorderScreen — lowercase 'o'
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const CheckoutPlaceorderScreen()),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A2B5E),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(vertical: sw * 0.035),
                elevation: 4,
                shadowColor:
                    const Color(0xFF1A2B5E).withValues(alpha: 0.35),
              ),
              child: Text('Deliver Here',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: sw * 0.036,
                      fontWeight: FontWeight.w700)),
            ),
          ),
        ),
      ),
    );
  }
}