import 'package:flutter/material.dart';
import 'checkout_placeorder_screen.dart';

const Color _kAddrNavy = Color(0xFF1A2B5E);
const Color _kAddrCyan = Color(0xFF00B4D8);
const Color _kAddrDiv  = Color(0xFFE2E8F0);
const Color _kAddrText = Color(0xFF2D3748);
const Color _kAddrSub  = Color(0xFF8A94A6);

class CheckoutAddressScreen extends StatefulWidget {
  const CheckoutAddressScreen({super.key});
  @override
  State<CheckoutAddressScreen> createState() => _CheckoutAddressScreenState();
}

class _CheckoutAddressScreenState extends State<CheckoutAddressScreen> {
  int _selectedAddress = 0;

  final List<Map<String, String>> _addresses = [
    {
      'type':  'Home',
      'name':  'Anirudh',
      'line1': 'Akshaya Nagar 1st Block 1st Cross,',
      'line2': 'Rammurthy Nagar, Bangalore- 560016.',
      'phone': '+91 9862367892',
    },
    {
      'type':  'Office',
      'name':  'Anirudh',
      'line1': 'Akshaya Nagar 1st Block 1st Cross,',
      'line2': 'Rammurthy Nagar, Bangalore- 560016.',
      'phone': '+91 9862367892',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      body: Column(
        children: [
          _buildHeader(context, sw),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(sw * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: sw * 0.01),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.add_rounded,
                            color: Colors.white, size: sw * 0.045),
                        label: Text('Add New Address',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: sw * 0.035,
                                fontWeight: FontWeight.w700)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _kAddrNavy,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          padding:
                              EdgeInsets.symmetric(vertical: sw * 0.035),
                          elevation: 3,
                          shadowColor:
                              _kAddrNavy.withValues(alpha: 0.35),
                        ),
                      ),
                    ),
                    SizedBox(height: sw * 0.045),
                    Text('Saved Addresses',
                        style: TextStyle(
                            fontSize: sw * 0.038,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF1A2340))),
                    SizedBox(height: sw * 0.025),
                    ...List.generate(
                        _addresses.length, (i) => _addressCard(i, sw)),
                    SizedBox(height: sw * 0.04),
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

  // ── Header with Figma step bar (step 0 done, step 1 active) ─────────────

  Widget _buildHeader(BuildContext context, double sw) {
    return Container(
      color: _kAddrNavy,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  sw * 0.04, sw * 0.03, sw * 0.04, sw * 0.02),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
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
                      child: Text('Checkout (2/3)',
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
            _buildFigmaStepBar(sw, currentStep: 1),
            SizedBox(height: sw * 0.04),
          ],
        ),
      ),
    );
  }

  Widget _buildFigmaStepBar(double sw, {required int currentStep}) {
    const labels = ['Payment', 'Address', 'Place order'];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.06),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(labels.length, (i) {
              final isActive = i == currentStep;
              final isDone = i < currentStep;
              return Text(labels[i],
                  style: TextStyle(
                      color: (isActive || isDone)
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.45),
                      fontSize: sw * 0.03,
                      fontWeight: (isActive || isDone)
                          ? FontWeight.w700
                          : FontWeight.w400));
            }),
          ),
          SizedBox(height: sw * 0.02),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  height: 3,
                  decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(2))),
              Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: currentStep == 0
                      ? 0.0
                      : currentStep == 1
                          ? 0.5
                          : 1.0,
                  child: Container(
                      height: 3,
                      decoration: BoxDecoration(
                          color: _kAddrCyan,
                          borderRadius: BorderRadius.circular(2))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(labels.length, (i) {
                  final isDone = i < currentStep;
                  final isActive = i == currentStep;
                  return Container(
                    width: sw * 0.07,
                    height: sw * 0.07,
                    decoration: BoxDecoration(
                      color: isDone
                          ? _kAddrCyan
                          : isActive
                              ? _kAddrCyan
                              : Colors.white.withValues(alpha: 0.25),
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: (isDone || isActive)
                              ? _kAddrCyan
                              : Colors.white.withValues(alpha: 0.4),
                          width: 2),
                    ),
                    child: Center(
                      child: isDone
                          ? Icon(Icons.check_rounded,
                              color: Colors.white, size: sw * 0.035)
                          : isActive
                              ? Container(
                                  width: sw * 0.025,
                                  height: sw * 0.025,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle))
                              : null,
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _addressCard(int index, double sw) {
    final addr = _addresses[index];
    final bool sel = _selectedAddress == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedAddress = index),
      child: Container(
        margin: EdgeInsets.only(bottom: sw * 0.03),
        padding: EdgeInsets.all(sw * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
              color: sel ? _kAddrNavy : _kAddrDiv, width: sel ? 2 : 1),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withValues(alpha: sel ? 0.08 : 0.04),
                blurRadius: sel ? 12 : 6,
                offset: const Offset(0, 3)),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: sw * 0.048,
              height: sw * 0.048,
              margin: EdgeInsets.only(top: sw * 0.005),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: sel ? _kAddrNavy : _kAddrSub, width: 2),
              ),
              child: sel
                  ? Center(
                      child: Container(
                        width: sw * 0.024,
                        height: sw * 0.024,
                        decoration: const BoxDecoration(
                            color: _kAddrNavy, shape: BoxShape.circle),
                      ),
                    )
                  : null,
            ),
            SizedBox(width: sw * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: sw * 0.025, vertical: sw * 0.007),
                    decoration: BoxDecoration(
                      color: sel
                          ? _kAddrNavy
                          : _kAddrNavy.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(addr['type']!,
                        style: TextStyle(
                            color: sel ? Colors.white : _kAddrNavy,
                            fontSize: sw * 0.026,
                            fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(height: sw * 0.015),
                  Text(addr['line1']!,
                      style: TextStyle(
                          fontSize: sw * 0.03, color: _kAddrText)),
                  Text(addr['line2']!,
                      style: TextStyle(
                          fontSize: sw * 0.03, color: _kAddrText)),
                  SizedBox(height: sw * 0.008),
                  Text(addr['name']!,
                      style: TextStyle(
                          fontSize: sw * 0.03,
                          fontWeight: FontWeight.w600,
                          color: _kAddrText)),
                  SizedBox(height: sw * 0.005),
                  Text(addr['phone']!,
                      style: TextStyle(
                          fontSize: sw * 0.03, color: _kAddrSub)),
                  SizedBox(height: sw * 0.02),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text('Edit',
                            style: TextStyle(
                                fontSize: sw * 0.03,
                                fontWeight: FontWeight.w600,
                                color: _kAddrNavy)),
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
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const CheckoutPlaceorderScreen()),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: _kAddrNavy,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(vertical: sw * 0.035),
                elevation: 4,
                shadowColor: _kAddrNavy.withValues(alpha: 0.35),
              ),
              child: Text('Continue',
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