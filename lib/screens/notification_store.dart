// lib/screens/notification_store.dart

import 'package:flutter/material.dart';

// ── ValueNotifier so notification screen auto-rebuilds ──
final notificationNotifier = ValueNotifier<int>(0);

class NotificationStore {
  static List<Map<String, dynamic>> todayNotifs = [
    {
      'icon':      Icons.local_hospital_rounded,
      'iconBg':    const Color(0xFFFFE4E6),
      'iconColor': const Color(0xFFE11D48),
      'title':     'Your appointment has been confirmed',
      'subtitle':  'Dr. Ramesh Kumar – Cardiology dept is ready for you today.',
      'time':      '01:25 PM',
      'unread':    true,
    },
    {
      'icon':      Icons.shopping_bag_rounded,
      'iconBg':    const Color(0xFFE0F2FE),
      'iconColor': const Color(0xFF0284C7),
      'title':     'Your order has been shipped!',
      'subtitle':  'Bajaj Finserve EMI card, order ID #23450ER23w is on the way.',
      'time':      '11:40 AM',
      'unread':    true,
    },
    {
      'icon':      Icons.verified_rounded,
      'iconBg':    const Color(0xFFDCFCE7),
      'iconColor': const Color(0xFF16A34A),
      'title':     'Payment Successful',
      'subtitle':  'Rs.2,604.00 paid for Glucometer. Invoice sent to your email.',
      'time':      '09:35 AM',
      'unread':    false,
    },
    {
      'icon':      Icons.campaign_rounded,
      'iconBg':    const Color(0xFFFFF7CD),
      'iconColor': const Color(0xFFD97706),
      'title':     'New offer just for you!',
      'subtitle':  'Get 30% off on all mobility aids. Limited time deal.',
      'time':      '08:10 AM',
      'unread':    false,
    },
  ];

  static List<Map<String, dynamic>> thisWeekNotifs = [
    {
      'icon':      Icons.medication_rounded,
      'iconBg':    const Color(0xFFEDE9FE),
      'iconColor': const Color(0xFF7C3AED),
      'title':     'Medicine reminder',
      'subtitle':  'Time to take your prescribed medicines. Stay healthy!',
      'time':      'Mon 3:00 PM',
      'unread':    false,
    },
    {
      'icon':      Icons.receipt_long_rounded,
      'iconBg':    const Color(0xFFE0F2FE),
      'iconColor': const Color(0xFF0284C7),
      'title':     'Order delivered successfully',
      'subtitle':  'Your order #23450ER23w has been delivered. Rate your experience.',
      'time':      'Sun 11:00 AM',
      'unread':    false,
    },
    {
      'icon':      Icons.location_on_rounded,
      'iconBg':    const Color(0xFFFFE4E6),
      'iconColor': const Color(0xFFE11D48),
      'title':     'Nearby hospital alert',
      'subtitle':  'Apollo Hospital is 2km away and accepting new patients today.',
      'time':      'Sat 09:00 AM',
      'unread':    false,
    },
    {
      'icon':      Icons.card_giftcard_rounded,
      'iconBg':    const Color(0xFFFFF7CD),
      'iconColor': const Color(0xFFD97706),
      'title':     'You earned 50 reward points!',
      'subtitle':  'Keep shopping to unlock exclusive health benefits.',
      'time':      'Fri 05:30 PM',
      'unread':    false,
    },
  ];

  // ── Call this after adding any notification ──
  static void addToday(Map<String, dynamic> notif) {
    todayNotifs.insert(0, notif);
    notificationNotifier.value++;
  }
}