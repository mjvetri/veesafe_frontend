// // lib/screens/menu_screen.dart

// import 'package:flutter/material.dart';
// import 'package:veesafe/screens/message_store.dart';
// import 'package:veesafe/screens/notification_store.dart';
// import 'package:veesafe/screens/refer_and_earn_screen.dart';
// import '../constants/app_colors.dart';
// import 'legal_screen.dart';
// import 'notification_screen.dart';
// import 'edit_profile_screen.dart';
// import 'category_screen.dart';
// import 'search_screen.dart';
// import 'home_screen.dart';
// import 'your_orders_screen.dart';
// import 'auth/login_screen.dart';
// import 'message_store.dart';
// import 'screens/messages_screen.dart';

// class MenuScreen extends StatelessWidget {
//   const MenuScreen({super.key});

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
//                     _profileCard(),
//                     const SizedBox(height: 6),
//                     _primaryNav(context),
//                     _divider(),
//                     _accountNav(context),
//                     _divider(),
//                     _portalLinks(context),
//                     const SizedBox(height: 20),
//                     _logoutButton(context),
//                     const SizedBox(height: 16),
//                     _footer(),
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

//   Widget _appBar(BuildContext context) => Container(
//     color: kBlue,
//     padding: const EdgeInsets.fromLTRB(4, 6, 14, 0),
//     child: Row(
//       children: [
//         IconButton(
//           icon: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         const Spacer(),
//       ],
//     ),
//   );

//   Widget _profileCard() => Container(
//     width: double.infinity,
//     color: kBlue,
//     padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Stack(
//               alignment: Alignment.center,
//               children: [
//                 Container(
//                   width: 86,
//                   height: 86,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.white.withOpacity(0.15),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.white.withOpacity(0.25),
//                         blurRadius: 16,
//                         spreadRadius: 4,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   width: 80,
//                   height: 80,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.white.withOpacity(0.15),
//                     border: Border.all(
//                       color: const Color(0xFFE8C84A),
//                       width: 2,
//                     ),
//                   ),
//                   child: const Icon(
//                     Icons.local_hospital_rounded,
//                     color: Color(0xFFE8C84A),
//                     size: 42,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(width: 10),
//             RichText(
//               text: const TextSpan(
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w900,
//                   letterSpacing: 1.5,
//                   color: Colors.white,
//                 ),
//                 children: [
//                   TextSpan(text: 'VEES'),
//                   TextSpan(
//                     text: 'A',
//                     style: TextStyle(color: Color(0xFFE8C84A)),
//                   ),
//                   TextSpan(text: 'FE'),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 18),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.12),
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
//           ),
//           child: Row(
//             children: [
//               CircleAvatar(
//                 radius: 22,
//                 backgroundColor: Colors.white.withOpacity(0.25),
//                 child: const Text(
//                   'JD',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 12),
//               const Expanded(
//                 child: Text(
//                   'John Doe',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );

//   Widget _primaryNav(BuildContext context) => Column(
//     children: [
//       _menuTile(
//         context,
//         icon: Icons.home_rounded,
//         label: 'Home',
//         onTap: () => Navigator.pop(context),
//       ),
//       _menuTile(
//         context,
//         icon: Icons.grid_view_rounded,
//         label: 'Categories',
//         onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const CategoryScreen()),
//         ),
//       ),
//       _menuTile(
//         context,
//         icon: Icons.person_rounded,
//         label: 'Profile',
//         onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const EditProfileScreen()),
//         ),
//       ),
//     ],
//   );

//   Widget _accountNav(BuildContext context) => Column(
//     children: [
//       _menuTile(
//         context,
//         icon: Icons.payment_rounded,
//         label: 'Payment',
//         onTap: () {},
//       ),
//       // _menuTile(
//       //   context,
//       //   icon: Icons.chat_rounded,
//       //   label: 'Messages',
//       //   onTap: () => Navigator.push(
//       //     context,
//       //     MaterialPageRoute(builder: (_) => const NotificationScreen()),
//       //   ),
//       // ),

//       _menuTile(
//   context,
//   icon: Icons.chat_bubble_rounded,
//   label: 'Messages',
//   badge: '3',
//   onTap: () => Navigator.push(
//     context,
//     MaterialPageRoute(builder: (_) => const MessagesScreen()),
//   ),
// ),

//       _menuTile(
//         context,
//         icon: Icons.notifications_rounded,
//         label: 'Notification',
//         badge: '3',
//         onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const NotificationStore()),
//         ),
//       ),
//       _menuTile(
//         context,
//         icon: Icons.receipt_long_rounded,
//         label: 'Your Orders',
//         // onTap: YourOrdersScreen() {},
//         onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const YourOrdersScreen()),
//         ),
//       ),
//       /*_menuTile(
//         context,
//         icon: Icons.favorite_rounded,
//         label: 'Wishlist',
//         onTap: () {},
//       ),*/
//       _menuTile(
//         context,
//         icon: Icons.card_giftcard_rounded,
//         label: 'Refer and Earn',
//         onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const ReferAndEarnScreen()),
//         ),
//       ),
//       _menuTile(
//         context,
//         icon: Icons.account_balance_wallet_rounded,
//         label: 'Veesafe Wallet',
//         onTap: () {},
//       ),
//       _menuTile(
//         context,
//         icon: Icons.campaign_rounded,
//         label: 'Influencer Marketing',
//         onTap: () {},
//       ),
//       _menuTile(
//         context,
//         icon: Icons.gavel_rounded,
//         label: 'Legal',
//         onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => const LegalScreen()),
//         ),
//       ),
//     ],
//   );

