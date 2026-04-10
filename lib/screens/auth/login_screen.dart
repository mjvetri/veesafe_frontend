// // import 'package:flutter/material.dart';
// // import 'package:flutter/gestures.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class LoginScreen extends StatefulWidget {
// //   const LoginScreen({super.key});

// //   @override
// //   State<LoginScreen> createState() => _LoginScreenState();
// // }

// // class _LoginScreenState extends State<LoginScreen> {
// //   // ✨ ADD: GlobalKey for Form Validation
// //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// //   late TextEditingController _phoneController;
// //   late TextEditingController _passwordController;
// //   bool _rememberMe = false;
// //   bool _obscurePassword = true;
// //   bool _isLoading = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _phoneController = TextEditingController();
// //     _passwordController = TextEditingController();

// //     // ✨ ADD: Load Remember Me credentials
// //     _loadRememberedCredentials();
// //   }

// //   // ✨ ADD: Load saved credentials from SharedPreferences
// //   Future<void> _loadRememberedCredentials() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     final rememberMe = prefs.getBool('rememberMe') ?? false;

// //     if (rememberMe) {
// //       final savedEmail = prefs.getString('savedEmail') ?? '';
// //       final savedPassword = prefs.getString('savedPassword') ?? '';

// //       setState(() {
// //         _phoneController.text = savedEmail;
// //         _passwordController.text = savedPassword;
// //         _rememberMe = true;
// //       });
// //     }
// //   }

// //   // ✨ ADD: Save credentials to SharedPreferences
// //   Future<void> _saveCredentials() async {
// //     final prefs = await SharedPreferences.getInstance();

// //     if (_rememberMe) {
// //       await prefs.setString('savedEmail', _phoneController.text);
// //       await prefs.setString('savedPassword', _passwordController.text);
// //       await prefs.setBool('rememberMe', true);
// //     } else {
// //       await prefs.remove('savedEmail');
// //       await prefs.remove('savedPassword');
// //       await prefs.setBool('rememberMe', false);
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     _phoneController.dispose();
// //     _passwordController.dispose();
// //     super.dispose();
// //   }

// //   void _handleLogin() {
// //     // ✨ ADD: Form validation before login
// //     if (!_formKey.currentState!.validate()) {
// //       return;
// //     }

// //     // ✨ ADD: Save credentials if remember me is checked
// //     _saveCredentials();

// //     setState(() {
// //       _isLoading = true;
// //     });
// //     Future.delayed(const Duration(seconds: 2), () {
// //       if (mounted) {
// //         setState(() {
// //           _isLoading = false;
// //         });
// //         Navigator.of(context).pushNamed('/home');
// //       }
// //     });
// //   }

// //   void _handleGoogleLogin() {}
// //   void _handleAppleLogin() {}

// //   @override
// //   Widget build(BuildContext context) {
// //     final orientation = MediaQuery.of(context).orientation;
// //     final isPortrait = orientation == Orientation.portrait;

