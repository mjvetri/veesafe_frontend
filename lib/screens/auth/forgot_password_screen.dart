// import 'package:flutter/material.dart';

// class ForgotPasswordScreen extends StatefulWidget {
//   const ForgotPasswordScreen({super.key});

//   @override
//   State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
// }

// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//   late TextEditingController _emailOrPhoneController;

//   @override
//   void initState() {
//     super.initState();
//     _emailOrPhoneController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _emailOrPhoneController.dispose();
//     super.dispose();
//   }

//   void _handleSubmit() {
//     if (_emailOrPhoneController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please enter email or mobile number'),
//         ),
//       );
//       return;
//     }

//     // TODO: Implement forgot password logic
//     Navigator.of(context).pushNamed('/reset_password');
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final isMobile = screenSize.width < 550;

//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFF1E4480),
//               Color(0xFF152E5E),
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: isMobile ? 20 : 40,
//                 vertical: 20,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(height: screenSize.height * 0.05),

//                   // Back Button
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: GestureDetector(
//                       onTap: () => Navigator.pop(context),
//                       child: const Icon(
//                         Icons.arrow_back,
//                         color: Colors.white,
//                         size: 24,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenSize.height * 0.05),

//                   // Title
//                   Text(
//                     'Forgot Password',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: isMobile ? 28 : 36,
//                       fontWeight: FontWeight.w800,
//                       letterSpacing: 0.5,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 12),

//                   // Subtitle
//                   Text(
//                     'It happened! Enter your email id\nor mobile number associated with the account',
//                     style: TextStyle(
//                       color: Colors.white.withOpacity(0.8),
//                       fontSize: isMobile ? 13 : 15,
//                       fontWeight: FontWeight.w400,
//                       height: 1.6,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: screenSize.height * 0.1),

//                   // Email or Phone Field
//                   TextField(
//                     controller: _emailOrPhoneController,
//                     decoration: InputDecoration(
//                       hintText: 'Mobile number / E-mail id',
//                       hintStyle: TextStyle(
//                         color: Colors.grey[400],
//                         fontSize: 14,
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25),
//                         borderSide: BorderSide.none,
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 20,
//                         vertical: 16,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenSize.height * 0.12),

//                   // Submit Button
//                   SizedBox(
//                     width: double.infinity,
//                     height: 50,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF4A90E2),
//                         elevation: 4,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         shadowColor: const Color(0xFF4A90E2).withOpacity(0.4),
//                       ),
//                       onPressed: _handleSubmit,
//                       child: const Text(
//                         'SUBMIT',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w700,
//                           letterSpacing: 0.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenSize.height * 0.08),

//                   // Signup Link
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Already a customer? ',
//                         style: TextStyle(
//                           color: Colors.white.withOpacity(0.7),
//                           fontSize: 13,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).pushReplacementNamed('/login');
//                         },
//                         child: const Text(
//                           'Login',
//                           style: TextStyle(
//                             color: Color(0xFF4A90E2),
//                             fontSize: 13,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       GestureDetector(
//                         onTap: () {
//                           // TODO: Navigate to seller page
//                         },
//                         child: const Text(
//                           'Sell on Veesafe',
//                           style: TextStyle(
//                             color: Color(0xFF4A90E2),
//                             fontSize: 13,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: screenSize.height * 0.05),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// before new design

// import 'package:flutter/material.dart';

// class ForgotPasswordScreen extends StatefulWidget {
//   const ForgotPasswordScreen({super.key});

//   @override
//   State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
// }

// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//   late TextEditingController _emailOrPhoneController;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _emailOrPhoneController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _emailOrPhoneController.dispose();
//     super.dispose();
//   }

//   void _handleSubmit() {
//     if (_emailOrPhoneController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please enter email or mobile number'),
//         ),
//       );
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     });

//     // Simulate API call
//     Future.delayed(const Duration(seconds: 2), () {
//       if (mounted) {
//         setState(() {
//           _isLoading = false;
//         });
//         Navigator.of(context).pushReplacementNamed('/reset_password');
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final isMobile = screenSize.width < 600;
//     final isSmallMobile = screenSize.width < 400;

//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFF1E4480),
//               Color(0xFF152E5E),
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: isSmallMobile ? 16 : (isMobile ? 24 : 40),
//                 vertical: isMobile ? 20 : 40,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: screenSize.height * 0.03),

