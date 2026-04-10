// // // // lib/screens/edit_profile_screen.dart

// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/services.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';
// // // import '../constants/app_colors.dart';
// // // import 'change_password_screen.dart';

// // // class EditProfileScreen extends StatefulWidget {
// // //   const EditProfileScreen({super.key});

// // //   @override
// // //   State<EditProfileScreen> createState() => _EditProfileScreenState();
// // // }

// // // class _EditProfileScreenState extends State<EditProfileScreen>
// // //     with TickerProviderStateMixin {

// // //   late TabController _tabController;
// // //   bool _hasPhoto    = false;
// // //   bool _hovering    = false;
// // //   bool _showPass    = false;
// // //   bool _emailVerified = false;

// // //   // ── Primary ──
// // //   final _fullNameCtrl    = TextEditingController();
// // //   final _emailCtrl       = TextEditingController();
// // //   final _phoneCtrl       = TextEditingController();
// // //   final _passwordCtrl    = TextEditingController();
// // //   final _pincodeCtrl     = TextEditingController();

// // //   // ── Dropdown selections ──
// // //   String? _selectedLanguage;
// // //   String? _selectedNationality;
// // //   String? _selectedCity;
// // //   String? _selectedState;
// // //   String? _selectedGender;
// // //   String? _selectedMarital;
// // //   String? _selectedBloodGroup;

// // //   // ── Other info ──
// // //   final _kidsCtrl       = TextEditingController();
// // //   final _educationCtrl  = TextEditingController();
// // //   final _incomeCtrl     = TextEditingController();
// // //   final _occupationCtrl = TextEditingController();
// // //   final _businessCtrl   = TextEditingController();
// // //   DateTime? _selectedDOB;

// // //   final List<String> _extraEducations = [];
// // //   final List<String> _extraWorkplaces = [];

// // //   // ── Dropdown data ──
// // //   final List<String> _languages = [
// // //     'Tamil','English','Hindi','Telugu','Kannada','Malayalam',
// // //     'Bengali','Marathi','Gujarati','Punjabi','Urdu','Odia',
// // //   ];
// // //   final List<String> _nationalities = [
// // //     'Indian','American','British','Australian','Canadian',
// // //     'German','French','Japanese','Chinese','Other',
// // //   ];
// // //   final List<String> _cities = [
// // //     'Chennai','Puducherry','Bangalore','Mumbai','Delhi',
// // //     'Hyderabad','Kolkata','Pune','Ahmedabad','Coimbatore',
// // //     'Madurai','Trichy','Salem','Vellore','Other',
// // //   ];
// // //   final List<String> _states = [
// // //     'Tamil Nadu','Kerala','Karnataka','Andhra Pradesh',
// // //     'Telangana','Maharashtra','Gujarat','Rajasthan',
// // //     'Uttar Pradesh','West Bengal','Punjab','Other',
// // //   ];
// // //   final List<String> _genders = ['Male','Female','Other','Prefer not to say'];
// // //   final List<String> _maritalStatus = ['Single','Married','Divorced','Widowed'];
// // //   final List<String> _bloodGroups = ['A+','A-','B+','B-','O+','O-','AB+','AB-'];

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _tabController = TabController(length: 2, vsync: this);
// // //     _loadData();
// // //   }

// // //   // ════════════════════════════════════════
// // //   //  LOAD SAVED DATA
// // //   // ════════════════════════════════════════
// // //   Future<void> _loadData() async {
// // //     final prefs = await SharedPreferences.getInstance();
// // //     setState(() {
// // //       _fullNameCtrl.text    = prefs.getString('fullName')    ?? '';
// // //       _emailCtrl.text       = prefs.getString('email')       ?? '';
// // //       _phoneCtrl.text       = prefs.getString('phone')       ?? '';
// // //       _passwordCtrl.text    = prefs.getString('password')    ?? '';
// // //       _pincodeCtrl.text     = prefs.getString('pincode')     ?? '';
// // //       _kidsCtrl.text        = prefs.getString('kids')        ?? '';
// // //       _educationCtrl.text   = prefs.getString('education')   ?? '';
// // //       _incomeCtrl.text      = prefs.getString('income')      ?? '';
// // //       _occupationCtrl.text  = prefs.getString('occupation')  ?? '';
// // //       _businessCtrl.text    = prefs.getString('business')    ?? '';
// // //       _selectedLanguage     = prefs.getString('language');
// // //       _selectedNationality  = prefs.getString('nationality');
// // //       _selectedCity         = prefs.getString('city');
// // //       _selectedState        = prefs.getString('state');
// // //       _selectedGender       = prefs.getString('gender');
// // //       _selectedMarital      = prefs.getString('marital');
// // //       _selectedBloodGroup   = prefs.getString('bloodGroup');
// // //       _emailVerified        = prefs.getBool('emailVerified') ?? false;
// // //       final dob = prefs.getString('dob');
// // //       if (dob != null) _selectedDOB = DateTime.tryParse(dob);
// // //     });
// // //   }

// // //   // ════════════════════════════════════════
// // //   //  SAVE DATA
// // //   // ════════════════════════════════════════
// // //   Future<void> _saveData() async {
// // //     final prefs = await SharedPreferences.getInstance();
// // //     await prefs.setString('fullName',   _fullNameCtrl.text.trim());
// // //     await prefs.setString('email',      _emailCtrl.text.trim());
// // //     await prefs.setString('phone',      _phoneCtrl.text.trim());
// // //     await prefs.setString('password',   _passwordCtrl.text.trim());
// // //     await prefs.setString('pincode',    _pincodeCtrl.text.trim());
// // //     await prefs.setString('kids',       _kidsCtrl.text.trim());
// // //     await prefs.setString('education',  _educationCtrl.text.trim());
// // //     await prefs.setString('income',     _incomeCtrl.text.trim());
// // //     await prefs.setString('occupation', _occupationCtrl.text.trim());
// // //     await prefs.setString('business',   _businessCtrl.text.trim());
// // //     if (_selectedLanguage    != null) await prefs.setString('language',    _selectedLanguage!);
// // //     if (_selectedNationality != null) await prefs.setString('nationality', _selectedNationality!);
// // //     if (_selectedCity        != null) await prefs.setString('city',        _selectedCity!);
// // //     if (_selectedState       != null) await prefs.setString('state',       _selectedState!);
// // //     if (_selectedGender      != null) await prefs.setString('gender',      _selectedGender!);
// // //     if (_selectedMarital     != null) await prefs.setString('marital',     _selectedMarital!);
// // //     if (_selectedBloodGroup  != null) await prefs.setString('bloodGroup',  _selectedBloodGroup!);
// // //     await prefs.setBool('emailVerified', _emailVerified);
// // //     if (_selectedDOB != null) await prefs.setString('dob', _selectedDOB!.toIso8601String());
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _tabController.dispose();
// // //     super.dispose();
// // //   }

// // //   // ════════════════════════════════════════
// // //   //  DATE PICKER
// // //   // ════════════════════════════════════════
// // //   Future<void> _pickDOB() async {
// // //     final picked = await showDatePicker(
// // //       context: context,
// // //       initialDate: DateTime(1995, 1, 1),
// // //       firstDate: DateTime(1940),
// // //       lastDate: DateTime.now(),
// // //       builder: (context, child) => Theme(
// // //         data: Theme.of(context).copyWith(
// // //           colorScheme: const ColorScheme.light(
// // //             primary: kBlue,
// // //             onPrimary: Colors.white,
// // //             surface: Colors.white,
// // //           ),
// // //         ),
// // //         child: child!,
// // //       ),
// // //     );
// // //     if (picked != null) setState(() => _selectedDOB = picked);
// // //   }

// // //   // ════════════════════════════════════════
// // //   //  UPLOAD IMAGE SHEET
// // //   // ════════════════════════════════════════
// // //   void _uploadImage() {
// // //     showModalBottomSheet(
// // //       context: context,
// // //       backgroundColor: Colors.transparent,
// // //       builder: (_) => Container(
// // //         decoration: const BoxDecoration(
// // //           color: Colors.white,
// // //           borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
// // //         ),
// // //         padding: const EdgeInsets.fromLTRB(20, 14, 20, 32),
// // //         child: Column(
// // //           mainAxisSize: MainAxisSize.min,
// // //           children: [
// // //             Container(width: 40, height: 4,
// // //                 decoration: BoxDecoration(color: kBorderGrey,
// // //                     borderRadius: BorderRadius.circular(10))),
// // //             const SizedBox(height: 20),
// // //             const Text('Upload Profile Photo',
// // //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: kBlack)),
// // //             const SizedBox(height: 24),
// // //             Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //               children: [
// // //                 _photoOpt(Icons.camera_alt_rounded, 'Camera', kBlue, () {
// // //                   Navigator.pop(context);
// // //                   setState(() => _hasPhoto = true);
// // //                   _showSnack('Camera opened!', kBlue);
// // //                 }),
// // //                 _photoOpt(Icons.photo_library_rounded, 'Gallery', const Color(0xFF7C3AED), () {
// // //                   Navigator.pop(context);
// // //                   setState(() => _hasPhoto = true);
// // //                   _showSnack('Gallery opened!', kBlue);
// // //                 }),
// // //                 _photoOpt(Icons.delete_outline_rounded, 'Remove', Colors.red, () {
// // //                   Navigator.pop(context);
// // //                   setState(() => _hasPhoto = false);
// // //                   _showSnack('Photo removed', Colors.red);
// // //                 }),
// // //               ],
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _photoOpt(IconData icon, String label, Color color, VoidCallback onTap) =>
// // //       GestureDetector(
// // //         onTap: onTap,
// // //         child: Column(
// // //           children: [
// // //             Container(width: 60, height: 60,
// // //               decoration: BoxDecoration(color: color.withOpacity(0.1),
// // //                   shape: BoxShape.circle,
// // //                   border: Border.all(color: color.withOpacity(0.3), width: 1.5)),
// // //               child: Icon(icon, color: color, size: 26)),
// // //             const SizedBox(height: 8),
// // //             Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color)),
// // //           ],
// // //         ),
// // //       );

