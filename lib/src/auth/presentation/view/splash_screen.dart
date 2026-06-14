import 'package:ecom/core/common/widgets/ecomora_logo.dart';
import 'package:ecom/core/res/styles/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightThemePrimaryColor,
      body: Center(child: EcomoraLogo()),
    );
  }
}
