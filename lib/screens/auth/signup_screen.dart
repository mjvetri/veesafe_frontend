// import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   // ✨ Form key
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   late TextEditingController _emailController;
//   late TextEditingController _passwordController;
//   late TextEditingController _confirmPasswordController;
//   late TextEditingController _phoneController; // ✨ NEW: Phone field

//   bool _obscurePassword = true;
//   bool _obscureConfirmPassword = true;
//   bool _agreeToTerms = false;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _emailController = TextEditingController();
//     _passwordController = TextEditingController();
//     _confirmPasswordController = TextEditingController();
//     _phoneController = TextEditingController(); // ✨ NEW
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     _phoneController.dispose(); // ✨ NEW
//     super.dispose();
//   }

//   // ✨ NEW: Phone validation function
//   String? _validatePhone(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Phone number is required';
//     }
//     // Remove all non-digits
//     final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');
//     // Check if at least 10 digits
//     if (digitsOnly.length < 10) {
//       return 'Phone number must be at least 10 digits';
//     }
//     return null;
//   }

//   void _handleSignUp() {
//     // ✨ Form validation before signup
//     if (!_formKey.currentState!.validate()) {
//       return;
//     }

//     if (!_agreeToTerms) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please agree to terms')),
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
//             content: Text('Account created successfully'),
//             duration: Duration(seconds: 1),
//           ),
//         );

//         // ✨ Navigate to OTP with phone number
//         Future.delayed(const Duration(seconds: 1), () {
//           if (mounted) {
//             Navigator.of(context).pushReplacementNamed(
//               '/otp_verification',
//               arguments: _phoneController.text, // ✨ Pass phone
//             );
//           }
//         });
//       }
//     });
//   }

//   void _handleGoogleSignUp() {}
//   void _handleAppleSignUp() {}

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
//               // ✨ BLUE HEADER
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
//                       'Create Account',
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
//                         'Create your account today and start a  journey.',
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

