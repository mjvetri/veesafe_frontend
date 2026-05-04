// lib/screens/notification_screen.dart

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'notification_setting_screen.dart';
import 'notification_store.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with WidgetsBindingObserver {

  String _searchQuery = '';

  List<Map<String, dynamic>> get _todayNotifs => NotificationStore.todayNotifs;
  List<Map<String, dynamic>> get _thisWeekNotifs => NotificationStore.thisWeekNotifs;

  List<Map<String, dynamic>> get _filteredToday => _searchQuery.isEmpty
      ? _todayNotifs
      : _todayNotifs.where((n) =>
          (n['title'] as String).toLowerCase().contains(_searchQuery.toLowerCase()) ||
          (n['subtitle'] as String).toLowerCase().contains(_searchQuery.toLowerCase())).toList();

  List<Map<String, dynamic>> get _filteredThisWeek => _searchQuery.isEmpty
      ? _thisWeekNotifs
      : _thisWeekNotifs.where((n) =>
          (n['title'] as String).toLowerCase().contains(_searchQuery.toLowerCase()) ||
          (n['subtitle'] as String).toLowerCase().contains(_searchQuery.toLowerCase())).toList();

  int get _unreadCount => _todayNotifs.where((n) => n['unread'] == true).length;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: notificationNotifier,
      builder: (context, _, _) => Scaffold(
        backgroundColor: const Color(0xFFF5F7FA),
        body: SafeArea(
          child: Column(
            children: [
              _appBar(context),
              Expanded(
                child: _notificationsTab(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ════════════════════════════════════════
  //  APP BAR
  // ════════════════════════════════════════
  Widget _appBar(BuildContext context) => Container(
        color: AppColors.kBlue,
        padding: const EdgeInsets.fromLTRB(4, 6, 14, 10),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  if (_unreadCount > 0) ...[
                    const SizedBox(width: 6),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE11D48),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '$_unreadCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationSettingScreen()),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Icon(Icons.tune_rounded, color: Colors.white, size: 22),
              ),
            ),
          ],
        ),
      );

  // ════════════════════════════════════════
  //  NOTIFICATIONS LIST
  // ════════════════════════════════════════
  Widget _notificationsTab() => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 14),
            _searchBar(),
            const SizedBox(height: 14),
            if (_filteredToday.isNotEmpty) ...[
              _sectionLabel('Today'),
              const SizedBox(height: 8),
              ..._filteredToday.map((n) => _notifCard(n, context)),
            ],
            if (_filteredThisWeek.isNotEmpty) ...[
              const SizedBox(height: 8),
              _sectionLabel('This week'),
              const SizedBox(height: 8),
              ..._filteredThisWeek.map((n) => _notifCard(n, context)),
            ],
            if (_filteredToday.isEmpty && _filteredThisWeek.isEmpty)
              _emptyState(
                'No notifications found',
                'Try a different search keyword',
                Icons.notifications_off_rounded,
              ),
            const SizedBox(height: 28),
          ],
        ),
      );

  // ════════════════════════════════════════
  //  SEARCH BAR
  // ════════════════════════════════════════
  Widget _searchBar() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 46,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 14),
              const Icon(Icons.search_rounded, color: AppColors.kGrey, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  onChanged: (v) => setState(() => _searchQuery = v),
                  style: const TextStyle(fontSize: 13, color: AppColors.kBlack),
                  decoration: const InputDecoration(
                    hintText: 'Search notifications...',
                    hintStyle: TextStyle(color: AppColors.kGrey, fontSize: 13),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              if (_searchQuery.isNotEmpty)
                GestureDetector(
                  onTap: () => setState(() => _searchQuery = ''),
                  child: const Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(Icons.close_rounded, color: AppColors.kGrey, size: 18),
                  ),
                ),
            ],
          ),
        ),
      );

  // ════════════════════════════════════════
  //  SECTION LABEL
  // ════════════════════════════════════════
  Widget _sectionLabel(String label) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColors.kGrey,
            letterSpacing: 0.3,
          ),
        ),
      );

  // ════════════════════════════════════════
  //  NOTIFICATION CARD
  // ════════════════════════════════════════
  Widget _notifCard(Map<String, dynamic> n, BuildContext context) =>
      GestureDetector(
        onTap: () {
          setState(() => n['unread'] = false);
          showDialog(
            context: context,
            builder: (_) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Message',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: AppColors.kBlue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${n['subtitle']}\n\n${n['subtitle']} ${n['subtitle']}',
                      style: const TextStyle(
                        fontSize: 13.5,
                        color: AppColors.kGrey,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          'Close',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.kBlue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 6, 16, 0),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: n['unread'] == true
                ? Colors.white
                : Colors.white.withOpacity(0.85),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: n['unread'] == true
                  ? AppColors.kBlue.withOpacity(0.15)
                  : AppColors.kBorderGrey,
            ),
            boxShadow: [
              BoxShadow(
                color: n['unread'] == true
                    ? AppColors.kBlue.withOpacity(0.08)
                    : Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: n['iconBg'] as Color,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(
                  n['icon'] as IconData,
                  color: n['iconColor'] as Color,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            n['title'] as String,
                            style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: n['unread'] == true
                                  ? FontWeight.w700
                                  : FontWeight.w600,
                              color: AppColors.kBlack,
                              height: 1.3,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          n['time'] as String,
                          style: const TextStyle(fontSize: 10.5, color: AppColors.kGrey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      n['subtitle'] as String,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.kGrey,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              if (n['unread'] == true)
                Container(
                  margin: const EdgeInsets.only(left: 6, top: 2),
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE11D48),
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      );

  // ════════════════════════════════════════
  //  EMPTY STATE
  // ════════════════════════════════════════
  Widget _emptyState(String title, String subtitle, IconData icon) => Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: AppColors.kBlueLite,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: AppColors.kBlue, size: 32),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.kBlack,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12, color: AppColors.kGrey),
              ),
            ],
          ),
        ),
      );
}