// // lib/screens/notification_setting_screen.dart

// import 'package:flutter/material.dart';
// import '../constants/app_colors.dart';

// class NotificationSettingScreen extends StatefulWidget {
//   const NotificationSettingScreen({super.key});

//   @override
//   State<NotificationSettingScreen> createState() =>
//       _NotificationSettingScreenState();
// }

// class _NotificationSettingScreenState
//     extends State<NotificationSettingScreen> {
//   // Selected channels
//   final Set<String> _selected = {'WhatsApp'};

//   final List<Map<String, dynamic>> _channels = [
//     {'name': 'WhatsApp', 'icon': Icons.chat_rounded,          'color': Color(0xFF25D366)},
//     {'name': 'Email',    'icon': Icons.email_rounded,      'color': Color(0xFFEA4335)},
//     {'name': 'SMS',      'icon': Icons.sms_rounded,        'color': Color(0xFF0A1F5C)},
//     {'name': 'Instagram','icon': Icons.camera_alt_rounded, 'color': Color(0xFFE1306C)},
//     {'name': 'Facebook', 'icon': Icons.thumb_up_rounded,   'color': Color(0xFF1877F2)},
//     {'name': 'Telegram', 'icon': Icons.send_rounded,       'color': Color(0xFF0088CC)},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             _appBar(context),
//             Expanded(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 30),
//                     _headerSection(),
//                     const SizedBox(height: 28),
//                     _channelGrid(),
//                     const SizedBox(height: 32),
//                     _continueButton(context),
//                     const SizedBox(height: 14),
//                     _cancelButton(context),
//                     const SizedBox(height: 28),
//                   ],
//                 ),
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
//         color: kBlue,
//         padding: const EdgeInsets.fromLTRB(4, 6, 14, 10),
//         child: Row(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.arrow_back_ios,
//                   size: 18, color: Colors.white),
//               onPressed: () => Navigator.pop(context),
//             ),
//             const Expanded(
//               child: Center(
//                 child: Text(
//                   'Notification Setting',
//                   style: TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w800,
//                       color: Colors.white),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 48),
//           ],
//         ),
//       );

//   // ════════════════════════════════════════
//   //  HEADER — icon + title + subtitle
//   // ════════════════════════════════════════
//   Widget _headerSection() => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24),
//         child: Column(
//           children: [
//             // Animated bell icon container
//             Container(
//               width: 72,
//               height: 72,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [kBlue, const Color(0xFF1A73E8)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     color: kBlue.withOpacity(0.35),
//                     blurRadius: 20,
//                     offset: const Offset(0, 8),
//                   ),
//                 ],
//               ),
//               child: const Icon(
//                 Icons.notifications_active_rounded,
//                 color: Colors.white,
//                 size: 34,
//               ),
//             ),
//             const SizedBox(height: 18),
//             const Text(
//               'Notification Setting',
//               style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w900,
//                   color: kBlack),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               'Please confirm that you accept receiving\nnotifications in the following ways',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 13,
//                   color: kGrey,
//                   height: 1.5),
//             ),
//           ],
//         ),
//       );