// //     return Scaffold(
// //       backgroundColor: Colors.transparent,
// //       body: Container(
// //         width: double.infinity,
// //         height: double.infinity,
// //         decoration: const BoxDecoration(
// //           gradient: LinearGradient(
// //             begin: Alignment.topCenter,
// //             end: Alignment.bottomCenter,
// //             colors: [
// //               Color(0xFF1A3A6B),
// //               Color(0xFF244A7E),
// //             ],
// //           ),
// //         ),
// //         child: SingleChildScrollView(
// //           child: Column(
// //             children: [
// //               // ✨ BLUE HEADER (Top section with text)
// //               Container(
// //                 width: double.infinity,
// //                 padding: EdgeInsets.only(
// //                   top: isPortrait ? 40 : 20,
// //                   bottom: isPortrait ? 30 : 20,
// //                 ),
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Text(
// //                       'At VeeSafe',
// //                       style: TextStyle(
// //                         color: Colors.white.withOpacity(0.8),
// //                         fontSize: isPortrait ? 11 : 13,
// //                         fontWeight: FontWeight.w600,
// //                         letterSpacing: 1.5,
// //                       ),
// //                     ),
// //                     SizedBox(height: isPortrait ? 14 : 8),
// //                     Text(
// //                       'Welcome Back',
// //                       style: TextStyle(
// //                         color: Colors.white,
// //                         fontSize: isPortrait ? 38 : 32,
// //                         fontWeight: FontWeight.w800,
// //                         letterSpacing: 0.3,
// //                       ),
// //                       textAlign: TextAlign.center,
// //                     ),
// //                     SizedBox(height: isPortrait ? 10 : 6),
// //                     Padding(
// //                       padding: EdgeInsets.symmetric(
// //                         horizontal: isPortrait ? 28 : 40,
// //                       ),
// //                       child: Text(
// //                         'Fill out the information below in order to access your account.',
// //                         style: TextStyle(
// //                           color: Colors.white.withOpacity(0.85),
// //                           fontSize: isPortrait ? 13 : 12,
// //                           fontWeight: FontWeight.w400,
// //                           height: 1.5,
// //                         ),
// //                         textAlign: TextAlign.center,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),

// //               // ✨ WHITE CARD (Form - all rounded corners)
// //               Container(
// //                 width: double.infinity,
// //                 margin: EdgeInsets.symmetric(
// //                   horizontal: isPortrait ? 10 : 20,
// //                 ),
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(28),
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: Colors.black.withOpacity(0.12),
// //                       blurRadius: 25,
// //                       offset: const Offset(0, 8),
// //                     ),
// //                   ],
// //                 ),
// //                 // ✨ WRAP IN FORM WIDGET
// //                 child: Form(
// //                   key: _formKey,
// //                   child: Padding(
// //                     padding: EdgeInsets.symmetric(
// //                       horizontal: isPortrait ? 22 : 32,
// //                       vertical: isPortrait ? 26 : 24,
// //                     ),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         // ✨ TAB TOGGLE (Log In / Sign up)
// //                         Container(
// //                           decoration: BoxDecoration(
// //                             color: Colors.grey[100],
// //                             borderRadius: BorderRadius.circular(16),
// //                           ),
// //                           child: Row(
// //                             children: ['Log In', 'Sign up'].map((tab) {
// //                               final isActive = tab == 'Log In';
// //                               return Expanded(
// //                                 child: GestureDetector(
// //                                   onTap: () {
// //                                     if (!isActive) {
// //                                       Navigator.of(context)
// //                                           .pushReplacementNamed('/signup');
// //                                     }
// //                                   },
// //                                   child: Container(
// //                                     padding: const EdgeInsets.symmetric(
// //                                         vertical: 12),
// //                                     decoration: BoxDecoration(
// //                                       color: isActive
// //                                           ? Colors.white
// //                                           : Colors.transparent,
// //                                       borderRadius: BorderRadius.circular(12),
// //                                       boxShadow: isActive
// //                                           ? [
// //                                               BoxShadow(
// //                                                 color: Colors.black
// //                                                     .withOpacity(0.06),
// //                                                 blurRadius: 8,
// //                                                 offset: const Offset(0, 1),
// //                                               ),
// //                                             ]
// //                                           : null,
// //                                     ),
// //                                     child: Text(
// //                                       tab,
// //                                       textAlign: TextAlign.center,
// //                                       style: TextStyle(
// //                                         color: isActive
// //                                             ? const Color(0xFF1A3A6B)
// //                                             : Colors.grey[500],
// //                                         fontSize: 14,
// //                                         fontWeight: isActive
// //                                             ? FontWeight.w700
// //                                             : FontWeight.w500,
// //                                       ),
// //                                     ),
// //                                   ),
// //                                 ),
// //                               );
// //                             }).toList(),
// //                           ),
// //                         ),
// //                         SizedBox(height: isPortrait ? 22 : 16),

// //                         // Email - ✨ CHANGED TO TextFormField WITH VALIDATION
// //                         Text(
// //                           'Email',
// //                           style: TextStyle(
// //                             color: Colors.grey[900],
// //                             fontSize: 14,
// //                             fontWeight: FontWeight.w700,
// //                           ),
// //                         ),
// //                         const SizedBox(height: 8),
// //                         TextFormField(
// //                           controller: _phoneController,
// //                           // ✨ ADD: Email Validation
// //                           validator: (value) {
// //                             if (value == null || value.isEmpty) {
// //                               return 'Email is required';
// //                             }
// //                             // ✨ ADD: Email format validation
// //                             final emailRegex = RegExp(
// //                               r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
// //                             );
// //                             if (!emailRegex.hasMatch(value)) {
// //                               return 'Please enter a valid email';
// //                             }
// //                             return null;
// //                           },
// //                           decoration: InputDecoration(
// //                             hintText: 'Enter your email',
// //                             hintStyle: TextStyle(
// //                               color: Colors.grey[400],
// //                               fontSize: 14,
// //                             ),
// //                             prefixIcon: Icon(
// //                               Icons.email_rounded,
// //                               color: Colors.grey[400],
// //                             ),
// //                             border: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(12),
// //                               borderSide: BorderSide(
// //                                 color: Colors.grey[300]!,
// //                               ),
// //                             ),
// //                             enabledBorder: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(12),
// //                               borderSide: BorderSide(
// //                                 color: Colors.grey[300]!,
// //                               ),
// //                             ),
// //                             focusedBorder: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(12),
// //                               borderSide: const BorderSide(
// //                                 color: Color(0xFF1A3A6B),
// //                                 width: 2,
// //                               ),
// //                             ),
// //                             filled: true,
// //                             fillColor: Colors.grey[50],
// //                             contentPadding: const EdgeInsets.symmetric(
// //                               horizontal: 14,
// //                               vertical: 12,
// //                             ),
// //                           ),
// //                         ),
// //                         SizedBox(height: isPortrait ? 16 : 12),

// //                         // Password - ✨ CHANGED TO TextFormField WITH VALIDATION
// //                         Text(
// //                           'Password',
// //                           style: TextStyle(
// //                             color: Colors.grey[900],
// //                             fontSize: 14,
// //                             fontWeight: FontWeight.w700,
// //                           ),
// //                         ),
// //                         const SizedBox(height: 8),
// //                         TextFormField(
// //                           controller: _passwordController,
// //                           obscureText: _obscurePassword,
// //                           // ✨ ADD: Password Validation
// //                           validator: (value) {
// //                             if (value == null || value.isEmpty) {
// //                               return 'Password is required';
// //                             }
// //                             if (value.length < 6) {
// //                               return 'Password must be at least 6 characters';
// //                             }
// //                             return null;
// //                           },
// //                           decoration: InputDecoration(
// //                             hintText: 'Enter your Password',
// //                             hintStyle: TextStyle(
// //                               color: Colors.grey[400],
// //                               fontSize: 14,
// //                             ),
// //                             prefixIcon: Icon(
// //                               Icons.lock_rounded,
// //                               color: Colors.grey[400],
// //                             ),
// //                             suffixIcon: GestureDetector(
// //                               onTap: () {
// //                                 setState(() {
// //                                   _obscurePassword = !_obscurePassword;
// //                                 });
// //                               },
// //                               child: Icon(
// //                                 _obscurePassword
// //                                     ? Icons.visibility_off_rounded
// //                                     : Icons.visibility_rounded,
// //                                 color: Colors.grey[400],
// //                               ),
// //                             ),
// //                             border: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(12),
// //                               borderSide: BorderSide(
// //                                 color: Colors.grey[300]!,
// //                               ),
// //                             ),
// //                             enabledBorder: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(12),
// //                               borderSide: BorderSide(
// //                                 color: Colors.grey[300]!,
// //                               ),
// //                             ),
// //                             focusedBorder: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(12),
// //                               borderSide: const BorderSide(
// //                                 color: Color(0xFF1A3A6B),
// //                                 width: 2,
// //                               ),
// //                             ),
// //                             filled: true,
// //                             fillColor: Colors.grey[50],
// //                             contentPadding: const EdgeInsets.symmetric(
// //                               horizontal: 14,
// //                               vertical: 12,
// //                             ),
// //                           ),
// //                         ),
// //                         SizedBox(height: isPortrait ? 14 : 10),

// //                         // Remember Me & Forgot Password
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             Row(
// //                               children: [
// //                                 // ✨ MODIFY: Remember Me Checkbox - Now saves/clears credentials
// //                                 Checkbox(
// //                                   value: _rememberMe,
// //                                   onChanged: (value) {
// //                                     setState(() {
// //                                       _rememberMe = value ?? false;
// //                                     });
// //                                     // ✨ ADD: Save/Clear immediately when toggled
// //                                     _saveCredentials();
// //                                   },
// //                                   activeColor: const Color(0xFF1A3A6B),
// //                                   side: BorderSide(
// //                                     color: Colors.grey[400]!,
// //                                   ),
// //                                 ),
// //                                 Text(
// //                                   'Remember me',
// //                                   style: TextStyle(
// //                                     color: Colors.grey[700],
// //                                     fontSize: 12,
// //                                     fontWeight: FontWeight.w500,
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                             GestureDetector(
// //                               onTap: () {
// //                                 Navigator.of(context)
// //                                     .pushNamed('/forgot_password');
// //                               },
// //                               child: const Text(
// //                                 'Forgot Password?',
// //                                 style: TextStyle(
// //                                   color: Color(0xFF1A3A6B),
// //                                   fontSize: 12,
// //                                   fontWeight: FontWeight.w700,
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                         SizedBox(height: isPortrait ? 20 : 14),

// //                         // Login Button - ✨ MODIFIED: Call form validation
// //                         SizedBox(
// //                           width: double.infinity,
// //                           height: 50,
// //                           child: ElevatedButton(
// //                             onPressed: _isLoading ? null : _handleLogin,
// //                             style: ElevatedButton.styleFrom(
// //                               backgroundColor: const Color(0xFF1A3A6B),
// //                               shape: RoundedRectangleBorder(
// //                                 borderRadius: BorderRadius.circular(26),
// //                               ),
// //                               elevation: 0,
// //                             ),
// //                             child: _isLoading
// //                                 ? SizedBox(
// //                                     width: 20,
// //                                     height: 20,
// //                                     child: CircularProgressIndicator(
// //                                       valueColor: AlwaysStoppedAnimation<Color>(
// //                                         Colors.white.withOpacity(0.8),
// //                                       ),
// //                                       strokeWidth: 2.5,
// //                                     ),
// //                                   )
// //                                 : const Text(
// //                                     'Log In',
// //                                     style: TextStyle(
// //                                       color: Colors.white,
// //                                       fontSize: 15,
// //                                       fontWeight: FontWeight.w800,
// //                                     ),
// //                                   ),
// //                           ),
// //                         ),
// //                         SizedBox(height: isPortrait ? 16 : 12),

// //                         // Or continue with
// //                         Center(
// //                           child: Text(
// //                             'Or continue with',
// //                             style: TextStyle(
// //                               color: Colors.grey[600],
// //                               fontSize: 12,
// //                               fontWeight: FontWeight.w500,
// //                             ),
// //                           ),
// //                         ),
// //                         SizedBox(height: isPortrait ? 12 : 8),

// //                         // Social Buttons
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: [
// //                             _buildSocialButton(
// //                               icon: Icons.g_mobiledata,
// //                               onTap: _handleGoogleLogin,
// //                               color: const Color(0xFFEA4335),
// //                             ),
// //                             SizedBox(width: isPortrait ? 12 : 10),
// //                             _buildSocialButton(
// //                               icon: Icons.apple,
// //                               onTap: _handleAppleLogin,
// //                               color: Colors.black,
// //                             ),
// //                           ],
// //                         ),
// //                         SizedBox(height: isPortrait ? 16 : 12),

// //                         // Sign Up Link
// //                         Center(
// //                           child: RichText(
// //                             text: TextSpan(
// //                               text: 'Don\'t have an account? ',
// //                               style: TextStyle(
// //                                 color: Colors.grey[700],
// //                                 fontSize: 12,
// //                               ),
// //                               children: [
// //                                 TextSpan(
// //                                   text: 'Create an account',
// //                                   style: const TextStyle(
// //                                     color: Color(0xFF1A3A6B),
// //                                     fontWeight: FontWeight.w800,
// //                                   ),
// //                                   recognizer: TapGestureRecognizer()
// //                                     ..onTap = () {
// //                                       Navigator.of(context)
// //                                           .pushReplacementNamed('/signup');
// //                                     },
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                         SizedBox(height: isPortrait ? 12 : 8),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: isPortrait ? 20 : 16),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildSocialButton({
// //     required IconData icon,
// //     required VoidCallback onTap,
// //     required Color color,
// //   }) {
// //     return InkWell(
// //       onTap: onTap,
// //       borderRadius: BorderRadius.circular(10),
// //       child: Container(
// //         width: 50,
// //         height: 50,
// //         decoration: BoxDecoration(
// //           border: Border.all(color: Colors.grey[300]!, width: 1.5),
// //           borderRadius: BorderRadius.circular(10),
// //           color: Colors.white,
// //         ),
// //         child: Center(
// //           child: Icon(icon, color: color, size: 24),
// //         ),
// //       ),
// //     );
// //   }
// // }







// import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   // ✨ ADD: GlobalKey for Form Validation
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   late TextEditingController _phoneController;
//   late TextEditingController _passwordController;
//   bool _rememberMe = false;
//   bool _obscurePassword = true;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _phoneController = TextEditingController();
//     _passwordController = TextEditingController();

//     // ✨ ADD: Load Remember Me credentials
//     _loadRememberedCredentials();
//   }

//   // ✨ ADD: Load saved credentials from SharedPreferences
//   Future<void> _loadRememberedCredentials() async {
//     final prefs = await SharedPreferences.getInstance();
//     final rememberMe = prefs.getBool('rememberMe') ?? false;

//     if (rememberMe) {
//       final savedEmail = prefs.getString('savedEmail') ?? '';
//       final savedPassword = prefs.getString('savedPassword') ?? '';

//       setState(() {
//         _phoneController.text = savedEmail;
//         _passwordController.text = savedPassword;
//         _rememberMe = true;
//       });
//     }
//   }

//   // ✨ ADD: Save credentials to SharedPreferences
//   Future<void> _saveCredentials() async {
//     final prefs = await SharedPreferences.getInstance();

//     if (_rememberMe) {
//       await prefs.setString('savedEmail', _phoneController.text);
//       await prefs.setString('savedPassword', _passwordController.text);
//       await prefs.setBool('rememberMe', true);
//     } else {
//       await prefs.remove('savedEmail');
//       await prefs.remove('savedPassword');
//       await prefs.setBool('rememberMe', false);
//     }
//   }

//   @override
//   void dispose() {
//     _phoneController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   // void _handleLogin() {
//   //   // ✨ ADD: Form validation before login
//   //   if (!_formKey.currentState!.validate()) {
//   //     return;
//   //   }

//   //   // ✨ ADD: Save credentials if remember me is checked
//   //   _saveCredentials();

//   //   setState(() {
//   //     _isLoading = true;
//   //   });
//   //   Future.delayed(const Duration(seconds: 2), () {
//   //     if (mounted) {
//   //       setState(() {
//   //         _isLoading = false;
//   //       });
//   //       Navigator.of(context).pushNamed('/home');
//   //     }
//   //   });
//   // }

//   Future<void> _handleLogin() async {
//     if (!_formKey.currentState!.validate()) {
//       return;
//     }

//     await _saveCredentials();

//     setState(() {
//       _isLoading = true;
//     });

//     await Future.delayed(const Duration(seconds: 2));

//     if (mounted) {
//       // ✅ Save isLoggedIn = true
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setBool('isLoggedIn', true);

//       setState(() {
//         _isLoading = false;
//       });

//       Navigator.of(context).pushNamedAndRemoveUntil(
//         '/home',
//         (route) => false, // clears entire back stack
//       );
//     }
//   }

//   void _handleGoogleLogin() {}
//   void _handleAppleLogin() {}

//   @override
//   Widget build(BuildContext context) {
//     final orientation = MediaQuery.of(context).orientation;
//     final isPortrait = orientation == Orientation.portrait;

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
//               // ✨ BLUE HEADER (Top section with text)
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
//                       'Welcome Back',
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
//                         horizontal: isPortrait ? 28 : 40,
//                       ),
//                       child: Text(
//                         'Fill out the information below in order to access your account.',
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

//               // ✨ WHITE CARD (Form - all rounded corners)
//               Container(
//                 width: double.infinity,
//                 margin: EdgeInsets.symmetric(
//                   horizontal: isPortrait ? 10 : 20,
//                 ),
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
//                 // ✨ WRAP IN FORM WIDGET
//                 child: Form(
//                   key: _formKey,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: isPortrait ? 22 : 32,
//                       vertical: isPortrait ? 26 : 24,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // ✨ TAB TOGGLE (Log In / Sign up)
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey[100],
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: Row(
//                             children: ['Log In', 'Sign up'].map((tab) {
//                               final isActive = tab == 'Log In';
//                               return Expanded(
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     if (!isActive) {
//                                       Navigator.of(context)
//                                           .pushReplacementNamed('/signup');
//                                     }
//                                   },
//                                   child: Container(
//                                     padding: const EdgeInsets.symmetric(
//                                         vertical: 12),
//                                     decoration: BoxDecoration(
//                                       color: isActive
//                                           ? Colors.white
//                                           : Colors.transparent,
//                                       borderRadius: BorderRadius.circular(12),
//                                       boxShadow: isActive
//                                           ? [
//                                               BoxShadow(
//                                                 color: Colors.black
//                                                     .withOpacity(0.06),
//                                                 blurRadius: 8,
//                                                 offset: const Offset(0, 1),
//                                               ),
//                                             ]
//                                           : null,
//                                     ),
//                                     child: Text(
//                                       tab,
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: isActive
//                                             ? const Color(0xFF1A3A6B)
//                                             : Colors.grey[500],
//                                         fontSize: 14,
//                                         fontWeight: isActive
//                                             ? FontWeight.w700
//                                             : FontWeight.w500,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                         SizedBox(height: isPortrait ? 22 : 16),

//                         // Email - ✨ CHANGED TO TextFormField WITH VALIDATION
//                         Text(
//                           'Email',
//                           style: TextStyle(
//                             color: Colors.grey[900],
//                             fontSize: 14,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         TextFormField(
//                           controller: _phoneController,
//                           // ✨ ADD: Email Validation
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Email is required';
//                             }
//                             // ✨ ADD: Email format validation
//                             final emailRegex = RegExp(
//                               r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
//                             );
//                             if (!emailRegex.hasMatch(value)) {
//                               return 'Please enter a valid email';
//                             }
//                             return null;
//                           },
//                           decoration: InputDecoration(
//                             hintText: 'Enter your email',
//                             hintStyle: TextStyle(
//                               color: Colors.grey[400],
//                               fontSize: 14,
//                             ),
//                             prefixIcon: Icon(
//                               Icons.email_rounded,
//                               color: Colors.grey[400],
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: BorderSide(
//                                 color: Colors.grey[300]!,
//                               ),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: BorderSide(
//                                 color: Colors.grey[300]!,
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: const BorderSide(
//                                 color: Color(0xFF1A3A6B),
//                                 width: 2,
//                               ),
//                             ),
//                             filled: true,
//                             fillColor: Colors.grey[50],
//                             contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 14,
//                               vertical: 12,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: isPortrait ? 16 : 12),

//                         // Password - ✨ CHANGED TO TextFormField WITH VALIDATION
//                         Text(
//                           'Password',
//                           style: TextStyle(
//                             color: Colors.grey[900],
//                             fontSize: 14,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         TextFormField(
//                           controller: _passwordController,
//                           obscureText: _obscurePassword,
//                           // ✨ ADD: Password Validation
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Password is required';
//                             }
//                             if (value.length < 6) {
//                               return 'Password must be at least 6 characters';
//                             }
//                             return null;
//                           },
//                           decoration: InputDecoration(
//                             hintText: 'Enter your Password',
//                             hintStyle: TextStyle(
//                               color: Colors.grey[400],
//                               fontSize: 14,
//                             ),
//                             prefixIcon: Icon(
//                               Icons.lock_rounded,
//                               color: Colors.grey[400],
//                             ),
//                             suffixIcon: GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   _obscurePassword = !_obscurePassword;
//                                 });
//                               },
//                               child: Icon(
//                                 _obscurePassword
//                                     ? Icons.visibility_off_rounded
//                                     : Icons.visibility_rounded,
//                                 color: Colors.grey[400],
//                               ),
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: BorderSide(
//                                 color: Colors.grey[300]!,
//                               ),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: BorderSide(
//                                 color: Colors.grey[300]!,
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: const BorderSide(
//                                 color: Color(0xFF1A3A6B),
//                                 width: 2,
//                               ),
//                             ),
//                             filled: true,
//                             fillColor: Colors.grey[50],
//                             contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 14,
//                               vertical: 12,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: isPortrait ? 14 : 10),

//                         // Remember Me & Forgot Password
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 // ✨ MODIFY: Remember Me Checkbox - Now saves/clears credentials
//                                 Checkbox(
//                                   value: _rememberMe,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       _rememberMe = value ?? false;
//                                     });
//                                     // ✨ ADD: Save/Clear immediately when toggled
//                                     _saveCredentials();
//                                   },
//                                   activeColor: const Color(0xFF1A3A6B),
//                                   side: BorderSide(
//                                     color: Colors.grey[400]!,
//                                   ),
//                                 ),
//                                 Text(
//                                   'Remember me',
//                                   style: TextStyle(
//                                     color: Colors.grey[700],
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.of(context)
//                                     .pushNamed('/forgot_password');
//                               },
//                               child: const Text(
//                                 'Forgot Password?',
//                                 style: TextStyle(
//                                   color: Color(0xFF1A3A6B),
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: isPortrait ? 20 : 14),

//                         // Login Button - ✨ MODIFIED: Call form validation
//                         SizedBox(
//                           width: double.infinity,
//                           height: 50,
//                           child: ElevatedButton(
//                             onPressed: _isLoading ? null : _handleLogin,
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0xFF1A3A6B),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(26),
//                               ),
//                               elevation: 0,
//                             ),
//                             child: _isLoading
//                                 ? SizedBox(
//                                     width: 20,
//                                     height: 20,
//                                     child: CircularProgressIndicator(
//                                       valueColor: AlwaysStoppedAnimation<Color>(
//                                         Colors.white.withOpacity(0.8),
//                                       ),
//                                       strokeWidth: 2.5,
//                                     ),
//                                   )
//                                 : const Text(
//                                     'Log In',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w800,
//                                     ),
//                                   ),
//                           ),
//                         ),
//                         SizedBox(height: isPortrait ? 16 : 12),

//                         // Or continue with
//                         Center(
//                           child: Text(
//                             'Or continue with',
//                             style: TextStyle(
//                               color: Colors.grey[600],
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: isPortrait ? 12 : 8),

//                         // Social Buttons
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             _buildSocialButton(
//                               icon: Icons.g_mobiledata,
//                               onTap: _handleGoogleLogin,
//                               color: const Color(0xFFEA4335),
//                             ),
//                             SizedBox(width: isPortrait ? 12 : 10),
//                             _buildSocialButton(
//                               icon: Icons.apple,
//                               onTap: _handleAppleLogin,
//                               color: Colors.black,
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: isPortrait ? 16 : 12),

//                         // Sign Up Link
//                         Center(
//                           child: RichText(
//                             text: TextSpan(
//                               text: 'Don\'t have an account? ',
//                               style: TextStyle(
//                                 color: Colors.grey[700],
//                                 fontSize: 12,
//                               ),
//                               children: [
//                                 TextSpan(
//                                   text: 'Create an account',
//                                   style: const TextStyle(
//                                     color: Color(0xFF1A3A6B),
//                                     fontWeight: FontWeight.w800,
//                                   ),
//                                   recognizer: TapGestureRecognizer()
//                                     ..onTap = () {
//                                       Navigator.of(context)
//                                           .pushReplacementNamed('/signup');
//                                     },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: isPortrait ? 12 : 8),
//                       ],
//                     ),
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

//   Widget _buildSocialButton({
//     required IconData icon,
//     required VoidCallback onTap,
//     required Color color,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(10),
//       child: Container(
//         width: 50,
//         height: 50,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey[300]!, width: 1.5),
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.white,
//         ),
//         child: Center(
//           child: Icon(icon, color: color, size: 24),
//         ),
//       ),
//     );
//   }
// }



















import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:veesafe/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool _rememberMe = false;
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final saved = await AuthService.getSavedCredentials();
    if (saved.rememberMe) {
      setState(() {
        _emailController.text = saved.email;
        _passwordController.text = saved.password;
        _rememberMe = true;
      });
    }
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final result = await AuthService.login(
      email: _emailController.text.trim(),
      password: _passwordController.text,
      rememberMe: _rememberMe,
    );

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (result.success) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/home',
        (route) => false,
      );
    } else {
      _showError(result.errorMessage ?? 'Invalid email or password.');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white, size: 18),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFD32F2F),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _handleGoogleLogin() {}
  void _handleAppleLogin() {}

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
              // ── Header ──────────────────────────────────────────────────────
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: isPortrait ? 60 : 20,
                  bottom: isPortrait ? 30 : 20,
                ),
                child: Column(
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
                      'Welcome Back',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isPortrait ? 38 : 32,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.3,
                      ),
                    ),
                    SizedBox(height: isPortrait ? 10 : 6),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: isPortrait ? 28 : 40),
                      child: Text(
                        'Fill out the information below to access your account.',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                          fontSize: isPortrait ? 13 : 12,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              // ── White card ──────────────────────────────────────────────────
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
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isPortrait ? 22 : 32,
                      vertical: isPortrait ? 26 : 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tab toggle
                        _buildTabToggle(isPortrait, activeTab: 'Log In'),
                        SizedBox(height: isPortrait ? 22 : 16),

                        // Email
                        _fieldLabel('Email'),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return 'Email is required';
                            }
                            final rx = RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                            );
                            if (!rx.hasMatch(v)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          decoration: _inputDecoration(
                            hint: 'Enter your email',
                            icon: Icons.email_rounded,
                          ),
                        ),
                        SizedBox(height: isPortrait ? 16 : 12),

                        // Password
                        _fieldLabel('Password'),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return 'Password is required';
                            }
                            if (v.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          decoration: _inputDecoration(
                            hint: 'Enter your password',
                            icon: Icons.lock_rounded,
                            suffix: GestureDetector(
                              onTap: () => setState(
                                  () => _obscurePassword = !_obscurePassword),
                              child: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: isPortrait ? 6 : 4),

                        // Remember me & Forgot password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: _rememberMe,
                                  onChanged: (v) =>
                                      setState(() => _rememberMe = v ?? false),
                                  activeColor: const Color(0xFF1A3A6B),
                                  side: BorderSide(color: Colors.grey[400]!),
                                ),
                                Text(
                                  'Remember me',
                                  style: TextStyle(
                                      color: Colors.grey[700], fontSize: 12),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushNamed('/forgot_password'),
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Color(0xFF1A3A6B),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: isPortrait ? 20 : 14),

                        // Login button
                        _primaryButton(
                          label: 'Log In',
                          onPressed: _isLoading ? null : _handleLogin,
                          isLoading: _isLoading,
                        ),
                        SizedBox(height: isPortrait ? 16 : 12),

                        _orDivider(),
                        SizedBox(height: isPortrait ? 12 : 8),

                        _socialButtons(),
                        SizedBox(height: isPortrait ? 16 : 12),

                        // Sign up link
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 12),
                              children: [
                                TextSpan(
                                  text: 'Create an account',
                                  style: const TextStyle(
                                    color: Color(0xFF1A3A6B),
                                    fontWeight: FontWeight.w800,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.of(context)
                                        .pushReplacementNamed('/signup'),
                                ),
                              ],
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

  // ── Shared UI helpers ──────────────────────────────────────────────────────

  Widget _buildTabToggle(bool isPortrait, {required String activeTab}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: ['Log In', 'Sign up'].map((tab) {
          final isActive = tab == activeTab;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                if (!isActive) {
                  Navigator.of(context).pushReplacementNamed('/signup');
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isActive ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 8,
                            offset: const Offset(0, 1),
                          )
                        ]
                      : null,
                ),
                child: Text(
                  tab,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:
                        isActive ? const Color(0xFF1A3A6B) : Colors.grey[500],
                    fontSize: 14,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _fieldLabel(String text) => Text(
        text,
        style: TextStyle(
            color: Colors.grey[900], fontSize: 14, fontWeight: FontWeight.w700),
      );

  InputDecoration _inputDecoration({
    required String hint,
    required IconData icon,
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
      prefixIcon: Icon(icon, color: Colors.grey[400]),
      suffixIcon: suffix,
      helperText: ' ',
      errorStyle: const TextStyle(
          color: Colors.red, fontSize: 12, fontWeight: FontWeight.w600),
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
        borderSide: const BorderSide(color: Color(0xFF1A3A6B), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      filled: true,
      fillColor: Colors.grey[50],
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    );
  }

  Widget _primaryButton({
    required String label,
    required VoidCallback? onPressed,
    bool isLoading = false,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1A3A6B),
          disabledBackgroundColor: const Color(0xFF1A3A6B).withOpacity(0.7),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white.withOpacity(0.8)),
                  strokeWidth: 2.5,
                ),
              )
            : Text(
                label,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w800),
              ),
      ),
    );
  }

  Widget _orDivider() => Center(
        child: Text(
          'Or continue with',
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
      );

  Widget _socialButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _socialBtn(
              Icons.g_mobiledata, _handleGoogleLogin, const Color(0xFFEA4335)),
          const SizedBox(width: 12),
          _socialBtn(Icons.apple, _handleAppleLogin, Colors.black),
        ],
      );

  Widget _socialBtn(IconData icon, VoidCallback onTap, Color color) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!, width: 1.5),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Icon(icon, color: color, size: 24),
        ),
      );
}