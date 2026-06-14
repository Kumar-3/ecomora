import 'package:ecom/core/extension/text_style_extension.dart';
import 'package:ecom/core/res/styles/app_colors.dart';
import 'package:ecom/core/res/styles/text.dart';
import 'package:flutter/material.dart';

class EcomoraLogo extends StatelessWidget {
  const EcomoraLogo({super.key, this.style});

  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Ecom",
        style: style ?? TextStyles.appLogo.white,
        children: const [
          TextSpan(
            text: 'ora',
            style: TextStyle(color: AppColors.lightThemeSecondaryColor),
          ),
        ],
      ),
    );
  }
}
