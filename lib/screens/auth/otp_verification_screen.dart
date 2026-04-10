import 'package:flutter/material.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  late List<TextEditingController> _otpControllers;
  late List<FocusNode> _otpFocusNodes;
  String _phoneNumber = ''; // ✨ NEW: Store phone from signup
  int _remainingSeconds = 59;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();

    // ✨ NEW: Get phone from signup
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final phone = ModalRoute.of(context)?.settings.arguments as String?;
      setState(() {
        _phoneNumber = phone ?? 'Unknown';
      });
    });

    _otpControllers = List.generate(4, (_) => TextEditingController());
    _otpFocusNodes = List.generate(4, (_) => FocusNode());
    _startTimer();
  }

  void _startTimer() {
    _remainingSeconds = 59;
    _canResend = false;
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        setState(() {
          _remainingSeconds--;
          if (_remainingSeconds <= 0) {
            _canResend = true;
          }
        });
      }
      return _remainingSeconds > 0;
    });
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _otpFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _handleVerifyOTP() {
    String otp = _otpControllers.map((c) => c.text).join();
    if (otp.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter complete OTP')),
      );
      return;
    }
    Navigator.of(context).pushReplacementNamed('/home');
  }

  void _handleResendOTP() {
    if (_canResend) {
      for (var controller in _otpControllers) {
        controller.clear();
      }
      _startTimer();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('OTP resent successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    }
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
            colors: [
              Color(0xFF1A3A6B),
              Color(0xFF244A7E),
            ],
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
                      'At Tazkiran',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: isPortrait ? 11 : 13,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: isPortrait ? 14 : 8),
                    Text(
                      'Verification Code',
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
                          horizontal: isPortrait ? 28 : 40),
                      child: Text(
                        'Enter the 4-digit code sent to your mobile number',
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // ✨ PHONE NUMBER DISPLAY - UPDATED
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone_rounded,
                              color: const Color(0xFF1A3A6B),
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            // ✨ Display phone from signup
                            Text(
                              _phoneNumber,
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: isPortrait ? 28 : 20),

                      // Enter Code Text
                      Text(
                        'Enter the code',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: isPortrait ? 18 : 14),

                      // OTP INPUT BOXES
                      SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: SizedBox(
                            width: isPortrait ? 240 : 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(4, (index) {
                                return SizedBox(
                                  width: 45,
                                  height: isPortrait ? 55 : 48,
                                  child: TextField(
                                    controller: _otpControllers[index],
                                    focusNode: _otpFocusNodes[index],
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    maxLength: 1,
                                    onChanged: (value) {
                                      if (value.length == 1 && index < 3) {
                                        _otpFocusNodes[index + 1]
                                            .requestFocus();
                                      }
                                    },
                                    decoration: InputDecoration(
                                      hintText: '0',
                                      hintStyle: TextStyle(
                                        color: Colors.grey[300],
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey[50],
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.grey[300]!,
                                          width: 1.5,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.grey[300]!,
                                          width: 1.5,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Color(0xFF1A3A6B),
                                          width: 2.5,
                                        ),
                                      ),
                                      counterText: '',
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 6,
                                        horizontal: 4,
                                      ),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF1A3A6B),
                                      letterSpacing: 2,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: isPortrait ? 28 : 20),

                      // Timer Container
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: _remainingSeconds > 0
                              ? Colors.blue.withOpacity(0.08)
                              : Colors.green.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: _remainingSeconds > 0
                            ? Text(
                                'Resend code in $_remainingSeconds seconds',
                                style: const TextStyle(
                                  color: Color(0xFF1A3A6B),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            : GestureDetector(
                                onTap: _handleResendOTP,
                                child: const Text(
                                  'Resend Code',
                                  style: TextStyle(
                                    color: Color(0xFF1A3A6B),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(height: isPortrait ? 24 : 16),

                      // Verify Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _handleVerifyOTP,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1A3A6B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Verify & Continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: isPortrait ? 14 : 10),

                      // Help Text
                      Text(
                        'Didn\'t receive the code?',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: _canResend ? _handleResendOTP : null,
                        child: Text(
                          'Request new code',
                          style: TextStyle(
                            color: _canResend
                                ? const Color(0xFF1A3A6B)
                                : Colors.grey[400],
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            decoration: _canResend
                                ? TextDecoration.underline
                                : TextDecoration.none,
                          ),
                        ),
                      ),
                      SizedBox(height: isPortrait ? 10 : 6),
                    ],
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