//                   // Back Button
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: GestureDetector(
//                       onTap: () => Navigator.pop(context),
//                       child: Icon(
//                         Icons.arrow_back,
//                         color: Colors.white,
//                         size: isSmallMobile ? 20 : 24,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenSize.height * 0.05),

//                   // Title
//                   Text(
//                     'Forgot Password',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: isSmallMobile ? 24 : (isMobile ? 28 : 36),
//                       fontWeight: FontWeight.w800,
//                       letterSpacing: 0.5,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 10),

//                   // Subtitle
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: isMobile ? 0 : 40,
//                     ),
//                     child: Text(
//                       'It happened! Enter your email id\nor mobile number associated with the account',
//                       style: TextStyle(
//                         color: Colors.white.withOpacity(0.85),
//                         fontSize: isSmallMobile ? 12 : (isMobile ? 14 : 15),
//                         fontWeight: FontWeight.w400,
//                         height: 1.6,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   SizedBox(height: screenSize.height * 0.08),

//                   // Email or Phone Field
//                   Container(
//                     constraints: BoxConstraints(
//                       maxWidth: isMobile ? double.infinity : 400,
//                     ),
//                     child: TextField(
//                       controller: _emailOrPhoneController,
//                       enabled: !_isLoading,
//                       decoration: InputDecoration(
//                         hintText: 'Mobile number / E-mail id',
//                         hintStyle: TextStyle(
//                           color: Colors.grey[400],
//                           fontSize: isSmallMobile ? 13 : 14,
//                         ),
//                         filled: true,
//                         fillColor: Colors.white,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(25),
//                           borderSide: BorderSide.none,
//                         ),
//                         contentPadding: EdgeInsets.symmetric(
//                           horizontal: 20,
//                           vertical: isSmallMobile ? 14 : 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenSize.height * 0.12),

//                   // Submit Button
//                   Container(
//                     constraints: BoxConstraints(
//                       maxWidth: isMobile ? double.infinity : 400,
//                     ),
//                     child: SizedBox(
//                       width: double.infinity,
//                       height: isSmallMobile ? 48 : 52,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF4A90E2),
//                           elevation: 4,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                           shadowColor: const Color(0xFF4A90E2).withOpacity(0.4),
//                         ),
//                         onPressed: _isLoading ? null : _handleSubmit,
//                         child: _isLoading
//                             ? SizedBox(
//                                 width: 20,
//                                 height: 20,
//                                 child: CircularProgressIndicator(
//                                   valueColor: AlwaysStoppedAnimation<Color>(
//                                     Colors.white.withOpacity(0.8),
//                                   ),
//                                   strokeWidth: 2,
//                                 ),
//                               )
//                             : Text(
//                                 'SUBMIT',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: isSmallMobile ? 14 : 15,
//                                   fontWeight: FontWeight.w700,
//                                   letterSpacing: 0.4,
//                                 ),
//                               ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenSize.height * 0.08),

//                   // Sign Up Link
//                   Container(
//                     constraints: BoxConstraints(
//                       maxWidth: isMobile ? double.infinity : 400,
//                     ),
//                     child: Wrap(
//                       alignment: WrapAlignment.center,
//                       spacing: 4,
//                       children: [
//                         Text(
//                           'Already a customer?',
//                           style: TextStyle(
//                             color: Colors.white.withOpacity(0.75),
//                             fontSize: isSmallMobile ? 11 : 12,
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.of(context)
//                                 .pushReplacementNamed('/login');
//                           },
//                           child: Text(
//                             'Login',
//                             style: TextStyle(
//                               color: Color(0xFF4A90E2),
//                               fontSize: isSmallMobile ? 11 : 12,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           'Sell on Veesafe',
//                           style: TextStyle(
//                             color: Color(0xFF4A90E2),
//                             fontSize: isSmallMobile ? 11 : 12,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: screenSize.height * 0.05),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//after new design  with different colour
// import 'package:flutter/material.dart';

// class ForgotPasswordScreen extends StatefulWidget {
//   const ForgotPasswordScreen({super.key});

//   @override
//   State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
// }

// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//   // ✅ ALL EXISTING CONTROLLERS PRESERVED
//   late TextEditingController _emailOrPhoneController;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _emailOrPhoneController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _emailOrPhoneController.dispose();
//     super.dispose();
//   }

//   void _handleSubmit() {
//     if (_emailOrPhoneController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter email or phone')),
//       );
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     });

