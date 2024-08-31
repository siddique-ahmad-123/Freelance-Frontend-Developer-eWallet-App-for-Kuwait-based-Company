import 'package:az_e_wallet/views/screens/HomeScreen.dart';
import 'package:az_e_wallet/views/screens/ProfilePage_screen.dart';
import 'package:az_e_wallet/views/screens/Profile_info_screen.dart';
import 'package:az_e_wallet/views/screens/Qr_scanner.dart';
import 'package:az_e_wallet/views/screens/otp_auth_screen.dart';
import 'package:az_e_wallet/views/widgets/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AZ E-Wallet',
      theme: AppTheme.lightTheme, // Apply the custom theme
      home:  HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


