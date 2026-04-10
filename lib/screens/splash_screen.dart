// // File: lib/screen/splash_screen.dart

// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:shared_preferences/shared_preferences.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _fadeAnimation;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1200),
//     );

//     _fadeAnimation = Tween<double>(
//       begin: 0.0,
//       end: 1.0,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

//     _scaleAnimation = Tween<double>(
//       begin: 0.85,
//       end: 1.0,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

//     _controller.forward();

//     // After 3 seconds, decide where to go
//     Timer(const Duration(seconds: 3), () {
//       _navigateNext();
//     });
//   }

//   /// Checks SharedPreferences to decide the route:
//   ///   - First install           → /onboarding
//   ///   - Returning user (seen onboarding, not logged in) → /login
//   ///   - Returning user (already logged in)              → /home
//   Future<void> _navigateNext() async {
//     if (!mounted) return;

//     final prefs = await SharedPreferences.getInstance();

//     final bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
//     final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

//     if (!mounted) return;

//     if (!hasSeenOnboarding) {
//       // First time — show onboarding
//       Navigator.of(context).pushReplacementNamed('/onboarding');
//     } else if (!isLoggedIn) {
//       // Has seen onboarding but not logged in
//       Navigator.of(context).pushReplacementNamed('/login');
//     } else {
//       // Already logged in — go straight to home
//       Navigator.of(context).pushReplacementNamed('/home');
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF1A3A6B),
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Color(0xFF1E4480), Color(0xFF152E5E)],
//           ),
//         ),
//         child: FadeTransition(
//           opacity: _fadeAnimation,
//           child: ScaleTransition(
//             scale: _scaleAnimation,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // ---- LOGO + BRAND NAME ----
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: 36,
//                       height: 36,
//                       child: CustomPaint(painter: VeeSafeIconPainter()),
//                     ),
//                     const SizedBox(width: 10),
//                     RichText(
//                       text: const TextSpan(
//                         children: [
//                           TextSpan(
//                             text: 'VEE',
//                             style: TextStyle(
//                               fontFamily: 'Arial',
//                               fontSize: 28,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.white,
//                               letterSpacing: 2.0,
//                             ),
//                           ),
//                           TextSpan(
//                             text: 'S',
//                             style: TextStyle(
//                               fontFamily: 'Arial',
//                               fontSize: 28,
//                               fontWeight: FontWeight.w700,
//                               color: Color(0xFFE8C547),
//                               letterSpacing: 2.0,
//                             ),
//                           ),
//                           TextSpan(
//                             text: 'AFE',
//                             style: TextStyle(
//                               fontFamily: 'Arial',
//                               fontSize: 28,
//                               fontWeight: FontWeight.w700,
//                               color: Colors.white,
//                               letterSpacing: 2.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 180),
//                 const Text(
//                   'Made in India',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w700,
//                     letterSpacing: 0.5,
//                   ),
//                 ),
//                 const SizedBox(height: 6),
//                 const Text(
//                   'One Stop Online Shopping For All Your\nMedical Equipment',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Color(0xFFB0C4DE),
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                     height: 1.6,
//                     letterSpacing: 0.3,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class VeeSafeIconPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final goldPaint = Paint()
//       ..color = const Color(0xFFE8C547)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2.2
//       ..strokeCap = StrokeCap.round
//       ..strokeJoin = StrokeJoin.round;

//     final double w = size.width;
//     final double h = size.height;

//     final roofPath = Path();
//     roofPath.moveTo(w * 0.5, h * 0.05);
//     roofPath.lineTo(w * 0.95, h * 0.42);
//     roofPath.lineTo(w * 0.82, h * 0.42);
//     roofPath.lineTo(w * 0.82, h * 0.95);
//     roofPath.lineTo(w * 0.18, h * 0.95);
//     roofPath.lineTo(w * 0.18, h * 0.42);
//     roofPath.lineTo(w * 0.05, h * 0.42);
//     roofPath.close();
//     canvas.drawPath(roofPath, goldPaint);

//     final crossPaint = Paint()
//       ..color = const Color(0xFFE8C547)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2.0
//       ..strokeCap = StrokeCap.round;

//     canvas.drawLine(
//       Offset(w * 0.5, h * 0.52),
//       Offset(w * 0.5, h * 0.84),
//       crossPaint,
//     );
//     canvas.drawLine(
//       Offset(w * 0.35, h * 0.68),
//       Offset(w * 0.65, h * 0.68),
//       crossPaint,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }





import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();

    // // Navigate to onboarding after 3 seconds - CHANGED THIS LINE
    // Timer(const Duration(seconds: 3), () {
    //   if (mounted) {
    //     Navigator.of(context).pushReplacementNamed('/onboarding');
    //   }
    // });

    Timer(const Duration(seconds: 3), () async {
      if (mounted) {
        final prefs = await SharedPreferences.getInstance();
        final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

        if (mounted) {
          if (isLoggedIn) {
            Navigator.of(context).pushReplacementNamed('/home');
          } else {
            Navigator.of(context).pushReplacementNamed('/onboarding');
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A3A6B), // Deep navy blue
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1E4480), // Slightly lighter navy at top
              Color(0xFF152E5E), // Darker navy at bottom
            ],
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ---- LOGO + BRAND NAME ----
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Medical Cross / Home Icon
                    Container(
                      width: 36,
                      height: 36,
                      child: CustomPaint(
                        painter: VeeSafeIconPainter(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Brand Name
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'VEE',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 2.0,
                            ),
                          ),
                          TextSpan(
                            text: 'S',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFE8C547), // Gold/Yellow
                              letterSpacing: 2.0,
                            ),
                          ),
                          TextSpan(
                            text: 'AFE',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // ---- BOTTOM TEXT ----
                const SizedBox(height: 180),
                const Text(
                  'Made in India',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'One Stop Online Shopping For All Your\nMedical Equipment',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFB0C4DE),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Custom painter for VeeSafe logo icon (house + medical cross)
class VeeSafeIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final goldPaint = Paint()
      ..color = const Color(0xFFE8C547)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final double w = size.width;
    final double h = size.height;

    // Draw house/roof shape
    final roofPath = Path();
    roofPath.moveTo(w * 0.5, h * 0.05); // Top peak
    roofPath.lineTo(w * 0.95, h * 0.42); // Right of roof
    roofPath.lineTo(w * 0.82, h * 0.42); // Right shoulder
    roofPath.lineTo(w * 0.82, h * 0.95); // Bottom right
    roofPath.lineTo(w * 0.18, h * 0.95); // Bottom left
    roofPath.lineTo(w * 0.18, h * 0.42); // Left shoulder
    roofPath.lineTo(w * 0.05, h * 0.42); // Left of roof
    roofPath.close();
    canvas.drawPath(roofPath, goldPaint);

    // Draw medical cross inside house
    final crossPaint = Paint()
      ..color = const Color(0xFFE8C547)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    // Vertical bar of cross
    canvas.drawLine(
      Offset(w * 0.5, h * 0.52),
      Offset(w * 0.5, h * 0.84),
      crossPaint,
    );
    // Horizontal bar of cross
    canvas.drawLine(
      Offset(w * 0.35, h * 0.68),
      Offset(w * 0.65, h * 0.68),
      crossPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}