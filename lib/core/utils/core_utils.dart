import 'package:ecom/core/extension/context_exitension.dart';
import 'package:flutter/material.dart';

abstract class CoreUtils {
  const CoreUtils();
  static Color adaptiveColor(
    BuildContext context, {
    required Color lightModeColor,
    required Color darkModeColor,
  }) {
    return context.isDarkMode ? darkModeColor : lightModeColor;
  }
}