// // //   // ════════════════════════════════════════
// // //   //  VERIFY EMAIL
// // //   // ════════════════════════════════════════
// // //   void _verifyEmail() {
// // //     if (_emailCtrl.text.isEmpty || !_emailCtrl.text.contains('@')) {
// // //       _showSnack('Enter a valid email first!', Colors.orange);
// // //       return;
// // //     }
// // //     final otpCtrl = TextEditingController();
// // //     showDialog(context: context,
// // //       builder: (_) => AlertDialog(
// // //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// // //         title: const Text('Verify Email',
// // //             style: TextStyle(fontWeight: FontWeight.w800, color: kBlack)),
// // //         content: Column(
// // //           mainAxisSize: MainAxisSize.min,
// // //           children: [
// // //             Text('Enter the OTP sent to\n${_emailCtrl.text}',
// // //                 textAlign: TextAlign.center,
// // //                 style: const TextStyle(fontSize: 13, color: kGrey)),
// // //             const SizedBox(height: 16),
// // //             TextField(
// // //               controller: otpCtrl,
// // //               keyboardType: TextInputType.number,
// // //               inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// // //               textAlign: TextAlign.center,
// // //               maxLength: 6,
// // //               style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, letterSpacing: 8),
// // //               decoration: InputDecoration(
// // //                 counterText: '',
// // //                 hintText: '------',
// // //                 hintStyle: const TextStyle(color: kBorderGrey),
// // //                 filled: true, fillColor: kBlueLite,
// // //                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //         actions: [
// // //           TextButton(onPressed: () => Navigator.pop(context),
// // //               child: const Text('Cancel', style: TextStyle(color: kGrey))),
// // //           ElevatedButton(
// // //             style: ElevatedButton.styleFrom(backgroundColor: kBlue,
// // //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
// // //             onPressed: () {
// // //               Navigator.pop(context);
// // //               setState(() => _emailVerified = true);
// // //               _showSnack('Email verified ✓', const Color(0xFF16A34A));
// // //             },
// // //             child: const Text('Verify', style: TextStyle(color: Colors.white)),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   // ════════════════════════════════════════
// // //   //  CHANGE PASSWORD
// // //   // ════════════════════════════════════════
// // //   void _changePassword() {
// // //     final currentCtrl = TextEditingController();
// // //     final newCtrl     = TextEditingController();
// // //     final confirmCtrl = TextEditingController();
// // //     bool showNew = false;
// // //     showModalBottomSheet(
// // //       context: context,
// // //       isScrollControlled: true,
// // //       backgroundColor: Colors.transparent,
// // //       builder: (_) => StatefulBuilder(
// // //         builder: (ctx, setBS) => Padding(
// // //           padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
// // //           child: Container(
// // //             decoration: const BoxDecoration(color: Colors.white,
// // //                 borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
// // //             padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
// // //             child: Column(
// // //               mainAxisSize: MainAxisSize.min,
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Center(child: Container(width: 40, height: 4,
// // //                     decoration: BoxDecoration(color: kBorderGrey,
// // //                         borderRadius: BorderRadius.circular(10)))),
// // //                 const SizedBox(height: 18),
// // //                 const Text('Change Password',
// // //                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: kBlack)),
// // //                 const SizedBox(height: 20),
// // //                 _sheetField('Current Password', currentCtrl, isPassword: true),
// // //                 const SizedBox(height: 12),
// // //                 TextField(
// // //                   controller: newCtrl,
// // //                   obscureText: !showNew,
// // //                   decoration: InputDecoration(
// // //                     labelText: 'New Password',
// // //                     labelStyle: const TextStyle(color: kGrey, fontSize: 13),
// // //                     filled: true, fillColor: kBlueLite,
// // //                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
// // //                     focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
// // //                         borderSide: const BorderSide(color: kBlue, width: 1.5)),
// // //                     isDense: true,
// // //                     suffixIcon: IconButton(
// // //                       icon: Icon(showNew ? Icons.visibility_off : Icons.visibility, color: kGrey),
// // //                       onPressed: () => setBS(() => showNew = !showNew),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 12),
// // //                 _sheetField('Confirm New Password', confirmCtrl, isPassword: true),
// // //                 const SizedBox(height: 20),
// // //                 SizedBox(
// // //                   width: double.infinity,
// // //                   child: ElevatedButton(
// // //                     style: ElevatedButton.styleFrom(backgroundColor: kBlue,
// // //                         padding: const EdgeInsets.symmetric(vertical: 14),
// // //                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
// // //                     onPressed: () {
// // //                       if (newCtrl.text == confirmCtrl.text && newCtrl.text.isNotEmpty) {
// // //                         Navigator.pop(context);
// // //                         _showSnack('Password changed!', const Color(0xFF16A34A));
// // //                       } else {
// // //                         _showSnack('Passwords do not match!', Colors.red);
// // //                       }
// // //                     },
// // //                     child: const Text('Update Password',
// // //                         style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   // ════════════════════════════════════════
// // //   //  ADD EDUCATION / WORKPLACE
// // //   // ════════════════════════════════════════
// // //   void _addEducation() {
// // //     final ctrl = TextEditingController();
// // //     showDialog(context: context,
// // //       builder: (_) => AlertDialog(
// // //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// // //         title: const Text('Add Education',
// // //             style: TextStyle(fontWeight: FontWeight.w800, color: kBlack)),
// // //         content: _sheetField('Degree / Course', ctrl),
// // //         actions: [
// // //           TextButton(onPressed: () => Navigator.pop(context),
// // //               child: const Text('Cancel', style: TextStyle(color: kGrey))),
// // //           ElevatedButton(
// // //             style: ElevatedButton.styleFrom(backgroundColor: kBlue,
// // //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
// // //             onPressed: () {
// // //               if (ctrl.text.trim().isNotEmpty) {
// // //                 setState(() => _extraEducations.add(ctrl.text.trim()));
// // //                 Navigator.pop(context);
// // //                 _showSnack('Education added!', kBlue);
// // //               }
// // //             },
// // //             child: const Text('Add', style: TextStyle(color: Colors.white)),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   void _addWorkplace() {
// // //     final ctrl = TextEditingController();
// // //     showDialog(context: context,
// // //       builder: (_) => AlertDialog(
// // //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// // //         title: const Text('Add a Workplace',
// // //             style: TextStyle(fontWeight: FontWeight.w800, color: kBlack)),
// // //         content: _sheetField('Company / Hospital Name', ctrl),
// // //         actions: [
// // //           TextButton(onPressed: () => Navigator.pop(context),
// // //               child: const Text('Cancel', style: TextStyle(color: kGrey))),
// // //           ElevatedButton(
// // //             style: ElevatedButton.styleFrom(backgroundColor: kBlue,
// // //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
// // //             onPressed: () {
// // //               if (ctrl.text.trim().isNotEmpty) {
// // //                 setState(() => _extraWorkplaces.add(ctrl.text.trim()));
// // //                 Navigator.pop(context);
// // //                 _showSnack('Workplace added!', kBlue);
// // //               }
// // //             },
// // //             child: const Text('Add', style: TextStyle(color: Colors.white)),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   void _showSnack(String msg, Color color) {
// // //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// // //       content: Text(msg),
// // //       backgroundColor: color,
// // //       behavior: SnackBarBehavior.floating,
// // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // //     ));
// // //   }

// // //   Widget _sheetField(String label, TextEditingController ctrl, {bool isPassword = false}) =>
// // //       TextField(
// // //         controller: ctrl,
// // //         obscureText: isPassword,
// // //         decoration: InputDecoration(
// // //           labelText: label,
// // //           labelStyle: const TextStyle(color: kGrey, fontSize: 13),
// // //           filled: true, fillColor: kBlueLite,
// // //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
// // //           focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
// // //               borderSide: const BorderSide(color: kBlue, width: 1.5)),
// // //           isDense: true,
// // //         ),
// // //       );

// // //   // ════════════════════════════════════════
// // //   //  BUILD
// // //   // ════════════════════════════════════════
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: const Color(0xFFF5F7FA),
// // //       body: SafeArea(
// // //         child: Column(
// // //           children: [
// // //             _appBar(context),
// // //             _tabBar(),
// // //             Expanded(
// // //               child: TabBarView(
// // //                 controller: _tabController,
// // //                 children: [_primaryTab(), _otherInfoTab()],
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   // ════════════════════════════════════════
// // //   //  APP BAR
// // //   // ════════════════════════════════════════
// // //   Widget _appBar(BuildContext context) => Container(
// // //     decoration: const BoxDecoration(
// // //       gradient: LinearGradient(colors: [kBlue, Color(0xFF1A73E8)],
// // //           begin: Alignment.centerLeft, end: Alignment.centerRight),
// // //     ),
// // //     padding: const EdgeInsets.fromLTRB(4, 6, 14, 10),
// // //     child: Row(
// // //       children: [
// // //         IconButton(icon: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.white),
// // //             onPressed: () => Navigator.pop(context)),
// // //         const Expanded(
// // //           child: Center(
// // //             child: Text('Edit profile information',
// // //                 style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white)),
// // //           ),
// // //         ),
// // //         GestureDetector(
// // //           onTap: () async {
// // //             // ── Validate ALL fields ──
// // //             if (_fullNameCtrl.text.trim().isEmpty) {
// // //               _showSnack('Please enter your full name!', Colors.red); return;
// // //             }
// // //             if (_emailCtrl.text.trim().isEmpty || !_emailCtrl.text.contains('@') || !_emailCtrl.text.contains('.')) {
// // //               _showSnack('Please enter a valid email address!', Colors.red); return;
// // //             }
// // //             if (_phoneCtrl.text.trim().length < 10) {
// // //               _showSnack('Phone number must be 10 digits!', Colors.red); return;
// // //             }
// // //             if (_passwordCtrl.text.trim().isEmpty || _passwordCtrl.text.length < 6) {
// // //               _showSnack('Password must be at least 6 characters!', Colors.red); return;
// // //             }
// // //             if (_selectedLanguage == null) {
// // //               _showSnack('Please select a language!', Colors.red); return;
// // //             }
// // //             if (_selectedNationality == null) {
// // //               _showSnack('Please select your nationality!', Colors.red); return;
// // //             }
// // //             if (_pincodeCtrl.text.trim().length < 6) {
// // //               _showSnack('Pincode must be 6 digits!', Colors.red); return;
// // //             }
// // //             if (_selectedCity == null) {
// // //               _showSnack('Please select your city!', Colors.red); return;
// // //             }
// // //             if (_selectedState == null) {
// // //               _showSnack('Please select your state!', Colors.red); return;
// // //             }
// // //             if (_selectedGender == null) {
// // //               _showSnack('Please select your gender!', Colors.red); return;
// // //             }
// // //             if (_selectedDOB == null) {
// // //               _showSnack('Please select your date of birth!', Colors.red); return;
// // //             }
// // //             if (_selectedMarital == null) {
// // //               _showSnack('Please select your marital status!', Colors.red); return;
// // //             }
// // //             if (_incomeCtrl.text.trim().isEmpty) {
// // //               _showSnack('Please enter your monthly income!', Colors.red); return;
// // //             }
// // //             if (_occupationCtrl.text.trim().isEmpty) {
// // //               _showSnack('Please enter your occupation!', Colors.red); return;
// // //             }
// // //             if (_kidsCtrl.text.trim().isEmpty) {
// // //               _showSnack('Please enter number of kids!', Colors.red); return;
// // //             }
// // //             if (_educationCtrl.text.trim().isEmpty) {
// // //               _showSnack('Please enter your education!', Colors.red); return;
// // //             }
// // //             if (_businessCtrl.text.trim().isEmpty) {
// // //               _showSnack('Please enter your business name!', Colors.red); return;
// // //             }
// // //             if (_selectedBloodGroup == null) {
// // //               _showSnack('Please select your blood group!', Colors.red); return;
// // //             }
// // //             // ── Save all data ──
// // //             await _saveData();
// // //             _showSnack('✅ Profile saved successfully!', const Color(0xFF16A34A));
// // //             Navigator.pop(context);
// // //           },
// // //           child: Container(
// // //             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
// // //             decoration: BoxDecoration(color: Colors.white.withOpacity(0.2),
// // //                 borderRadius: BorderRadius.circular(20),
// // //                 border: Border.all(color: Colors.white.withOpacity(0.5))),
// // //             child: const Text('Save',
// // //                 style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700)),
// // //           ),
// // //         ),
// // //       ],
// // //     ),
// // //   );

// // //   // ════════════════════════════════════════
// // //   //  TAB BAR
// // //   // ════════════════════════════════════════
// // //   Widget _tabBar() => Container(
// // //     color: Colors.white,
// // //     child: TabBar(
// // //       controller: _tabController,
// // //       labelColor: kBlue,
// // //       unselectedLabelColor: kGrey,
// // //       indicatorColor: kBlue,
// // //       indicatorWeight: 3,
// // //       labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
// // //       tabs: const [Tab(text: 'Primary'), Tab(text: 'Other Info')],
// // //     ),
// // //   );

// // //   // ════════════════════════════════════════
// // //   //  PRIMARY TAB
// // //   // ════════════════════════════════════════
// // //   Widget _primaryTab() => SingleChildScrollView(
// // //     physics: const BouncingScrollPhysics(),
// // //     padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
// // //     child: Column(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         // ── Profile picture card ──
// // //         Container(
// // //           padding: const EdgeInsets.all(16),
// // //           decoration: BoxDecoration(
// // //             color: Colors.white,
// // //             borderRadius: BorderRadius.circular(16),
// // //             border: Border.all(color: const Color(0xFFEEF1F8)),
// // //             boxShadow: [
// // //               BoxShadow(color: Colors.black.withOpacity(0.05),
// // //                   blurRadius: 12, offset: const Offset(0, 3)),
// // //             ],
// // //           ),
// // //           child: Row(
// // //             children: [
// // //               // ── Avatar ──
// // //               MouseRegion(
// // //                 onEnter: (_) => setState(() => _hovering = true),
// // //                 onExit: (_) => setState(() => _hovering = false),
// // //                 child: GestureDetector(
// // //                   onTap: _uploadImage,
// // //                   child: Stack(
// // //                     children: [
// // //                       Container(
// // //                         width: 70, height: 70,
// // //                         decoration: BoxDecoration(
// // //                           shape: BoxShape.circle,
// // //                           color: const Color(0xFFF0F3F8),
// // //                           border: Border.all(
// // //                               color: const Color(0xFFDDE2EA), width: 2),
// // //                         ),
// // //                         child: ClipOval(
// // //                           child: _hasPhoto
// // //                               ? Container(color: kBlueLite,
// // //                               child: const Icon(Icons.check_circle_rounded,
// // //                                   size: 40, color: kBlue))
// // //                               : const Icon(Icons.person_rounded,
// // //                                   size: 42, color: Color(0xFFB0BEC5)),
// // //                         ),
// // //                       ),
// // //                       if (_hovering)
// // //                         Container(
// // //                           width: 70, height: 70,
// // //                           decoration: BoxDecoration(
// // //                             shape: BoxShape.circle,
// // //                             color: Colors.black.withOpacity(0.4)),
// // //                           child: const Icon(Icons.camera_alt_rounded,
// // //                               color: Colors.white, size: 24),
// // //                         ),
// // //                       Positioned(
// // //                         bottom: 0, right: 0,
// // //                         child: Container(
// // //                           width: 22, height: 22,
// // //                           decoration: BoxDecoration(
// // //                             color: kBlue,
// // //                             shape: BoxShape.circle,
// // //                             border: Border.all(color: Colors.white, width: 1.5),
// // //                           ),
// // //                           child: const Icon(Icons.camera_alt_rounded,
// // //                               size: 11, color: Colors.white),
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //               const SizedBox(width: 16),
// // //               // ── Upload / Remove ──
// // //               Expanded(
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     const Text('Profile Picture',
// // //                         style: TextStyle(
// // //                             fontSize: 13,
// // //                             fontWeight: FontWeight.w700,
// // //                             color: kBlack)),
// // //                     const SizedBox(height: 10),
// // //                     Row(
// // //                       children: [
// // //                         GestureDetector(
// // //                           onTap: _uploadImage,
// // //                           child: Container(
// // //                             padding: const EdgeInsets.symmetric(
// // //                                 horizontal: 16, vertical: 8),
// // //                             decoration: BoxDecoration(
// // //                               color: kBlue,
// // //                               borderRadius: BorderRadius.circular(8),
// // //                             ),
// // //                             child: const Row(
// // //                               mainAxisSize: MainAxisSize.min,
// // //                               children: [
// // //                                 Icon(Icons.cloud_upload_outlined,
// // //                                     color: Colors.white, size: 14),
// // //                                 SizedBox(width: 5),
// // //                                 Text('Upload Image',
// // //                                     style: TextStyle(
// // //                                         color: Colors.white,
// // //                                         fontSize: 12,
// // //                                         fontWeight: FontWeight.w700)),
// // //                               ],
// // //                             ),
// // //                           ),
// // //                         ),
// // //                         const SizedBox(width: 12),
// // //                         GestureDetector(
// // //                           onTap: () {
// // //                             setState(() => _hasPhoto = false);
// // //                             _showSnack('Photo removed', Colors.red);
// // //                           },
// // //                           child: const Text('Remove',
// // //                               style: TextStyle(
// // //                                   fontSize: 13,
// // //                                   color: Colors.red,
// // //                                   fontWeight: FontWeight.w600)),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),

// // //         const SizedBox(height: 24),

// // //         // ── Full Name — letters only ──
// // //         _textField(
// // //           label: 'Full Name',
// // //           controller: _fullNameCtrl,
// // //           icon: Icons.person_outline_rounded,
// // //           hint: 'Deepak Kumar',
// // //           inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
// // //           keyboardType: TextInputType.name,
// // //         ),

// // //         // ── Email ──
// // //         _textField(
// // //           label: 'E-mail Address',
// // //           controller: _emailCtrl,
// // //           icon: Icons.email_outlined,
// // //           hint: 'deepak@gmail.com',
// // //           keyboardType: TextInputType.emailAddress,
// // //           trailing: GestureDetector(
// // //             onTap: _verifyEmail,
// // //             child: _badge(_emailVerified ? 'Verified ✓' : 'Verify',
// // //                 _emailVerified ? const Color(0xFF16A34A) : Colors.orange),
// // //           ),
// // //         ),

// // //         // ── Phone — numbers only, max 10 ──
// // //         _textField(
// // //           label: 'Phone Number',
// // //           controller: _phoneCtrl,
// // //           icon: Icons.phone_outlined,
// // //           hint: '+91 98765 43210',
// // //           keyboardType: TextInputType.phone,
// // //           inputFormatters: [
// // //             FilteringTextInputFormatter.digitsOnly,
// // //             LengthLimitingTextInputFormatter(10),
// // //           ],
// // //           trailing: _badge('Verified ✓', const Color(0xFF16A34A)),
// // //         ),

// // //         // ── Password with eye icon ──
// // //         _passwordField(),

// // //         // ── Language dropdown ──
// // //         _dropdown('Language Known', Icons.language_rounded, _languages, _selectedLanguage,
// // //             (val) => setState(() => _selectedLanguage = val)),

// // //         // ── Nationality dropdown ──
// // //         _dropdown('Nationality', Icons.flag_outlined, _nationalities, _selectedNationality,
// // //             (val) => setState(() => _selectedNationality = val)),

// // //         // ── Pincode — numbers only, max 6 ──
// // //         _textField(
// // //           label: 'Pincode',
// // //           controller: _pincodeCtrl,
// // //           icon: Icons.pin_drop_outlined,
// // //           hint: '605 001',
// // //           keyboardType: TextInputType.number,
// // //           inputFormatters: [
// // //             FilteringTextInputFormatter.digitsOnly,
// // //             LengthLimitingTextInputFormatter(6),
// // //           ],
// // //         ),

// // //         // ── City dropdown ──
// // //         _dropdown('City', Icons.location_city_outlined, _cities, _selectedCity,
// // //             (val) => setState(() => _selectedCity = val)),

// // //         // ── State dropdown ──
// // //         _dropdown('State', Icons.map_outlined, _states, _selectedState,
// // //             (val) => setState(() => _selectedState = val)),

// // //         // ── Gender dropdown ──
// // //         _dropdown('Gender', Icons.wc_rounded, _genders, _selectedGender,
// // //             (val) => setState(() => _selectedGender = val)),
// // //       ],
// // //     ),
// // //   );

// // //   // ════════════════════════════════════════
// // //   //  OTHER INFO TAB
// // //   // ════════════════════════════════════════
// // //   Widget _otherInfoTab() => SingleChildScrollView(
// // //     physics: const BouncingScrollPhysics(),
// // //     padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
// // //     child: Column(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         // ── Date of Birth — date picker ──
// // //         _datePicker(),

// // //         // ── Marital Status dropdown ──
// // //         _dropdown('Marital Status', Icons.favorite_border_rounded,
// // //             _maritalStatus, _selectedMarital,
// // //             (val) => setState(() => _selectedMarital = val)),

// // //         // ── Number of Kids — numbers only ──
// // //         _textField(
// // //           label: 'Number of Kids',
// // //           controller: _kidsCtrl,
// // //           icon: Icons.child_care_rounded,
// // //           hint: '1',
// // //           keyboardType: TextInputType.number,
// // //           inputFormatters: [
// // //             FilteringTextInputFormatter.digitsOnly,
// // //             LengthLimitingTextInputFormatter(2),
// // //           ],
// // //         ),

// // //         // ── Education — letters only ──
// // //         _textField(
// // //           label: 'Education',
// // //           controller: _educationCtrl,
// // //           icon: Icons.school_outlined,
// // //           hint: 'B.Sc Nursing, MBA',
// // //           inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s\.]'))],
// // //         ),

// // //         // ── Monthly Income — numbers only ──
// // //         _textField(
// // //           label: 'Monthly Income',
// // //           controller: _incomeCtrl,
// // //           icon: Icons.currency_rupee_rounded,
// // //           hint: '50000',
// // //           keyboardType: TextInputType.number,
// // //           inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// // //         ),

// // //         // ── Occupation — letters only ──
// // //         _textField(
// // //           label: 'Occupation',
// // //           controller: _occupationCtrl,
// // //           icon: Icons.work_outline_rounded,
// // //           hint: 'Doctor, Engineer',
// // //           inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
// // //         ),

// // //         // ── Business Name ──
// // //         _textField(
// // //           label: 'My Business Name',
// // //           controller: _businessCtrl,
// // //           icon: Icons.business_outlined,
// // //           hint: 'Veesafe Health Pvt Ltd',
// // //         ),

// // //         // ── Blood Group dropdown ──
// // //         _dropdown('Blood Group', Icons.bloodtype_outlined,
// // //             _bloodGroups, _selectedBloodGroup,
// // //             (val) => setState(() => _selectedBloodGroup = val)),

// // //         // ── Extra chips ──
// // //         ..._extraEducations.map((e) => _chip(e, () =>
// // //             setState(() => _extraEducations.remove(e)))),
// // //         ..._extraWorkplaces.map((w) => _chip(w, () =>
// // //             setState(() => _extraWorkplaces.remove(w)))),

// // //         const SizedBox(height: 8),
// // //         _addButton('Add Education', _addEducation),
// // //         const SizedBox(height: 12),
// // //         _addButton('Add a Workplace', _addWorkplace),
// // //       ],
// // //     ),
// // //   );

// // //   // ════════════════════════════════════════
// // //   //  FLOATING LABEL TEXT FIELD
// // //   // ════════════════════════════════════════
// // //   Widget _textField({
// // //     required String label,
// // //     required TextEditingController controller,
// // //     required IconData icon,
// // //     String? hint,
// // //     bool isPassword = false,
// // //     TextInputType keyboardType = TextInputType.text,
// // //     List<TextInputFormatter>? inputFormatters,
// // //     Widget? trailing,
// // //   }) =>
// // //       Padding(
// // //         padding: const EdgeInsets.only(bottom: 20),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             // ── Bold navy label ──
// // //             Row(
// // //               children: [
// // //                 Text(label,
// // //                     style: const TextStyle(
// // //                         fontSize: 13,
// // //                         fontWeight: FontWeight.w700,
// // //                         color: Color(0xFF1A2E5A),
// // //                         letterSpacing: 0.2)),
// // //                 if (trailing != null) ...[
// // //                   const Spacer(),
// // //                   trailing,
// // //                 ],
// // //               ],
// // //             ),
// // //             const SizedBox(height: 8),
// // //             // ── Input with underline ──
// // //             TextFormField(
// // //               controller: controller,
// // //               obscureText: isPassword,
// // //               keyboardType: keyboardType,
// // //               inputFormatters: inputFormatters,
// // //               style: const TextStyle(
// // //                   fontSize: 14,
// // //                   fontWeight: FontWeight.w500,
// // //                   color: kBlack),
// // //               decoration: InputDecoration(
// // //                 hintText: hint,
// // //                 hintStyle: const TextStyle(
// // //                     fontSize: 13.5,
// // //                     color: Color(0xFFC5CDD8),
// // //                     fontWeight: FontWeight.w400),
// // //                 isDense: true,
// // //                 contentPadding:
// // //                     const EdgeInsets.symmetric(vertical: 6),
// // //                 border: InputBorder.none,
// // //                 enabledBorder: const UnderlineInputBorder(
// // //                   borderSide: BorderSide(
// // //                       color: Color(0xFFDDE2EA), width: 1.2),
// // //                 ),
// // //                 focusedBorder: UnderlineInputBorder(
// // //                   borderSide: BorderSide(color: kBlue, width: 1.8),
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       );

// // //   // ════════════════════════════════════════
// // //   //  PASSWORD FIELD WITH EYE ICON
// // //   // ════════════════════════════════════════
// // //   Widget _passwordField() => Padding(
// // //     padding: const EdgeInsets.only(bottom: 20),
// // //     child: Column(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         Row(
// // //           children: [
// // //             const Text('Change Password',
// // //                 style: TextStyle(
// // //                     fontSize: 13,
// // //                     fontWeight: FontWeight.w700,
// // //                     color: Color(0xFF1A2E5A),
// // //                     letterSpacing: 0.2)),
// // //             const Spacer(),
// // //             GestureDetector(
// // //               onTap: () async {
// // //                 final newPass = await Navigator.push<String>(
// // //                   context,
// // //                   MaterialPageRoute(
// // //                       builder: (_) => const ChangePasswordScreen()),
// // //                 );
// // //                 if (newPass != null) {
// // //                   setState(() => _passwordCtrl.text = newPass);
// // //                 }
// // //               },
// // //               child: _badge('Change', kBlue),
// // //             ),
// // //           ],
// // //         ),
// // //         const SizedBox(height: 6),
// // //         TextFormField(
// // //           controller: _passwordCtrl,
// // //           obscureText: !_showPass,
// // //           style: const TextStyle(
// // //               fontSize: 13, fontWeight: FontWeight.w500, color: kBlack),
// // //           decoration: InputDecoration(
// // //             hintText: 'Min 6 characters',
// // //             hintStyle: const TextStyle(
// // //                 fontSize: 13, color: Color(0xFFBBC5D5), fontWeight: FontWeight.w400),
// // //             isDense: true,
// // //             contentPadding: const EdgeInsets.symmetric(vertical: 8),
// // //             border: InputBorder.none,
// // //             enabledBorder: const UnderlineInputBorder(
// // //               borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 1),
// // //             ),
// // //             focusedBorder: const UnderlineInputBorder(
// // //               borderSide: BorderSide(color: kBlue, width: 1.5),
// // //             ),
// // //             suffixIcon: IconButton(
// // //               icon: Icon(_showPass ? Icons.visibility_off : Icons.visibility,
// // //                   size: 20, color: kGrey),
// // //               onPressed: () => setState(() => _showPass = !_showPass),
// // //             ),
// // //           ),
// // //         ),
// // //       ],
// // //     ),
// // //   );

// // //   // ════════════════════════════════════════
// // //   //  DROPDOWN FIELD — opens as bottom sheet
// // //   // ════════════════════════════════════════
// // //   Widget _dropdown(String label, IconData icon, List<String> items,
// // //       String? value, ValueChanged<String?> onChanged) =>
// // //       Padding(
// // //         padding: const EdgeInsets.only(bottom: 20),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Text(label,
// // //                 style: const TextStyle(
// // //                     fontSize: 14,
// // //                     fontWeight: FontWeight.w800,
// // //                     color: kBlue)),
// // //             const SizedBox(height: 6),
// // //             GestureDetector(
// // //               onTap: () => _showPickerSheet(label, items, value, onChanged),
// // //               child: Row(
// // //                 children: [
// // //                   Expanded(
// // //                     child: Text(
// // //                       value ?? 'Select $label',
// // //                       style: TextStyle(
// // //                           fontSize: 13,
// // //                           fontWeight: FontWeight.w500,
// // //                           color: value != null
// // //                               ? kBlack
// // //                               : const Color(0xFFBBC5D5)),
// // //                     ),
// // //                   ),
// // //                   const Icon(Icons.keyboard_arrow_down_rounded,
// // //                       color: kGrey, size: 20),
// // //                 ],
// // //               ),
// // //             ),
// // //             const Divider(
// // //                 color: Color(0xFFE0E0E0), thickness: 1, height: 12),
// // //           ],
// // //         ),
// // //       );

// // //   // ── Bottom sheet picker ──
// // //   void _showPickerSheet(String label, List<String> items,
// // //       String? current, ValueChanged<String?> onChanged) {
// // //     showModalBottomSheet(
// // //       context: context,
// // //       backgroundColor: Colors.transparent,
// // //       isScrollControlled: true,
// // //       builder: (_) => Container(
// // //         decoration: const BoxDecoration(
// // //           color: Colors.white,
// // //           borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
// // //         ),
// // //         padding: const EdgeInsets.fromLTRB(0, 14, 0, 24),
// // //         child: Column(
// // //           mainAxisSize: MainAxisSize.min,
// // //           children: [
// // //             // Handle
// // //             Container(
// // //               width: 40, height: 4,
// // //               decoration: BoxDecoration(
// // //                 color: kBorderGrey,
// // //                 borderRadius: BorderRadius.circular(10),
// // //               ),
// // //             ),
// // //             const SizedBox(height: 14),
// // //             Padding(
// // //               padding: const EdgeInsets.symmetric(horizontal: 20),
// // //               child: Text('Select $label',
// // //                   style: const TextStyle(
// // //                       fontSize: 16,
// // //                       fontWeight: FontWeight.w800,
// // //                       color: kBlack)),
// // //             ),
// // //             const SizedBox(height: 10),
// // //             const Divider(color: kBorderGrey, height: 1),
// // //             ConstrainedBox(
// // //               constraints: BoxConstraints(
// // //                 maxHeight: MediaQuery.of(context).size.height * 0.45,
// // //               ),
// // //               child: ListView.builder(
// // //                 shrinkWrap: true,
// // //                 physics: const BouncingScrollPhysics(),
// // //                 itemCount: items.length,
// // //                 itemBuilder: (_, i) {
// // //                   final item = items[i];
// // //                   final isSelected = item == current;
// // //                   return InkWell(
// // //                     onTap: () {
// // //                       onChanged(item);
// // //                       Navigator.pop(context);
// // //                     },
// // //                     child: Container(
// // //                       padding: const EdgeInsets.symmetric(
// // //                           horizontal: 20, vertical: 14),
// // //                       color: isSelected
// // //                           ? kBlueLite
// // //                           : Colors.transparent,
// // //                       child: Row(
// // //                         children: [
// // //                           Expanded(
// // //                             child: Text(item,
// // //                                 style: TextStyle(
// // //                                     fontSize: 14,
// // //                                     fontWeight: isSelected
// // //                                         ? FontWeight.w700
// // //                                         : FontWeight.w500,
// // //                                     color: isSelected
// // //                                         ? kBlue
// // //                                         : kBlack)),
// // //                           ),
// // //                           if (isSelected)
// // //                             const Icon(Icons.check_rounded,
// // //                                 color: kBlue, size: 18),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   // ════════════════════════════════════════
// // //   //  DATE PICKER FIELD
// // //   // ════════════════════════════════════════
// // //   Widget _datePicker() => Padding(
// // //     padding: const EdgeInsets.only(bottom: 20),
// // //     child: Column(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         const Text('Date of Birth',
// // //             style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF1A2E5A), letterSpacing: 0.2)),
// // //         const SizedBox(height: 6),
// // //         GestureDetector(
// // //           onTap: _pickDOB,
// // //           child: Row(
// // //             children: [
// // //               Expanded(
// // //                 child: Text(
// // //                   _selectedDOB != null
// // //                       ? '${_selectedDOB!.day.toString().padLeft(2, '0')} / ${_selectedDOB!.month.toString().padLeft(2, '0')} / ${_selectedDOB!.year}'
// // //                       : '15 / 08 / 1995',
// // //                   style: TextStyle(
// // //                       fontSize: 13,
// // //                       fontWeight: FontWeight.w500,
// // //                       color: _selectedDOB != null ? kBlack : const Color(0xFFBBC5D5)),
// // //                 ),
// // //               ),
// // //               const Icon(Icons.calendar_today_rounded, size: 18, color: kGrey),
// // //             ],
// // //           ),
// // //         ),
// // //         const Divider(color: Color(0xFFE0E0E0), thickness: 1, height: 12),
// // //       ],
// // //     ),
// // //   );

// // //   // ── Badge ──
// // //   Widget _badge(String text, Color color) => Container(
// // //     padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
// // //     decoration: BoxDecoration(color: color.withOpacity(0.1),
// // //         borderRadius: BorderRadius.circular(20),
// // //         border: Border.all(color: color.withOpacity(0.35))),
// // //     child: Text(text,
// // //         style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w700)),
// // //   );

// // //   // ── Chip ──
// // //   Widget _chip(String text, VoidCallback onDelete) => Padding(
// // //     padding: const EdgeInsets.only(bottom: 8),
// // //     child: Container(
// // //       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
// // //       decoration: BoxDecoration(color: kBlueLite, borderRadius: BorderRadius.circular(12),
// // //           border: Border.all(color: kBlue.withOpacity(0.2))),
// // //       child: Row(
// // //         children: [
// // //           const Icon(Icons.check_circle_rounded, color: kBlue, size: 16),
// // //           const SizedBox(width: 8),
// // //           Expanded(child: Text(text,
// // //               style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: kBlack))),
// // //           GestureDetector(onTap: onDelete,
// // //               child: const Icon(Icons.close_rounded, color: kGrey, size: 16)),
// // //         ],
// // //       ),
// // //     ),
// // //   );

// // //   // ── Add button ──
// // //   Widget _addButton(String label, VoidCallback onTap) => GestureDetector(
// // //     onTap: onTap,
// // //     child: Container(
// // //       width: double.infinity,
// // //       padding: const EdgeInsets.symmetric(vertical: 15),
// // //       decoration: BoxDecoration(color: Colors.white,
// // //           borderRadius: BorderRadius.circular(16),
// // //           border: Border.all(color: kBlue.withOpacity(0.35), width: 1.5),
// // //           boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03),
// // //               blurRadius: 6, offset: const Offset(0, 2))]),
// // //       child: Row(
// // //         mainAxisAlignment: MainAxisAlignment.center,
// // //         children: [
// // //           const Icon(Icons.add_circle_outline_rounded, size: 18, color: kBlue),
// // //           const SizedBox(width: 6),
// // //           Text(label,
// // //               style: const TextStyle(fontSize: 13, color: kBlue, fontWeight: FontWeight.w700)),
// // //         ],
// // //       ),
// // //     ),
// // //   );
// // // }
















// // // lib/screens/edit_profile_screen.dart

// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import '../constants/app_colors.dart';
// // import 'change_password_screen.dart';
// // import 'address_screen.dart';

// // class EditProfileScreen extends StatefulWidget {
// //   const EditProfileScreen({super.key});

// //   @override
// //   State<EditProfileScreen> createState() => _EditProfileScreenState();
// // }

// // class _EditProfileScreenState extends State<EditProfileScreen>
// //     with TickerProviderStateMixin {

// //   late TabController _tabController;
// //   bool _hasPhoto    = false;
// //   bool _hovering    = false;
// //   bool _showPass    = false;
// //   bool _emailVerified = false;

// //   // ── Primary ──
// //   final _fullNameCtrl    = TextEditingController();
// //   final _emailCtrl       = TextEditingController();
// //   final _phoneCtrl       = TextEditingController();
// //   final _passwordCtrl    = TextEditingController();
// //   final _pincodeCtrl     = TextEditingController();

// //   // ── Dropdown selections ──
// //   String? _selectedLanguage;
// //   String? _selectedNationality;
// //   String? _selectedCity;
// //   String? _selectedState;
// //   String? _selectedGender;
// //   String? _selectedMarital;
// //   String? _selectedBloodGroup;

// //   // ── Other info ──
// //   final _kidsCtrl       = TextEditingController();
// //   final _educationCtrl  = TextEditingController();
// //   final _incomeCtrl     = TextEditingController();
// //   final _occupationCtrl = TextEditingController();
// //   final _businessCtrl   = TextEditingController();
// //   DateTime? _selectedDOB;

// //   final List<String> _extraEducations = [];
// //   final List<String> _extraWorkplaces = [];

// //   // ── Dropdown data ──
// //   final List<String> _languages = [
// //     'Tamil','English','Hindi','Telugu','Kannada','Malayalam',
// //     'Bengali','Marathi','Gujarati','Punjabi','Urdu','Odia',
// //   ];
// //   final List<String> _nationalities = [
// //     'Indian','American','British','Australian','Canadian',
// //     'German','French','Japanese','Chinese','Other',
// //   ];
// //   final List<String> _cities = [
// //     'Chennai','Puducherry','Bangalore','Mumbai','Delhi',
// //     'Hyderabad','Kolkata','Pune','Ahmedabad','Coimbatore',
// //     'Madurai','Trichy','Salem','Vellore','Other',
// //   ];
// //   final List<String> _states = [
// //     'Tamil Nadu','Kerala','Karnataka','Andhra Pradesh',
// //     'Telangana','Maharashtra','Gujarat','Rajasthan',
// //     'Uttar Pradesh','West Bengal','Punjab','Other',
// //   ];
// //   final List<String> _genders = ['Male','Female','Other','Prefer not to say'];
// //   final List<String> _maritalStatus = ['Single','Married','Divorced','Widowed'];
// //   final List<String> _bloodGroups = ['A+','A-','B+','B-','O+','O-','AB+','AB-'];

// //   @override
// //   void initState() {
// //     super.initState();
// //     _tabController = TabController(length: 2, vsync: this);
// //     _loadData();
// //   }

// //   // ════════════════════════════════════════
// //   //  LOAD SAVED DATA
// //   // ════════════════════════════════════════
// //   Future<void> _loadData() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     setState(() {
// //       _fullNameCtrl.text    = prefs.getString('fullName')    ?? '';
// //       _emailCtrl.text       = prefs.getString('email')       ?? '';
// //       _phoneCtrl.text       = prefs.getString('phone')       ?? '';
// //       _passwordCtrl.text    = prefs.getString('password')    ?? '';
// //       _pincodeCtrl.text     = prefs.getString('pincode')     ?? '';
// //       _kidsCtrl.text        = prefs.getString('kids')        ?? '';
// //       _educationCtrl.text   = prefs.getString('education')   ?? '';
// //       _incomeCtrl.text      = prefs.getString('income')      ?? '';
// //       _occupationCtrl.text  = prefs.getString('occupation')  ?? '';
// //       _businessCtrl.text    = prefs.getString('business')    ?? '';
// //       _selectedLanguage     = prefs.getString('language');
// //       _selectedNationality  = prefs.getString('nationality');
// //       _selectedCity         = prefs.getString('city');
// //       _selectedState        = prefs.getString('state');
// //       _selectedGender       = prefs.getString('gender');
// //       _selectedMarital      = prefs.getString('marital');
// //       _selectedBloodGroup   = prefs.getString('bloodGroup');
// //       _emailVerified        = prefs.getBool('emailVerified') ?? false;
// //       final dob = prefs.getString('dob');
// //       if (dob != null) _selectedDOB = DateTime.tryParse(dob);
// //     });
// //   }

// //   // ════════════════════════════════════════
// //   //  SAVE DATA
// //   // ════════════════════════════════════════
// //   Future<void> _saveData() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     await prefs.setString('fullName',   _fullNameCtrl.text.trim());
// //     await prefs.setString('email',      _emailCtrl.text.trim());
// //     await prefs.setString('phone',      _phoneCtrl.text.trim());
// //     await prefs.setString('password',   _passwordCtrl.text.trim());
// //     await prefs.setString('pincode',    _pincodeCtrl.text.trim());
// //     await prefs.setString('kids',       _kidsCtrl.text.trim());
// //     await prefs.setString('education',  _educationCtrl.text.trim());
// //     await prefs.setString('income',     _incomeCtrl.text.trim());
// //     await prefs.setString('occupation', _occupationCtrl.text.trim());
// //     await prefs.setString('business',   _businessCtrl.text.trim());
// //     if (_selectedLanguage    != null) await prefs.setString('language',    _selectedLanguage!);
// //     if (_selectedNationality != null) await prefs.setString('nationality', _selectedNationality!);
// //     if (_selectedCity        != null) await prefs.setString('city',        _selectedCity!);
// //     if (_selectedState       != null) await prefs.setString('state',       _selectedState!);
// //     if (_selectedGender      != null) await prefs.setString('gender',      _selectedGender!);
// //     if (_selectedMarital     != null) await prefs.setString('marital',     _selectedMarital!);
// //     if (_selectedBloodGroup  != null) await prefs.setString('bloodGroup',  _selectedBloodGroup!);
// //     await prefs.setBool('emailVerified', _emailVerified);
// //     if (_selectedDOB != null) await prefs.setString('dob', _selectedDOB!.toIso8601String());
// //   }

// //   @override
// //   void dispose() {
// //     _tabController.dispose();
// //     super.dispose();
// //   }

// //   // ════════════════════════════════════════
// //   //  DATE PICKER
// //   // ════════════════════════════════════════
// //   Future<void> _pickDOB() async {
// //     final picked = await showDatePicker(
// //       context: context,
// //       initialDate: DateTime(1995, 1, 1),
// //       firstDate: DateTime(1940),
// //       lastDate: DateTime.now(),
// //       builder: (context, child) => Theme(
// //         data: Theme.of(context).copyWith(
// //           colorScheme: const ColorScheme.light(
// //             primary: kBlue,
// //             onPrimary: Colors.white,
// //             surface: Colors.white,
// //           ),
// //         ),
// //         child: child!,
// //       ),
// //     );
// //     if (picked != null) setState(() => _selectedDOB = picked);
// //   }

// //   // ════════════════════════════════════════
// //   //  UPLOAD IMAGE SHEET
// //   // ════════════════════════════════════════
// //   void _uploadImage() {
// //     showModalBottomSheet(
// //       context: context,
// //       backgroundColor: Colors.transparent,
// //       builder: (_) => Container(
// //         decoration: const BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
// //         ),
// //         padding: const EdgeInsets.fromLTRB(20, 14, 20, 32),
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             Container(width: 40, height: 4,
// //                 decoration: BoxDecoration(color: kBorderGrey,
// //                     borderRadius: BorderRadius.circular(10))),
// //             const SizedBox(height: 20),
// //             const Text('Upload Profile Photo',
// //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: kBlack)),
// //             const SizedBox(height: 24),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               children: [
// //                 _photoOpt(Icons.camera_alt_rounded, 'Camera', kBlue, () {
// //                   Navigator.pop(context);
// //                   setState(() => _hasPhoto = true);
// //                   _showSnack('Camera opened!', kBlue);
// //                 }),
// //                 _photoOpt(Icons.photo_library_rounded, 'Gallery', const Color(0xFF7C3AED), () {
// //                   Navigator.pop(context);
// //                   setState(() => _hasPhoto = true);
// //                   _showSnack('Gallery opened!', kBlue);
// //                 }),
// //                 _photoOpt(Icons.delete_outline_rounded, 'Remove', Colors.red, () {
// //                   Navigator.pop(context);
// //                   setState(() => _hasPhoto = false);
// //                   _showSnack('Photo removed', Colors.red);
// //                 }),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _photoOpt(IconData icon, String label, Color color, VoidCallback onTap) =>
// //       GestureDetector(
// //         onTap: onTap,
// //         child: Column(
// //           children: [
// //             Container(width: 60, height: 60,
// //               decoration: BoxDecoration(color: color.withOpacity(0.1),
// //                   shape: BoxShape.circle,
// //                   border: Border.all(color: color.withOpacity(0.3), width: 1.5)),
// //               child: Icon(icon, color: color, size: 26)),
// //             const SizedBox(height: 8),
// //             Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color)),
// //           ],
// //         ),
// //       );

// //   // ════════════════════════════════════════
// //   //  VERIFY EMAIL
// //   // ════════════════════════════════════════
// //   void _verifyEmail() {
// //     if (_emailCtrl.text.isEmpty || !_emailCtrl.text.contains('@')) {
// //       _showSnack('Enter a valid email first!', Colors.orange);
// //       return;
// //     }
// //     final otpCtrl = TextEditingController();
// //     showDialog(context: context,
// //       builder: (_) => AlertDialog(
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// //         title: const Text('Verify Email',
// //             style: TextStyle(fontWeight: FontWeight.w800, color: kBlack)),
// //         content: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             Text('Enter the OTP sent to\n${_emailCtrl.text}',
// //                 textAlign: TextAlign.center,
// //                 style: const TextStyle(fontSize: 13, color: kGrey)),
// //             const SizedBox(height: 16),
// //             TextField(
// //               controller: otpCtrl,
// //               keyboardType: TextInputType.number,
// //               inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// //               textAlign: TextAlign.center,
// //               maxLength: 6,
// //               style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, letterSpacing: 8),
// //               decoration: InputDecoration(
// //                 counterText: '',
// //                 hintText: '------',
// //                 hintStyle: const TextStyle(color: kBorderGrey),
// //                 filled: true, fillColor: kBlueLite,
// //                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
// //               ),
// //             ),
// //           ],
// //         ),
// //         actions: [
// //           TextButton(onPressed: () => Navigator.pop(context),
// //               child: const Text('Cancel', style: TextStyle(color: kGrey))),
// //           ElevatedButton(
// //             style: ElevatedButton.styleFrom(backgroundColor: kBlue,
// //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
// //             onPressed: () {
// //               Navigator.pop(context);
// //               setState(() => _emailVerified = true);
// //               _showSnack('Email verified ✓', const Color(0xFF16A34A));
// //             },
// //             child: const Text('Verify', style: TextStyle(color: Colors.white)),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   // ════════════════════════════════════════
// //   //  CHANGE PASSWORD
// //   // ════════════════════════════════════════
// //   void _changePassword() {
// //     final currentCtrl = TextEditingController();
// //     final newCtrl     = TextEditingController();
// //     final confirmCtrl = TextEditingController();
// //     bool showNew = false;
// //     showModalBottomSheet(
// //       context: context,
// //       isScrollControlled: true,
// //       backgroundColor: Colors.transparent,
// //       builder: (_) => StatefulBuilder(
// //         builder: (ctx, setBS) => Padding(
// //           padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
// //           child: Container(
// //             decoration: const BoxDecoration(color: Colors.white,
// //                 borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
// //             padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Center(child: Container(width: 40, height: 4,
// //                     decoration: BoxDecoration(color: kBorderGrey,
// //                         borderRadius: BorderRadius.circular(10)))),
// //                 const SizedBox(height: 18),
// //                 const Text('Change Password',
// //                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: kBlack)),
// //                 const SizedBox(height: 20),
// //                 _sheetField('Current Password', currentCtrl, isPassword: true),
// //                 const SizedBox(height: 12),
// //                 TextField(
// //                   controller: newCtrl,
// //                   obscureText: !showNew,
// //                   decoration: InputDecoration(
// //                     labelText: 'New Password',
// //                     labelStyle: const TextStyle(color: kGrey, fontSize: 13),
// //                     filled: true, fillColor: kBlueLite,
// //                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
// //                     focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
// //                         borderSide: const BorderSide(color: kBlue, width: 1.5)),
// //                     isDense: true,
// //                     suffixIcon: IconButton(
// //                       icon: Icon(showNew ? Icons.visibility_off : Icons.visibility, color: kGrey),
// //                       onPressed: () => setBS(() => showNew = !showNew),
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 12),
// //                 _sheetField('Confirm New Password', confirmCtrl, isPassword: true),
// //                 const SizedBox(height: 20),
// //                 SizedBox(
// //                   width: double.infinity,
// //                   child: ElevatedButton(
// //                     style: ElevatedButton.styleFrom(backgroundColor: kBlue,
// //                         padding: const EdgeInsets.symmetric(vertical: 14),
// //                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
// //                     onPressed: () {
// //                       if (newCtrl.text == confirmCtrl.text && newCtrl.text.isNotEmpty) {
// //                         Navigator.pop(context);
// //                         _showSnack('Password changed!', const Color(0xFF16A34A));
// //                       } else {
// //                         _showSnack('Passwords do not match!', Colors.red);
// //                       }
// //                     },
// //                     child: const Text('Update Password',
// //                         style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   // ════════════════════════════════════════
// //   //  ADD EDUCATION / WORKPLACE
// //   // ════════════════════════════════════════
// //   void _addEducation() {
// //     final ctrl = TextEditingController();
// //     showDialog(context: context,
// //       builder: (_) => AlertDialog(
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// //         title: const Text('Add Education',
// //             style: TextStyle(fontWeight: FontWeight.w800, color: kBlack)),
// //         content: _sheetField('Degree / Course', ctrl),
// //         actions: [
// //           TextButton(onPressed: () => Navigator.pop(context),
// //               child: const Text('Cancel', style: TextStyle(color: kGrey))),
// //           ElevatedButton(
// //             style: ElevatedButton.styleFrom(backgroundColor: kBlue,
// //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
// //             onPressed: () {
// //               if (ctrl.text.trim().isNotEmpty) {
// //                 setState(() => _extraEducations.add(ctrl.text.trim()));
// //                 Navigator.pop(context);
// //                 _showSnack('Education added!', kBlue);
// //               }
// //             },
// //             child: const Text('Add', style: TextStyle(color: Colors.white)),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   void _addWorkplace() {
// //     final ctrl = TextEditingController();
// //     showDialog(context: context,
// //       builder: (_) => AlertDialog(
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// //         title: const Text('Add a Workplace',
// //             style: TextStyle(fontWeight: FontWeight.w800, color: kBlack)),
// //         content: _sheetField('Company / Hospital Name', ctrl),
// //         actions: [
// //           TextButton(onPressed: () => Navigator.pop(context),
// //               child: const Text('Cancel', style: TextStyle(color: kGrey))),
// //           ElevatedButton(
// //             style: ElevatedButton.styleFrom(backgroundColor: kBlue,
// //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
// //             onPressed: () {
// //               if (ctrl.text.trim().isNotEmpty) {
// //                 setState(() => _extraWorkplaces.add(ctrl.text.trim()));
// //                 Navigator.pop(context);
// //                 _showSnack('Workplace added!', kBlue);
// //               }
// //             },
// //             child: const Text('Add', style: TextStyle(color: Colors.white)),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   void _showSnack(String msg, Color color) {
// //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //       content: Text(msg),
// //       backgroundColor: color,
// //       behavior: SnackBarBehavior.floating,
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //     ));
// //   }

// //   Widget _sheetField(String label, TextEditingController ctrl, {bool isPassword = false}) =>
// //       TextField(
// //         controller: ctrl,
// //         obscureText: isPassword,
// //         decoration: InputDecoration(
// //           labelText: label,
// //           labelStyle: const TextStyle(color: kGrey, fontSize: 13),
// //           filled: true, fillColor: kBlueLite,
// //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
// //           focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
// //               borderSide: const BorderSide(color: kBlue, width: 1.5)),
// //           isDense: true,
// //         ),
// //       );

// //   // ════════════════════════════════════════
// //   //  BUILD
// //   // ════════════════════════════════════════
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF5F7FA),
// //       body: SafeArea(
// //         child: Column(
// //           children: [
// //             _appBar(context),
// //             _tabBar(),
// //             Expanded(
// //               child: TabBarView(
// //                 controller: _tabController,
// //                 children: [_primaryTab(), _otherInfoTab()],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   // ════════════════════════════════════════
// //   //  APP BAR
// //   // ════════════════════════════════════════
// //   Widget _appBar(BuildContext context) => Container(
// //     decoration: const BoxDecoration(
// //       gradient: LinearGradient(colors: [kBlue, Color(0xFF1A73E8)],
// //           begin: Alignment.centerLeft, end: Alignment.centerRight),
// //     ),
// //     padding: const EdgeInsets.fromLTRB(4, 6, 14, 10),
// //     child: Row(
// //       children: [
// //         IconButton(icon: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.white),
// //             onPressed: () => Navigator.pop(context)),
// //         const Expanded(
// //           child: Center(
// //             child: Text('Edit profile information',
// //                 style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white)),
// //           ),
// //         ),
// //         GestureDetector(
// //           onTap: () async {
// //             // ── Validate ALL fields ──
// //             if (_fullNameCtrl.text.trim().isEmpty) {
// //               _showSnack('Please enter your full name!', Colors.red); return;
// //             }
// //             if (_emailCtrl.text.trim().isEmpty || !_emailCtrl.text.contains('@') || !_emailCtrl.text.contains('.')) {
// //               _showSnack('Please enter a valid email address!', Colors.red); return;
// //             }
// //             if (_phoneCtrl.text.trim().length < 10) {
// //               _showSnack('Phone number must be 10 digits!', Colors.red); return;
// //             }
// //             if (_passwordCtrl.text.trim().isEmpty || _passwordCtrl.text.length < 6) {
// //               _showSnack('Password must be at least 6 characters!', Colors.red); return;
// //             }
// //             if (_selectedLanguage == null) {
// //               _showSnack('Please select a language!', Colors.red); return;
// //             }
// //             if (_selectedNationality == null) {
// //               _showSnack('Please select your nationality!', Colors.red); return;
// //             }
// //             if (_pincodeCtrl.text.trim().length < 6) {
// //               _showSnack('Pincode must be 6 digits!', Colors.red); return;
// //             }
// //             if (_selectedCity == null) {
// //               _showSnack('Please select your city!', Colors.red); return;
// //             }
// //             if (_selectedState == null) {
// //               _showSnack('Please select your state!', Colors.red); return;
// //             }
// //             if (_selectedGender == null) {
// //               _showSnack('Please select your gender!', Colors.red); return;
// //             }
// //             if (_selectedDOB == null) {
// //               _showSnack('Please select your date of birth!', Colors.red); return;
// //             }
// //             if (_selectedMarital == null) {
// //               _showSnack('Please select your marital status!', Colors.red); return;
// //             }
// //             if (_incomeCtrl.text.trim().isEmpty) {
// //               _showSnack('Please enter your monthly income!', Colors.red); return;
// //             }
// //             if (_occupationCtrl.text.trim().isEmpty) {
// //               _showSnack('Please enter your occupation!', Colors.red); return;
// //             }
// //             if (_kidsCtrl.text.trim().isEmpty) {
// //               _showSnack('Please enter number of kids!', Colors.red); return;
// //             }
// //             if (_educationCtrl.text.trim().isEmpty) {
// //               _showSnack('Please enter your education!', Colors.red); return;
// //             }
// //             if (_businessCtrl.text.trim().isEmpty) {
// //               _showSnack('Please enter your business name!', Colors.red); return;
// //             }
// //             if (_selectedBloodGroup == null) {
// //               _showSnack('Please select your blood group!', Colors.red); return;
// //             }
// //             // ── Save all data ──
// //             await _saveData();
// //             _showSnack('✅ Profile saved successfully!', const Color(0xFF16A34A));
// //             Navigator.pop(context);
// //           },
// //           child: Container(
// //             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
// //             decoration: BoxDecoration(color: Colors.white.withOpacity(0.2),
// //                 borderRadius: BorderRadius.circular(20),
// //                 border: Border.all(color: Colors.white.withOpacity(0.5))),
// //             child: const Text('Save',
// //                 style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700)),
// //           ),
// //         ),
// //       ],
// //     ),
// //   );

// //   // ════════════════════════════════════════
// //   //  TAB BAR
// //   // ════════════════════════════════════════
// //   Widget _tabBar() => Container(
// //     color: Colors.white,
// //     child: TabBar(
// //       controller: _tabController,
// //       labelColor: kBlue,
// //       unselectedLabelColor: kGrey,
// //       indicatorColor: kBlue,
// //       indicatorWeight: 3,
// //       labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
// //       tabs: const [Tab(text: 'Primary'), Tab(text: 'Other Info')],
// //     ),
// //   );

// //   // ════════════════════════════════════════
// //   //  PRIMARY TAB
// //   // ════════════════════════════════════════
// //   Widget _primaryTab() => SingleChildScrollView(
// //     physics: const BouncingScrollPhysics(),
// //     padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
// //     child: Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         // ── Profile picture card ──
// //         Container(
// //           padding: const EdgeInsets.all(16),
// //           decoration: BoxDecoration(
// //             color: Colors.white,
// //             borderRadius: BorderRadius.circular(16),
// //             border: Border.all(color: const Color(0xFFEEF1F8)),
// //             boxShadow: [
// //               BoxShadow(color: Colors.black.withOpacity(0.05),
// //                   blurRadius: 12, offset: const Offset(0, 3)),
// //             ],
// //           ),
// //           child: Row(
// //             children: [
// //               // ── Avatar ──
// //               MouseRegion(
// //                 onEnter: (_) => setState(() => _hovering = true),
// //                 onExit: (_) => setState(() => _hovering = false),
// //                 child: GestureDetector(
// //                   onTap: _uploadImage,
// //                   child: Stack(
// //                     children: [
// //                       Container(
// //                         width: 70, height: 70,
// //                         decoration: BoxDecoration(
// //                           shape: BoxShape.circle,
// //                           color: const Color(0xFFF0F3F8),
// //                           border: Border.all(
// //                               color: const Color(0xFFDDE2EA), width: 2),
// //                         ),
// //                         child: ClipOval(
// //                           child: _hasPhoto
// //                               ? Container(color: kBlueLite,
// //                               child: const Icon(Icons.check_circle_rounded,
// //                                   size: 40, color: kBlue))
// //                               : const Icon(Icons.person_rounded,
// //                                   size: 42, color: Color(0xFFB0BEC5)),
// //                         ),
// //                       ),
// //                       if (_hovering)
// //                         Container(
// //                           width: 70, height: 70,
// //                           decoration: BoxDecoration(
// //                             shape: BoxShape.circle,
// //                             color: Colors.black.withOpacity(0.4)),
// //                           child: const Icon(Icons.camera_alt_rounded,
// //                               color: Colors.white, size: 24),
// //                         ),
// //                       Positioned(
// //                         bottom: 0, right: 0,
// //                         child: Container(
// //                           width: 22, height: 22,
// //                           decoration: BoxDecoration(
// //                             color: kBlue,
// //                             shape: BoxShape.circle,
// //                             border: Border.all(color: Colors.white, width: 1.5),
// //                           ),
// //                           child: const Icon(Icons.camera_alt_rounded,
// //                               size: 11, color: Colors.white),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(width: 16),
// //               // ── Upload / Remove ──
// //               Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     const Text('Profile Picture',
// //                         style: TextStyle(
// //                             fontSize: 13,
// //                             fontWeight: FontWeight.w700,
// //                             color: kBlack)),
// //                     const SizedBox(height: 10),
// //                     Row(
// //                       children: [
// //                         GestureDetector(
// //                           onTap: _uploadImage,
// //                           child: Container(
// //                             padding: const EdgeInsets.symmetric(
// //                                 horizontal: 16, vertical: 8),
// //                             decoration: BoxDecoration(
// //                               color: kBlue,
// //                               borderRadius: BorderRadius.circular(8),
// //                             ),
// //                             child: const Row(
// //                               mainAxisSize: MainAxisSize.min,
// //                               children: [
// //                                 Icon(Icons.cloud_upload_outlined,
// //                                     color: Colors.white, size: 14),
// //                                 SizedBox(width: 5),
// //                                 Text('Upload Image',
// //                                     style: TextStyle(
// //                                         color: Colors.white,
// //                                         fontSize: 12,
// //                                         fontWeight: FontWeight.w700)),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                         const SizedBox(width: 12),
// //                         GestureDetector(
// //                           onTap: () {
// //                             setState(() => _hasPhoto = false);
// //                             _showSnack('Photo removed', Colors.red);
// //                           },
// //                           child: const Text('Remove',
// //                               style: TextStyle(
// //                                   fontSize: 13,
// //                                   color: Colors.red,
// //                                   fontWeight: FontWeight.w600)),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),

// //         const SizedBox(height: 24),

// //         // ── Full Name — letters only ──
// //         _textField(
// //           label: 'Full Name',
// //           controller: _fullNameCtrl,
// //           icon: Icons.person_outline_rounded,
// //           hint: 'Deepak Kumar',
// //           inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
// //           keyboardType: TextInputType.name,
// //         ),

// //         // ── Email ──
// //         _textField(
// //           label: 'E-mail Address',
// //           controller: _emailCtrl,
// //           icon: Icons.email_outlined,
// //           hint: 'deepak@gmail.com',
// //           keyboardType: TextInputType.emailAddress,
// //           trailing: GestureDetector(
// //             onTap: _verifyEmail,
// //             child: _badge(_emailVerified ? 'Verified ✓' : 'Verify',
// //                 _emailVerified ? const Color(0xFF16A34A) : Colors.orange),
// //           ),
// //         ),

// //         // ── Phone — numbers only, max 10 ──
// //         _textField(
// //           label: 'Phone Number',
// //           controller: _phoneCtrl,
// //           icon: Icons.phone_outlined,
// //           hint: '+91 98765 43210',
// //           keyboardType: TextInputType.phone,
// //           inputFormatters: [
// //             FilteringTextInputFormatter.digitsOnly,
// //             LengthLimitingTextInputFormatter(10),
// //           ],
// //           trailing: _badge('Verified ✓', const Color(0xFF16A34A)),
// //         ),

// //         // ── Password with eye icon ──
// //         _passwordField(),

// //         // ── Language dropdown ──
// //         _dropdown('Language Known', Icons.language_rounded, _languages, _selectedLanguage,
// //             (val) => setState(() => _selectedLanguage = val)),

// //         // ── Nationality dropdown ──
// //         _dropdown('Nationality', Icons.flag_outlined, _nationalities, _selectedNationality,
// //             (val) => setState(() => _selectedNationality = val)),

// //         // ── Pincode — numbers only, max 6 ──
// //         _textField(
// //           label: 'Pincode',
// //           controller: _pincodeCtrl,
// //           icon: Icons.pin_drop_outlined,
// //           hint: '605 001',
// //           keyboardType: TextInputType.number,
// //           inputFormatters: [
// //             FilteringTextInputFormatter.digitsOnly,
// //             LengthLimitingTextInputFormatter(6),
// //           ],
// //         ),

// //         // ── City dropdown ──
// //         _dropdown('City', Icons.location_city_outlined, _cities, _selectedCity,
// //             (val) => setState(() => _selectedCity = val)),

// //         // ── State dropdown ──
// //         _dropdown('State', Icons.map_outlined, _states, _selectedState,
// //             (val) => setState(() => _selectedState = val)),

// //         // ── Gender dropdown ──
// //         _dropdown('Gender', Icons.wc_rounded, _genders, _selectedGender,
// //             (val) => setState(() => _selectedGender = val)),

// //         const SizedBox(height: 4),

// //         // ── Add Address button ──
// //         GestureDetector(
// //           onTap: () => Navigator.push(context,
// //               MaterialPageRoute(builder: (_) => const AddressScreen())),
// //           child: Container(
// //             width: double.infinity,
// //             padding: const EdgeInsets.symmetric(vertical: 15),
// //             decoration: BoxDecoration(
// //               color: Colors.white,
// //               borderRadius: BorderRadius.circular(16),
// //               border: Border.all(color: kBlue.withOpacity(0.35), width: 1.5),
// //               boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03),
// //                   blurRadius: 6, offset: const Offset(0, 2))],
// //             ),
// //             child: const Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Icon(Icons.add_circle_outline_rounded, size: 18, color: kBlue),
// //                 SizedBox(width: 6),
// //                 Text('Add Address',
// //                     style: TextStyle(
// //                         fontSize: 13,
// //                         color: kBlue,
// //                         fontWeight: FontWeight.w700)),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ],
// //     ),
// //   );

// //   // ════════════════════════════════════════
// //   //  OTHER INFO TAB
// //   // ════════════════════════════════════════
// //   Widget _otherInfoTab() => SingleChildScrollView(
// //     physics: const BouncingScrollPhysics(),
// //     padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
// //     child: Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         // ── Date of Birth — date picker ──
// //         _datePicker(),

// //         // ── Marital Status dropdown ──
// //         _dropdown('Marital Status', Icons.favorite_border_rounded,
// //             _maritalStatus, _selectedMarital,
// //             (val) => setState(() => _selectedMarital = val)),

// //         // ── Number of Kids — numbers only ──
// //         _textField(
// //           label: 'Number of Kids',
// //           controller: _kidsCtrl,
// //           icon: Icons.child_care_rounded,
// //           hint: '1',
// //           keyboardType: TextInputType.number,
// //           inputFormatters: [
// //             FilteringTextInputFormatter.digitsOnly,
// //             LengthLimitingTextInputFormatter(2),
// //           ],
// //         ),

// //         // ── Education — letters only ──
// //         _textField(
// //           label: 'Education',
// //           controller: _educationCtrl,
// //           icon: Icons.school_outlined,
// //           hint: 'B.Sc Nursing, MBA',
// //           inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s\.]'))],
// //         ),

// //         // ── Monthly Income — numbers only ──
// //         _textField(
// //           label: 'Monthly Income',
// //           controller: _incomeCtrl,
// //           icon: Icons.currency_rupee_rounded,
// //           hint: '50000',
// //           keyboardType: TextInputType.number,
// //           inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// //         ),

// //         // ── Occupation — letters only ──
// //         _textField(
// //           label: 'Occupation',
// //           controller: _occupationCtrl,
// //           icon: Icons.work_outline_rounded,
// //           hint: 'Doctor, Engineer',
// //           inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
// //         ),

// //         // ── Business Name ──
// //         _textField(
// //           label: 'My Business Name',
// //           controller: _businessCtrl,
// //           icon: Icons.business_outlined,
// //           hint: 'Veesafe Health Pvt Ltd',
// //         ),

// //         // ── Blood Group dropdown ──
// //         _dropdown('Blood Group', Icons.bloodtype_outlined,
// //             _bloodGroups, _selectedBloodGroup,
// //             (val) => setState(() => _selectedBloodGroup = val)),

// //         // ── Extra chips ──
// //         ..._extraEducations.map((e) => _chip(e, () =>
// //             setState(() => _extraEducations.remove(e)))),
// //         ..._extraWorkplaces.map((w) => _chip(w, () =>
// //             setState(() => _extraWorkplaces.remove(w)))),

// //         const SizedBox(height: 8),
// //         _addButton('Add Education', _addEducation),
// //         const SizedBox(height: 12),
// //         _addButton('Add a Workplace', _addWorkplace),
// //       ],
// //     ),
// //   );

// //   // ════════════════════════════════════════
// //   //  FLOATING LABEL TEXT FIELD
// //   // ════════════════════════════════════════
// //   Widget _textField({
// //     required String label,
// //     required TextEditingController controller,
// //     required IconData icon,
// //     String? hint,
// //     bool isPassword = false,
// //     TextInputType keyboardType = TextInputType.text,
// //     List<TextInputFormatter>? inputFormatters,
// //     Widget? trailing,
// //   }) =>
// //       Padding(
// //         padding: const EdgeInsets.only(bottom: 20),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // ── Bold navy label ──
// //             Row(
// //               children: [
// //                 Text(label,
// //                     style: const TextStyle(
// //                         fontSize: 13,
// //                         fontWeight: FontWeight.w700,
// //                         color: Color(0xFF1A2E5A),
// //                         letterSpacing: 0.2)),
// //                 if (trailing != null) ...[
// //                   const Spacer(),
// //                   trailing,
// //                 ],
// //               ],
// //             ),
// //             const SizedBox(height: 8),
// //             // ── Input with underline ──
// //             TextFormField(
// //               controller: controller,
// //               obscureText: isPassword,
// //               keyboardType: keyboardType,
// //               inputFormatters: inputFormatters,
// //               style: const TextStyle(
// //                   fontSize: 14,
// //                   fontWeight: FontWeight.w500,
// //                   color: kBlack),
// //               decoration: InputDecoration(
// //                 hintText: hint,
// //                 hintStyle: const TextStyle(
// //                     fontSize: 13.5,
// //                     color: Color(0xFFC5CDD8),
// //                     fontWeight: FontWeight.w400),
// //                 isDense: true,
// //                 contentPadding:
// //                     const EdgeInsets.symmetric(vertical: 6),
// //                 border: InputBorder.none,
// //                 enabledBorder: const UnderlineInputBorder(
// //                   borderSide: BorderSide(
// //                       color: Color(0xFFDDE2EA), width: 1.2),
// //                 ),
// //                 focusedBorder: UnderlineInputBorder(
// //                   borderSide: BorderSide(color: kBlue, width: 1.8),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       );

// //   // ════════════════════════════════════════
// //   //  PASSWORD FIELD WITH EYE ICON
// //   // ════════════════════════════════════════
// //   Widget _passwordField() => Padding(
// //     padding: const EdgeInsets.only(bottom: 20),
// //     child: Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Row(
// //           children: [
// //             const Text('Change Password',
// //                 style: TextStyle(
// //                     fontSize: 13,
// //                     fontWeight: FontWeight.w700,
// //                     color: Color(0xFF1A2E5A),
// //                     letterSpacing: 0.2)),
// //             const Spacer(),
// //             GestureDetector(
// //               onTap: () async {
// //                 final newPass = await Navigator.push<String>(
// //                   context,
// //                   MaterialPageRoute(
// //                       builder: (_) => const ChangePasswordScreen()),
// //                 );
// //                 if (newPass != null) {
// //                   setState(() => _passwordCtrl.text = newPass);
// //                 }
// //               },
// //               child: _badge('Change', kBlue),
// //             ),
// //           ],
// //         ),
// //         const SizedBox(height: 6),
// //         TextFormField(
// //           controller: _passwordCtrl,
// //           obscureText: !_showPass,
// //           style: const TextStyle(
// //               fontSize: 13, fontWeight: FontWeight.w500, color: kBlack),
// //           decoration: InputDecoration(
// //             hintText: 'Min 6 characters',
// //             hintStyle: const TextStyle(
// //                 fontSize: 13, color: Color(0xFFBBC5D5), fontWeight: FontWeight.w400),
// //             isDense: true,
// //             contentPadding: const EdgeInsets.symmetric(vertical: 8),
// //             border: InputBorder.none,
// //             enabledBorder: const UnderlineInputBorder(
// //               borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 1),
// //             ),
// //             focusedBorder: const UnderlineInputBorder(
// //               borderSide: BorderSide(color: kBlue, width: 1.5),
// //             ),
// //             suffixIcon: IconButton(
// //               icon: Icon(_showPass ? Icons.visibility_off : Icons.visibility,
// //                   size: 20, color: kGrey),
// //               onPressed: () => setState(() => _showPass = !_showPass),
// //             ),
// //           ),
// //         ),
// //       ],
// //     ),
// //   );

// //   // ════════════════════════════════════════
// //   //  DROPDOWN FIELD — opens as bottom sheet
// //   // ════════════════════════════════════════
// //   Widget _dropdown(String label, IconData icon, List<String> items,
// //       String? value, ValueChanged<String?> onChanged) =>
// //       Padding(
// //         padding: const EdgeInsets.only(bottom: 20),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(label,
// //                 style: const TextStyle(
// //                     fontSize: 14,
// //                     fontWeight: FontWeight.w800,
// //                     color: kBlue)),
// //             const SizedBox(height: 6),
// //             GestureDetector(
// //               onTap: () => _showPickerSheet(label, items, value, onChanged),
// //               child: Row(
// //                 children: [
// //                   Expanded(
// //                     child: Text(
// //                       value ?? 'Select $label',
// //                       style: TextStyle(
// //                           fontSize: 13,
// //                           fontWeight: FontWeight.w500,
// //                           color: value != null
// //                               ? kBlack
// //                               : const Color(0xFFBBC5D5)),
// //                     ),
// //                   ),
// //                   const Icon(Icons.keyboard_arrow_down_rounded,
// //                       color: kGrey, size: 20),
// //                 ],
// //               ),
// //             ),
// //             const Divider(
// //                 color: Color(0xFFE0E0E0), thickness: 1, height: 12),
// //           ],
// //         ),
// //       );

// //   // ── Bottom sheet picker ──
// //   void _showPickerSheet(String label, List<String> items,
// //       String? current, ValueChanged<String?> onChanged) {
// //     showModalBottomSheet(
// //       context: context,
// //       backgroundColor: Colors.transparent,
// //       isScrollControlled: true,
// //       builder: (_) => Container(
// //         decoration: const BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
// //         ),
// //         padding: const EdgeInsets.fromLTRB(0, 14, 0, 24),
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             // Handle
// //             Container(
// //               width: 40, height: 4,
// //               decoration: BoxDecoration(
// //                 color: kBorderGrey,
// //                 borderRadius: BorderRadius.circular(10),
// //               ),
// //             ),
// //             const SizedBox(height: 14),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 20),
// //               child: Text('Select $label',
// //                   style: const TextStyle(
// //                       fontSize: 16,
// //                       fontWeight: FontWeight.w800,
// //                       color: kBlack)),
// //             ),
// //             const SizedBox(height: 10),
// //             const Divider(color: kBorderGrey, height: 1),
// //             ConstrainedBox(
// //               constraints: BoxConstraints(
// //                 maxHeight: MediaQuery.of(context).size.height * 0.45,
// //               ),
// //               child: ListView.builder(
// //                 shrinkWrap: true,
// //                 physics: const BouncingScrollPhysics(),
// //                 itemCount: items.length,
// //                 itemBuilder: (_, i) {
// //                   final item = items[i];
// //                   final isSelected = item == current;
// //                   return InkWell(
// //                     onTap: () {
// //                       onChanged(item);
// //                       Navigator.pop(context);
// //                     },
// //                     child: Container(
// //                       padding: const EdgeInsets.symmetric(
// //                           horizontal: 20, vertical: 14),
// //                       color: isSelected
// //                           ? kBlueLite
// //                           : Colors.transparent,
// //                       child: Row(
// //                         children: [
// //                           Expanded(
// //                             child: Text(item,
// //                                 style: TextStyle(
// //                                     fontSize: 14,
// //                                     fontWeight: isSelected
// //                                         ? FontWeight.w700
// //                                         : FontWeight.w500,
// //                                     color: isSelected
// //                                         ? kBlue
// //                                         : kBlack)),
// //                           ),
// //                           if (isSelected)
// //                             const Icon(Icons.check_rounded,
// //                                 color: kBlue, size: 18),
// //                         ],
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   // ════════════════════════════════════════
// //   //  DATE PICKER FIELD
// //   // ════════════════════════════════════════
// //   Widget _datePicker() => Padding(
// //     padding: const EdgeInsets.only(bottom: 20),
// //     child: Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         const Text('Date of Birth',
// //             style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF1A2E5A), letterSpacing: 0.2)),
// //         const SizedBox(height: 6),
// //         GestureDetector(
// //           onTap: _pickDOB,
// //           child: Row(
// //             children: [
// //               Expanded(
// //                 child: Text(
// //                   _selectedDOB != null
// //                       ? '${_selectedDOB!.day.toString().padLeft(2, '0')} / ${_selectedDOB!.month.toString().padLeft(2, '0')} / ${_selectedDOB!.year}'
// //                       : '15 / 08 / 1995',
// //                   style: TextStyle(
// //                       fontSize: 13,
// //                       fontWeight: FontWeight.w500,
// //                       color: _selectedDOB != null ? kBlack : const Color(0xFFBBC5D5)),
// //                 ),
// //               ),
// //               const Icon(Icons.calendar_today_rounded, size: 18, color: kGrey),
// //             ],
// //           ),
// //         ),
// //         const Divider(color: Color(0xFFE0E0E0), thickness: 1, height: 12),
// //       ],
// //     ),
// //   );

// //   // ── Badge ──
// //   Widget _badge(String text, Color color) => Container(
// //     padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
// //     decoration: BoxDecoration(color: color.withOpacity(0.1),
// //         borderRadius: BorderRadius.circular(20),
// //         border: Border.all(color: color.withOpacity(0.35))),
// //     child: Text(text,
// //         style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w700)),
// //   );

// //   // ── Chip ──
// //   Widget _chip(String text, VoidCallback onDelete) => Padding(
// //     padding: const EdgeInsets.only(bottom: 8),
// //     child: Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
// //       decoration: BoxDecoration(color: kBlueLite, borderRadius: BorderRadius.circular(12),
// //           border: Border.all(color: kBlue.withOpacity(0.2))),
// //       child: Row(
// //         children: [
// //           const Icon(Icons.check_circle_rounded, color: kBlue, size: 16),
// //           const SizedBox(width: 8),
// //           Expanded(child: Text(text,
// //               style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: kBlack))),
// //           GestureDetector(onTap: onDelete,
// //               child: const Icon(Icons.close_rounded, color: kGrey, size: 16)),
// //         ],
// //       ),
// //     ),
// //   );

// //   // ── Add button ──
// //   Widget _addButton(String label, VoidCallback onTap) => GestureDetector(
// //     onTap: onTap,
// //     child: Container(
// //       width: double.infinity,
// //       padding: const EdgeInsets.symmetric(vertical: 15),
// //       decoration: BoxDecoration(color: Colors.white,
// //           borderRadius: BorderRadius.circular(16),
// //           border: Border.all(color: kBlue.withOpacity(0.35), width: 1.5),
// //           boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03),
// //               blurRadius: 6, offset: const Offset(0, 2))]),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           const Icon(Icons.add_circle_outline_rounded, size: 18, color: kBlue),
// //           const SizedBox(width: 6),
// //           Text(label,
// //               style: const TextStyle(fontSize: 13, color: kBlue, fontWeight: FontWeight.w700)),
// //         ],
// //       ),
// //     ),
// //   );
// // }








// // lib/screens/edit_profile_screen.dart

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../constants/app_colors.dart';
// import 'change_password_screen.dart';
// import 'address_screen.dart';

// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({super.key});

//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen>
//     with TickerProviderStateMixin {

//   late TabController _tabController;
//   bool _hasPhoto    = false;
//   bool _hovering    = false;
//   bool _showPass    = false;
//   bool _emailVerified = false;

//   // ── Primary ──
//   final _fullNameCtrl    = TextEditingController();
//   final _emailCtrl       = TextEditingController();
//   final _phoneCtrl       = TextEditingController();
//   final _passwordCtrl    = TextEditingController();
//   final _pincodeCtrl     = TextEditingController();

//   // ── Dropdown selections ──
//   String? _selectedLanguage;
//   String? _selectedNationality;
//   String? _selectedCity;
//   String? _selectedState;
//   String? _selectedGender;
//   String? _selectedMarital;
//   String? _selectedBloodGroup;

//   // ── Other info ──
//   final _kidsCtrl       = TextEditingController();
//   final _educationCtrl  = TextEditingController();
//   final _incomeCtrl     = TextEditingController();
//   final _occupationCtrl = TextEditingController();
//   final _businessCtrl   = TextEditingController();
//   DateTime? _selectedDOB;

//   final List<String> _extraEducations = [];
//   final List<String> _extraWorkplaces = [];
//   List<Map<String, String>> _savedAddresses = [];

//   // ── Dropdown data ──
//   final List<String> _languages = [
//     'Tamil','English','Hindi','Telugu','Kannada','Malayalam',
//     'Bengali','Marathi','Gujarati','Punjabi','Urdu','Odia',
//   ];
//   final List<String> _nationalities = [
//     'Indian','American','British','Australian','Canadian',
//     'German','French','Japanese','Chinese','Other',
//   ];
//   final List<String> _cities = [
//     'Chennai','Puducherry','Bangalore','Mumbai','Delhi',
//     'Hyderabad','Kolkata','Pune','Ahmedabad','Coimbatore',
//     'Madurai','Trichy','Salem','Vellore','Other',
//   ];
//   final List<String> _states = [
//     'Tamil Nadu','Kerala','Karnataka','Andhra Pradesh',
//     'Telangana','Maharashtra','Gujarat','Rajasthan',
//     'Uttar Pradesh','West Bengal','Punjab','Other',
//   ];
//   final List<String> _genders = ['Male','Female','Other','Prefer not to say'];
//   final List<String> _maritalStatus = ['Single','Married','Divorced','Widowed'];
//   final List<String> _bloodGroups = ['A+','A-','B+','B-','O+','O-','AB+','AB-'];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//     _loadData();
//   }

//   // ════════════════════════════════════════
//   //  LOAD SAVED DATA
//   // ════════════════════════════════════════
//   Future<void> _loadData() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _fullNameCtrl.text    = prefs.getString('fullName')    ?? '';
//       _emailCtrl.text       = prefs.getString('email')       ?? '';
//       _phoneCtrl.text       = prefs.getString('phone')       ?? '';
//       _passwordCtrl.text    = prefs.getString('password')    ?? '';
//       _pincodeCtrl.text     = prefs.getString('pincode')     ?? '';
//       _kidsCtrl.text        = prefs.getString('kids')        ?? '';
//       _educationCtrl.text   = prefs.getString('education')   ?? '';
//       _incomeCtrl.text      = prefs.getString('income')      ?? '';
//       _occupationCtrl.text  = prefs.getString('occupation')  ?? '';
//       _businessCtrl.text    = prefs.getString('business')    ?? '';
//       _selectedLanguage     = prefs.getString('language');
//       _selectedNationality  = prefs.getString('nationality');
//       _selectedCity         = prefs.getString('city');
//       _selectedState        = prefs.getString('state');
//       _selectedGender       = prefs.getString('gender');
//       _selectedMarital      = prefs.getString('marital');
//       _selectedBloodGroup   = prefs.getString('bloodGroup');
//       _emailVerified        = prefs.getBool('emailVerified') ?? false;
//       final dob = prefs.getString('dob');
//       if (dob != null) _selectedDOB = DateTime.tryParse(dob);
//     });
//     // ── Load addresses separately to ensure setState triggers ──
//     await _loadAddresses();
//   }

//   // ── Dedicated address loader ──
//   Future<void> _loadAddresses() async {
//     final prefs = await SharedPreferences.getInstance();
//     final raw = prefs.getString('addresses');
//     if (raw != null) {
//       final List decoded = jsonDecode(raw);
//       setState(() {
//         _savedAddresses =
//             decoded.map((e) => Map<String, String>.from(e)).toList();
//       });
//     } else {
//       setState(() => _savedAddresses = []);
//     }
//   }

//   // ════════════════════════════════════════
//   //  SAVE DATA
//   // ════════════════════════════════════════
//   Future<void> _saveData() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('fullName',   _fullNameCtrl.text.trim());
//     await prefs.setString('email',      _emailCtrl.text.trim());
//     await prefs.setString('phone',      _phoneCtrl.text.trim());
//     await prefs.setString('password',   _passwordCtrl.text.trim());
//     await prefs.setString('pincode',    _pincodeCtrl.text.trim());
//     await prefs.setString('kids',       _kidsCtrl.text.trim());
//     await prefs.setString('education',  _educationCtrl.text.trim());
//     await prefs.setString('income',     _incomeCtrl.text.trim());
//     await prefs.setString('occupation', _occupationCtrl.text.trim());
//     await prefs.setString('business',   _businessCtrl.text.trim());
//     if (_selectedLanguage    != null) await prefs.setString('language',    _selectedLanguage!);
//     if (_selectedNationality != null) await prefs.setString('nationality', _selectedNationality!);
//     if (_selectedCity        != null) await prefs.setString('city',        _selectedCity!);
//     if (_selectedState       != null) await prefs.setString('state',       _selectedState!);
//     if (_selectedGender      != null) await prefs.setString('gender',      _selectedGender!);
//     if (_selectedMarital     != null) await prefs.setString('marital',     _selectedMarital!);
//     if (_selectedBloodGroup  != null) await prefs.setString('bloodGroup',  _selectedBloodGroup!);
//     await prefs.setBool('emailVerified', _emailVerified);
//     if (_selectedDOB != null) await prefs.setString('dob', _selectedDOB!.toIso8601String());
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   // ════════════════════════════════════════
//   //  DATE PICKER
//   // ════════════════════════════════════════
//   Future<void> _pickDOB() async {
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime(1995, 1, 1),
//       firstDate: DateTime(1940),
//       lastDate: DateTime.now(),
//       builder: (context, child) => Theme(
//         data: Theme.of(context).copyWith(
//           colorScheme: const ColorScheme.light(
//             primary: kBlue,
//             onPrimary: Colors.white,
//             surface: Colors.white,
//           ),
//         ),
//         child: child!,
//       ),
//     );
//     if (picked != null) setState(() => _selectedDOB = picked);
//   }

//   // ════════════════════════════════════════
//   //  UPLOAD IMAGE SHEET
//   // ════════════════════════════════════════
//   void _uploadImage() {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (_) => Container(
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//         ),
//         padding: const EdgeInsets.fromLTRB(20, 14, 20, 32),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(width: 40, height: 4,
//                 decoration: BoxDecoration(color: kBorderGrey,
//                     borderRadius: BorderRadius.circular(10))),
//             const SizedBox(height: 20),
//             const Text('Upload Profile Photo',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: kBlack)),
//             const SizedBox(height: 24),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _photoOpt(Icons.camera_alt_rounded, 'Camera', kBlue, () {
//                   Navigator.pop(context);
//                   setState(() => _hasPhoto = true);
//                   _showSnack('Camera opened!', kBlue);
//                 }),
//                 _photoOpt(Icons.photo_library_rounded, 'Gallery', const Color(0xFF7C3AED), () {
//                   Navigator.pop(context);
//                   setState(() => _hasPhoto = true);
//                   _showSnack('Gallery opened!', kBlue);
//                 }),
//                 _photoOpt(Icons.delete_outline_rounded, 'Remove', Colors.red, () {
//                   Navigator.pop(context);
//                   setState(() => _hasPhoto = false);
//                   _showSnack('Photo removed', Colors.red);
//                 }),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _photoOpt(IconData icon, String label, Color color, VoidCallback onTap) =>
//       GestureDetector(
//         onTap: onTap,
//         child: Column(
//           children: [
//             Container(width: 60, height: 60,
//               decoration: BoxDecoration(color: color.withOpacity(0.1),
//                   shape: BoxShape.circle,
//                   border: Border.all(color: color.withOpacity(0.3), width: 1.5)),
//               child: Icon(icon, color: color, size: 26)),
//             const SizedBox(height: 8),
//             Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color)),
//           ],
//         ),
//       );

//   // ════════════════════════════════════════
//   //  VERIFY EMAIL
//   // ════════════════════════════════════════
//   void _verifyEmail() {
//     if (_emailCtrl.text.isEmpty || !_emailCtrl.text.contains('@')) {
//       _showSnack('Enter a valid email first!', Colors.orange);
//       return;
//     }
//     final otpCtrl = TextEditingController();
//     showDialog(context: context,
//       builder: (_) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: const Text('Verify Email',
//             style: TextStyle(fontWeight: FontWeight.w800, color: kBlack)),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text('Enter the OTP sent to\n${_emailCtrl.text}',
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(fontSize: 13, color: kGrey)),
//             const SizedBox(height: 16),
//             TextField(
//               controller: otpCtrl,
//               keyboardType: TextInputType.number,
//               inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//               textAlign: TextAlign.center,
//               maxLength: 6,
//               style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, letterSpacing: 8),
//               decoration: InputDecoration(
//                 counterText: '',
//                 hintText: '------',
//                 hintStyle: const TextStyle(color: kBorderGrey),
//                 filled: true, fillColor: kBlueLite,
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(onPressed: () => Navigator.pop(context),
//               child: const Text('Cancel', style: TextStyle(color: kGrey))),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: kBlue,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
//             onPressed: () {
//               Navigator.pop(context);
//               setState(() => _emailVerified = true);
//               _showSnack('Email verified ✓', const Color(0xFF16A34A));
//             },
//             child: const Text('Verify', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }

//   // ════════════════════════════════════════
//   //  CHANGE PASSWORD
//   // ════════════════════════════════════════
//   void _changePassword() {
//     final currentCtrl = TextEditingController();
//     final newCtrl     = TextEditingController();
//     final confirmCtrl = TextEditingController();
//     bool showNew = false;
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (_) => StatefulBuilder(
//         builder: (ctx, setBS) => Padding(
//           padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
//           child: Container(
//             decoration: const BoxDecoration(color: Colors.white,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
//             padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(child: Container(width: 40, height: 4,
//                     decoration: BoxDecoration(color: kBorderGrey,
//                         borderRadius: BorderRadius.circular(10)))),
//                 const SizedBox(height: 18),
//                 const Text('Change Password',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: kBlack)),
//                 const SizedBox(height: 20),
//                 _sheetField('Current Password', currentCtrl, isPassword: true),
//                 const SizedBox(height: 12),
//                 TextField(
//                   controller: newCtrl,
//                   obscureText: !showNew,
//                   decoration: InputDecoration(
//                     labelText: 'New Password',
//                     labelStyle: const TextStyle(color: kGrey, fontSize: 13),
//                     filled: true, fillColor: kBlueLite,
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
//                     focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
//                         borderSide: const BorderSide(color: kBlue, width: 1.5)),
//                     isDense: true,
//                     suffixIcon: IconButton(
//                       icon: Icon(showNew ? Icons.visibility_off : Icons.visibility, color: kGrey),
//                       onPressed: () => setBS(() => showNew = !showNew),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 _sheetField('Confirm New Password', confirmCtrl, isPassword: true),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(backgroundColor: kBlue,
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
//                     onPressed: () {
//                       if (newCtrl.text == confirmCtrl.text && newCtrl.text.isNotEmpty) {
//                         Navigator.pop(context);
//                         _showSnack('Password changed!', const Color(0xFF16A34A));
//                       } else {
//                         _showSnack('Passwords do not match!', Colors.red);
//                       }
//                     },
//                     child: const Text('Update Password',
//                         style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // ════════════════════════════════════════
//   //  ADD EDUCATION / WORKPLACE
//   // ════════════════════════════════════════
//   void _addEducation() {
//     final ctrl = TextEditingController();
//     showDialog(context: context,
//       builder: (_) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: const Text('Add Education',
//             style: TextStyle(fontWeight: FontWeight.w800, color: kBlack)),
//         content: _sheetField('Degree / Course', ctrl),
//         actions: [
//           TextButton(onPressed: () => Navigator.pop(context),
//               child: const Text('Cancel', style: TextStyle(color: kGrey))),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: kBlue,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
//             onPressed: () {
//               if (ctrl.text.trim().isNotEmpty) {
//                 setState(() => _extraEducations.add(ctrl.text.trim()));
//                 Navigator.pop(context);
//                 _showSnack('Education added!', kBlue);
//               }
//             },
//             child: const Text('Add', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }

//   void _addWorkplace() {
//     final ctrl = TextEditingController();
//     showDialog(context: context,
//       builder: (_) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: const Text('Add a Workplace',
//             style: TextStyle(fontWeight: FontWeight.w800, color: kBlack)),
//         content: _sheetField('Company / Hospital Name', ctrl),
//         actions: [
//           TextButton(onPressed: () => Navigator.pop(context),
//               child: const Text('Cancel', style: TextStyle(color: kGrey))),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: kBlue,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
//             onPressed: () {
//               if (ctrl.text.trim().isNotEmpty) {
//                 setState(() => _extraWorkplaces.add(ctrl.text.trim()));
//                 Navigator.pop(context);
//                 _showSnack('Workplace added!', kBlue);
//               }
//             },
//             child: const Text('Add', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showSnack(String msg, Color color) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text(msg),
//       backgroundColor: color,
//       behavior: SnackBarBehavior.floating,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//     ));
//   }

//   Widget _sheetField(String label, TextEditingController ctrl, {bool isPassword = false}) =>
//       TextField(
//         controller: ctrl,
//         obscureText: isPassword,
//         decoration: InputDecoration(
//           labelText: label,
//           labelStyle: const TextStyle(color: kGrey, fontSize: 13),
//           filled: true, fillColor: kBlueLite,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
//           focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: kBlue, width: 1.5)),
//           isDense: true,
//         ),
//       );

//   // ════════════════════════════════════════
//   //  BUILD
//   // ════════════════════════════════════════
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F7FA),
//       body: SafeArea(
//         child: Column(
//           children: [
//             _appBar(context),
//             _tabBar(),
//             Expanded(
//               child: TabBarView(
//                 controller: _tabController,
//                 children: [_primaryTab(), _otherInfoTab()],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ════════════════════════════════════════
//   //  APP BAR
//   // ════════════════════════════════════════
//   Widget _appBar(BuildContext context) => Container(
//     decoration: const BoxDecoration(
//       gradient: LinearGradient(colors: [kBlue, Color(0xFF1A73E8)],
//           begin: Alignment.centerLeft, end: Alignment.centerRight),
//     ),
//     padding: const EdgeInsets.fromLTRB(4, 6, 14, 10),
//     child: Row(
//       children: [
//         IconButton(icon: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.white),
//             onPressed: () => Navigator.pop(context)),
//         const Expanded(
//           child: Center(
//             child: Text('Edit profile information',
//                 style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white)),
//           ),
//         ),
//         GestureDetector(
//           onTap: () async {
//             // ── Validate ALL fields ──
//             if (_fullNameCtrl.text.trim().isEmpty) {
//               _showSnack('Please enter your full name!', Colors.red); return;
//             }
//             if (_emailCtrl.text.trim().isEmpty || !_emailCtrl.text.contains('@') || !_emailCtrl.text.contains('.')) {
//               _showSnack('Please enter a valid email address!', Colors.red); return;
//             }
//             if (_phoneCtrl.text.trim().length < 10) {
//               _showSnack('Phone number must be 10 digits!', Colors.red); return;
//             }
//             if (_passwordCtrl.text.trim().isEmpty || _passwordCtrl.text.length < 6) {
//               _showSnack('Password must be at least 6 characters!', Colors.red); return;
//             }
//             if (_selectedLanguage == null) {
//               _showSnack('Please select a language!', Colors.red); return;
//             }
//             if (_selectedNationality == null) {
//               _showSnack('Please select your nationality!', Colors.red); return;
//             }
//             if (_pincodeCtrl.text.trim().length < 6) {
//               _showSnack('Pincode must be 6 digits!', Colors.red); return;
//             }
//             if (_selectedCity == null) {
//               _showSnack('Please select your city!', Colors.red); return;
//             }
//             if (_selectedState == null) {
//               _showSnack('Please select your state!', Colors.red); return;
//             }
//             if (_selectedGender == null) {
//               _showSnack('Please select your gender!', Colors.red); return;
//             }
//             if (_selectedDOB == null) {
//               _showSnack('Please select your date of birth!', Colors.red); return;
//             }
//             if (_selectedMarital == null) {
//               _showSnack('Please select your marital status!', Colors.red); return;
//             }
//             if (_incomeCtrl.text.trim().isEmpty) {
//               _showSnack('Please enter your monthly income!', Colors.red); return;
//             }
//             if (_occupationCtrl.text.trim().isEmpty) {
//               _showSnack('Please enter your occupation!', Colors.red); return;
//             }
//             if (_kidsCtrl.text.trim().isEmpty) {
//               _showSnack('Please enter number of kids!', Colors.red); return;
//             }
//             if (_educationCtrl.text.trim().isEmpty) {
//               _showSnack('Please enter your education!', Colors.red); return;
//             }
//             if (_businessCtrl.text.trim().isEmpty) {
//               _showSnack('Please enter your business name!', Colors.red); return;
//             }
//             if (_selectedBloodGroup == null) {
//               _showSnack('Please select your blood group!', Colors.red); return;
//             }
//             // ── Save all data ──
//             await _saveData();
//             _showSnack('✅ Profile saved successfully!', const Color(0xFF16A34A));
//             Navigator.pop(context);
//           },
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
//             decoration: BoxDecoration(color: Colors.white.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: Colors.white.withOpacity(0.5))),
//             child: const Text('Save',
//                 style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700)),
//           ),
//         ),
//       ],
//     ),
//   );

//   // ════════════════════════════════════════
//   //  TAB BAR
//   // ════════════════════════════════════════
//   Widget _tabBar() => Container(
//     color: Colors.white,
//     child: TabBar(
//       controller: _tabController,
//       labelColor: kBlue,
//       unselectedLabelColor: kGrey,
//       indicatorColor: kBlue,
//       indicatorWeight: 3,
//       labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
//       tabs: const [Tab(text: 'Primary'), Tab(text: 'Other Info')],
//     ),
//   );

//   // ════════════════════════════════════════
//   //  PRIMARY TAB
//   // ════════════════════════════════════════
//   Widget _primaryTab() => SingleChildScrollView(
//     physics: const BouncingScrollPhysics(),
//     padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // ── Profile picture card ──
//         Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: const Color(0xFFEEF1F8)),
//             boxShadow: [
//               BoxShadow(color: Colors.black.withOpacity(0.05),
//                   blurRadius: 12, offset: const Offset(0, 3)),
//             ],
//           ),
//           child: Row(
//             children: [
//               // ── Avatar ──
//               MouseRegion(
//                 onEnter: (_) => setState(() => _hovering = true),
//                 onExit: (_) => setState(() => _hovering = false),
//                 child: GestureDetector(
//                   onTap: _uploadImage,
//                   child: Stack(
//                     children: [
//                       Container(
//                         width: 70, height: 70,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: const Color(0xFFF0F3F8),
//                           border: Border.all(
//                               color: const Color(0xFFDDE2EA), width: 2),
//                         ),
//                         child: ClipOval(
//                           child: _hasPhoto
//                               ? Container(color: kBlueLite,
//                               child: const Icon(Icons.check_circle_rounded,
//                                   size: 40, color: kBlue))
//                               : const Icon(Icons.person_rounded,
//                                   size: 42, color: Color(0xFFB0BEC5)),
//                         ),
//                       ),
//                       if (_hovering)
//                         Container(
//                           width: 70, height: 70,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.black.withOpacity(0.4)),
//                           child: const Icon(Icons.camera_alt_rounded,
//                               color: Colors.white, size: 24),
//                         ),
//                       Positioned(
//                         bottom: 0, right: 0,
//                         child: Container(
//                           width: 22, height: 22,
//                           decoration: BoxDecoration(
//                             color: kBlue,
//                             shape: BoxShape.circle,
//                             border: Border.all(color: Colors.white, width: 1.5),
//                           ),
//                           child: const Icon(Icons.camera_alt_rounded,
//                               size: 11, color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 16),
//               // ── Upload / Remove ──
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text('Profile Picture',
//                         style: TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w700,
//                             color: kBlack)),
//                     const SizedBox(height: 10),
//                     Row(
//                       children: [
//                         GestureDetector(
//                           onTap: _uploadImage,
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 16, vertical: 8),
//                             decoration: BoxDecoration(
//                               color: kBlue,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: const Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Icon(Icons.cloud_upload_outlined,
//                                     color: Colors.white, size: 14),
//                                 SizedBox(width: 5),
//                                 Text('Upload Image',
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w700)),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() => _hasPhoto = false);
//                             _showSnack('Photo removed', Colors.red);
//                           },
//                           child: const Text('Remove',
//                               style: TextStyle(
//                                   fontSize: 13,
//                                   color: Colors.red,
//                                   fontWeight: FontWeight.w600)),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),

