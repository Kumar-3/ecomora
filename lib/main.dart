import 'package:ecom/core/config/app_config.dart';
import 'package:ecom/core/res/styles/app_colors.dart';
import 'package:ecom/core/services/injection_container.dart';
import 'package:ecom/core/services/router.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.lightThemePrimaryColor),
      fontFamily: "Switzer",
      scaffoldBackgroundColor: AppColors.lightThemeTintStockColor,
      appBarTheme: const AppBarTheme(
        foregroundColor: AppColors.lightThemePrimaryTextColor,
        backgroundColor: AppColors.lightThemeTintStockColor,
      ),
      useMaterial3: true,
    );

    return MaterialApp.router(
      title: AppConfig.appName,
      theme: theme,
      darkTheme: theme.copyWith(
        scaffoldBackgroundColor: AppColors.darkThemeBgDark,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkThemeBgDark,
          foregroundColor: AppColors.lightThemeWhiteColor,
        ),
      ),
      routerConfig: router,
    );
  }
}
