import 'package:flutter/material.dart';

class OfferBanner extends StatelessWidget {
  const OfferBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: sw * 0.04, vertical: sw * 0.02),
      height: sw * 0.38,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFFFF3E0), Color(0xFFFFE0B2)],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(sw * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: sw * 0.02, vertical: sw * 0.006),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6971E),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text('50% OFF',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: sw * 0.022,
                              fontWeight: FontWeight.w800)),
                    ),
                    SizedBox(height: sw * 0.015),
                    Text('Medical\nProduct',
                        style: TextStyle(
                          fontSize: sw * 0.052,
                          fontWeight: FontWeight.w900,
                          color: const Color(0xFF1A2B5E),
                          height: 1.1,
                        )),
                    SizedBox(height: sw * 0.02),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: sw * 0.04, vertical: sw * 0.018),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A2B5E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text('Open',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: sw * 0.028,
                              fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(sw * 0.02),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.monitor_heart_outlined,
                      color: const Color(0xFF1A2B5E).withValues(alpha: 0.4),
                      size: sw * 0.2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}