//     Future.delayed(const Duration(seconds: 2), () {
//       if (mounted) {
//         setState(() {
//           _isLoading = false;
//         });
//         // ✅ Show success message instead of navigating
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Reset link sent to your email'),
//             duration: Duration(seconds: 3),
//           ),
//         );
//         // ✅ Optionally go back to login after 1 second
//         Future.delayed(const Duration(seconds: 1), () {
//           if (mounted) {
//             Navigator.of(context).pushReplacementNamed('/login');
//           }
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final isMobile = screenSize.width < 600;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // ✨ FULL-WIDTH HEADER
//             Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Color(0xFF008B9E),
//                     Color(0xFF00798A),
//                   ],
//                 ),
//               ),
//               child: SafeArea(
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'At Tazkiran',
//                         style: TextStyle(
//                           color: Colors.white.withOpacity(0.85),
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                           letterSpacing: 0.8,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       const Text(
//                         'Reset Password',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 34,
//                           fontWeight: FontWeight.w800,
//                           letterSpacing: 0.3,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(height: 14),
//                       Text(
//                         'Enter your email to receive a reset link',
//                         style: TextStyle(
//                           color: Colors.white.withOpacity(0.9),
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           height: 1.4,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             // ✨ FORM CONTAINER
//             Transform.translate(
//               offset: const Offset(0, -25),
//               child: Container(
//                 width: isMobile ? screenSize.width - 32 : screenSize.width - 80,
//                 margin: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 40),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(28),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.12),
//                       blurRadius: 24,
//                       offset: const Offset(0, 8),
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(isMobile ? 24 : 32),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Back Button
//                       GestureDetector(
//                         onTap: () => Navigator.pop(context),
//                         child: const Icon(
//                           Icons.arrow_back_rounded,
//                           color: Colors.black87,
//                           size: 26,
//                         ),
//                       ),
//                       const SizedBox(height: 22),

//                       // Email Label
//                       Text(
//                         'Email Address',
//                         style: TextStyle(
//                           color: Colors.grey[800],
//                           fontSize: 14,
//                           fontWeight: FontWeight.w700,
//                           letterSpacing: 0.2,
//                         ),
//                       ),
//                       const SizedBox(height: 10),

//                       // Input Field
//                       _buildTextField(
//                         controller: _emailOrPhoneController,
//                         hintText: 'Enter your email',
//                         prefixIcon: Icons.email_rounded,
//                       ),
//                       const SizedBox(height: 28),

//                       // Submit Button
//                       SizedBox(
//                         width: double.infinity,
//                         height: 52,
//                         child: ElevatedButton(
//                           onPressed: _isLoading ? null : _handleSubmit,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF008B9E),
//                             elevation: 0,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(26),
//                             ),
//                             disabledBackgroundColor: Colors.grey[400],
//                           ),
//                           child: _isLoading
//                               ? SizedBox(
//                                   width: 24,
//                                   height: 24,
//                                   child: CircularProgressIndicator(
//                                     valueColor: AlwaysStoppedAnimation<Color>(
//                                       Colors.white.withOpacity(0.9),
//                                     ),
//                                     strokeWidth: 2.5,
//                                   ),
//                                 )
//                               : const Text(
//                                   'Send Reset Link',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w800,
//                                     letterSpacing: 0.5,
//                                   ),
//                                 ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),

//                       // Back to Login
//                       Center(
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.of(context)
//                                 .pushReplacementNamed('/login');
//                           },
//                           child: const Text(
//                             'Back to Login',
//                             style: TextStyle(
//                               color: Color(0xFF008B9E),
//                               fontSize: 14,
//                               fontWeight: FontWeight.w800,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hintText,
//     required IconData prefixIcon,
//   }) {
//     return TextField(
//       controller: controller,
//       style: const TextStyle(
//         color: Colors.black87,
//         fontSize: 15,
//         fontWeight: FontWeight.w500,
//       ),
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: TextStyle(
//           color: Colors.grey[400],
//           fontSize: 14,
//           fontWeight: FontWeight.w400,
//         ),
//         prefixIcon: Icon(
//           prefixIcon,
//           color: Colors.grey[400],
//           size: 20,
//         ),
//         filled: true,
//         fillColor: Colors.grey[50],
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(14),
//           borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(14),
//           borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(14),
//           borderSide: const BorderSide(color: Color(0xFF008B9E), width: 2),
//         ),
//         contentPadding:
//             const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class ForgotPasswordScreen extends StatefulWidget {
//   const ForgotPasswordScreen({super.key});

//   @override
//   State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
// }

// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//   late TextEditingController _emailOrPhoneController;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _emailOrPhoneController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _emailOrPhoneController.dispose();
//     super.dispose();
//   }

//   void _handleSubmit() {
//     if (_emailOrPhoneController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter email or phone')),
//       );
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     });