//               // ✨ WHITE CARD
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
//                 // ✨ FORM WRAPPER
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
//                         // ✨ TAB TOGGLE
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey[100],
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: Row(
//                             children: ['Log In', 'Sign up'].map((tab) {
//                               final isActive = tab == 'Sign up';
//                               return Expanded(
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     if (!isActive) {
//                                       Navigator.of(context)
//                                           .pushReplacementNamed('/login');
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

//                         // Email
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
//                           controller: _emailController,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Email is required';
//                             }
//                             final emailRegex = RegExp(
//                               r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
//                             );
//                             if (!emailRegex.hasMatch(value)) {
//                               return 'Please enter a valid email';
//                             }
//                             return null;
//                           },
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
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
//                             errorStyle: const TextStyle(
//                               color: Colors.red,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             helperText: ' ',
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
//                             errorBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: const BorderSide(
//                                 color: Colors.red,
//                                 width: 2,
//                               ),
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: const BorderSide(
//                                 color: Colors.red,
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

//                         // ✨ NEW: Phone Number
//                         Text(
//                           'Phone Number',
//                           style: TextStyle(
//                             color: Colors.grey[900],
//                             fontSize: 14,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         TextFormField(
//                           controller: _phoneController,
//                           keyboardType: TextInputType.phone,
//                           validator: _validatePhone,
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           decoration: InputDecoration(
//                             hintText: 'Enter your phone number',
//                             hintStyle: TextStyle(
//                               color: Colors.grey[400],
//                               fontSize: 14,
//                             ),
//                             prefixIcon: Icon(
//                               Icons.phone_rounded,
//                               color: Colors.grey[400],
//                             ),
//                             errorStyle: const TextStyle(
//                               color: Colors.red,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             helperText: ' ',
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
//                             errorBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: const BorderSide(
//                                 color: Colors.red,
//                                 width: 2,
//                               ),
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: const BorderSide(
//                                 color: Colors.red,
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

//                         // Password
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
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Password is required';
//                             }
//                             if (value.length < 6) {
//                               return 'Password must be at least 6 characters';
//                             }
//                             return null;
//                           },
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
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
//                             errorStyle: const TextStyle(
//                               color: Colors.red,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             helperText: ' ',
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
//                             errorBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: const BorderSide(
//                                 color: Colors.red,
//                                 width: 2,
//                               ),
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: const BorderSide(
//                                 color: Colors.red,
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

//                         // Confirm Password
//                         Text(
//                           'Confirm Password',
//                           style: TextStyle(
//                             color: Colors.grey[900],
//                             fontSize: 14,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         TextFormField(
//                           controller: _confirmPasswordController,
//                           obscureText: _obscureConfirmPassword,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please confirm your password';
//                             }
//                             if (value.length < 6) {
//                               return 'Password must be at least 6 characters';
//                             }
//                             if (value != _passwordController.text) {
//                               return 'Passwords do not match';
//                             }
//                             return null;
//                           },
//                           autovalidateMode: AutovalidateMode.onUserInteraction,
//                           decoration: InputDecoration(
//                             hintText: 'Confirm your Password',
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
//                                   _obscureConfirmPassword =
//                                       !_obscureConfirmPassword;
//                                 });
//                               },
//                               child: Icon(
//                                 _obscureConfirmPassword
//                                     ? Icons.visibility_off_rounded
//                                     : Icons.visibility_rounded,
//                                 color: Colors.grey[400],
//                               ),
//                             ),
//                             errorStyle: const TextStyle(
//                               color: Colors.red,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             helperText: ' ',
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
//                             errorBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: const BorderSide(
//                                 color: Colors.red,
//                                 width: 2,
//                               ),
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: const BorderSide(
//                                 color: Colors.red,
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
//                         SizedBox(height: isPortrait ? 12 : 10),

//                         // Terms & Conditions
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Checkbox(
//                               value: _agreeToTerms,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _agreeToTerms = value ?? false;
//                                 });
//                               },
//                               activeColor: const Color(0xFF1A3A6B),
//                               side: BorderSide(
//                                 color: Colors.grey[400]!,
//                               ),
//                             ),
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(top: 6),
//                                 child: Text(
//                                   'I agree to Terms & Conditions and Privacy Policy',
//                                   style: TextStyle(
//                                     color: Colors.grey[700],
//                                     fontSize: 11,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: isPortrait ? 18 : 14),

//                         // Register Button
//                         SizedBox(
//                           width: double.infinity,
//                           height: 50,
//                           child: ElevatedButton(
//                             onPressed: _isLoading ? null : _handleSignUp,
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
//                                     'Register',
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
//                               onTap: _handleGoogleSignUp,
//                               color: const Color(0xFFEA4335),
//                             ),
//                             SizedBox(width: isPortrait ? 12 : 10),
//                             _buildSocialButton(
//                               icon: Icons.apple,
//                               onTap: _handleAppleSignUp,
//                               color: Colors.black,
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: isPortrait ? 16 : 12),

//                         // Login Link
//                         Center(
//                           child: RichText(
//                             text: TextSpan(
//                               text: 'Already have an account? ',
//                               style: TextStyle(
//                                 color: Colors.grey[700],
//                                 fontSize: 12,
//                               ),
//                               children: [
//                                 TextSpan(
//                                   text: 'Log In',
//                                   style: const TextStyle(
//                                     color: Color(0xFF1A3A6B),
//                                     fontWeight: FontWeight.w800,
//                                   ),
//                                   recognizer: TapGestureRecognizer()
//                                     ..onTap = () {
//                                       Navigator.of(context)
//                                           .pushReplacementNamed('/login');
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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _phoneController;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeToTerms = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';
    final digits = value.replaceAll(RegExp(r'[^\d]'), '');
    if (digits.length < 10) return 'Phone number must be at least 10 digits';
    return null;
  }

  Future<void> _handleSignUp() async {
    if (!_formKey.currentState!.validate()) return;

    if (!_agreeToTerms) {
      _showError('Please agree to the Terms & Conditions.');
      return;
    }

    setState(() => _isLoading = true);

    final result = await AuthService.signUp(
      email: _emailController.text.trim(),
      password: _passwordController.text,
      phone: _phoneController.text.trim(),
    );

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (result.success) {
      _showSuccess('Account created successfully!');
      await Future.delayed(const Duration(milliseconds: 800));
      if (mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/home',
          (route) => false,
        );
      }
    } else {
      _showError(result.errorMessage ?? 'Sign up failed. Please try again.');
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
                    fontSize: 13),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFD32F2F),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_outline,
                color: Colors.white, size: 18),
            const SizedBox(width: 10),
            Text(message,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13)),
          ],
        ),
        backgroundColor: const Color(0xFF2E7D32),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _handleGoogleSignUp() {}
  void _handleAppleSignUp() {}

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
                      'Create Account',
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
                        'Create your account today and start a safe journey.',
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
                        _buildTabToggle(activeTab: 'Sign up'),
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
                          decoration: _inputDeco(
                            hint: 'Enter your email',
                            icon: Icons.email_rounded,
                          ),
                        ),
                        SizedBox(height: isPortrait ? 4 : 2),

                        // Phone
                        _fieldLabel('Phone Number'),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: _validatePhone,
                          decoration: _inputDeco(
                            hint: 'Enter your phone number',
                            icon: Icons.phone_rounded,
                          ),
                        ),
                        SizedBox(height: isPortrait ? 4 : 2),

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
                          decoration: _inputDeco(
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
                        SizedBox(height: isPortrait ? 4 : 2),

                        // Confirm Password
                        _fieldLabel('Confirm Password'),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: _obscureConfirmPassword,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (v != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          decoration: _inputDeco(
                            hint: 'Confirm your password',
                            icon: Icons.lock_rounded,
                            suffix: GestureDetector(
                              onTap: () => setState(() =>
                                  _obscureConfirmPassword =
                                      !_obscureConfirmPassword),
                              child: Icon(
                                _obscureConfirmPassword
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded,
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: isPortrait ? 8 : 6),

                        // Terms
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: _agreeToTerms,
                              onChanged: (v) =>
                                  setState(() => _agreeToTerms = v ?? false),
                              activeColor: const Color(0xFF1A3A6B),
                              side: BorderSide(color: Colors.grey[400]!),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  'I agree to Terms & Conditions and Privacy Policy',
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: isPortrait ? 18 : 14),

                        // Register button
                        _primaryButton(
                          label: 'Register',
                          onPressed: _isLoading ? null : _handleSignUp,
                          isLoading: _isLoading,
                        ),
                        SizedBox(height: isPortrait ? 16 : 12),

                        Center(
                          child: Text(
                            'Or continue with',
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: isPortrait ? 12 : 8),

                        // Social buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _socialBtn(Icons.g_mobiledata, _handleGoogleSignUp,
                                const Color(0xFFEA4335)),
                            const SizedBox(width: 12),
                            _socialBtn(
                                Icons.apple, _handleAppleSignUp, Colors.black),
                          ],
                        ),
                        SizedBox(height: isPortrait ? 16 : 12),

                        // Log in link
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 12),
                              children: [
                                TextSpan(
                                  text: 'Log In',
                                  style: const TextStyle(
                                    color: Color(0xFF1A3A6B),
                                    fontWeight: FontWeight.w800,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.of(context)
                                        .pushReplacementNamed('/login'),
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

  // ── UI helpers ─────────────────────────────────────────────────────────────

  Widget _buildTabToggle({required String activeTab}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: ['Log In', 'Sign up'].map((tab) {
          final isActive = tab == activeTab;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                if (!isActive) {
                  Navigator.of(context).pushReplacementNamed('/login');
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
                              offset: const Offset(0, 1))
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

  InputDecoration _inputDeco({
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