//   Widget _portalLinks(BuildContext context) => Column(
//     children: [
//       _linkTile(context, label: 'Go to Supplier Hub', onTap: () {}),
//       _linkTile(context, label: 'Go to Supplier Hub', onTap: () {}),
//       _linkTile(context, label: 'Go to Supplier Hub', onTap: () {}),
//     ],
//   );

//   Widget _logoutButton(BuildContext context) => Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 40),
//     child: GestureDetector(
//       onTap: () {
//         showDialog(
//           context: context,
//           builder: (_) => AlertDialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             title: const Text(
//               'Log Out',
//               style: TextStyle(fontWeight: FontWeight.w800, color: kBlack),
//             ),
//             content: const Text(
//               'Are you sure you want to log out?',
//               style: TextStyle(color: kGrey),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text(
//                   'Cancel',
//                   style: TextStyle(color: kGrey, fontWeight: FontWeight.w600),
//                 ),
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: kBlue,
//                   foregroundColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.pop(context);
//                   Navigator.of(context).pushAndRemoveUntil(
//                     MaterialPageRoute(builder: (_) => const LoginScreen()),
//                     (route) => false,
//                   );
//                 },
//                 child: const Text(
//                   'Log Out',
//                   style: TextStyle(fontWeight: FontWeight.w700),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//       child: Container(
//         height: 46,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: kBlue,
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: const Center(
//           child: Text(
//             'Log Out',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 15,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );

//   Widget _footer() => const Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Text(
//         'Made in india',
//         style: TextStyle(
//           fontSize: 12,
//           color: kGrey,
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//     ],
//   );

//   Widget _menuTile(
//     BuildContext context, {
//     required IconData icon,
//     required String label,
//     required VoidCallback onTap,
//     String? badge,
//   }) => Material(
//     color: Colors.transparent,
//     child: InkWell(
//       onTap: onTap,
//       splashColor: kBlueLite,
//       highlightColor: kBlueLite,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
//           child: Row(
//             children: [
//               Container(
//                 width: 38,
//                 height: 38,
//                 decoration: BoxDecoration(
//                   color: kBlueLite,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Icon(icon, size: 20, color: kBlue),
//               ),
//               const SizedBox(width: 14),
//               Expanded(
//                 child: Text(
//                   label,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: kBlack,
//                   ),
//                 ),
//               ),
//               if (badge != null)
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 8,
//                     vertical: 2,
//                   ),
//                   decoration: BoxDecoration(
//                     color: kBlue,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     badge,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 11,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 )
//               else
//                 const Icon(Icons.chevron_right, size: 18, color: kBorderGrey),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );

//   Widget _linkTile(
//     BuildContext context, {
//     required String label,
//     required VoidCallback onTap,
//   }) => Material(
//     color: Colors.transparent,
//     child: InkWell(
//       onTap: onTap,
//       splashColor: kBlueLite,
//       highlightColor: kBlueLite,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 13),
//           decoration: const BoxDecoration(
//             border: Border(bottom: BorderSide(color: kBorderGrey, width: 0.8)),
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   label,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     color: kBlue,
//                   ),
//                 ),
//               ),
//               const Icon(Icons.chevron_right, size: 18, color: kBlue),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );

//   Widget _divider() => const Padding(
//     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//     child: Divider(color: kBorderGrey, thickness: 1, height: 1),
//   );
// }












// lib/screens/menu_screen.dart

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'legal_screen.dart';
import 'notification_screen.dart';
import 'edit_profile_screen.dart';
import 'category_screen.dart';
import 'your_orders_screen.dart';
import 'auth/login_screen.dart';
import 'refer_and_earn_screen.dart';
import 'messages_screen.dart';          // ← correct import (no 'screens/' prefix)
// ← keep for badge count only

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _appBar(context),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    _profileCard(),
                    const SizedBox(height: 6),
                    _primaryNav(context),
                    _divider(),
                    _accountNav(context),
                    _divider(),
                    _portalLinks(context),
                    const SizedBox(height: 20),
                    _logoutButton(context),
                    const SizedBox(height: 16),
                    _footer(),
                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) => Container(
    color: kBlue,
    padding: const EdgeInsets.fromLTRB(4, 6, 14, 0),
    child: Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        const Spacer(),
      ],
    ),
  );

  Widget _profileCard() => Container(
    width: double.infinity,
    color: kBlue,
    padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 86, height: 86,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.25),
                        blurRadius: 16, spreadRadius: 4,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 80, height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.15),
                    border: Border.all(color: const Color(0xFFE8C84A), width: 2),
                  ),
                  child: const Icon(Icons.local_hospital_rounded,
                      color: Color(0xFFE8C84A), size: 42),
                ),
              ],
            ),
            const SizedBox(width: 10),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w900,
                  letterSpacing: 1.5, color: Colors.white,
                ),
                children: [
                  TextSpan(text: 'VEES'),
                  TextSpan(text: 'A',
                      style: TextStyle(color: Color(0xFFE8C84A))),
                  TextSpan(text: 'FE'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white.withOpacity(0.25),
                child: const Text('JD',
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text('John Doe',
                    style: TextStyle(color: Colors.white,
                        fontSize: 14, fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _primaryNav(BuildContext context) => Column(
    children: [
      _menuTile(context,
          icon: Icons.home_rounded,
          label: 'Home',
          onTap: () => Navigator.pop(context)),
      _menuTile(context,
          icon: Icons.grid_view_rounded,
          label: 'Categories',
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const CategoryScreen()))),
      _menuTile(context,
          icon: Icons.person_rounded,
          label: 'Profile',
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const EditProfileScreen()))),
    ],
  );

  Widget _accountNav(BuildContext context) => Column(
    children: [
      _menuTile(context,
          icon: Icons.payment_rounded,
          label: 'Payment',
          onTap: () {}),

      // ── Messages → MessagesScreen ──
      _menuTile(context,
          icon: Icons.chat_bubble_rounded,
          label: 'Messages',
          badge: '3',
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const MessagesScreen()))),

      // ── Notifications → NotificationScreen ──
      _menuTile(context,
          icon: Icons.notifications_rounded,
          label: 'Notification',
          badge: '3',
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const NotificationScreen()))),  // ← was NotificationStore

      _menuTile(context,
          icon: Icons.receipt_long_rounded,
          label: 'Your Orders',
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const YourOrdersScreen()))),
      _menuTile(context,
          icon: Icons.card_giftcard_rounded,
          label: 'Refer and Earn',
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const ReferAndEarnScreen()))),
      _menuTile(context,
          icon: Icons.account_balance_wallet_rounded,
          label: 'Veesafe Wallet',
          onTap: () {}),
      _menuTile(context,
          icon: Icons.campaign_rounded,
          label: 'Influencer Marketing',
          onTap: () {}),
      _menuTile(context,
          icon: Icons.gavel_rounded,
          label: 'Legal',
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const LegalScreen()))),
    ],
  );

  Widget _portalLinks(BuildContext context) => Column(
    children: [
      _linkTile(context, label: 'Go to Supplier Hub', onTap: () {}),
      _linkTile(context, label: 'Go to Supplier Hub', onTap: () {}),
      _linkTile(context, label: 'Go to Supplier Hub', onTap: () {}),
    ],
  );

  Widget _logoutButton(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40),
    child: GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            title: const Text('Log Out',
                style: TextStyle(fontWeight: FontWeight.w800, color: kBlack)),
            content: const Text('Are you sure you want to log out?',
                style: TextStyle(color: kGrey)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel',
                    style: TextStyle(color: kGrey, fontWeight: FontWeight.w600)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlue, foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false,
                  );
                },
                child: const Text('Log Out',
                    style: TextStyle(fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        );
      },
      child: Container(
        height: 46, width: double.infinity,
        decoration: BoxDecoration(
            color: kBlue, borderRadius: BorderRadius.circular(30)),
        child: const Center(
          child: Text('Log Out',
              style: TextStyle(color: Colors.white,
                  fontSize: 15, fontWeight: FontWeight.w700)),
        ),
      ),
    ),
  );

  Widget _footer() => const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Made in india',
          style: TextStyle(fontSize: 12, color: kGrey, fontWeight: FontWeight.w400)),
    ],
  );

  Widget _menuTile(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    String? badge,
  }) =>
      Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: kBlueLite,
          highlightColor: kBlueLite,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
              child: Row(
                children: [
                  Container(
                    width: 38, height: 38,
                    decoration: BoxDecoration(
                        color: kBlueLite,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(icon, size: 20, color: kBlue),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(label,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: kBlack)),
                  ),
                  if (badge != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                          color: kBlue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(badge,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold)),
                    )
                  else
                    const Icon(Icons.chevron_right,
                        size: 18, color: kBorderGrey),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _linkTile(
    BuildContext context, {
    required String label,
    required VoidCallback onTap,
  }) =>
      Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: kBlueLite,
          highlightColor: kBlueLite,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 13),
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: kBorderGrey, width: 0.8)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(label,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kBlue)),
                  ),
                  const Icon(Icons.chevron_right, size: 18, color: kBlue),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _divider() => const Padding(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    child: Divider(color: kBorderGrey, thickness: 1, height: 1),
  );
}