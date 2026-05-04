import 'package:flutter/material.dart';
import '../../models/healthcare_models.dart';
import 'healthcare_booking_screen.dart';

class CaretakerScreen extends StatefulWidget {
  final CaretakerType? preSelectedType;
  const CaretakerScreen({super.key, this.preSelectedType});
  @override
  State<CaretakerScreen> createState() => _CaretakerScreenState();
}

class _CaretakerScreenState extends State<CaretakerScreen> {
  static const Color _navy = Color(0xFF1A2B5E);
  static const Color _teal = Color(0xFF2BB5A0);
  static const Color _dark = Color(0xFF1A2340);
  static const Color _grey = Color(0xFF8A94A6);
  static const Color _lite = Color(0xFFEEF3FB);

  HealthcareServiceDef? _selectedService;
  CaretakerDuration _duration    = CaretakerDuration.twentyFourHours;
  CaretakerGender? _gender;
  CaretakerExperience _experience = CaretakerExperience.experienced;

  @override
  void initState() {
    super.initState();
    if (widget.preSelectedType != null) {
      final idMap = {
        CaretakerType.seniorCitizenCare:    'caretaker_senior',
        CaretakerType.patientCareAttendant: 'caretaker_patient',
        CaretakerType.postSurgeryAttendant: 'caretaker_post_surgery',
        CaretakerType.disabilitySupport:    'caretaker_disability',
      };
      final targetId = idMap[widget.preSelectedType!];
      _selectedService = caretakerServices.firstWhere(
        (s) => s.id == targetId, orElse: () => caretakerServices.first,
      );
    } else {
      _selectedService = caretakerServices.first;
    }
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
        title: const Text('Caretaker / Attendant',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 17)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle('Select Care Type'),
            const SizedBox(height: 12),
            ...caretakerServices.map((svc) => _serviceCard(svc)),
            const SizedBox(height: 20),
            _sectionTitle('Duration'),
            const SizedBox(height: 10),
            _durationRow(),
            const SizedBox(height: 20),
            _sectionTitle('Preferred Gender'),
            const SizedBox(height: 10),
            _genderRow(),
            const SizedBox(height: 20),
            _sectionTitle('Experience Level'),
            const SizedBox(height: 10),
            _experienceRow(),
            const SizedBox(height: 28),
            _proceedBtn(context),
            const SizedBox(height: 16),
          ],
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

  Widget _serviceCard(HealthcareServiceDef svc) {
    final sel = _selectedService?.id == svc.id;
    final iconMap = {
      'caretaker_senior':       Icons.elderly_rounded,
      'caretaker_patient':      Icons.personal_injury_rounded,
      'caretaker_post_surgery': Icons.healing_rounded,
      'caretaker_disability':   Icons.accessible_rounded,
    };
    return GestureDetector(
      onTap: () => setState(() => _selectedService = svc),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: sel ? _lite : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: sel ? _navy : const Color(0xFFEEEEEE), width: sel ? 2 : 1),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Row(children: [
          Container(
            width: 42, height: 42,
            decoration: BoxDecoration(
              color: sel ? _navy : const Color(0xFFE0F2F1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(iconMap[svc.id] ?? Icons.people_alt_rounded,
                size: 20, color: sel ? Colors.white : _teal),
          ),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Expanded(child: Text(svc.title,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: sel ? _navy : _dark))),
              if (svc.isHighPriority)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: BoxDecoration(color: const Color(0xFFE8F5E9), borderRadius: BorderRadius.circular(20)),
                  child: const Text('Top Priority',
                      style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: Color(0xFF1B5E20))),
                ),
            ]),
            const SizedBox(height: 3),
            Text(svc.subtitle, style: TextStyle(fontSize: 10.5, color: _grey)),
            const SizedBox(height: 6),
            Wrap(spacing: 4, runSpacing: 4, children: svc.tags.map((t) => _tagChip(tagLabel(t))).toList()),
          ])),
          if (sel) Icon(Icons.check_circle_rounded, color: _navy, size: 20),
        ]),
      ),
    );
  }

  Widget _tagChip(String label) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
    decoration: BoxDecoration(color: _lite, borderRadius: BorderRadius.circular(20)),
    child: Text(label, style: TextStyle(fontSize: 9, color: _navy, fontWeight: FontWeight.w600)),
  );

  Widget _durationRow() => Row(
    children: CaretakerDuration.values.map((d) {
      final sel = _duration == d;
      return Expanded(child: GestureDetector(
        onTap: () => setState(() => _duration = d),
        child: Container(
          margin: EdgeInsets.only(right: d == CaretakerDuration.twentyFourHours ? 0 : 8),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: sel ? _navy : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: sel ? _navy : const Color(0xFFDDDDDD)),
          ),
          child: Text(caretakerDurationLabel(d), textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w700,
                  color: sel ? Colors.white : _dark)),
        ),
      ));
    }).toList(),
  );

  Widget _genderRow() => Row(children: [
    _genderBtn(null, 'No Preference', Icons.people_outline_rounded),
    const SizedBox(width: 8),
    _genderBtn(CaretakerGender.male, 'Male', Icons.man_rounded),
    const SizedBox(width: 8),
    _genderBtn(CaretakerGender.female, 'Female', Icons.woman_rounded),
  ]);

  Widget _genderBtn(CaretakerGender? val, String label, IconData icon) {
    final sel = _gender == val;
    return Expanded(child: GestureDetector(
      onTap: () => setState(() => _gender = val),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 9),
        decoration: BoxDecoration(
          color: sel ? _navy : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: sel ? _navy : const Color(0xFFDDDDDD)),
        ),
        child: Column(children: [
          Icon(icon, size: 16, color: sel ? Colors.white : _navy),
          const SizedBox(height: 3),
          Text(label, textAlign: TextAlign.center,
              style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.w700,
                  color: sel ? Colors.white : _dark)),
        ]),
      ),
    ));
  }

  Widget _experienceRow() => Row(
    children: CaretakerExperience.values.map((e) {
      final sel = _experience == e;
      return Expanded(child: GestureDetector(
        onTap: () => setState(() => _experience = e),
        child: Container(
          margin: EdgeInsets.only(right: e == CaretakerExperience.experienced ? 0 : 8),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: sel ? _navy : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: sel ? _navy : const Color(0xFFDDDDDD)),
          ),
          child: Text(experienceLabel(e), textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700,
                  color: sel ? Colors.white : _dark)),
        ),
      ));
    }).toList(),
  );

  Widget _proceedBtn(BuildContext context) => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: _selectedService == null ? null : () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => HealthcareBookingScreen(
            serviceDef: _selectedService!,
            subCategoryLabel: 'Caretaker / Attendant',
            extraParams: {
              'caretaker_duration': _duration,
              'gender': _gender,
              'experience': _experience,
            },
          ))),
      style: ElevatedButton.styleFrom(
        backgroundColor: _navy, foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: const Text('Continue – Enter Patient Details',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
    ),
  );
}