//         const SizedBox(height: 24),

//         // ── Full Name — letters only ──
//         _textField(
//           label: 'Full Name',
//           controller: _fullNameCtrl,
//           icon: Icons.person_outline_rounded,
//           hint: 'Deepak Kumar',
//           inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
//           keyboardType: TextInputType.name,
//         ),

//         // ── Email ──
//         _textField(
//           label: 'E-mail Address',
//           controller: _emailCtrl,
//           icon: Icons.email_outlined,
//           hint: 'deepak@gmail.com',
//           keyboardType: TextInputType.emailAddress,
//           trailing: GestureDetector(
//             onTap: _verifyEmail,
//             child: _badge(_emailVerified ? 'Verified ✓' : 'Verify',
//                 _emailVerified ? const Color(0xFF16A34A) : Colors.orange),
//           ),
//         ),

//         // ── Phone — numbers only, max 10 ──
//         _textField(
//           label: 'Phone Number',
//           controller: _phoneCtrl,
//           icon: Icons.phone_outlined,
//           hint: '+91 98765 43210',
//           keyboardType: TextInputType.phone,
//           inputFormatters: [
//             FilteringTextInputFormatter.digitsOnly,
//             LengthLimitingTextInputFormatter(10),
//           ],
//           trailing: _badge('Verified ✓', const Color(0xFF16A34A)),
//         ),

