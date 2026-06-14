import 'package:ecom/core/utils/core_utils.dart';
import 'package:flutter/material.dart';

abstract class AppColors {
  // Light Theme Primary Tint Color
  static const Color lightThemePrimaryTint = Color(0xff9e9cdc);

  // Light Theme Primary Color
  static const Color lightThemePrimaryColor = Color(0xff524eb7);

  // Light Theme Secondary Color
  static const Color lightThemeSecondaryColor = Color(0xffff6631);

  // Light Theme Primary Text Color
  static const Color lightThemePrimaryTextColor = Color(0xff282344);

  // Light Theme Secondary Text Color
  static const Color lightThemeSecondaryTextColor = Color(0xff9491a1);

  // Light Theme Pink Color
  static const Color lightThemePinkColor = Color(0xffff08e98);

  // Light Theme White Color
  static const Color lightThemeWhiteColor = Color(0xffffffff);

  // Light Theme Tint Stock Color
  static const Color lightThemeTintStockColor = Color(0xffff6f6f9);

  // Light Theme Yellow Color
  static const Color lightThemeYellowColor = Color(0xffffec613);

  // Light Theme Stock Color
  static const Color lightThemeStockColor = Color(0xffff4e4e9);

  // Dark Theme Dark Sharp Color
  static const Color darkThemeDarkSharpColor = Color(0xff191821);

  //Dark Theme BG Dark Color
  static const Color darkThemeBgDark = Color(0xff0e0d11);

  // Dark Theme Primary Tint Color
  static const Color darkThemeDarkNavBarColor = Color(0xff201f27);
  static Color classicAdaptiveTextColor(BuildContext context) => CoreUtils.adaptiveColor(
    context,
    lightModeColor: lightThemePrimaryTextColor,
    darkModeColor: lightThemeWhiteColor,
  );
}