//   // ════════════════════════════════════════
//   //  CHANNEL GRID — 3 columns, selectable cards
//   // ════════════════════════════════════════
//   Widget _channelGrid() => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: GridView.builder(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             crossAxisSpacing: 14,
//             mainAxisSpacing: 14,
//             childAspectRatio: 1.0,
//           ),
//           itemCount: _channels.length,
//           itemBuilder: (_, i) {
//             final ch = _channels[i];
//             final isSelected = _selected.contains(ch['name']);
//             return GestureDetector(
//               onTap: () {
//                 setState(() {
//                   if (isSelected) {
//                     _selected.remove(ch['name']);
//                   } else {
//                     _selected.add(ch['name'] as String);
//                   }
//                 });
//               },
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 200),
//                 decoration: BoxDecoration(
//                   color: isSelected
//                       ? (ch['color'] as Color).withOpacity(0.08)
//                       : Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   border: Border.all(
//                     color: isSelected
//                         ? (ch['color'] as Color)
//                         : kBorderGrey,
//                     width: isSelected ? 2 : 1,
//                   ),
//                   boxShadow: isSelected
//                       ? [
//                           BoxShadow(
//                             color: (ch['color'] as Color).withOpacity(0.15),
//                             blurRadius: 10,
//                             offset: const Offset(0, 4),
//                           )
//                         ]
//                       : [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.05),
//                             blurRadius: 6,
//                             offset: const Offset(0, 2),
//                           )
//                         ],
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Icon with color
//                     Container(
//                       width: 42,
//                       height: 42,
//                       decoration: BoxDecoration(
//                         color: (ch['color'] as Color).withOpacity(0.12),
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         ch['icon'] as IconData,
//                         color: ch['color'] as Color,
//                         size: 22,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       ch['name'] as String,
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                         color: isSelected
//                             ? (ch['color'] as Color)
//                             : kBlack,
//                       ),
//                     ),
//                     // Selected checkmark
//                     if (isSelected) ...[
//                       const SizedBox(height: 4),
//                       Icon(
//                         Icons.check_circle_rounded,
//                         color: ch['color'] as Color,
//                         size: 14,
//                       ),
//                     ],
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       );