//         // ── Password with eye icon ──
//         _passwordField(),

//         // ── Language dropdown ──
//         _dropdown('Language Known', Icons.language_rounded, _languages, _selectedLanguage,
//             (val) => setState(() => _selectedLanguage = val)),

//         // ── Nationality dropdown ──
//         _dropdown('Nationality', Icons.flag_outlined, _nationalities, _selectedNationality,
//             (val) => setState(() => _selectedNationality = val)),

//         // ── Pincode — numbers only, max 6 ──
//         _textField(
//           label: 'Pincode',
//           controller: _pincodeCtrl,
//           icon: Icons.pin_drop_outlined,
//           hint: '605 001',
//           keyboardType: TextInputType.number,
//           inputFormatters: [
//             FilteringTextInputFormatter.digitsOnly,
//             LengthLimitingTextInputFormatter(6),
//           ],
//         ),

//         // ── City dropdown ──
//         _dropdown('City', Icons.location_city_outlined, _cities, _selectedCity,
//             (val) => setState(() => _selectedCity = val)),

//         // ── State dropdown ──
//         _dropdown('State', Icons.map_outlined, _states, _selectedState,
//             (val) => setState(() => _selectedState = val)),

//         // ── Gender dropdown ──
//         _dropdown('Gender', Icons.wc_rounded, _genders, _selectedGender,
//             (val) => setState(() => _selectedGender = val)),

