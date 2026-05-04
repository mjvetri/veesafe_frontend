// lib/models/healthcare_models.dart
// ─────────────────────────────────────────────────────────────────────────────
// Home Healthcare Models
// Follows the same pattern as rental_model.dart / order_model.dart
// DO NOT modify existing models. This is a pure extension.
// ─────────────────────────────────────────────────────────────────────────────

// ── Enums ────────────────────────────────────────────────────────────────────

enum HealthcareSubCategory { nursingCare, caretaker }

enum NursingCareType {
  basicNursing,
  postSurgeryNursing,
  icuCriticalCare,
  seniorCitizenNursing,
}

enum CaretakerType {
  seniorCitizenCare,
  patientCareAttendant,
  postSurgeryAttendant,
  disabilitySupport,
}

enum NursingDuration { hourly, twelveHours, twentyFourHours }

enum CaretakerDuration { eightHours, twelveHours, twentyFourHours }

enum NursingSkillLevel { basic, certified, icuTrained }

enum CaretakerGender { male, female }

enum CaretakerExperience { fresher, experienced }

// ── Tags (for dynamic filtering) ─────────────────────────────────────────────

enum HealthcareTag {
  seniorCitizen,
  postSurgery,
  criticalCare,
  dailyAssistance,
  adult,
  child,
  elderly,
  shortTerm,
  longTerm,
  disability,
}

// ── Service Definition (category-based, tag-driven, expandable) ──────────────

class HealthcareServiceDef {
  final String id;
  final String title;
  final String subtitle;
  final HealthcareSubCategory subCategory;
  final List<HealthcareTag> tags;
  final bool isHighPriority;

  const HealthcareServiceDef({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.subCategory,
    required this.tags,
    this.isHighPriority = false,
  });
}

// ── Nursing Care Service Definitions ─────────────────────────────────────────

const List<HealthcareServiceDef> nursingCareServices = [
  HealthcareServiceDef(
    id: 'nursing_senior',
    title: 'Senior Citizen Nursing',
    subtitle: 'Specialised nursing for elderly patients at home',
    subCategory: HealthcareSubCategory.nursingCare,
    tags: [HealthcareTag.seniorCitizen, HealthcareTag.elderly, HealthcareTag.longTerm],
    isHighPriority: true,
  ),
  HealthcareServiceDef(
    id: 'nursing_basic',
    title: 'Basic Nursing Care',
    subtitle: 'Wound dressing, vitals monitoring, medication support',
    subCategory: HealthcareSubCategory.nursingCare,
    tags: [HealthcareTag.adult, HealthcareTag.shortTerm, HealthcareTag.dailyAssistance],
  ),
  HealthcareServiceDef(
    id: 'nursing_post_surgery',
    title: 'Post-Surgery Nursing',
    subtitle: 'Post-operative care & recovery monitoring',
    subCategory: HealthcareSubCategory.nursingCare,
    tags: [HealthcareTag.postSurgery, HealthcareTag.adult, HealthcareTag.shortTerm],
  ),
  HealthcareServiceDef(
    id: 'nursing_icu',
    title: 'ICU / Critical Care Nursing',
    subtitle: 'Advanced nursing for critical & ICU-discharge patients',
    subCategory: HealthcareSubCategory.nursingCare,
    tags: [HealthcareTag.criticalCare, HealthcareTag.adult, HealthcareTag.shortTerm],
  ),
];

// ── Caretaker Service Definitions ─────────────────────────────────────────────

const List<HealthcareServiceDef> caretakerServices = [
  HealthcareServiceDef(
    id: 'caretaker_senior',
    title: 'Senior Citizen Care',
    subtitle: 'Full-time elderly companion & daily assistance',
    subCategory: HealthcareSubCategory.caretaker,
    tags: [HealthcareTag.seniorCitizen, HealthcareTag.elderly, HealthcareTag.dailyAssistance, HealthcareTag.longTerm],
    isHighPriority: true,
  ),
  HealthcareServiceDef(
    id: 'caretaker_patient',
    title: 'Patient Care Attendant',
    subtitle: 'Bedside assistance & personal care for patients',
    subCategory: HealthcareSubCategory.caretaker,
    tags: [HealthcareTag.adult, HealthcareTag.dailyAssistance, HealthcareTag.shortTerm],
  ),
  HealthcareServiceDef(
    id: 'caretaker_post_surgery',
    title: 'Post-Surgery Attendant',
    subtitle: 'Recovery assistance after surgery',
    subCategory: HealthcareSubCategory.caretaker,
    tags: [HealthcareTag.postSurgery, HealthcareTag.adult, HealthcareTag.shortTerm],
  ),
  HealthcareServiceDef(
    id: 'caretaker_disability',
    title: 'Disability Support',
    subtitle: 'Specialised care for differently-abled individuals',
    subCategory: HealthcareSubCategory.caretaker,
    tags: [HealthcareTag.disability, HealthcareTag.adult, HealthcareTag.longTerm],
  ),
];

// ── Booking Model (mirrors order system pattern) ──────────────────────────────

