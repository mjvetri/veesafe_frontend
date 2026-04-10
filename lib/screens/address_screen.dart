// lib/screens/address_screen.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_colors.dart';

class AddressScreen extends StatefulWidget {
  final String? prefillName;
  final String? prefillPhone;

  const AddressScreen({super.key, this.prefillName, this.prefillPhone});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  List<Map<String, String>> _addresses = [];
  bool _showForm = false;

  // ── Form controllers ──
  late TextEditingController _line1Ctrl;
  late TextEditingController _line2Ctrl;
  late TextEditingController _cityCtrl;
  late TextEditingController _pincodeCtrl;
  String? _selectedCountry = 'India';

  // ── Street address controllers ──
  late TextEditingController _streetCtrl;
  late TextEditingController _aptCtrl;
  late TextEditingController _cityCtrl2;
  late TextEditingController _pincode2Ctrl;
  String? _selectedCountry2 = 'India';

  final List<String> _countries = [
    'India', 'United States', 'United Kingdom', 'Australia',
    'Canada', 'Germany', 'France', 'Japan', 'Singapore', 'Other',
  ];

  @override
  void initState() {
    super.initState();
    _line1Ctrl   = TextEditingController();
    _line2Ctrl   = TextEditingController();
    _cityCtrl    = TextEditingController();
    _pincodeCtrl = TextEditingController();
    _streetCtrl  = TextEditingController();
    _aptCtrl     = TextEditingController();
    _cityCtrl2   = TextEditingController();
    _pincode2Ctrl= TextEditingController();
    _loadAddresses();
  }

  @override
  void dispose() {
    _line1Ctrl.dispose();
    _line2Ctrl.dispose();
    _cityCtrl.dispose();
    _pincodeCtrl.dispose();
    _streetCtrl.dispose();
    _aptCtrl.dispose();
    _cityCtrl2.dispose();
    _pincode2Ctrl.dispose();
    super.dispose();
  }

