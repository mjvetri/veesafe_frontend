import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../screens/dashboard/dashboard_screen.dart';

class VeesafeApp extends StatelessWidget {
  const VeesafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veesafe Seller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.navy),
        scaffoldBackgroundColor: AppColors.bg,
        fontFamily: 'Nunito',
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.navy,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}
