import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    if (!value.contains('@')) {
      return 'Enter a valid email';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }

    return null;
  }

  void _handleRequestReset() {
    print('📌 Button Clicked');

    final isValid = _formKey.currentState?.validate() ?? false;
    print('✅ Validation Result: $isValid');

    if (!isValid) {
      print('❌ Email is invalid - NOT proceeding');
      return;
    }

    print('✅ Email is valid - Proceeding');

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
            duration: Duration(seconds: 2),
          ),
        );
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            Navigator.of(context).pushReplacementNamed('/login');
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 600;
    final isSmallMobile = screenSize.width < 400;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1E4480), Color(0xFF152E5E)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallMobile ? 16 : (isMobile ? 24 : 40),
                vertical: isMobile ? 20 : 40,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenSize.height * 0.03),
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: isSmallMobile ? 20 : 24,
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.05),
                    Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isSmallMobile ? 24 : (isMobile ? 28 : 36),
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 0 : 40,
                      ),
                      child: Text(
                        'Please enter the email address you\'d\nlike your password reset information sent to',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                          fontSize: isSmallMobile ? 12 : (isMobile ? 14 : 15),
                          fontWeight: FontWeight.w400,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.08),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: isMobile ? double.infinity : 400,
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        enabled: !_isLoading,
                        validator: _validateEmail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          hintText: 'E-mail id',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: isSmallMobile ? 13 : 14,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          errorStyle: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          helperText: ' ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                              color: Color(0xFF4A90E2),
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: isSmallMobile ? 14 : 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.12),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: isMobile ? double.infinity : 400,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: isSmallMobile ? 48 : 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4A90E2),
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            shadowColor: const Color(
                              0xFF4A90E2,
                            ).withOpacity(0.4),
                          ),
                          onPressed: _isLoading ? null : _handleRequestReset,
                          child: _isLoading
                              ? SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white.withOpacity(0.8),
                                    ),
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  'REQUEST RESET LINK',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isSmallMobile ? 13 : 14,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.08),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/login');
                      },
                      child: Text(
                        'Back to login',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: isSmallMobile ? 12 : 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.08),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: isMobile ? double.infinity : 400,
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 4,
                        children: [
                          Text(
                            'Already a customer?',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.75),
                              fontSize: isSmallMobile ? 11 : 12,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(
                                context,
                              ).pushReplacementNamed('/login');
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: const Color(0xFF4A90E2),
                                fontSize: isSmallMobile ? 11 : 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            'Sell on Veesafe',
                            style: TextStyle(
                              color: const Color(0xFF4A90E2),
                              fontSize: isSmallMobile ? 11 : 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