  // ════════════════════════════════════════
  //  LOAD addresses from SharedPreferences
  // ════════════════════════════════════════
  Future<void> _loadAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('addresses');
    if (raw != null) {
      final List decoded = jsonDecode(raw);
      setState(() {
        _addresses = decoded.map((e) => Map<String, String>.from(e)).toList();
      });
    }
  }

  // ════════════════════════════════════════
  //  SAVE addresses to SharedPreferences
  // ════════════════════════════════════════
  Future<void> _saveAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('addresses', jsonEncode(_addresses));
  }

  // ════════════════════════════════════════
  //  CLEAR FORM
  // ════════════════════════════════════════
  void _clearForm() {
    _line1Ctrl.clear();
    _line2Ctrl.clear();
    _cityCtrl.clear();
    _pincodeCtrl.clear();
    _streetCtrl.clear();
    _aptCtrl.clear();
    _cityCtrl2.clear();
    _pincode2Ctrl.clear();
    setState(() {
      _selectedCountry  = 'India';
      _selectedCountry2 = 'India';
    });
  }

  // ════════════════════════════════════════
  //  SUBMIT ADDRESS — smart logic
  // ════════════════════════════════════════
  Future<void> _submitAddress() async {
    final hasAddress = _line1Ctrl.text.trim().isNotEmpty &&
        _cityCtrl.text.trim().isNotEmpty &&
        _pincodeCtrl.text.trim().isNotEmpty;

    final hasStreet = _streetCtrl.text.trim().isNotEmpty &&
        _cityCtrl2.text.trim().isNotEmpty &&
        _pincode2Ctrl.text.trim().isNotEmpty;

    // ── Nothing filled ──
    if (!hasAddress && !hasStreet) {
      _showSnack('Please fill at least one address!', Colors.red);
      return;
    }

    // ── Partial address filled ──
    if (_line1Ctrl.text.trim().isNotEmpty && !hasAddress) {
      _showSnack('Please complete Address Line 1, City & ZIP!', Colors.orange);
      return;
    }

    // ── Partial street filled ──
    if (_streetCtrl.text.trim().isNotEmpty && !hasStreet) {
      _showSnack('Please complete Street, City & ZIP!', Colors.orange);
      return;
    }

    final newAddress = {
      'name':    widget.prefillName  ?? '',
      'phone':   widget.prefillPhone ?? '',
      // Address section
      'line1':    hasAddress ? _line1Ctrl.text.trim()   : '',
      'line2':    hasAddress ? _line2Ctrl.text.trim()   : '',
      'city':     hasAddress ? _cityCtrl.text.trim()    : '',
      'country':  hasAddress ? (_selectedCountry ?? 'India') : '',
      'pincode':  hasAddress ? _pincodeCtrl.text.trim() : '',
      // Street section
      'street':   hasStreet ? _streetCtrl.text.trim()  : '',
      'apt':      hasStreet ? _aptCtrl.text.trim()     : '',
      'city2':    hasStreet ? _cityCtrl2.text.trim()   : '',
      'country2': hasStreet ? (_selectedCountry2 ?? 'India') : '',
      'pincode2': hasStreet ? _pincode2Ctrl.text.trim(): '',
    };

    setState(() {
      _addresses.add(newAddress);
      _showForm = false;
    });

    await _saveAddresses();
    _clearForm();

    final saved = [
      if (hasAddress) 'Home Address',
      if (hasStreet)  'Street Address',
    ].join(' & ');

    _showSnack('✅ $saved saved!', const Color(0xFF16A34A));
  }

  void _showSnack(String msg, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            _appBar(context),
            Expanded(
              child: _showForm ? _formView() : _listView(),
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
          gradient: LinearGradient(
            colors: [kBlue, Color(0xFF1A73E8)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        padding: const EdgeInsets.fromLTRB(4, 6, 14, 10),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios,
                  size: 18, color: Colors.white),
              onPressed: () {
                if (_showForm) {
                  setState(() => _showForm = false);
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            Expanded(
              child: Center(
                child: Text(
                  _showForm ? 'Add New Address' : 'Your Address',
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ),
            ),
            // ── Fix 2: Only show + Add when there's at least one address ──
            if (!_showForm && _addresses.isNotEmpty)
              GestureDetector(
                onTap: () => setState(() => _showForm = true),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 7),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Colors.white.withOpacity(0.5)),
                  ),
                  child: const Text('+ Add',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w700)),
                ),
              )
            else
              const SizedBox(width: 48),
          ],
        ),
      );

  // ════════════════════════════════════════
  //  LIST VIEW — show saved addresses
  // ════════════════════════════════════════
  Widget _listView() => _addresses.isEmpty
      ? _emptyState()
      : ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          itemCount: _addresses.length,
          itemBuilder: (_, i) {
            final a = _addresses[i];
            return Container(
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: kBorderGrey),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 42, height: 42,
                    decoration: BoxDecoration(
                      color: kBlueLite,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.location_on_rounded,
                        color: kBlue, size: 22),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if ((a['name'] ?? '').isNotEmpty)
                          Text(a['name']!,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: kBlack)),
                        const SizedBox(height: 4),

                        // ── Home Address ──
                        if ((a['line1'] ?? '').isNotEmpty) ...[
                          const Text('Home Address',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: kBlue)),
                          const SizedBox(height: 2),
                          Text(
                            [
                              a['line1'],
                              if ((a['line2'] ?? '').isNotEmpty) a['line2'],
                              a['city'],
                              a['country'],
                              a['pincode'],
                            ].where((s) => s != null && s.isNotEmpty).join(', '),
                            style: const TextStyle(
                                fontSize: 12, color: kGrey, height: 1.5),
                          ),
                        ],

                        // ── Street Address ──
                        if ((a['street'] ?? '').isNotEmpty) ...[
                          const SizedBox(height: 6),
                          const Text('Street Address',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                  color: kBlue)),
                          const SizedBox(height: 2),
                          Text(
                            [
                              a['street'],
                              if ((a['apt'] ?? '').isNotEmpty) a['apt'],
                              a['city2'],
                              a['country2'],
                              a['pincode2'],
                            ].where((s) => s != null && s.isNotEmpty).join(', '),
                            style: const TextStyle(
                                fontSize: 12, color: kGrey, height: 1.5),
                          ),
                        ],

                        if ((a['phone'] ?? '').isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(a['phone']!,
                              style: const TextStyle(
                                  fontSize: 12, color: kGrey)),
                        ],
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      setState(() => _addresses.removeAt(i));
                      await _saveAddresses();
                      _showSnack('Address removed', Colors.red);
                    },
                    child: const Icon(Icons.delete_outline_rounded,
                        color: Colors.red, size: 20),
                  ),
                ],
              ),
            );
          },
        );

  // ════════════════════════════════════════
  //  EMPTY STATE
  // ════════════════════════════════════════
  Widget _emptyState() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160, height: 160,
              decoration: BoxDecoration(
                  color: kBlueLite, shape: BoxShape.circle),
              child: const Icon(Icons.location_on_rounded,
                  size: 80, color: kBlue),
            ),
            const SizedBox(height: 24),
            const Text("You haven't created yet !",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: kBlack)),
            const SizedBox(height: 8),
            const Text(
              'Your order will be well sanitised\nand safely delivered.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: kGrey, height: 1.5),
            ),
            const SizedBox(height: 28),
            GestureDetector(
              onTap: () => setState(() => _showForm = true),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 14),
                decoration: BoxDecoration(
                  color: kBlue,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                        color: kBlue.withOpacity(0.35),
                        blurRadius: 12,
                        offset: const Offset(0, 5)),
                  ],
                ),
                child: const Text('Add a new one',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      );

  // ════════════════════════════════════════
  //  FORM VIEW — two columns side by side
  // ════════════════════════════════════════
  Widget _formView() => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _addressCard(
                    children: [
                      _formField(label: 'Address line 1',            controller: _line1Ctrl),
                      const SizedBox(height: 12),
                      _formField(label: 'Address line 2 (optional)', controller: _line2Ctrl),
                      const SizedBox(height: 12),
                      _formField(label: 'City',                      controller: _cityCtrl,
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))]),
                      const SizedBox(height: 12),
                      _countryDropdownWidget(_selectedCountry,
                          (val) => setState(() => _selectedCountry = val)),
                      const SizedBox(height: 12),
                      _formField(label: 'ZIP/ postcode',             controller: _pincodeCtrl,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(6)]),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _addressCard(
                    children: [
                      _formField(label: 'Street address',             controller: _streetCtrl),
                      const SizedBox(height: 12),
                      _formField(label: 'Apt, suite, etc (optional)', controller: _aptCtrl),
                      const SizedBox(height: 12),
                      _formField(label: 'City',                       controller: _cityCtrl2,
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))]),
                      const SizedBox(height: 12),
                      _countryDropdownWidget(_selectedCountry2,
                          (val) => setState(() => _selectedCountry2 = val)),
                      const SizedBox(height: 12),
                      _formField(label: 'ZIP/ postcode',              controller: _pincode2Ctrl,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(6)]),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // ── Single Save button ──
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 3,
                ),
                onPressed: _submitAddress,
                child: const Text('Save',
                    style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      );

  Widget _addressCard({required List<Widget> children}) =>
      Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: kBorderGrey),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
      );

  Widget _sectionTitle(String title) => Text(title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: kBlack));

  // ── Form field ──
  Widget _formField({
    required String label,
    required TextEditingController controller,
    String hint = '',
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: kBlack)),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            style: const TextStyle(fontSize: 14, color: kBlack),
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                    color: Color(0xFFDDE2EA), width: 1.2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: kBlue, width: 1.8),
              ),
            ),
          ),
        ],
      );

  Widget _countryDropdownWidget(String? value, ValueChanged<String?> onChanged) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Country',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: kBlack)),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 14, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: const Color(0xFFDDE2EA), width: 1.2),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                icon: const Icon(
                    Icons.unfold_more_rounded,
                    color: kGrey, size: 20),
                style: const TextStyle(
                    fontSize: 14, color: kBlack),
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(12),
                onChanged: onChanged,
                items: _countries
                    .map((c) => DropdownMenuItem(
                          value: c,
                          child: Text(c),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      );
}