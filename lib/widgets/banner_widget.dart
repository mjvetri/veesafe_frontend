





// lib/widgets/banner_widget.dart
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

// Weighing scale
const _s = 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=200&h=200&fit=crop';
// Blood pressure monitor
const _b = 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=200&h=200&fit=crop';
// Thermometer / medical
const _t = 'https://images.unsplash.com/photo-1631549916768-4119b2e5f926?w=200&h=200&fit=crop';
// Oximeter / pulse
const _o = 'https://images.unsplash.com/photo-1559757175-5700dde675bc?w=200&h=200&fit=crop';

class HeroBanner extends StatelessWidget {
  final Color bgColor;
  const HeroBanner({super.key, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 4, 12, 4),
      height: 138,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 0, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('50% OFF',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: kGrey)),
                const SizedBox(height: 2),
                const Text('Medical\nProduct',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900, color: kBlack, height: 1.1)),
                const SizedBox(height: 9),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: kBlack,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('Open',
                        style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  Expanded(child: _box(_s)),
                  const SizedBox(width: 5),
                  Expanded(child: _box(_b)),
                ]),
                const SizedBox(height: 5),
                Row(children: [
                  Expanded(child: _box(_t)),
                  const SizedBox(width: 5),
                  Expanded(child: _box(_o)),
                ]),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget _box(String url) => Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 4, offset: const Offset(0, 2))],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(url, fit: BoxFit.contain,
              errorBuilder: (_, _, _) => const Icon(Icons.medical_services, color: kBlue, size: 18)),
        ),
      );
}