//         const SizedBox(height: 4),

//         // ── Add Address button ──
//         GestureDetector(
//           onTap: () async {
//             await Navigator.push(context,
//                 MaterialPageRoute(builder: (_) => AddressScreen(
//                   prefillName: _fullNameCtrl.text.trim(),
//                   prefillPhone: _phoneCtrl.text.trim(),
//                 )));
//             // ── Reload addresses after returning ──
//             await _loadAddresses();
//           },
//           child: Container(
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(vertical: 15),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16),
//               border: Border.all(color: kBlue.withOpacity(0.35), width: 1.5),
//               boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03),
//                   blurRadius: 6, offset: const Offset(0, 2))],
//             ),
//             child: const Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.add_circle_outline_rounded, size: 18, color: kBlue),
//                 SizedBox(width: 6),
//                 Text('Add Address',
//                     style: TextStyle(
//                         fontSize: 13,
//                         color: kBlue,
//                         fontWeight: FontWeight.w700)),
//               ],
//             ),
//           ),
//         ),

//         // ── Show saved addresses ──
//         if (_savedAddresses.isNotEmpty) ...[
//           const SizedBox(height: 14),
//           ..._savedAddresses.map((a) => Container(
//             margin: const EdgeInsets.only(bottom: 10),
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: kBorderGrey),
//               boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03),
//                   blurRadius: 6, offset: const Offset(0, 2))],
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: 36, height: 36,
//                   decoration: BoxDecoration(
//                     color: kBlueLite,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: const Icon(Icons.location_on_rounded,
//                       color: kBlue, size: 18),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       if ((a['line1'] ?? '').isNotEmpty)
//                         Text(
//                           [a['line1'], a['city'], a['pincode']]
//                               .where((s) => s != null && s!.isNotEmpty)
//                               .join(', '),
//                           style: const TextStyle(
//                               fontSize: 12, color: kBlack,
//                               fontWeight: FontWeight.w600, height: 1.4),
//                         ),
//                       if ((a['street'] ?? '').isNotEmpty)
//                         Text(
//                           [a['street'], a['city2'], a['pincode2']]
//                               .where((s) => s != null && s!.isNotEmpty)
//                               .join(', '),
//                           style: const TextStyle(
//                               fontSize: 12, color: kGrey, height: 1.4),
//                         ),
//                     ],
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () async {
//                     await Navigator.push(context,
//                         MaterialPageRoute(builder: (_) => AddressScreen(
//                           prefillName: _fullNameCtrl.text.trim(),
//                           prefillPhone: _phoneCtrl.text.trim(),
//                         )));
//                     await _loadAddresses();
//                   },
//                   child: const Icon(Icons.edit_outlined,
//                       color: kGrey, size: 16),
//                 ),
//               ],
//             ),
//           )),
//         ],
//       ],
//     ),
//   );

//   // ════════════════════════════════════════
//   //  OTHER INFO TAB
//   // ════════════════════════════════════════
//   Widget _otherInfoTab() => SingleChildScrollView(
//     physics: const BouncingScrollPhysics(),
//     padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // ── Date of Birth — date picker ──
//         _datePicker(),

//         // ── Marital Status dropdown ──
//         _dropdown('Marital Status', Icons.favorite_border_rounded,
//             _maritalStatus, _selectedMarital,
//             (val) => setState(() => _selectedMarital = val)),

//         // ── Number of Kids — numbers only ──
//         _textField(
//           label: 'Number of Kids',
//           controller: _kidsCtrl,
//           icon: Icons.child_care_rounded,
//           hint: '1',
//           keyboardType: TextInputType.number,
//           inputFormatters: [
//             FilteringTextInputFormatter.digitsOnly,
//             LengthLimitingTextInputFormatter(2),
//           ],
//         ),

//         // ── Education — letters only ──
//         _textField(
//           label: 'Education',
//           controller: _educationCtrl,
//           icon: Icons.school_outlined,
//           hint: 'B.Sc Nursing, MBA',
//           inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s\.]'))],
//         ),

//         // ── Monthly Income — numbers only ──
//         _textField(
//           label: 'Monthly Income',
//           controller: _incomeCtrl,
//           icon: Icons.currency_rupee_rounded,
//           hint: '50000',
//           keyboardType: TextInputType.number,
//           inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//         ),

//         // ── Occupation — letters only ──
//         _textField(
//           label: 'Occupation',
//           controller: _occupationCtrl,
//           icon: Icons.work_outline_rounded,
//           hint: 'Doctor, Engineer',
//           inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
//         ),

//         // ── Business Name ──
//         _textField(
//           label: 'My Business Name',
//           controller: _businessCtrl,
//           icon: Icons.business_outlined,
//           hint: 'Veesafe Health Pvt Ltd',
//         ),

//         // ── Blood Group dropdown ──
//         _dropdown('Blood Group', Icons.bloodtype_outlined,
//             _bloodGroups, _selectedBloodGroup,
//             (val) => setState(() => _selectedBloodGroup = val)),

//         // ── Extra chips ──
//         ..._extraEducations.map((e) => _chip(e, () =>
//             setState(() => _extraEducations.remove(e)))),
//         ..._extraWorkplaces.map((w) => _chip(w, () =>
//             setState(() => _extraWorkplaces.remove(w)))),

//         const SizedBox(height: 8),
//         _addButton('Add Education', _addEducation),
//         const SizedBox(height: 12),
//         _addButton('Add a Workplace', _addWorkplace),
//       ],
//     ),
//   );

//   // ════════════════════════════════════════
//   //  FLOATING LABEL TEXT FIELD
//   // ════════════════════════════════════════
//   Widget _textField({
//     required String label,
//     required TextEditingController controller,
//     required IconData icon,
//     String? hint,
//     bool isPassword = false,
//     TextInputType keyboardType = TextInputType.text,
//     List<TextInputFormatter>? inputFormatters,
//     Widget? trailing,
//   }) =>
//       Padding(
//         padding: const EdgeInsets.only(bottom: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ── Bold navy label ──
//             Row(
//               children: [
//                 Text(label,
//                     style: const TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w700,
//                         color: Color(0xFF1A2E5A),
//                         letterSpacing: 0.2)),
//                 if (trailing != null) ...[
//                   const Spacer(),
//                   trailing,
//                 ],
//               ],
//             ),
//             const SizedBox(height: 8),
//             // ── Input with underline ──
//             TextFormField(
//               controller: controller,
//               obscureText: isPassword,
//               keyboardType: keyboardType,
//               inputFormatters: inputFormatters,
//               style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: kBlack),
//               decoration: InputDecoration(
//                 hintText: hint,
//                 hintStyle: const TextStyle(
//                     fontSize: 13.5,
//                     color: Color(0xFFC5CDD8),
//                     fontWeight: FontWeight.w400),
//                 isDense: true,
//                 contentPadding:
//                     const EdgeInsets.symmetric(vertical: 6),
//                 border: InputBorder.none,
//                 enabledBorder: const UnderlineInputBorder(
//                   borderSide: BorderSide(
//                       color: Color(0xFFDDE2EA), width: 1.2),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: kBlue, width: 1.8),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );

//   // ════════════════════════════════════════
//   //  PASSWORD FIELD WITH EYE ICON
//   // ════════════════════════════════════════
//   Widget _passwordField() => Padding(
//     padding: const EdgeInsets.only(bottom: 20),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             const Text('Change Password',
//                 style: TextStyle(
//                     fontSize: 13,
//                     fontWeight: FontWeight.w700,
//                     color: Color(0xFF1A2E5A),
//                     letterSpacing: 0.2)),
//             const Spacer(),
//             GestureDetector(
//               onTap: () async {
//                 final newPass = await Navigator.push<String>(
//                   context,
//                   MaterialPageRoute(
//                       builder: (_) => const ChangePasswordScreen()),
//                 );
//                 if (newPass != null) {
//                   setState(() => _passwordCtrl.text = newPass);
//                 }
//               },
//               child: _badge('Change', kBlue),
//             ),
//           ],
//         ),
//         const SizedBox(height: 6),
//         TextFormField(
//           controller: _passwordCtrl,
//           obscureText: !_showPass,
//           style: const TextStyle(
//               fontSize: 13, fontWeight: FontWeight.w500, color: kBlack),
//           decoration: InputDecoration(
//             hintText: 'Min 6 characters',
//             hintStyle: const TextStyle(
//                 fontSize: 13, color: Color(0xFFBBC5D5), fontWeight: FontWeight.w400),
//             isDense: true,
//             contentPadding: const EdgeInsets.symmetric(vertical: 8),
//             border: InputBorder.none,
//             enabledBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 1),
//             ),
//             focusedBorder: const UnderlineInputBorder(
//               borderSide: BorderSide(color: kBlue, width: 1.5),
//             ),
//             suffixIcon: IconButton(
//               icon: Icon(_showPass ? Icons.visibility_off : Icons.visibility,
//                   size: 20, color: kGrey),
//               onPressed: () => setState(() => _showPass = !_showPass),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );

//   // ════════════════════════════════════════
//   //  DROPDOWN FIELD — opens as bottom sheet
//   // ════════════════════════════════════════
//   Widget _dropdown(String label, IconData icon, List<String> items,
//       String? value, ValueChanged<String?> onChanged) =>
//       Padding(
//         padding: const EdgeInsets.only(bottom: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(label,
//                 style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w800,
//                     color: kBlue)),
//             const SizedBox(height: 6),
//             GestureDetector(
//               onTap: () => _showPickerSheet(label, items, value, onChanged),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       value ?? 'Select $label',
//                       style: TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w500,
//                           color: value != null
//                               ? kBlack
//                               : const Color(0xFFBBC5D5)),
//                     ),
//                   ),
//                   const Icon(Icons.keyboard_arrow_down_rounded,
//                       color: kGrey, size: 20),
//                 ],
//               ),
//             ),
//             const Divider(
//                 color: Color(0xFFE0E0E0), thickness: 1, height: 12),
//           ],
//         ),
//       );

//   // ── Bottom sheet picker ──
//   void _showPickerSheet(String label, List<String> items,
//       String? current, ValueChanged<String?> onChanged) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       isScrollControlled: true,
//       builder: (_) => Container(
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//         ),
//         padding: const EdgeInsets.fromLTRB(0, 14, 0, 24),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Handle
//             Container(
//               width: 40, height: 4,
//               decoration: BoxDecoration(
//                 color: kBorderGrey,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             const SizedBox(height: 14),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Text('Select $label',
//                   style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w800,
//                       color: kBlack)),
//             ),
//             const SizedBox(height: 10),
//             const Divider(color: kBorderGrey, height: 1),
//             ConstrainedBox(
//               constraints: BoxConstraints(
//                 maxHeight: MediaQuery.of(context).size.height * 0.45,
//               ),
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 physics: const BouncingScrollPhysics(),
//                 itemCount: items.length,
//                 itemBuilder: (_, i) {
//                   final item = items[i];
//                   final isSelected = item == current;
//                   return InkWell(
//                     onTap: () {
//                       onChanged(item);
//                       Navigator.pop(context);
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 14),
//                       color: isSelected
//                           ? kBlueLite
//                           : Colors.transparent,
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Text(item,
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: isSelected
//                                         ? FontWeight.w700
//                                         : FontWeight.w500,
//                                     color: isSelected
//                                         ? kBlue
//                                         : kBlack)),
//                           ),
//                           if (isSelected)
//                             const Icon(Icons.check_rounded,
//                                 color: kBlue, size: 18),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ════════════════════════════════════════
//   //  DATE PICKER FIELD
//   // ════════════════════════════════════════
//   Widget _datePicker() => Padding(
//     padding: const EdgeInsets.only(bottom: 20),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text('Date of Birth',
//             style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF1A2E5A), letterSpacing: 0.2)),
//         const SizedBox(height: 6),
//         GestureDetector(
//           onTap: _pickDOB,
//           child: Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   _selectedDOB != null
//                       ? '${_selectedDOB!.day.toString().padLeft(2, '0')} / ${_selectedDOB!.month.toString().padLeft(2, '0')} / ${_selectedDOB!.year}'
//                       : '15 / 08 / 1995',
//                   style: TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w500,
//                       color: _selectedDOB != null ? kBlack : const Color(0xFFBBC5D5)),
//                 ),
//               ),
//               const Icon(Icons.calendar_today_rounded, size: 18, color: kGrey),
//             ],
//           ),
//         ),
//         const Divider(color: Color(0xFFE0E0E0), thickness: 1, height: 12),
//       ],
//     ),
//   );

//   // ── Badge ──
//   Widget _badge(String text, Color color) => Container(
//     padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
//     decoration: BoxDecoration(color: color.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: color.withOpacity(0.35))),
//     child: Text(text,
//         style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w700)),
//   );

//   // ── Chip ──
//   Widget _chip(String text, VoidCallback onDelete) => Padding(
//     padding: const EdgeInsets.only(bottom: 8),
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//       decoration: BoxDecoration(color: kBlueLite, borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: kBlue.withOpacity(0.2))),
//       child: Row(
//         children: [
//           const Icon(Icons.check_circle_rounded, color: kBlue, size: 16),
//           const SizedBox(width: 8),
//           Expanded(child: Text(text,
//               style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: kBlack))),
//           GestureDetector(onTap: onDelete,
//               child: const Icon(Icons.close_rounded, color: kGrey, size: 16)),
//         ],
//       ),
//     ),
//   );

//   // ── Add button ──
//   Widget _addButton(String label, VoidCallback onTap) => GestureDetector(
//     onTap: onTap,
//     child: Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(vertical: 15),
//       decoration: BoxDecoration(color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: kBlue.withOpacity(0.35), width: 1.5),
//           boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03),
//               blurRadius: 6, offset: const Offset(0, 2))]),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.add_circle_outline_rounded, size: 18, color: kBlue),
//           const SizedBox(width: 6),
//           Text(label,
//               style: const TextStyle(fontSize: 13, color: kBlue, fontWeight: FontWeight.w700)),
//         ],
//       ),
//     ),
//   );
// }















// lib/screens/edit_profile_screen.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_colors.dart';
import 'change_password_screen.dart';
import 'address_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with TickerProviderStateMixin {

  late TabController _tabController;
  bool _hasPhoto    = false;
  bool _hovering    = false;
  bool _showPass    = false;
  bool _emailVerified = false;

  // ── Primary ──
  final _fullNameCtrl    = TextEditingController();
  final _emailCtrl       = TextEditingController();
  final _phoneCtrl       = TextEditingController();
  final _passwordCtrl    = TextEditingController();
  final _pincodeCtrl     = TextEditingController();

  // ── Dropdown selections ──
  String? _selectedLanguage;
  String? _selectedNationality;
  String? _selectedCity;
  String? _selectedState;
  String? _selectedGender;
  String? _selectedMarital;
  String? _selectedBloodGroup;

  // ── Other info ──
  final _kidsCtrl       = TextEditingController();
  final _educationCtrl  = TextEditingController();
  final _incomeCtrl     = TextEditingController();
  final _occupationCtrl = TextEditingController();
  final _businessCtrl   = TextEditingController();
  DateTime? _selectedDOB;

  final List<String> _extraEducations = [];
  final List<String> _extraWorkplaces = [];
  List<Map<String, String>> _savedAddresses = [];

  // ── Dropdown data ──
  final List<String> _languages = [
    'Tamil','English','Hindi','Telugu','Kannada','Malayalam',
    'Bengali','Marathi','Gujarati','Punjabi','Urdu','Odia',
  ];
  final List<String> _nationalities = [
    'Indian','American','British','Australian','Canadian',
    'German','French','Japanese','Chinese','Other',
  ];
  final List<String> _cities = [
    'Chennai','Puducherry','Bangalore','Mumbai','Delhi',
    'Hyderabad','Kolkata','Pune','Ahmedabad','Coimbatore',
    'Madurai','Trichy','Salem','Vellore','Other',
  ];
  final List<String> _states = [
    'Tamil Nadu','Kerala','Karnataka','Andhra Pradesh',
    'Telangana','Maharashtra','Gujarat','Rajasthan',
    'Uttar Pradesh','West Bengal','Punjab','Other',
  ];
  final List<String> _genders = ['Male','Female','Other','Prefer not to say'];
  final List<String> _maritalStatus = ['Single','Married','Divorced','Widowed'];
  final List<String> _bloodGroups = ['A+','A-','B+','B-','O+','O-','AB+','AB-'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadData();
  }

  // ════════════════════════════════════════
  //  LOAD SAVED DATA
  // ════════════════════════════════════════
  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _fullNameCtrl.text    = prefs.getString('fullName')    ?? '';
      _emailCtrl.text       = prefs.getString('email')       ?? '';
      _phoneCtrl.text       = prefs.getString('phone')       ?? '';
      _passwordCtrl.text    = prefs.getString('password')    ?? '';
      _pincodeCtrl.text     = prefs.getString('pincode')     ?? '';
      _kidsCtrl.text        = prefs.getString('kids')        ?? '';
      _educationCtrl.text   = prefs.getString('education')   ?? '';
      _incomeCtrl.text      = prefs.getString('income')      ?? '';
      _occupationCtrl.text  = prefs.getString('occupation')  ?? '';
      _businessCtrl.text    = prefs.getString('business')    ?? '';
      _selectedLanguage     = prefs.getString('language');
      _selectedNationality  = prefs.getString('nationality');
      _selectedCity         = prefs.getString('city');
      _selectedState        = prefs.getString('state');
      _selectedGender       = prefs.getString('gender');
      _selectedMarital      = prefs.getString('marital');
      _selectedBloodGroup   = prefs.getString('bloodGroup');
      _emailVerified        = prefs.getBool('emailVerified') ?? false;
      final dob = prefs.getString('dob');
      if (dob != null) _selectedDOB = DateTime.tryParse(dob);
    });
    // ── Load addresses separately to ensure setState triggers ──
    await _loadAddresses();
  }

  // ── Dedicated address loader ──
  Future<void> _loadAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('addresses');
    if (raw != null) {
      final List decoded = jsonDecode(raw);
      setState(() {
        _savedAddresses =
            decoded.map((e) => Map<String, String>.from(e)).toList();
      });
    } else {
      setState(() => _savedAddresses = []);
    }
  }

  // ════════════════════════════════════════
  //  SAVE DATA
  // ════════════════════════════════════════
  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullName',   _fullNameCtrl.text.trim());
    await prefs.setString('email',      _emailCtrl.text.trim());
    await prefs.setString('phone',      _phoneCtrl.text.trim());
    await prefs.setString('password',   _passwordCtrl.text.trim());
    await prefs.setString('pincode',    _pincodeCtrl.text.trim());
    await prefs.setString('kids',       _kidsCtrl.text.trim());
    await prefs.setString('education',  _educationCtrl.text.trim());
    await prefs.setString('income',     _incomeCtrl.text.trim());
    await prefs.setString('occupation', _occupationCtrl.text.trim());
    await prefs.setString('business',   _businessCtrl.text.trim());
    if (_selectedLanguage    != null) await prefs.setString('language',    _selectedLanguage!);
    if (_selectedNationality != null) await prefs.setString('nationality', _selectedNationality!);
    if (_selectedCity        != null) await prefs.setString('city',        _selectedCity!);
    if (_selectedState       != null) await prefs.setString('state',       _selectedState!);
    if (_selectedGender      != null) await prefs.setString('gender',      _selectedGender!);
    if (_selectedMarital     != null) await prefs.setString('marital',     _selectedMarital!);
    if (_selectedBloodGroup  != null) await prefs.setString('bloodGroup',  _selectedBloodGroup!);
    await prefs.setBool('emailVerified', _emailVerified);
    if (_selectedDOB != null) await prefs.setString('dob', _selectedDOB!.toIso8601String());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // ════════════════════════════════════════
  //  DATE PICKER
  // ════════════════════════════════════════
  Future<void> _pickDOB() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1995, 1, 1),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: kBlue,
            onPrimary: Colors.white,
            surface: Colors.white,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _selectedDOB = picked);
  }

  // ════════════════════════════════════════
  //  UPLOAD IMAGE SHEET
  // ════════════════════════════════════════
  void _uploadImage() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 40, height: 4,
                decoration: BoxDecoration(color: kBorderGrey,
                    borderRadius: BorderRadius.circular(10))),
            const SizedBox(height: 20),
            const Text('Upload Profile Photo',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: kBlack)),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _photoOpt(Icons.camera_alt_rounded, 'Camera', kBlue, () {
                  Navigator.pop(context);
                  setState(() => _hasPhoto = true);
                  _showSnack('Camera opened!', kBlue);
                }),
                _photoOpt(Icons.photo_library_rounded, 'Gallery', const Color(0xFF7C3AED), () {
                  Navigator.pop(context);
                  setState(() => _hasPhoto = true);
                  _showSnack('Gallery opened!', kBlue);
                }),
                _photoOpt(Icons.delete_outline_rounded, 'Remove', Colors.red, () {
                  Navigator.pop(context);
                  setState(() => _hasPhoto = false);
                  _showSnack('Photo removed', Colors.red);
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _photoOpt(IconData icon, String label, Color color, VoidCallback onTap) =>
      GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(width: 60, height: 60,
              decoration: BoxDecoration(color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                  border: Border.all(color: color.withOpacity(0.3), width: 1.5)),
              child: Icon(icon, color: color, size: 26)),
            const SizedBox(height: 8),
            Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color)),
          ],
        ),
      );

  // ════════════════════════════════════════
  //  VERIFY EMAIL
  // ════════════════════════════════════════
  void _verifyEmail() {
    if (_emailCtrl.text.isEmpty || !_emailCtrl.text.contains('@')) {
      _showSnack('Enter a valid email first!', Colors.orange);
      return;
    }
    final otpCtrl = TextEditingController();
    showDialog(context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Verify Email',
            style: TextStyle(fontWeight: FontWeight.w800, color: kBlack)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Enter the OTP sent to\n${_emailCtrl.text}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 13, color: kGrey)),
            const SizedBox(height: 16),
            TextField(
              controller: otpCtrl,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textAlign: TextAlign.center,
              maxLength: 6,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, letterSpacing: 8),
              decoration: InputDecoration(
                counterText: '',
                hintText: '------',
                hintStyle: const TextStyle(color: kBorderGrey),
                filled: true, fillColor: kBlueLite,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: kGrey))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: kBlue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              Navigator.pop(context);
              setState(() => _emailVerified = true);
              _showSnack('Email verified ✓', const Color(0xFF16A34A));
            },
            child: const Text('Verify', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // ════════════════════════════════════════
  //  CHANGE PASSWORD
  // ════════════════════════════════════════
  void _changePassword() {
    final currentCtrl = TextEditingController();
    final newCtrl     = TextEditingController();
    final confirmCtrl = TextEditingController();
    bool showNew = false;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => StatefulBuilder(
        builder: (ctx, setBS) => Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
          child: Container(
            decoration: const BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Container(width: 40, height: 4,
                    decoration: BoxDecoration(color: kBorderGrey,
                        borderRadius: BorderRadius.circular(10)))),
                const SizedBox(height: 18),
                const Text('Change Password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: kBlack)),
                const SizedBox(height: 20),
                _sheetField('Current Password', currentCtrl, isPassword: true),
                const SizedBox(height: 12),
                TextField(
                  controller: newCtrl,
                  obscureText: !showNew,
                  decoration: InputDecoration(
                    labelText: 'New Password',
                    labelStyle: const TextStyle(color: kGrey, fontSize: 13),
                    filled: true, fillColor: kBlueLite,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: kBlue, width: 1.5)),
                    isDense: true,
                    suffixIcon: IconButton(
                      icon: Icon(showNew ? Icons.visibility_off : Icons.visibility, color: kGrey),
                      onPressed: () => setBS(() => showNew = !showNew),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _sheetField('Confirm New Password', confirmCtrl, isPassword: true),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: kBlue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
                    onPressed: () {
                      if (newCtrl.text == confirmCtrl.text && newCtrl.text.isNotEmpty) {
                        Navigator.pop(context);
                        _showSnack('Password changed!', const Color(0xFF16A34A));
                      } else {
                        _showSnack('Passwords do not match!', Colors.red);
                      }
                    },
                    child: const Text('Update Password',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ════════════════════════════════════════
  //  ADD EDUCATION / WORKPLACE
  // ════════════════════════════════════════
  void _addEducation() {
    final ctrl = TextEditingController();
    showDialog(context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Add Education',
            style: TextStyle(fontWeight: FontWeight.w800, color: kBlack)),
        content: _sheetField('Degree / Course', ctrl),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: kGrey))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: kBlue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              if (ctrl.text.trim().isNotEmpty) {
                setState(() => _extraEducations.add(ctrl.text.trim()));
                Navigator.pop(context);
                _showSnack('Education added!', kBlue);
              }
            },
            child: const Text('Add', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _addWorkplace() {
    final ctrl = TextEditingController();
    showDialog(context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Add a Workplace',
            style: TextStyle(fontWeight: FontWeight.w800, color: kBlack)),
        content: _sheetField('Company / Hospital Name', ctrl),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: kGrey))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: kBlue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              if (ctrl.text.trim().isNotEmpty) {
                setState(() => _extraWorkplaces.add(ctrl.text.trim()));
                Navigator.pop(context);
                _showSnack('Workplace added!', kBlue);
              }
            },
            child: const Text('Add', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showSnack(String msg, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ));
  }

  Widget _sheetField(String label, TextEditingController ctrl, {bool isPassword = false}) =>
      TextField(
        controller: ctrl,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: kGrey, fontSize: 13),
          filled: true, fillColor: kBlueLite,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: kBlue, width: 1.5)),
          isDense: true,
        ),
      );

  // ════════════════════════════════════════
  //  BUILD
  // ════════════════════════════════════════
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            _appBar(context),
            _tabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [_primaryTab(), _otherInfoTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ════════════════════════════════════════
  //  APP BAR
  // ════════════════════════════════════════
  Widget _appBar(BuildContext context) => Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(colors: [kBlue, Color(0xFF1A73E8)],
          begin: Alignment.centerLeft, end: Alignment.centerRight),
    ),
    padding: const EdgeInsets.fromLTRB(4, 6, 14, 10),
    child: Row(
      children: [
        IconButton(icon: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.white),
            onPressed: () => Navigator.pop(context)),
        const Expanded(
          child: Center(
            child: Text('Edit profile information',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white)),
          ),
        ),
        GestureDetector(
          onTap: () async {
            // ── Validate ALL fields ──
            if (_fullNameCtrl.text.trim().isEmpty) {
              _showSnack('Please enter your full name!', Colors.red); return;
            }
            if (_emailCtrl.text.trim().isEmpty || !_emailCtrl.text.contains('@') || !_emailCtrl.text.contains('.')) {
              _showSnack('Please enter a valid email address!', Colors.red); return;
            }
            if (_phoneCtrl.text.trim().length < 10) {
              _showSnack('Phone number must be 10 digits!', Colors.red); return;
            }
            if (_passwordCtrl.text.trim().isEmpty || _passwordCtrl.text.length < 6) {
              _showSnack('Password must be at least 6 characters!', Colors.red); return;
            }
            if (_selectedLanguage == null) {
              _showSnack('Please select a language!', Colors.red); return;
            }
            if (_selectedNationality == null) {
              _showSnack('Please select your nationality!', Colors.red); return;
            }
            if (_pincodeCtrl.text.trim().length < 6) {
              _showSnack('Pincode must be 6 digits!', Colors.red); return;
            }
            if (_selectedCity == null) {
              _showSnack('Please select your city!', Colors.red); return;
            }
            if (_selectedState == null) {
              _showSnack('Please select your state!', Colors.red); return;
            }
            if (_selectedGender == null) {
              _showSnack('Please select your gender!', Colors.red); return;
            }
            if (_selectedDOB == null) {
              _showSnack('Please select your date of birth!', Colors.red); return;
            }
            if (_selectedMarital == null) {
              _showSnack('Please select your marital status!', Colors.red); return;
            }
            if (_incomeCtrl.text.trim().isEmpty) {
              _showSnack('Please enter your monthly income!', Colors.red); return;
            }
            if (_occupationCtrl.text.trim().isEmpty) {
              _showSnack('Please enter your occupation!', Colors.red); return;
            }
            if (_kidsCtrl.text.trim().isEmpty) {
              _showSnack('Please enter number of kids!', Colors.red); return;
            }
            if (_educationCtrl.text.trim().isEmpty) {
              _showSnack('Please enter your education!', Colors.red); return;
            }
            if (_businessCtrl.text.trim().isEmpty) {
              _showSnack('Please enter your business name!', Colors.red); return;
            }
            if (_selectedBloodGroup == null) {
              _showSnack('Please select your blood group!', Colors.red); return;
            }
            // ── Save all data ──
            await _saveData();
            _showSnack('✅ Profile saved successfully!', const Color(0xFF16A34A));
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.5))),
            child: const Text('Save',
                style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700)),
          ),
        ),
      ],
    ),
  );

  // ════════════════════════════════════════
  //  TAB BAR
  // ════════════════════════════════════════
  Widget _tabBar() => Container(
    color: Colors.white,
    child: TabBar(
      controller: _tabController,
      labelColor: kBlue,
      unselectedLabelColor: kGrey,
      indicatorColor: kBlue,
      indicatorWeight: 3,
      labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
      tabs: const [Tab(text: 'Primary'), Tab(text: 'Other Info')],
    ),
  );

  // ════════════════════════════════════════
  //  PRIMARY TAB
  // ════════════════════════════════════════
  Widget _primaryTab() => SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Profile picture card ──
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEEF1F8)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05),
                  blurRadius: 12, offset: const Offset(0, 3)),
            ],
          ),
          child: Row(
            children: [
              // ── Avatar ──
              MouseRegion(
                onEnter: (_) => setState(() => _hovering = true),
                onExit: (_) => setState(() => _hovering = false),
                child: GestureDetector(
                  onTap: _uploadImage,
                  child: Stack(
                    children: [
                      Container(
                        width: 70, height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFF0F3F8),
                          border: Border.all(
                              color: const Color(0xFFDDE2EA), width: 2),
                        ),
                        child: ClipOval(
                          child: _hasPhoto
                              ? Container(color: kBlueLite,
                              child: const Icon(Icons.check_circle_rounded,
                                  size: 40, color: kBlue))
                              : const Icon(Icons.person_rounded,
                                  size: 42, color: Color(0xFFB0BEC5)),
                        ),
                      ),
                      if (_hovering)
                        Container(
                          width: 70, height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.4)),
                          child: const Icon(Icons.camera_alt_rounded,
                              color: Colors.white, size: 24),
                        ),
                      Positioned(
                        bottom: 0, right: 0,
                        child: Container(
                          width: 22, height: 22,
                          decoration: BoxDecoration(
                            color: kBlue,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1.5),
                          ),
                          child: const Icon(Icons.camera_alt_rounded,
                              size: 11, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // ── Upload / Remove ──
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Profile Picture',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: kBlack)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: _uploadImage,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: kBlue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.cloud_upload_outlined,
                                    color: Colors.white, size: 14),
                                SizedBox(width: 5),
                                Text('Upload Image',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: () {
                            setState(() => _hasPhoto = false);
                            _showSnack('Photo removed', Colors.red);
                          },
                          child: const Text('Remove',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // ── Full Name — letters only ──
        _textField(
          label: 'Full Name',
          controller: _fullNameCtrl,
          icon: Icons.person_outline_rounded,
          hint: 'Deepak Kumar',
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
          keyboardType: TextInputType.name,
        ),

        // ── Email ──
        _textField(
          label: 'E-mail Address',
          controller: _emailCtrl,
          icon: Icons.email_outlined,
          hint: 'deepak@gmail.com',
          keyboardType: TextInputType.emailAddress,
          trailing: GestureDetector(
            onTap: _verifyEmail,
            child: _badge(_emailVerified ? 'Verified ✓' : 'Verify',
                _emailVerified ? const Color(0xFF16A34A) : Colors.orange),
          ),
        ),

        // ── Phone — numbers only, max 10 ──
        _textField(
          label: 'Phone Number',
          controller: _phoneCtrl,
          icon: Icons.phone_outlined,
          hint: '+91 98765 43210',
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          trailing: _badge('Verified ✓', const Color(0xFF16A34A)),
        ),

        // ── Password with eye icon ──
        _passwordField(),

        // ── Language dropdown ──
        _dropdown('Language Known', Icons.language_rounded, _languages, _selectedLanguage,
            (val) => setState(() => _selectedLanguage = val)),

        // ── Nationality dropdown ──
        _dropdown('Nationality', Icons.flag_outlined, _nationalities, _selectedNationality,
            (val) => setState(() => _selectedNationality = val)),

        // ── Pincode — numbers only, max 6 ──
        _textField(
          label: 'Pincode',
          controller: _pincodeCtrl,
          icon: Icons.pin_drop_outlined,
          hint: '605 001',
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(6),
          ],
        ),

        // ── City dropdown ──
        _dropdown('City', Icons.location_city_outlined, _cities, _selectedCity,
            (val) => setState(() => _selectedCity = val)),

        // ── State dropdown ──
        _dropdown('State', Icons.map_outlined, _states, _selectedState,
            (val) => setState(() => _selectedState = val)),

        // ── Gender dropdown ──
        _dropdown('Gender', Icons.wc_rounded, _genders, _selectedGender,
            (val) => setState(() => _selectedGender = val)),

        const SizedBox(height: 4),

        // ── Show Add Address button only if NO addresses saved ──
        // ── If addresses exist, just show them with a header ──
        if (_savedAddresses.isEmpty)
          GestureDetector(
            onTap: () async {
              await Navigator.push(context,
                  MaterialPageRoute(builder: (_) => AddressScreen(
                    prefillName: _fullNameCtrl.text.trim(),
                    prefillPhone: _phoneCtrl.text.trim(),
                  )));
              await _loadAddresses();
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: kBlue.withOpacity(0.35), width: 1.5),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03),
                    blurRadius: 6, offset: const Offset(0, 2))],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_circle_outline_rounded, size: 18, color: kBlue),
                  SizedBox(width: 6),
                  Text('Add Address',
                      style: TextStyle(
                          fontSize: 13,
                          color: kBlue,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),

        // ── Show saved addresses with header ──
        if (_savedAddresses.isNotEmpty) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Saved Addresses',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A2E5A),
                      letterSpacing: 0.2)),
            ],
          ),
          const SizedBox(height: 8),
          ..._savedAddresses.map((a) => Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: kBorderGrey),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03),
                  blurRadius: 6, offset: const Offset(0, 2))],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 36, height: 36,
                  decoration: BoxDecoration(
                    color: kBlueLite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.location_on_rounded,
                      color: kBlue, size: 18),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if ((a['line1'] ?? '').isNotEmpty)
                        Text(
                          [a['line1'], a['city'], a['pincode']]
                              .where((s) => s != null && s.isNotEmpty)
                              .join(', '),
                          style: const TextStyle(
                              fontSize: 12, color: kBlack,
                              fontWeight: FontWeight.w600, height: 1.4),
                        ),
                      if ((a['street'] ?? '').isNotEmpty)
                        Text(
                          [a['street'], a['city2'], a['pincode2']]
                              .where((s) => s != null && s.isNotEmpty)
                              .join(', '),
                          style: const TextStyle(
                              fontSize: 12, color: kGrey, height: 1.4),
                        ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AddressScreen(
                          prefillName: _fullNameCtrl.text.trim(),
                          prefillPhone: _phoneCtrl.text.trim(),
                        )));
                    await _loadAddresses();
                  },
                  child: const Icon(Icons.edit_outlined,
                      color: kGrey, size: 16),
                ),
              ],
            ),
          )),
        ],
      ],
    ),
  );

  // ════════════════════════════════════════
  //  OTHER INFO TAB
  // ════════════════════════════════════════
  Widget _otherInfoTab() => SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Date of Birth — date picker ──
        _datePicker(),

        // ── Marital Status dropdown ──
        _dropdown('Marital Status', Icons.favorite_border_rounded,
            _maritalStatus, _selectedMarital,
            (val) => setState(() => _selectedMarital = val)),

        // ── Number of Kids — numbers only ──
        _textField(
          label: 'Number of Kids',
          controller: _kidsCtrl,
          icon: Icons.child_care_rounded,
          hint: '1',
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(2),
          ],
        ),

        // ── Education — letters only ──
        _textField(
          label: 'Education',
          controller: _educationCtrl,
          icon: Icons.school_outlined,
          hint: 'B.Sc Nursing, MBA',
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s\.]'))],
        ),

        // ── Monthly Income — numbers only ──
        _textField(
          label: 'Monthly Income',
          controller: _incomeCtrl,
          icon: Icons.currency_rupee_rounded,
          hint: '50000',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),

        // ── Occupation — letters only ──
        _textField(
          label: 'Occupation',
          controller: _occupationCtrl,
          icon: Icons.work_outline_rounded,
          hint: 'Doctor, Engineer',
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
        ),

        // ── Business Name ──
        _textField(
          label: 'My Business Name',
          controller: _businessCtrl,
          icon: Icons.business_outlined,
          hint: 'Veesafe Health Pvt Ltd',
        ),

        // ── Blood Group dropdown ──
        _dropdown('Blood Group', Icons.bloodtype_outlined,
            _bloodGroups, _selectedBloodGroup,
            (val) => setState(() => _selectedBloodGroup = val)),

        // ── Extra chips ──
        ..._extraEducations.map((e) => _chip(e, () =>
            setState(() => _extraEducations.remove(e)))),
        ..._extraWorkplaces.map((w) => _chip(w, () =>
            setState(() => _extraWorkplaces.remove(w)))),

        const SizedBox(height: 8),
        _addButton('Add Education', _addEducation),
        const SizedBox(height: 12),
        _addButton('Add a Workplace', _addWorkplace),
      ],
    ),
  );

  // ════════════════════════════════════════
  //  FLOATING LABEL TEXT FIELD
  // ════════════════════════════════════════
  Widget _textField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    String? hint,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    Widget? trailing,
  }) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Bold navy label ──
            Row(
              children: [
                Text(label,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A2E5A),
                        letterSpacing: 0.2)),
                if (trailing != null) ...[
                  const Spacer(),
                  trailing,
                ],
              ],
            ),
            const SizedBox(height: 8),
            // ── Input with underline ──
            TextFormField(
              controller: controller,
              obscureText: isPassword,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: kBlack),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                    fontSize: 13.5,
                    color: Color(0xFFC5CDD8),
                    fontWeight: FontWeight.w400),
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 6),
                border: InputBorder.none,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xFFDDE2EA), width: 1.2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kBlue, width: 1.8),
                ),
              ),
            ),
          ],
        ),
      );

  // ════════════════════════════════════════
  //  PASSWORD FIELD WITH EYE ICON
  // ════════════════════════════════════════
  Widget _passwordField() => Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('Change Password',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A2E5A),
                    letterSpacing: 0.2)),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                final newPass = await Navigator.push<String>(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const ChangePasswordScreen()),
                );
                if (newPass != null) {
                  setState(() => _passwordCtrl.text = newPass);
                }
              },
              child: _badge('Change', kBlue),
            ),
          ],
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: _passwordCtrl,
          obscureText: !_showPass,
          style: const TextStyle(
              fontSize: 13, fontWeight: FontWeight.w500, color: kBlack),
          decoration: InputDecoration(
            hintText: 'Min 6 characters',
            hintStyle: const TextStyle(
                fontSize: 13, color: Color(0xFFBBC5D5), fontWeight: FontWeight.w400),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            border: InputBorder.none,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 1),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kBlue, width: 1.5),
            ),
            suffixIcon: IconButton(
              icon: Icon(_showPass ? Icons.visibility_off : Icons.visibility,
                  size: 20, color: kGrey),
              onPressed: () => setState(() => _showPass = !_showPass),
            ),
          ),
        ),
      ],
    ),
  );

  // ════════════════════════════════════════
  //  DROPDOWN FIELD — opens as bottom sheet
  // ════════════════════════════════════════
  Widget _dropdown(String label, IconData icon, List<String> items,
      String? value, ValueChanged<String?> onChanged) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: kBlue)),
            const SizedBox(height: 6),
            GestureDetector(
              onTap: () => _showPickerSheet(label, items, value, onChanged),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      value ?? 'Select $label',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: value != null
                              ? kBlack
                              : const Color(0xFFBBC5D5)),
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down_rounded,
                      color: kGrey, size: 20),
                ],
              ),
            ),
            const Divider(
                color: Color(0xFFE0E0E0), thickness: 1, height: 12),
          ],
        ),
      );

  // ── Bottom sheet picker ──
  void _showPickerSheet(String label, List<String> items,
      String? current, ValueChanged<String?> onChanged) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.fromLTRB(0, 14, 0, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
            Container(
              width: 40, height: 4,
              decoration: BoxDecoration(
                color: kBorderGrey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Select $label',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: kBlack)),
            ),
            const SizedBox(height: 10),
            const Divider(color: kBorderGrey, height: 1),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.45,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (_, i) {
                  final item = items[i];
                  final isSelected = item == current;
                  return InkWell(
                    onTap: () {
                      onChanged(item);
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 14),
                      color: isSelected
                          ? kBlueLite
                          : Colors.transparent,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(item,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: isSelected
                                        ? FontWeight.w700
                                        : FontWeight.w500,
                                    color: isSelected
                                        ? kBlue
                                        : kBlack)),
                          ),
                          if (isSelected)
                            const Icon(Icons.check_rounded,
                                color: kBlue, size: 18),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ════════════════════════════════════════
  //  DATE PICKER FIELD
  // ════════════════════════════════════════
  Widget _datePicker() => Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Date of Birth',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF1A2E5A), letterSpacing: 0.2)),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: _pickDOB,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  _selectedDOB != null
                      ? '${_selectedDOB!.day.toString().padLeft(2, '0')} / ${_selectedDOB!.month.toString().padLeft(2, '0')} / ${_selectedDOB!.year}'
                      : '15 / 08 / 1995',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: _selectedDOB != null ? kBlack : const Color(0xFFBBC5D5)),
                ),
              ),
              const Icon(Icons.calendar_today_rounded, size: 18, color: kGrey),
            ],
          ),
        ),
        const Divider(color: Color(0xFFE0E0E0), thickness: 1, height: 12),
      ],
    ),
  );

  // ── Badge ──
  Widget _badge(String text, Color color) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
    decoration: BoxDecoration(color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.35))),
    child: Text(text,
        style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w700)),
  );

  // ── Chip ──
  Widget _chip(String text, VoidCallback onDelete) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(color: kBlueLite, borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kBlue.withOpacity(0.2))),
      child: Row(
        children: [
          const Icon(Icons.check_circle_rounded, color: kBlue, size: 16),
          const SizedBox(width: 8),
          Expanded(child: Text(text,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: kBlack))),
          GestureDetector(onTap: onDelete,
              child: const Icon(Icons.close_rounded, color: kGrey, size: 16)),
        ],
      ),
    ),
  );

  // ── Add button ──
  Widget _addButton(String label, VoidCallback onTap) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: kBlue.withOpacity(0.35), width: 1.5),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03),
              blurRadius: 6, offset: const Offset(0, 2))]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.add_circle_outline_rounded, size: 18, color: kBlue),
          const SizedBox(width: 6),
          Text(label,
              style: const TextStyle(fontSize: 13, color: kBlue, fontWeight: FontWeight.w700)),
        ],
      ),
    ),
  );
}