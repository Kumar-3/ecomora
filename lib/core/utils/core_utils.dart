import 'package:ecom/core/extension/context_exitension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

abstract class CoreUtils {
  const CoreUtils();

  static void postFrameCall(VoidCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  static Color adaptiveColor(
    BuildContext context, {
    required Color lightModeColor,
    required Color darkModeColor,
  }) {
    return context.isDarkMode ? darkModeColor : lightModeColor;
  }
}
