import 'package:ecom/core/common/widgets/app_bar_bottom.dart';
import 'package:ecom/core/res/styles/text.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const path = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const AppBarBottom(),
        title: const Text('Sign in', style: TextStyles.headingSemiBold),
      ),
      body: Container(),
    );
  }
}
