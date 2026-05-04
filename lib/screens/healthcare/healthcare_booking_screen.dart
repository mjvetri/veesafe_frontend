import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/healthcare_models.dart';
import 'healthcare_service.dart';
import 'healthcare_booking_success_screen.dart';

class HealthcareBookingScreen extends StatefulWidget {
  final HealthcareServiceDef serviceDef;
  final String subCategoryLabel;
  final Map<String, dynamic> extraParams;

  const HealthcareBookingScreen({
    super.key,
    required this.serviceDef,
    required this.subCategoryLabel,
    required this.extraParams,
  });

  @override
  State<HealthcareBookingScreen> createState() => _HealthcareBookingScreenState();
}

class _HealthcareBookingScreenState extends State<HealthcareBookingScreen> {
  static const Color _navy = Color(0xFF1A2B5E);
  static const Color _teal = Color(0xFF2BB5A0);
  static const Color _dark = Color(0xFF1A2340);
  static const Color _grey = Color(0xFF8A94A6);
  static const Color _lite = Color(0xFFEEF3FB);

  final _formKey           = GlobalKey<FormState>();
  final _patientNameCtrl   = TextEditingController();
  final _patientAgeCtrl    = TextEditingController();
  final _conditionCtrl     = TextEditingController();
  final _addressCtrl       = TextEditingController();
  final _contactCtrl       = TextEditingController();

  DateTime _scheduledDate = DateTime.now().add(const Duration(days: 1));
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _prefillAddress();
  }

  Future<void> _prefillAddress() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('user_address') ?? '';
    if (saved.isNotEmpty && mounted) setState(() => _addressCtrl.text = saved);
  }

  @override
  void dispose() {
    _patientNameCtrl.dispose();
    _patientAgeCtrl.dispose();
    _conditionCtrl.dispose();
    _addressCtrl.dispose();
    _contactCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _scheduledDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 60)),
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(colorScheme: ColorScheme.light(primary: _navy)),
        child: child!,
      ),
    );
    if (picked != null && mounted) setState(() => _scheduledDate = picked);
  }

  Future<void> _submitBooking() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    final svc    = widget.serviceDef;
    final params = widget.extraParams;

    final booking = HealthcareBooking(
      bookingId:         'HC-${DateTime.now().millisecondsSinceEpoch}',
      main:              'Home Healthcare Services',
      sub:               widget.subCategoryLabel,
      inner:             svc.title,
      serviceId:         svc.id,
      tags:              svc.tags,
      nursingDuration:   params['nursing_duration'] as NursingDuration?,
      nursingSkill:      params['nursing_skill'] as NursingSkillLevel?,
      caretakerDuration: params['caretaker_duration'] as CaretakerDuration?,
      gender:            params['gender'] as CaretakerGender?,
      experience:        params['experience'] as CaretakerExperience?,
      scheduledDate:     _scheduledDate,
      patientName:       _patientNameCtrl.text.trim(),
      patientAge:        _patientAgeCtrl.text.trim(),
      patientCondition:  _conditionCtrl.text.trim(),
      address:           _addressCtrl.text.trim(),
      contactNumber:     _contactCtrl.text.trim(),
      useCase:           _resolveUseCase(svc),
      createdAt:         DateTime.now(),
    );

    final result = await HealthcareService.instance.submitBooking(booking);
    setState(() => _isLoading = false);

    if (!mounted) return;
    if (result.success) {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (_) => HealthcareBookingSuccessScreen(booking: booking, bookingId: result.bookingId)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result.message), backgroundColor: Colors.red.shade700));
    }
  }

  String _resolveUseCase(HealthcareServiceDef svc) {
    if (svc.tags.contains(HealthcareTag.seniorCitizen)) return 'Elderly';
    if (svc.tags.contains(HealthcareTag.postSurgery))   return 'Post Surgery';
    if (svc.tags.contains(HealthcareTag.criticalCare))  return 'Critical Care';
    if (svc.tags.contains(HealthcareTag.disability))    return 'Disability Support';
    return 'General';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      appBar: AppBar(
        backgroundColor: _navy,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Patient Details',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 17)),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _summaryCard(),
              const SizedBox(height: 20),
              _sectionTitle('Patient Information'),
              const SizedBox(height: 12),
              _field('Patient Name', _patientNameCtrl, Icons.person_outline_rounded, required: true),
              const SizedBox(height: 12),
              _field('Patient Age', _patientAgeCtrl, Icons.cake_outlined,
                  keyboardType: TextInputType.number, required: true),
              const SizedBox(height: 12),
              _field('Medical Condition / Notes', _conditionCtrl, Icons.medical_information_outlined, maxLines: 3),
              const SizedBox(height: 20),
              _sectionTitle('Service Details'),
              const SizedBox(height: 12),
              _dateTile(),
              const SizedBox(height: 20),
              _sectionTitle('Contact & Address'),
              const SizedBox(height: 12),
              _field('Contact Number', _contactCtrl, Icons.phone_outlined,
                  keyboardType: TextInputType.phone, required: true),
              const SizedBox(height: 12),
              _field('Service Address', _addressCtrl, Icons.location_on_outlined,
                  maxLines: 2, required: true),
              const SizedBox(height: 28),
              _confirmBtn(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String t) => Row(children: [
    Container(width: 4, height: 16,
        decoration: BoxDecoration(color: _navy, borderRadius: BorderRadius.circular(4))),
    const SizedBox(width: 8),
    Text(t, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: _dark)),
  ]);

  Widget _summaryCard() => Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: _lite,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: _navy.withOpacity(0.2)),
    ),
    child: Row(children: [
      Container(
        width: 44, height: 44,
        decoration: BoxDecoration(color: _navy, borderRadius: BorderRadius.circular(12)),
        child: const Icon(Icons.medical_services_rounded, size: 22, color: Colors.white),
      ),
      const SizedBox(width: 12),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.serviceDef.title,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: _navy)),
        const SizedBox(height: 2),
        Text('${widget.subCategoryLabel} · Home Healthcare',
            style: TextStyle(fontSize: 10.5, color: _grey)),
      ])),
    ]),
  );

  Widget _field(String label, TextEditingController ctrl, IconData icon,
      {int maxLines = 1, TextInputType keyboardType = TextInputType.text, bool required = false}) =>
      TextFormField(
        controller: ctrl,
        maxLines: maxLines,
        keyboardType: keyboardType,
        validator: required ? (v) => (v == null || v.trim().isEmpty) ? 'Required' : null : null,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, size: 18, color: _navy),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFDDDDDD))),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFDDDDDD))),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: _navy, width: 1.5)),
        ),
      );

  Widget _dateTile() => GestureDetector(
    onTap: _pickDate,
    child: Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDDDDDD)),
      ),
      child: Row(children: [
        Icon(Icons.calendar_today_outlined, size: 18, color: _navy),
        const SizedBox(width: 10),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Service Date', style: TextStyle(fontSize: 11, color: _grey)),
          const SizedBox(height: 2),
          Text('${_scheduledDate.day}/${_scheduledDate.month}/${_scheduledDate.year}',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: _dark)),
        ]),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(color: _lite, borderRadius: BorderRadius.circular(20)),
          child: Text('Change', style: TextStyle(fontSize: 11, color: _navy, fontWeight: FontWeight.w600)),
        ),
      ]),
    ),
  );

  Widget _confirmBtn() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: _isLoading ? null : _submitBooking,
      style: ElevatedButton.styleFrom(
        backgroundColor: _navy, foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: _isLoading
          ? const SizedBox(height: 18, width: 18,
              child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
          : const Text('Confirm Booking', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
    ),
  );
}
