import 'package:flutter/material.dart';
import '../../models/healthcare_models.dart';
import 'healthcare_booking_screen.dart';

class NursingCareScreen extends StatefulWidget {
  const NursingCareScreen({super.key});
  @override
  State<NursingCareScreen> createState() => _NursingCareScreenState();
}

class _NursingCareScreenState extends State<NursingCareScreen> {
  static const Color _navy = Color(0xFF1A2B5E);
  static const Color _dark = Color(0xFF1A2340);
  static const Color _grey = Color(0xFF8A94A6);
  static const Color _lite = Color(0xFFEEF3FB);

  HealthcareServiceDef? _selectedService;
  NursingDuration _duration = NursingDuration.twelveHours;
  NursingSkillLevel _skill  = NursingSkillLevel.basic;

  @override
  void initState() {
    super.initState();
    _selectedService = nursingCareServices.first;
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
        title: const Text('Nursing Care',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 17)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle('Select Nursing Type'),
            const SizedBox(height: 12),
            ...nursingCareServices.map((svc) => _serviceCard(svc)),
            const SizedBox(height: 20),
            _sectionTitle('Duration'),
            const SizedBox(height: 10),
            _durationRow(),
            const SizedBox(height: 20),
            _sectionTitle('Skill Level'),
            const SizedBox(height: 10),
            _skillRow(),
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
              color: sel ? _navy : const Color(0xFFE8F0FE),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.medical_services_rounded, size: 20, color: sel ? Colors.white : _navy),
          ),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Expanded(child: Text(svc.title,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: sel ? _navy : _dark))),
              if (svc.isHighPriority)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: BoxDecoration(color: const Color(0xFFFCE4EC), borderRadius: BorderRadius.circular(20)),
                  child: const Text('High Priority',
                      style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: Color(0xFFC62828))),
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
    children: NursingDuration.values.map((d) {
      final sel = _duration == d;
      return Expanded(child: GestureDetector(
        onTap: () => setState(() => _duration = d),
        child: Container(
          margin: EdgeInsets.only(right: d == NursingDuration.twentyFourHours ? 0 : 8),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: sel ? _navy : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: sel ? _navy : const Color(0xFFDDDDDD)),
          ),
          child: Column(children: [
            Icon(d == NursingDuration.hourly ? Icons.timelapse : Icons.access_time_filled_rounded,
                size: 18, color: sel ? Colors.white : _navy),
            const SizedBox(height: 4),
            Text(nursingDurationLabel(d), textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w700,
                    color: sel ? Colors.white : _dark)),
          ]),
        ),
      ));
    }).toList(),
  );

  Widget _skillRow() => Row(
    children: NursingSkillLevel.values.map((s) {
      final sel = _skill == s;
      return Expanded(child: GestureDetector(
        onTap: () => setState(() => _skill = s),
        child: Container(
          margin: EdgeInsets.only(right: s == NursingSkillLevel.icuTrained ? 0 : 8),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: sel ? _navy : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: sel ? _navy : const Color(0xFFDDDDDD)),
          ),
          child: Text(skillLabel(s), textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w700,
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
            subCategoryLabel: 'Nursing Care',
            extraParams: {'nursing_duration': _duration, 'nursing_skill': _skill},
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
