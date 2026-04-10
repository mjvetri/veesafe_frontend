import 'package:flutter/material.dart';
import 'all_reviews_screen.dart';

const Color _wrNavy    = Color(0xFF1A2B5E);
const Color _wrBg      = Color(0xFFF2F6FA);
const Color _wrDark    = Color(0xFF1A2340);
const Color _wrGrey    = Color(0xFF8A94A6);
const Color _wrOrange  = Color(0xFFF6971E);

// ════════════════════════════════════════════════════
// WRITE A REVIEW SCREEN
// ════════════════════════════════════════════════════
class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});
  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  int _rating = 3;
  final TextEditingController _reviewCtrl = TextEditingController();

  // ── Product images ──
  final List<String> _productImages = [
    'assets/images/image.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.png',
  ];
  int _selectedImageIndex = 0;

  @override
  void dispose() { _reviewCtrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _wrBg,
      body: Column(
        children: [
          _buildAppBar(context, sw),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(sw * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: sw * 0.01),
                    _buildProductCard(sw),
                    SizedBox(height: sw * 0.04),
                    _buildRatingSection(sw),
                    SizedBox(height: sw * 0.04),
                    _buildReviewTextField(sw),
                    SizedBox(height: sw * 0.05),
                    _buildSubmitButton(context, sw),
                    SizedBox(height: sw * 0.04),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, double sw) {
    return Container(
      color: _wrNavy,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(sw * 0.04, sw * 0.025, sw * 0.04, sw * 0.038),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: sw * 0.085, height: sw * 0.085,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(sw * 0.02),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
                  ),
                  child: Icon(Icons.chevron_left_rounded, color: Colors.white, size: sw * 0.052),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text('Write a Review',
                      style: TextStyle(color: Colors.white, fontSize: sw * 0.042, fontWeight: FontWeight.w700)),
                ),
              ),
              SizedBox(width: sw * 0.085),
            ],
          ),
        ),
      ),
    );
  }

  // ── UPDATED: Product card with image gallery ──
  Widget _buildProductCard(double sw) {
    return Container(
      padding: EdgeInsets.all(sw * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Image column: main image + thumbnails ──
          Column(
            children: [
              // Main selected image
              Container(
                width: sw * 0.22,
                height: sw * 0.22,
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF4FF),
                  borderRadius: BorderRadius.circular(sw * 0.025),
                  border: Border.all(color: const Color(0xFFD0DCF8), width: 1.5),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  _productImages[_selectedImageIndex],
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Center(
                    child: Icon(Icons.monitor_heart_outlined, color: _wrNavy, size: sw * 0.1),
                  ),
                ),
              ),
              SizedBox(height: sw * 0.02),
              // Thumbnail row
              Row(
                children: List.generate(_productImages.length, (i) {
                  final bool isSelected = i == _selectedImageIndex;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedImageIndex = i),
                    child: Container(
                      margin: EdgeInsets.only(right: i < _productImages.length - 1 ? sw * 0.015 : 0),
                      width: sw * 0.055,
                      height: sw * 0.055,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(sw * 0.015),
                        border: Border.all(
                          color: isSelected ? _wrNavy : const Color(0xFFD0DCF8),
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        _productImages[i],
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => Container(
                          color: const Color(0xFFEEF4FF),
                          child: Icon(Icons.image_outlined, color: _wrGrey, size: sw * 0.03),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
          SizedBox(width: sw * 0.035),
          // ── Product details ──
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr Trust USA Gold Standard\nGlucometer Sugar Check Testing\nMachine 9001 with 25 Strips...',
                  style: TextStyle(fontSize: sw * 0.029, fontWeight: FontWeight.w600, color: _wrDark, height: 1.45),
                  maxLines: 3, overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: sw * 0.015),
                Text(r'$2,604.00',
                    style: TextStyle(fontSize: sw * 0.033, fontWeight: FontWeight.w800, color: _wrNavy)),
                SizedBox(height: sw * 0.012),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: sw * 0.025, vertical: sw * 0.008),
                  decoration: BoxDecoration(color: _wrNavy, borderRadius: BorderRadius.circular(6)),
                  child: Text('Delivered on Mon Jan 28',
                      style: TextStyle(color: Colors.white, fontSize: sw * 0.024, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingSection(double sw) {
    return Container(
      padding: EdgeInsets.all(sw * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Row(
        children: [
          Container(
            width: sw * 0.1, height: sw * 0.1,
            decoration: BoxDecoration(
              color: _wrNavy.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.camera_alt_outlined, color: _wrNavy, size: sw * 0.05),
          ),
          SizedBox(width: sw * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rate this product',
                  style: TextStyle(fontSize: sw * 0.034, fontWeight: FontWeight.w700, color: _wrDark)),
              SizedBox(height: sw * 0.008),
              Row(
                children: List.generate(5, (i) => GestureDetector(
                  onTap: () => setState(() => _rating = i + 1),
                  child: Padding(
                    padding: EdgeInsets.only(right: sw * 0.01),
                    child: Icon(
                      i < _rating ? Icons.star_rounded : Icons.star_outline_rounded,
                      color: i < _rating ? _wrOrange : const Color(0xFFE0E0E0),
                      size: sw * 0.055,
                    ),
                  ),
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReviewTextField(double sw) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: TextField(
        controller: _reviewCtrl,
        maxLines: 5,
        style: TextStyle(fontSize: sw * 0.031, color: _wrDark),
        decoration: InputDecoration(
          hintText: '"We are glad we can help you with your medical needs..."',
          hintStyle: TextStyle(fontSize: sw * 0.029, color: _wrGrey, height: 1.5, fontStyle: FontStyle.italic),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
          filled: true, fillColor: Colors.white,
          contentPadding: EdgeInsets.all(sw * 0.04),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context, double sw) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AllReviewsScreen()),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: _wrNavy,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.symmetric(vertical: sw * 0.038),
          elevation: 4,
          shadowColor: _wrNavy.withValues(alpha: 0.4),
        ),
        child: Text('Submit your review',
            style: TextStyle(color: Colors.white, fontSize: sw * 0.036, fontWeight: FontWeight.w700)),
      ),
    );
  }
}