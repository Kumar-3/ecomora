import 'package:ecom/core/res/styles/app_colors.dart';
import 'package:ecom/core/utils/core_utils.dart';
import 'package:flutter/material.dart';

extension TextStyleExt on TextStyle {
  /// Primary
  TextStyle get primary => copyWith(color: AppColors.lightThemePrimaryColor);

  /// Primary Tint
  TextStyle get primaryTint => copyWith(color: AppColors.lightThemePrimaryTint);

  /// Secondary (Orange)
  TextStyle get orange => copyWith(color: AppColors.lightThemeSecondaryColor);

  /// Primary Text
  TextStyle get textPrimary => copyWith(color: AppColors.lightThemePrimaryTextColor);

  /// Secondary Text
  TextStyle get textSecondary => copyWith(color: AppColors.lightThemeSecondaryTextColor);

  /// White
  TextStyle get white => copyWith(color: AppColors.lightThemeWhiteColor);

  /// Pink
  TextStyle get pink => copyWith(color: AppColors.lightThemePinkColor);

  /// Yellow
  TextStyle get yellow => copyWith(color: AppColors.lightThemeYellowColor);

  /// Stock
  TextStyle get stock => copyWith(color: AppColors.lightThemeStockColor);

  /// Tint Stock
  TextStyle get tintStock => copyWith(color: AppColors.lightThemeTintStockColor);

  /// Dark Sharp
  TextStyle get darkSharp => copyWith(color: AppColors.darkThemeDarkSharpColor);

  /// Dark Background
  TextStyle get darkBg => copyWith(color: AppColors.darkThemeBgDark);

  /// Dark NavBar
  TextStyle get darkNav => copyWith(color: AppColors.darkThemeDarkNavBarColor);

  /// Adaptive color (primary text ↔ white)
  TextStyle adaptiveColor(BuildContext context) => copyWith(
    color: CoreUtils.adaptiveColor(
      context,
      lightModeColor: AppColors.lightThemePrimaryTextColor,
      darkModeColor: AppColors.lightThemeWhiteColor,
    ),
  );
}