//   // ════════════════════════════════════════
//   //  CONTINUE BUTTON
//   // ════════════════════════════════════════
//   Widget _continueButton(BuildContext context) => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24),
//         child: GestureDetector(
//           onTap: () {
//             if (_selected.isEmpty) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text('Please select at least one channel'),
//                   backgroundColor: kBlue,
//                 ),
//               );
//               return;
//             }
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(
//                     'Notifications enabled for: ${_selected.join(', ')}'),
//                 backgroundColor: kBlue,
//               ),
//             );
//             Navigator.pop(context);
//           },
//           child: Container(
//             height: 50,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               color: kBlue,
//               borderRadius: BorderRadius.circular(14),
//               boxShadow: [
//                 BoxShadow(
//                   color: kBlue.withOpacity(0.35),
//                   blurRadius: 12,
//                   offset: const Offset(0, 5),
//                 ),
//               ],
//             ),
//             child: const Center(
//               child: Text(
//                 'Continue',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w700),
//               ),
//             ),
//           ),
//         ),
//       );

//   // ════════════════════════════════════════
//   //  CANCEL BUTTON
//   // ════════════════════════════════════════
//   Widget _cancelButton(BuildContext context) => GestureDetector(
//         onTap: () => Navigator.pop(context),
//         child: const Text(
//           'Cancel',
//           style: TextStyle(
//               fontSize: 14,
//               color: kGrey,
//               fontWeight: FontWeight.w500),
//         ),
//       );
// }










// lib/screens/notification_setting_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../constants/app_colors.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState
    extends State<NotificationSettingScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  // ── Static variables — persist across sessions ──
  static final Set<String> _selectedChannels = {'WhatsApp', 'Email'};
  static bool _pushEnabled      = true;
  static bool _emailEnabled     = true;
  static bool _soundEnabled     = true;
  static bool _vibrationEnabled = false;
  static bool _doNotDisturb     = false;

  final List<Map<String, dynamic>> _channels = [
    {'name': 'WhatsApp', 'icon': Icons.chat_rounded,             'color': Color(0xFF25D366), 'bg': Color(0xFFECFDF5)},
    {'name': 'Email',    'icon': Icons.email_rounded,            'color': Color(0xFFEA4335), 'bg': Color(0xFFFEF2F2)},
    {'name': 'SMS',      'icon': Icons.sms_rounded,              'color': Color(0xFF113A7A), 'bg': Color(0xFFEFF6FF)},
    {'name': 'Instagram','icon': Icons.camera_alt_rounded,       'color': Color(0xFFE1306C), 'bg': Color(0xFFFFF0F5)},
    {'name': 'Facebook', 'icon': Icons.thumb_up_alt_rounded,     'color': Color(0xFF1877F2), 'bg': Color(0xFFEFF6FF)},
    {'name': 'Telegram', 'icon': Icons.near_me_rounded,          'color': Color(0xFF0088CC), 'bg': Color(0xFFE8F4FD)},
  ];

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnim = CurvedAnimation(
        parent: _animController, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: _animController, curve: Curves.easeOut));
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
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
              child: FadeTransition(
                opacity: _fadeAnim,
                child: SlideTransition(
                  position: _slideAnim,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        _heroHeader(),
                        const SizedBox(height: 24),
                        _sectionTitle('Notification Channels'),
                        const SizedBox(height: 12),
                        _channelGrid(),
                        const SizedBox(height: 24),
                        _sectionTitle('Preferences'),
                        const SizedBox(height: 12),
                        _preferencesCard(),
                        const SizedBox(height: 24),
                        _sectionTitle('Do Not Disturb'),
                        const SizedBox(height: 12),
                        _dndCard(),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
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
              onPressed: () => Navigator.pop(context),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'Notification Settings',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 0.3),
                ),
              ),
            ),
            // ── Save button top right ──
            GestureDetector(
              onTap: () {
                if (_selectedChannels.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Please select at least one channel'),
                      backgroundColor: kBlue,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  );
                  return;
                }
                // ── Return saved settings to previous screen ──
                Navigator.pop(context, {
                  'channels': _selectedChannels.toList(),
                  'push': _pushEnabled,
                  'email': _emailEnabled,
                  'sound': _soundEnabled,
                  'vibration': _vibrationEnabled,
                  'dnd': _doNotDisturb,
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        '✅ Saved! Active: ${_selectedChannels.join(', ')}'),
                    backgroundColor: const Color(0xFF16A34A),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      );

  // ════════════════════════════════════════
  //  HERO HEADER — gradient card
  // ════════════════════════════════════════
  Widget _heroHeader() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [kBlue, Color(0xFF1A73E8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: kBlue.withOpacity(0.35),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              // Bell with ripple rings
              SizedBox(
                width: 70,
                height: 70,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer ring
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.white.withOpacity(0.2), width: 1.5),
                      ),
                    ),
                    // Middle ring
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.white.withOpacity(0.3), width: 1.5),
                      ),
                    ),
                    // Inner filled circle
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.notifications_active_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Stay Connected',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.2),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Choose how you want to receive your health updates & order alerts',
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          height: 1.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  // ════════════════════════════════════════
  //  SECTION TITLE
  // ════════════════════════════════════════
  Widget _sectionTitle(String title) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: kBlack,
              letterSpacing: 0.2),
        ),
      );

  // ════════════════════════════════════════
  //  CHANNEL GRID — 3 cols, animated selection
  // ════════════════════════════════════════
  Widget _channelGrid() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.4,
          ),
          itemCount: _channels.length,
          itemBuilder: (_, i) {
            final ch = _channels[i];
            final isSel = _selectedChannels.contains(ch['name']);
            return GestureDetector(
              onTap: () => setState(() => isSel
                  ? _selectedChannels.remove(ch['name'])
                  : _selectedChannels.add(ch['name'] as String)),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: isSel
                      ? (ch['color'] as Color).withOpacity(0.10)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: isSel
                        ? (ch['color'] as Color)
                        : const Color(0xFFE5E7EB),
                    width: isSel ? 2 : 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isSel
                          ? (ch['color'] as Color).withOpacity(0.18)
                          : Colors.black.withOpacity(0.05),
                      blurRadius: isSel ? 14 : 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon circle
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: isSel
                            ? (ch['color'] as Color).withOpacity(0.15)
                            : (ch['bg'] as Color),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        ch['icon'] as IconData,
                        color: ch['color'] as Color,
                        size: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      ch['name'] as String,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: isSel
                            ? (ch['color'] as Color)
                            : kBlack,
                      ),
                    ),
                    const SizedBox(height: 3),
                    // Checkmark or dot indicator
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: isSel
                          ? Icon(
                              Icons.check_circle_rounded,
                              key: const ValueKey('check'),
                              color: ch['color'] as Color,
                              size: 13,
                            )
                          : const SizedBox(height: 13, key: ValueKey('empty')),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );

  // ════════════════════════════════════════
  //  PREFERENCES CARD — toggle switches
  // ════════════════════════════════════════
  Widget _preferencesCard() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              _toggleRow(
                icon: Icons.notifications_rounded,
                iconColor: kBlue,
                iconBg: kBlueLite,
                label: 'Push Notifications',
                subtitle: 'Receive alerts on your device',
                value: _pushEnabled,
                onChanged: (v) => setState(() => _pushEnabled = v),
                isFirst: true,
              ),
              _tileDivider(),
              _toggleRow(
                icon: Icons.email_rounded,
                iconColor: const Color(0xFFEA4335),
                iconBg: const Color(0xFFFEF2F2),
                label: 'Email Notifications',
                subtitle: 'Get updates in your inbox',
                value: _emailEnabled,
                onChanged: (v) => setState(() => _emailEnabled = v),
              ),
              _tileDivider(),
              _toggleRow(
                icon: Icons.volume_up_rounded,
                iconColor: const Color(0xFF16A34A),
                iconBg: const Color(0xFFDCFCE7),
                label: 'Sound',
                subtitle: 'Play sound for notifications',
                value: _soundEnabled,
                onChanged: (v) => setState(() => _soundEnabled = v),
              ),
              _tileDivider(),
              _toggleRow(
                icon: Icons.vibration_rounded,
                iconColor: const Color(0xFF7C3AED),
                iconBg: const Color(0xFFEDE9FE),
                label: 'Vibration',
                subtitle: 'Vibrate on new notifications',
                value: _vibrationEnabled,
                onChanged: (v) => setState(() => _vibrationEnabled = v),
                isLast: true,
              ),
            ],
          ),
        ),
      );

  // ════════════════════════════════════════
  //  DO NOT DISTURB CARD
  // ════════════════════════════════════════
  Widget _dndCard() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: _toggleRow(
            icon: Icons.do_not_disturb_on_rounded,
            iconColor: const Color(0xFFDC2626),
            iconBg: const Color(0xFFFEE2E2),
            label: 'Do Not Disturb',
            subtitle: 'Silence all notifications',
            value: _doNotDisturb,
            onChanged: (v) => setState(() => _doNotDisturb = v),
            isFirst: true,
            isLast: true,
          ),
        ),
      );

  // ── Toggle row helper ──
  Widget _toggleRow({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String label,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool isFirst = false,
    bool isLast = false,
  }) =>
      Padding(
        padding: EdgeInsets.fromLTRB(
            16, isFirst ? 14 : 10, 16, isLast ? 14 : 10),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w700,
                          color: kBlack)),
                  const SizedBox(height: 2),
                  Text(subtitle,
                      style: const TextStyle(
                          fontSize: 11.5, color: kGrey)),
                ],
              ),
            ),
            CupertinoSwitch(
              value: value,
              onChanged: onChanged,
              activeTrackColor: kBlue,
            ),
          ],
        ),
      );

  Widget _tileDivider() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Divider(color: kBorderGrey, thickness: 1, height: 1),
      );

  // ════════════════════════════════════════
  //  SAVE BUTTON
  // ════════════════════════════════════════
  Widget _saveButton(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GestureDetector(
          onTap: () {
            if (_selectedChannels.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Please select at least one channel'),
                  backgroundColor: kBlue,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              );
              return;
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    '✅ Saved! Active: ${_selectedChannels.join(', ')}'),
                backgroundColor: const Color(0xFF16A34A),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            );
            Navigator.pop(context);
          },
          child: Container(
            height: 52,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [kBlue, Color(0xFF1A73E8)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: kBlue.withOpacity(0.4),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_rounded, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text(
                  'Save Settings',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.3),
                ),
              ],
            ),
          ),
        ),
      );

  // ════════════════════════════════════════
  //  CANCEL BUTTON
  // ════════════════════════════════════════
  Widget _cancelButton(BuildContext context) => Center(
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(
                fontSize: 14,
                color: kGrey,
                fontWeight: FontWeight.w500),
          ),
        ),
      );
}