//     Future.delayed(const Duration(seconds: 2), () {
//       if (mounted) {
//         setState(() {
//           _isLoading = false;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Reset link sent to your email'),
//             duration: Duration(seconds: 3),
//           ),
//         );
//         Future.delayed(const Duration(seconds: 1), () {
//           if (mounted) {
//             Navigator.of(context).pushReplacementNamed('/login');
//           }
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isPortrait =
//         MediaQuery.of(context).orientation == Orientation.portrait;

//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFF1A3A6B),
//               Color(0xFF244A7E),
//             ],
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.only(
//                   top: isPortrait ? 40 : 20,
//                   bottom: isPortrait ? 30 : 20,
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'At VeeSafe',
//                       style: TextStyle(
//                         color: Colors.white.withOpacity(0.8),
//                         fontSize: isPortrait ? 11 : 13,
//                         fontWeight: FontWeight.w600,
//                         letterSpacing: 1.5,
//                       ),
//                     ),
//                     SizedBox(height: isPortrait ? 14 : 8),
//                     Text(
//                       'Reset Password',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: isPortrait ? 38 : 32,
//                         fontWeight: FontWeight.w800,
//                         letterSpacing: 0.3,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: isPortrait ? 10 : 6),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: isPortrait ? 28 : 40),
//                       child: Text(
//                         'Enter your email or phone number to receive a password reset link',
//                         style: TextStyle(
//                           color: Colors.white.withOpacity(0.85),
//                           fontSize: isPortrait ? 13 : 12,
//                           fontWeight: FontWeight.w400,
//                           height: 1.5,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: double.infinity,
//                 margin: EdgeInsets.symmetric(horizontal: isPortrait ? 10 : 20),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(28),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.12),
//                       blurRadius: 25,
//                       offset: const Offset(0, 8),
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: isPortrait ? 22 : 32,
//                     vertical: isPortrait ? 32 : 28,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       GestureDetector(
//                         onTap: () => Navigator.pop(context),
//                         child: Icon(
//                           Icons.arrow_back_rounded,
//                           color: const Color(0xFF1A3A6B),
//                           size: 26,
//                         ),
//                       ),
//                       SizedBox(height: isPortrait ? 22 : 16),
//                       Text(
//                         'Email or Phone',
//                         style: TextStyle(
//                           color: Colors.grey[900],
//                           fontSize: 14,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       TextField(
//                         controller: _emailOrPhoneController,
//                         decoration: InputDecoration(
//                           hintText: 'Enter your email or phone',
//                           hintStyle: TextStyle(
//                             color: Colors.grey[400],
//                             fontSize: 14,
//                           ),
//                           prefixIcon: Icon(
//                             Icons.email_rounded,
//                             color: Colors.grey[400],
//                           ),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide(
//                               color: Colors.grey[300]!,
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: BorderSide(
//                               color: Colors.grey[300]!,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                             borderSide: const BorderSide(
//                               color: Color(0xFF1A3A6B),
//                               width: 2,
//                             ),
//                           ),
//                           filled: true,
//                           fillColor: Colors.grey[50],
//                           contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 14,
//                             vertical: 12,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: isPortrait ? 28 : 20),
//                       SizedBox(
//                         width: double.infinity,
//                         height: 52,
//                         child: ElevatedButton(
//                           onPressed: _isLoading ? null : _handleSubmit,
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF1A3A6B),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(26),
//                             ),
//                             elevation: 0,
//                           ),
//                           child: _isLoading
//                               ? SizedBox(
//                                   width: 24,
//                                   height: 24,
//                                   child: CircularProgressIndicator(
//                                     valueColor: AlwaysStoppedAnimation<Color>(
//                                       Colors.white.withOpacity(0.8),
//                                     ),
//                                     strokeWidth: 2.5,
//                                   ),
//                                 )
//                               : const Text(
//                                   'Send Reset Link',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w800,
//                                     letterSpacing: 0.5,
//                                   ),
//                                 ),
//                         ),
//                       ),
//                       SizedBox(height: isPortrait ? 16 : 12),
//                       Center(
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.of(context)
//                                 .pushReplacementNamed('/login');
//                           },
//                           child: const Text(
//                             'Back to Login',
//                             style: TextStyle(
//                               color: Color(0xFF1A3A6B),
//                               fontSize: 14,
//                               fontWeight: FontWeight.w800,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: isPortrait ? 12 : 8),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: isPortrait ? 20 : 16),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // ✨ Form key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _emailOrPhoneController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailOrPhoneController = TextEditingController();
  }

  @override
  void dispose() {
    _emailOrPhoneController.dispose();
    super.dispose();
  }

  // ✨ Email/Phone validation function
  String? _validateEmailOrPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email or phone is required';
    }

    // Check if it's an email
    if (value.contains('@')) {
      if (!value.contains('@')) {
        return 'Enter a valid email';
      }

      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );

      if (!emailRegex.hasMatch(value)) {
        return 'Enter a valid email';
      }
    }
    // Check if it's a phone number
    else {
      // Phone must be at least 10 digits
      final phoneRegex = RegExp(r'^\d{10,}$');
      if (!phoneRegex.hasMatch(value.replaceAll(RegExp(r'[^\d]'), ''))) {
        return 'Enter a valid phone number (10+ digits)';
      }
    }

    return null;
  }

  void _handleSubmit() {
    print('📌 Button Clicked');

    // ✨ Validate form
    final isValid = _formKey.currentState?.validate() ?? false;
    print('✅ Validation Result: $isValid');

    if (!isValid) {
      print('❌ Email/Phone is invalid - NOT proceeding');
      return;
    }

    print('✅ Email/Phone is valid - Proceeding');

    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Reset link sent to your email'),
            duration: Duration(seconds: 3),
          ),
        );
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            // ✨ UPDATED: Navigate to LOGIN instead of reset-password
            Navigator.of(context).pushReplacementNamed('/login');
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1A3A6B), Color(0xFF244A7E)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: isPortrait ? 40 : 20,
                  bottom: isPortrait ? 30 : 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'At VeeSafe',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: isPortrait ? 11 : 13,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: isPortrait ? 14 : 8),
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isPortrait ? 38 : 32,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: isPortrait ? 10 : 6),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isPortrait ? 28 : 40,
                      ),
                      child: Text(
                        'Enter your email or phone number to receive a password reset link',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                          fontSize: isPortrait ? 13 : 12,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: isPortrait ? 10 : 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 25,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isPortrait ? 22 : 32,
                    vertical: isPortrait ? 32 : 28,
                  ),
                  // ✨ Form wrapper
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            color: Color(0xFF1A3A6B),
                            size: 26,
                          ),
                        ),
                        SizedBox(height: isPortrait ? 22 : 16),
                        Text(
                          'Email or Phone',
                          style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // ✨ TextFormField with validator
                        TextFormField(
                          controller: _emailOrPhoneController,
                          keyboardType: TextInputType.emailAddress,
                          enabled: !_isLoading,
                          // ✨ Validator
                          validator: _validateEmailOrPhone,
                          // ✨ Real-time validation
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            hintText: 'Enter your email or phone',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            ),
                            prefixIcon: Icon(
                              Icons.email_rounded,
                              color: Colors.grey[400],
                            ),
                            // ✨ Error styling
                            errorStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            // ✨ Reserve space for error
                            helperText: ' ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFF1A3A6B),
                                width: 2,
                              ),
                            ),
                            // ✨ Error border
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                          ),
                        ),
                        SizedBox(height: isPortrait ? 28 : 20),
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _handleSubmit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1A3A6B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(26),
                              ),
                              elevation: 0,
                            ),
                            child: _isLoading
                                ? SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white.withOpacity(0.8),
                                      ),
                                      strokeWidth: 2.5,
                                    ),
                                  )
                                : const Text(
                                    'Send Reset Link',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                          ),
                        ),
                        SizedBox(height: isPortrait ? 16 : 12),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(
                                context,
                              ).pushReplacementNamed('/login');
                            },
                            child: const Text(
                              'Back to Login',
                              style: TextStyle(
                                color: Color(0xFF1A3A6B),
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: isPortrait ? 12 : 8),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: isPortrait ? 20 : 16),
            ],
          ),
        ),
      ),
    );
  }
}
