// // File: lib/screen/onboarding_screen.dart

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   late PageController _pageController;
//   int _currentPage = 0;

//   final List<OnboardingPageData> onboardingPages = [
//     OnboardingPageData(
//       title: 'Welcome to VeeSafe',
//       description:
//           'User friendly app for buying and selling of medical devices, medical equipments, medical disposable and medical fabric with doorstep delivery.',
//       illustrationType: IllustrationType.shopping,
//     ),
//     OnboardingPageData(
//       title: 'Fast Delivery',
//       description:
//           'We deliver all your medical appliances at lightning speed with real-time tracking and secure packaging.',
//       illustrationType: IllustrationType.delivery,
//     ),
//     OnboardingPageData(
//       title: 'Secured Payment',
//       description:
//           'We accept payments via Rupay, Visa, Credit Cards, Debit Cards, UPI and all through secured gateways.',
//       illustrationType: IllustrationType.payment,
//     ),
//     OnboardingPageData(
//       title: 'Student Store',
//       description:
//           'To support medical students easily acquire high-quality equipments to continue their practice, subsidized medical and lab supplies are made available to them.',
//       illustrationType: IllustrationType.student,
//     ),
//     OnboardingPageData(
//       title: 'Human Health & Wellness',
//       description:
//           'We are committed to provide our customers with quality healthcare and to have 24/7 access to best medical products and services at affordable prices.',
//       illustrationType: IllustrationType.wellness,
//     ),
//     OnboardingPageData(
//       title: 'Video Commerce',
//       description:
//           'Shop smarter for better shopping experience through our innovative video commerce feature with live product demos.',
//       illustrationType: IllustrationType.video,
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   /// Saves the flag so splash never shows onboarding again,
//   /// then navigates to signup.
//   Future<void> _completeOnboarding() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('hasSeenOnboarding', true);
//     if (!mounted) return;
//     Navigator.of(context).pushReplacementNamed('/signup');
//   }

//   /// Skip also marks onboarding as seen, then goes to login.
//   Future<void> _skipOnboarding() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('hasSeenOnboarding', true);
//     if (!mounted) return;
//     Navigator.of(context).pushReplacementNamed('/login');
//   }

//   void _nextPage() {
//     if (_currentPage == onboardingPages.length - 1) {
//       _completeOnboarding(); // ✅ saves flag + goes to /signup
//     } else {
//       _pageController.nextPage(
//         duration: const Duration(milliseconds: 400),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   void _previousPage() {
//     if (_currentPage > 0) {
//       _pageController.previousPage(
//         duration: const Duration(milliseconds: 400),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isLastPage = _currentPage == onboardingPages.length - 1;

//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         body: Stack(
//           children: [
//             PageView.builder(
//               controller: _pageController,
//               onPageChanged: (index) {
//                 setState(() {
//                   _currentPage = index;
//                 });
//               },
//               itemCount: onboardingPages.length,
//               itemBuilder: (context, index) {
//                 return OnboardingPageWidget(page: onboardingPages[index]);
//               },
//             ),