class HealthcareBooking {
  final String bookingId;
  final String main;          // "Home Healthcare Services"
  final String sub;           // "Nursing Care" / "Caretaker"
  final String inner;         // e.g. "Senior Citizen Nursing"
  final String serviceId;     // maps to HealthcareServiceDef.id
  final List<HealthcareTag> tags;

  // Nursing-specific
  final NursingDuration? nursingDuration;
  final NursingSkillLevel? nursingSkill;

  // Caretaker-specific
  final CaretakerDuration? caretakerDuration;
  final CaretakerGender? gender;
  final CaretakerExperience? experience;

  // Common booking fields
  final DateTime scheduledDate;
  final String patientName;
  final String patientAge;
  final String patientCondition;
  final String address;
  final String contactNumber;
  final String useCase;         // e.g. "Elderly", "Post Surgery"

  final HealthcareBookingStatus status;
  final DateTime createdAt;

  const HealthcareBooking({
    required this.bookingId,
    required this.main,
    required this.sub,
    required this.inner,
    required this.serviceId,
    required this.tags,
    this.nursingDuration,
    this.nursingSkill,
    this.caretakerDuration,
    this.gender,
    this.experience,
    required this.scheduledDate,
    required this.patientName,
    required this.patientAge,
    required this.patientCondition,
    required this.address,
    required this.contactNumber,
    required this.useCase,
    this.status = HealthcareBookingStatus.pending,
    required this.createdAt,
  });

  // toJson - matches the structure shown in the requirement spec
  Map<String, dynamic> toJson() => {
    'booking_id': bookingId,
    'main': main,
    'sub': sub,
    'inner': inner,
    'service_id': serviceId,
    'tags': tags.map((t) => t.name).toList(),
    if (nursingDuration != null) 'duration': _nursingDurationLabel(nursingDuration!),
    if (nursingSkill != null) 'skill': _skillLabel(nursingSkill!),
    if (caretakerDuration != null) 'duration': _caretakerDurationLabel(caretakerDuration!),
    if (gender != null) 'gender': gender!.name,
    if (experience != null) 'experience': _experienceLabel(experience!),
    'scheduled_date': scheduledDate.toIso8601String(),
    'patient_name': patientName,
    'patient_age': patientAge,
    'patient_condition': patientCondition,
    'address': address,
    'contact_number': contactNumber,
    'use_case': useCase,
    'status': status.name,
    'created_at': createdAt.toIso8601String(),
  };
}

enum HealthcareBookingStatus { pending, confirmed, inProgress, completed, cancelled }

// ── Label helpers ─────────────────────────────────────────────────────────────

String nursingDurationLabel(NursingDuration d) => _nursingDurationLabel(d);
String _nursingDurationLabel(NursingDuration d) {
  switch (d) {
    case NursingDuration.hourly:           return 'Hourly';
    case NursingDuration.twelveHours:      return '12 Hours';
    case NursingDuration.twentyFourHours:  return '24 Hours';
  }
}

String caretakerDurationLabel(CaretakerDuration d) => _caretakerDurationLabel(d);
String _caretakerDurationLabel(CaretakerDuration d) {
  switch (d) {
    case CaretakerDuration.eightHours:      return '8 Hours';
    case CaretakerDuration.twelveHours:     return '12 Hours';
    case CaretakerDuration.twentyFourHours: return '24 Hours';
  }
}

String skillLabel(NursingSkillLevel s) => _skillLabel(s);
String _skillLabel(NursingSkillLevel s) {
  switch (s) {
    case NursingSkillLevel.basic:      return 'Basic';
    case NursingSkillLevel.certified:  return 'Certified';
    case NursingSkillLevel.icuTrained: return 'ICU-Trained';
  }
}

String experienceLabel(CaretakerExperience e) => _experienceLabel(e);
String _experienceLabel(CaretakerExperience e) {
  switch (e) {
    case CaretakerExperience.fresher:    return 'Fresher';
    case CaretakerExperience.experienced: return 'Experienced';
  }
}

String tagLabel(HealthcareTag t) {
  switch (t) {
    case HealthcareTag.seniorCitizen:  return 'Senior Citizen';
    case HealthcareTag.postSurgery:    return 'Post Surgery';
    case HealthcareTag.criticalCare:   return 'Critical Care';
    case HealthcareTag.dailyAssistance: return 'Daily Assistance';
    case HealthcareTag.adult:          return 'Adult';
    case HealthcareTag.child:          return 'Child';
    case HealthcareTag.elderly:        return 'Elderly';
    case HealthcareTag.shortTerm:      return 'Short-term';
    case HealthcareTag.longTerm:       return 'Long-term';
    case HealthcareTag.disability:     return 'Disability';
  }
}

String bookingStatusLabel(HealthcareBookingStatus s) {
  switch (s) {
    case HealthcareBookingStatus.pending:    return 'Pending';
    case HealthcareBookingStatus.confirmed:  return 'Confirmed';
    case HealthcareBookingStatus.inProgress: return 'In Progress';
    case HealthcareBookingStatus.completed:  return 'Completed';
    case HealthcareBookingStatus.cancelled:  return 'Cancelled';
  }
}
