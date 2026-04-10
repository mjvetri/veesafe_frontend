import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final int rating;
  final String reviewText;
  final bool hasMedia;
  final bool isVideo;
  final int likes;

  const ReviewCard({
    super.key,
    required this.name,
    required this.rating,
    required this.reviewText,
    this.hasMedia = false,
    this.isVideo = false,
    this.likes = 0,
  });

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(sw * 0.04, 0, sw * 0.04, sw * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Reviewer info
          Padding(
            padding: EdgeInsets.fromLTRB(
                sw * 0.04, sw * 0.035, sw * 0.04, sw * 0.02),
            child: Row(
              children: [
                CircleAvatar(
                  radius: sw * 0.045,
                  backgroundColor: const Color(0xFF1A2B5E),
                  child: Text(name[0],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: sw * 0.032)),
                ),
                SizedBox(width: sw * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: TextStyle(
                            fontSize: sw * 0.031,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF1A2340))),
                    SizedBox(height: sw * 0.005),
                    Row(
                      children: List.generate(
                          5,
                          (i) => Icon(
                                i < rating
                                    ? Icons.star_rounded
                                    : Icons.star_outline_rounded,
                                color: i < rating
                                    ? const Color(0xFFF6971E)
                                    : const Color(0xFFE0E0E0),
                                size: sw * 0.032,
                              )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // ── Review text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
            child: Text(reviewText,
                style: TextStyle(
                    fontSize: sw * 0.029,
                    color: const Color(0xFF8A94A6),
                    height: 1.55)),
          ),
          // ── Media
          if (hasMedia) ...[
            SizedBox(height: sw * 0.025),
            _buildMedia(sw),
          ],
          // ── Bottom row
          Padding(
            padding: EdgeInsets.fromLTRB(
                sw * 0.04, sw * 0.025, sw * 0.04, sw * 0.025),
            child: Row(
              children: [
                Icon(Icons.image_outlined,
                    size: sw * 0.04, color: const Color(0xFF8A94A6)),
                SizedBox(width: sw * 0.03),
                Icon(Icons.thumb_up_outlined,
                    size: sw * 0.038, color: const Color(0xFF8A94A6)),
                SizedBox(width: sw * 0.015),
                Text('$likes',
                    style: TextStyle(
                        fontSize: sw * 0.028,
                        color: const Color(0xFF8A94A6))),
                SizedBox(width: sw * 0.035),
                Icon(Icons.flag_outlined,
                    size: sw * 0.038, color: const Color(0xFF8A94A6)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedia(double sw) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: sw * 0.48,
              color: const Color(0xFFD6E8F4),
              child: CustomPaint(painter: _RoomPainter()),
            ),
            if (isVideo)
              Container(
                width: sw * 0.14,
                height: sw * 0.14,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 10)
                  ],
                ),
                child: Icon(Icons.play_arrow_rounded,
                    color: const Color(0xFF1A2B5E), size: sw * 0.08),
              ),
          ],
        ),
      ),
    );
  }
}

class _RoomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size sz) {
    final w = sz.width; final h = sz.height;
    canvas.drawRect(Rect.fromLTWH(0, 0, w, h),
        Paint()..color = const Color(0xFFD6E8F4));
    canvas.drawRect(Rect.fromLTWH(0, h * 0.65, w, h * 0.35),
        Paint()..color = const Color(0xFFB8D4E8));
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(w * 0.1, h * 0.08, w * 0.35, h * 0.42),
            const Radius.circular(4)),
        Paint()..color = const Color(0xFFE8F4FC));
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(w * 0.55, h * 0.4, w * 0.38, h * 0.28),
            const Radius.circular(6)),
        Paint()..color = const Color(0xFFEEEEEE));
    canvas.drawOval(
        Rect.fromLTWH(w * 0.32, h * 0.28, w * 0.3, h * 0.1),
        Paint()..color = const Color(0xFFCCCCCC));
    canvas.drawCircle(Offset(w * 0.11, h * 0.45), w * 0.09,
        Paint()..color = const Color(0xFF4CAF50));
  }
  @override bool shouldRepaint(covariant CustomPainter o) => false;
}