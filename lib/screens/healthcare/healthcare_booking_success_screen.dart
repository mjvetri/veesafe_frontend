import 'package:flutter/material.dart';
import '../../models/healthcare_models.dart';

class HealthcareBookingSuccessScreen extends StatelessWidget {
  final HealthcareBooking booking;
  final String bookingId;

  const HealthcareBookingSuccessScreen({
    super.key,
    required this.booking,
    required this.bookingId,
  });

  static const Color _navy = Color(0xFF1A2B5E);
  static const Color _dark = Color(0xFF1A2340);
  static const Color _grey = Color(0xFF8A94A6);
  static const Color _green = Color(0xFF2E7D32);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              _successIcon(),
              const SizedBox(height: 24),
              const Text('Booking Confirmed!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF1A2340)),
                  textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Text('Your ${booking.inner} is confirmed.\nOur team will contact you shortly.',
                  style: const TextStyle(fontSize: 13.5, color: Color(0xFF8A94A6), height: 1.5),
                  textAlign: TextAlign.center),
              const SizedBox(height: 28),
              _bookingCard(),
              const SizedBox(height: 28),
              _primaryBtn(context),
              const SizedBox(height: 12),
              _secondaryBtn(context),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _successIcon() => Container(
    width: 80, height: 80,
    decoration: BoxDecoration(
      color: const Color(0xFFE8F5E9),
      shape: BoxShape.circle,
      boxShadow: [BoxShadow(color: _green.withOpacity(0.2), blurRadius: 20, offset: const Offset(0, 6))],
    ),
    child: Icon(Icons.check_rounded, size: 44, color: _green),
  );

  Widget _bookingCard() => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 3))],
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _row(Icons.confirmation_number_outlined, 'Booking ID', bookingId),
      const Divider(height: 20),
      _row(Icons.medical_services_outlined, 'Service', booking.inner),
      const SizedBox(height: 10),
      _row(Icons.category_outlined, 'Type', '${booking.main} › ${booking.sub}'),
      const SizedBox(height: 10),
      _row(Icons.person_outline_rounded, 'Patient', '${booking.patientName}, ${booking.patientAge} yrs'),
      const SizedBox(height: 10),
      _row(Icons.calendar_today_outlined, 'Scheduled Date',
          '${booking.scheduledDate.day}/${booking.scheduledDate.month}/${booking.scheduledDate.year}'),
      const SizedBox(height: 10),
      _row(Icons.location_on_outlined, 'Address', booking.address),
      const SizedBox(height: 10),
      _statusChip(),
    ]),
  );

  Widget _row(IconData icon, String label, String value) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, size: 16, color: _navy),
      const SizedBox(width: 8),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: const TextStyle(fontSize: 10.5, color: Color(0xFF8A94A6))),
        const SizedBox(height: 1),
        Text(value, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: Color(0xFF1A2340))),
      ])),
    ],
  );

  Widget _statusChip() => Row(children: [
    Icon(Icons.circle, size: 10, color: _green),
    const SizedBox(width: 6),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: const Color(0xFFE8F5E9), borderRadius: BorderRadius.circular(20)),
      child: Text(bookingStatusLabel(booking.status),
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: _green)),
    ),
  ]);

  Widget _primaryBtn(BuildContext context) => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
      style: ElevatedButton.styleFrom(
        backgroundColor: _navy, foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: const Text('Go to Home', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
    ),
  );

  Widget _secondaryBtn(BuildContext context) => SizedBox(
    width: double.infinity,
    child: OutlinedButton(
      onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: _navy, width: 1.5),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      child: Text('View My Bookings',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: _navy)),
    ),
  );
}