//             // Skip Button
//             Positioned(
//               top: MediaQuery.of(context).padding.top + 12,
//               right: 20,
//               child: Material(
//                 color: Colors.transparent,
//                 child: InkWell(
//                   onTap: _skipOnboarding, // ✅ saves flag + goes to /login
//                   borderRadius: BorderRadius.circular(12),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 8,
//                     ),
//                     child: Text(
//                       'Skip',
//                       style: TextStyle(
//                         color: Colors.white.withOpacity(0.9),
//                         fontSize: 15,
//                         fontWeight: FontWeight.w600,
//                         letterSpacing: 0.5,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             // Bottom Control Panel
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 padding: EdgeInsets.fromLTRB(
//                   18,
//                   20,
//                   18,
//                   16 + MediaQuery.of(context).padding.bottom,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 15,
//                       offset: const Offset(0, -3),
//                     ),
//                   ],
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(24),
//                     topRight: Radius.circular(24),
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: List.generate(
//                         onboardingPages.length,
//                         (index) => AnimatedContainer(
//                           duration: const Duration(milliseconds: 300),
//                           margin: const EdgeInsets.symmetric(horizontal: 5),
//                           width: _currentPage == index ? 28 : 8,
//                           height: 8,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(4),
//                             color: _currentPage == index
//                                 ? const Color(0xFF1A3A6B)
//                                 : const Color(0xFFD0D8E8),
//                             boxShadow: _currentPage == index
//                                 ? [
//                                     BoxShadow(
//                                       color: const Color(
//                                         0xFF1A3A6B,
//                                       ).withOpacity(0.3),
//                                       blurRadius: 6,
//                                       offset: const Offset(0, 2),
//                                     ),
//                                   ]
//                                 : [],
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height:
//                           MediaQuery.of(context).orientation ==
//                               Orientation.landscape
//                           ? 12
//                           : 22,
//                     ),
//                     _buildResponsiveButtons(context, isLastPage),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildResponsiveButtons(BuildContext context, bool isLastPage) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     if (screenWidth < 550) {
//       return Column(
//         children: [
//           SizedBox(
//             width: double.infinity,
//             height: 50,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF1A3A6B),
//                 elevation: 3,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 shadowColor: const Color(0xFF1A3A6B).withOpacity(0.4),
//               ),
//               onPressed: _nextPage,
//               child: Text(
//                 isLastPage ? 'Get Started' : 'Next',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                   fontWeight: FontWeight.w700,
//                   letterSpacing: 0.4,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           AnimatedOpacity(
//             opacity: _currentPage > 0 ? 1.0 : 0.3,
//             duration: const Duration(milliseconds: 300),
//             child: SizedBox(
//               width: double.infinity,
//               height: 50,
//               child: OutlinedButton(
//                 style: OutlinedButton.styleFrom(
//                   side: const BorderSide(color: Color(0xFF1A3A6B), width: 2),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 onPressed: _currentPage > 0 ? _previousPage : null,
//                 child: const Text(
//                   'Back',
//                   style: TextStyle(
//                     color: Color(0xFF1A3A6B),
//                     fontSize: 15,
//                     fontWeight: FontWeight.w700,
//                     letterSpacing: 0.4,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       );
//     } else {
//       return Row(
//         children: [
//           Expanded(
//             child: AnimatedOpacity(
//               opacity: _currentPage > 0 ? 1.0 : 0.3,
//               duration: const Duration(milliseconds: 300),
//               child: SizedBox(
//                 height: 50,
//                 child: OutlinedButton(
//                   style: OutlinedButton.styleFrom(
//                     side: const BorderSide(color: Color(0xFF1A3A6B), width: 2),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onPressed: _currentPage > 0 ? _previousPage : null,
//                   child: const Text(
//                     'Back',
//                     style: TextStyle(
//                       color: Color(0xFF1A3A6B),
//                       fontSize: 15,
//                       fontWeight: FontWeight.w700,
//                       letterSpacing: 0.4,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: SizedBox(
//               height: 50,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF1A3A6B),
//                   elevation: 3,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   shadowColor: const Color(0xFF1A3A6B).withOpacity(0.4),
//                 ),
//                 onPressed: _nextPage,
//                 child: Text(
//                   isLastPage ? 'Get Started' : 'Next',
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w700,
//                     letterSpacing: 0.4,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       );
//     }
//   }
// }

// // ✨ ONBOARDING PAGE WIDGET
// class OnboardingPageWidget extends StatefulWidget {
//   final OnboardingPageData page;

//   const OnboardingPageWidget({super.key, required this.page});

//   @override
//   State<OnboardingPageWidget> createState() => _OnboardingPageWidgetState();
// }

// class _OnboardingPageWidgetState extends State<OnboardingPageWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _setupAnimations();
//   }

//   void _setupAnimations() {
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 800),
//       vsync: this,
//     );

//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
//     );

//     _slideAnimation =
//         Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
//           CurvedAnimation(
//             parent: _animationController,
//             curve: Curves.easeOutBack,
//           ),
//         );

//     _scaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
//     );

//     _animationController.forward();
//   }

//   @override
//   void didUpdateWidget(OnboardingPageWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.page != widget.page) {
//       _animationController.reset();
//       _setupAnimations();
//     }
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final screenWidth = screenSize.width;
//     final screenHeight = screenSize.height;
//     final isPortrait =
//         MediaQuery.of(context).orientation == Orientation.portrait;

//     late double illustrationSize;
//     late double titleFontSize;
//     late double descriptionFontSize;
//     late double horizontalPadding;

//     if (screenWidth < 350) {
//       illustrationSize = 140;
//       titleFontSize = 22;
//       descriptionFontSize = 11.5;
//       horizontalPadding = 16;
//     } else if (screenWidth < 400) {
//       illustrationSize = 160;
//       titleFontSize = 24;
//       descriptionFontSize = 12;
//       horizontalPadding = 18;
//     } else if (screenWidth < 550) {
//       illustrationSize = 180;
//       titleFontSize = 26;
//       descriptionFontSize = 13;
//       horizontalPadding = 20;
//     } else if (screenWidth < 768) {
//       illustrationSize = 200;
//       titleFontSize = 30;
//       descriptionFontSize = 14;
//       horizontalPadding = 32;
//     } else {
//       illustrationSize = 220;
//       titleFontSize = 34;
//       descriptionFontSize = 15;
//       horizontalPadding = 48;
//     }

//     return Container(
//       width: screenWidth,
//       height: screenHeight,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [Color(0xFF1E4480), Color(0xFF152E5E)],
//         ),
//       ),
//       child: FadeTransition(
//         opacity: _fadeAnimation,
//         child: SlideTransition(
//           position: _slideAnimation,
//           child: SafeArea(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SizedBox(height: isPortrait ? 30 : 20),

//                   ScaleTransition(
//                     scale: _scaleAnimation,
//                     child: Container(
//                       width: illustrationSize,
//                       height: illustrationSize,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         gradient: LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                           colors: [
//                             Colors.white.withOpacity(0.12),
//                             Colors.white.withOpacity(0.04),
//                           ],
//                         ),
//                         border: Border.all(
//                           color: Colors.white.withOpacity(0.2),
//                           width: 2,
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.white.withOpacity(0.1),
//                             blurRadius: 25,
//                             offset: const Offset(0, 8),
//                           ),
//                         ],
//                       ),
//                       child: Center(
//                         child: CustomPaint(
//                           size: Size(
//                             illustrationSize * 0.7,
//                             illustrationSize * 0.7,
//                           ),
//                           painter: IllustrationPainter(
//                             type: widget.page.illustrationType,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),

//                   SizedBox(height: isPortrait ? 45 : 30),

//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: horizontalPadding,
//                     ),
//                     child: TweenAnimationBuilder<double>(
//                       tween: Tween(begin: 0.0, end: 1.0),
//                       duration: const Duration(milliseconds: 1000),
//                       curve: Curves.easeOut,
//                       builder: (context, value, child) {
//                         return Opacity(
//                           opacity: value,
//                           child: Transform.translate(
//                             offset: Offset(0, (1 - value) * 15),
//                             child: Text(
//                               widget.page.title,
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: titleFontSize,
//                                 fontWeight: FontWeight.w800,
//                                 letterSpacing: 0.5,
//                                 height: 1.3,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),

//                   SizedBox(height: isPortrait ? 16 : 12),

//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: horizontalPadding,
//                     ),
//                     child: TweenAnimationBuilder<double>(
//                       tween: Tween(begin: 0.0, end: 1.0),
//                       duration: const Duration(milliseconds: 1200),
//                       curve: Curves.easeOut,
//                       builder: (context, value, child) {
//                         return Opacity(
//                           opacity: value,
//                           child: Transform.translate(
//                             offset: Offset(0, (1 - value) * 12),
//                             child: Text(
//                               widget.page.description,
//                               style: TextStyle(
//                                 color: Colors.white.withOpacity(0.85),
//                                 fontSize: descriptionFontSize,
//                                 fontWeight: FontWeight.w400,
//                                 height: 1.6,
//                                 letterSpacing: 0.3,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),

//                   SizedBox(height: isPortrait ? 100 : 80),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Enum for illustration types
// enum IllustrationType { shopping, delivery, payment, student, wellness, video }

// // Custom painter for medical illustrations
// class IllustrationPainter extends CustomPainter {
//   final IllustrationType type;

//   IllustrationPainter({required this.type});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white
//       ..strokeWidth = 2.5
//       ..strokeCap = StrokeCap.round
//       ..strokeJoin = StrokeJoin.round;

//     final accentPaint = Paint()
//       ..color = const Color(0xFFE8C547)
//       ..strokeWidth = 2.5
//       ..strokeCap = StrokeCap.round
//       ..strokeJoin = StrokeJoin.round;

//     final w = size.width;
//     final h = size.height;

//     switch (type) {
//       case IllustrationType.shopping:
//         canvas.drawRRect(
//           RRect.fromRectAndRadius(
//             Rect.fromLTWH(w * 0.2, h * 0.3, w * 0.6, h * 0.5),
//             const Radius.circular(8),
//           ),
//           paint..style = PaintingStyle.stroke,
//         );
//         canvas.drawLine(
//           Offset(w * 0.35, h * 0.3),
//           Offset(w * 0.35, h * 0.1),
//           paint,
//         );
//         canvas.drawLine(
//           Offset(w * 0.65, h * 0.3),
//           Offset(w * 0.65, h * 0.1),
//           paint,
//         );
//         canvas.drawArc(
//           Rect.fromLTWH(w * 0.3, h * 0.05, w * 0.4, h * 0.2),
//           3.14,
//           3.14,
//           false,
//           paint,
//         );
//         break;

//       case IllustrationType.delivery:
//         canvas.drawRect(
//           Rect.fromLTWH(w * 0.1, h * 0.35, w * 0.8, h * 0.4),
//           paint..style = PaintingStyle.stroke,
//         );
//         canvas.drawCircle(Offset(w * 0.25, h * 0.75), w * 0.08, paint);
//         canvas.drawCircle(Offset(w * 0.75, h * 0.75), w * 0.08, paint);
//         canvas.drawLine(
//           Offset(w * 0.1, h * 0.45),
//           Offset(w * 0.05, h * 0.45),
//           paint,
//         );
//         break;

//       case IllustrationType.payment:
//         canvas.drawRRect(
//           RRect.fromRectAndRadius(
//             Rect.fromLTWH(w * 0.15, h * 0.25, w * 0.7, h * 0.45),
//             const Radius.circular(10),
//           ),
//           paint..style = PaintingStyle.stroke,
//         );
//         canvas.drawLine(
//           Offset(w * 0.2, h * 0.4),
//           Offset(w * 0.8, h * 0.4),
//           paint,
//         );
//         canvas.drawCircle(
//           Offset(w * 0.75, h * 0.6),
//           w * 0.08,
//           paint..style = PaintingStyle.stroke,
//         );
//         canvas.drawPath(
//           Path()
//             ..moveTo(w * 0.5, h * 0.15)
//             ..lineTo(w * 0.5, h * 0.05)
//             ..lineTo(w * 0.65, h * 0.15)
//             ..close(),
//           accentPaint..style = PaintingStyle.fill,
//         );
//         break;

//       case IllustrationType.student:
//         canvas.drawCircle(Offset(w * 0.5, h * 0.2), w * 0.12, paint);
//         canvas.drawRect(
//           Rect.fromLTWH(w * 0.35, h * 0.35, w * 0.3, h * 0.4),
//           paint..style = PaintingStyle.stroke,
//         );
//         canvas.drawLine(
//           Offset(w * 0.35, h * 0.55),
//           Offset(w * 0.65, h * 0.55),
//           paint,
//         );
//         canvas.drawLine(
//           Offset(w * 0.25, h * 0.6),
//           Offset(w * 0.45, h * 0.8),
//           paint,
//         );
//         canvas.drawLine(
//           Offset(w * 0.75, h * 0.6),
//           Offset(w * 0.55, h * 0.8),
//           paint,
//         );
//         break;

//       case IllustrationType.wellness:
//         final heartPath = Path();
//         heartPath.moveTo(w * 0.5, h * 0.75);
//         heartPath.cubicTo(w * 0.2, h * 0.5, w * 0.1, h * 0.4, w * 0.1, h * 0.3);
//         heartPath.cubicTo(
//           w * 0.1,
//           h * 0.15,
//           w * 0.25,
//           h * 0.05,
//           w * 0.35,
//           h * 0.05,
//         );
//         heartPath.cubicTo(
//           w * 0.45,
//           h * 0.05,
//           w * 0.5,
//           h * 0.15,
//           w * 0.5,
//           h * 0.2,
//         );
//         heartPath.cubicTo(
//           w * 0.5,
//           h * 0.15,
//           w * 0.55,
//           h * 0.05,
//           w * 0.65,
//           h * 0.05,
//         );
//         heartPath.cubicTo(
//           w * 0.75,
//           h * 0.05,
//           w * 0.9,
//           h * 0.15,
//           w * 0.9,
//           h * 0.3,
//         );
//         heartPath.cubicTo(
//           w * 0.9,
//           h * 0.4,
//           w * 0.8,
//           h * 0.5,
//           w * 0.5,
//           h * 0.75,
//         );
//         heartPath.close();
//         canvas.drawPath(heartPath, accentPaint..style = PaintingStyle.fill);
//         break;

//       case IllustrationType.video:
//         canvas.drawRRect(
//           RRect.fromRectAndRadius(
//             Rect.fromLTWH(w * 0.15, h * 0.15, w * 0.7, h * 0.7),
//             const Radius.circular(12),
//           ),
//           paint..style = PaintingStyle.stroke,
//         );
//         final playPath = Path();
//         playPath.moveTo(w * 0.35, h * 0.3);
//         playPath.lineTo(w * 0.35, h * 0.7);
//         playPath.lineTo(w * 0.65, h * 0.5);
//         playPath.close();
//         canvas.drawPath(playPath, accentPaint..style = PaintingStyle.fill);
//         break;
//     }
//   }

//   @override
//   bool shouldRepaint(IllustrationPainter oldDelegate) =>
//       oldDelegate.type != type;
// }

// // Data model for onboarding pages
// class OnboardingPageData {
//   final String title;
//   final String description;
//   final IllustrationType illustrationType;

//   OnboardingPageData({
//     required this.title,
//     required this.description,
//     required this.illustrationType,
//   });
// }










import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  final List<OnboardingPageData> onboardingPages = [
    OnboardingPageData(
      title: 'Welcome to VeeSafe',
      description:
          'User friendly app for buying and selling of medical devices, medical equipments, medical disposable and medical fabric with doorstep delivery.',
      imagePath: 'assets/images/shopping.png',
    ),
    OnboardingPageData(
      title: 'Fast Delivery',
      description:
          'We deliver all your medical appliances at lightning speed with real-time tracking and secure packaging.',
      imagePath: 'assets/images/delivery.png',
    ),
    OnboardingPageData(
      title: 'Secured Payment',
      description:
          'We accept payments via Rupay, Visa, Credit Cards, Debit Cards, UPI and all through secured gateways.',
      imagePath: 'assets/images/payment.png',
    ),
    OnboardingPageData(
      title: 'Student Store',
      description:
          'To support medical students easily acquire high-quality equipments to continue their practice, subsidized medical and lab supplies are made available to them.',
      imagePath: 'assets/images/student.png',
    ),
    OnboardingPageData(
      title: 'Human Health & Wellness',
      description:
          'We are committed to provide our customers with quality healthcare and to have 24/7 access to best medical products and services at affordable prices.',
      imagePath: 'assets/images/wellness.png',
    ),
    OnboardingPageData(
      title: 'Video Commerce',
      description:
          'Shop smarter for better shopping experience through our innovative video commerce feature with live product demos.',
      imagePath: 'assets/images/video.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage == onboardingPages.length - 1) {
      Navigator.of(context).pushReplacementNamed('/signup');
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentPage == onboardingPages.length - 1;
    final screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1E4480),
                Color(0xFF152E5E),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // ── Skip Button Row ──────────────────────────────
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16, top: 8),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/login');
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),

                // ── PageView takes remaining space ───────────────
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemCount: onboardingPages.length,
                    itemBuilder: (context, index) {
                      return OnboardingPageWidget(
                        page: onboardingPages[index],
                      );
                    },
                  ),
                ),

                // ── Bottom Panel ─────────────────────────────────
                Container(
                  padding: EdgeInsets.fromLTRB(
                    20,
                    20,
                    20,
                    16 + MediaQuery.of(context).padding.bottom,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 15,
                        offset: const Offset(0, -3),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Dot indicators
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onboardingPages.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: _currentPage == index ? 28 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: _currentPage == index
                                  ? const Color(0xFF1A3A6B)
                                  : const Color(0xFFD0D8E8),
                              boxShadow: _currentPage == index
                                  ? [
                                      BoxShadow(
                                        color: const Color(0xFF1A3A6B)
                                            .withOpacity(0.3),
                                        blurRadius: 6,
                                        offset: const Offset(0, 2),
                                      ),
                                    ]
                                  : [],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildResponsiveButtons(context, isLastPage, screenWidth),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResponsiveButtons(
      BuildContext context, bool isLastPage, double screenWidth) {
    if (screenWidth < 550) {
      return Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A3A6B),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadowColor: const Color(0xFF1A3A6B).withOpacity(0.4),
              ),
              onPressed: _nextPage,
              child: Text(
                isLastPage ? 'Get Started' : 'Next',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.4,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          AnimatedOpacity(
            opacity: _currentPage > 0 ? 1.0 : 0.3,
            duration: const Duration(milliseconds: 300),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Color(0xFF1A3A6B),
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _currentPage > 0 ? _previousPage : null,
                child: const Text(
                  'Back',
                  style: TextStyle(
                    color: Color(0xFF1A3A6B),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: AnimatedOpacity(
              opacity: _currentPage > 0 ? 1.0 : 0.3,
              duration: const Duration(milliseconds: 300),
              child: SizedBox(
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xFF1A3A6B),
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _currentPage > 0 ? _previousPage : null,
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      color: Color(0xFF1A3A6B),
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A3A6B),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadowColor: const Color(0xFF1A3A6B).withOpacity(0.4),
                ),
                onPressed: _nextPage,
                child: Text(
                  isLastPage ? 'Get Started' : 'Next',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}

// ═══════════════════════════════════════════════════════
// ONBOARDING PAGE WIDGET
// ═══════════════════════════════════════════════════════
class OnboardingPageWidget extends StatefulWidget {
  final OnboardingPageData page;

  const OnboardingPageWidget({
    super.key,
    required this.page,
  });

  @override
  State<OnboardingPageWidget> createState() => _OnboardingPageWidgetState();
}

class _OnboardingPageWidgetState extends State<OnboardingPageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.15), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    _scaleAnimation = Tween<double>(begin: 0.88, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    _animationController.forward();
  }

  @override
  void didUpdateWidget(OnboardingPageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.page != widget.page) {
      _animationController.reset();
      _setupAnimations();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    // Responsive sizing
    late double illustrationSize;
    late double titleFontSize;
    late double descriptionFontSize;
    late double horizontalPadding;

    if (screenWidth < 350) {
      illustrationSize = screenHeight * 0.28;
      titleFontSize = 20;
      descriptionFontSize = 11.5;
      horizontalPadding = 16;
    } else if (screenWidth < 400) {
      illustrationSize = screenHeight * 0.30;
      titleFontSize = 22;
      descriptionFontSize = 12;
      horizontalPadding = 18;
    } else if (screenWidth < 550) {
      illustrationSize = screenHeight * 0.32;
      titleFontSize = 24;
      descriptionFontSize = 13;
      horizontalPadding = 24;
    } else if (screenWidth < 768) {
      illustrationSize = screenHeight * 0.30;
      titleFontSize = 28;
      descriptionFontSize = 14;
      horizontalPadding = 32;
    } else {
      illustrationSize = screenHeight * 0.28;
      titleFontSize = 32;
      descriptionFontSize = 15;
      horizontalPadding = 48;
    }

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Column(
          children: [
            // ── TOP: Image occupies upper 55% ──────────────────
            Expanded(
              flex: 55,
              child: Center(
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Container(
                    width: illustrationSize,
                    height: illustrationSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.18),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.08),
                          blurRadius: 20,
                          offset: const Offset(0, -4),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Image.asset(
                        widget.page.imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ── BOTTOM: Text content in lower 45% ──────────────
            Expanded(
              flex: 45,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Title
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, (1 - value) * 18),
                            child: Text(
                              widget.page.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.5,
                                height: 1.3,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: isPortrait ? 14 : 10),

                    // Description
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: const Duration(milliseconds: 1100),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, (1 - value) * 14),
                            child: Text(
                              widget.page.description,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.82),
                                fontSize: descriptionFontSize,
                                fontWeight: FontWeight.w400,
                                height: 1.65,
                                letterSpacing: 0.3,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════
// DATA MODEL
// ═══════════════════════════════════════════════════════
class OnboardingPageData {
  final String title;
  final String description;
  final String imagePath;

  OnboardingPageData({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
