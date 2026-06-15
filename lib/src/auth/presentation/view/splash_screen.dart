import 'package:ecom/core/common/app/cache_helper.dart';
import 'package:ecom/core/common/widgets/ecomora_logo.dart';
import 'package:ecom/core/res/styles/app_colors.dart';
import 'package:ecom/core/services/injection_container.dart';
import 'package:ecom/core/utils/core_utils.dart';
import 'package:ecom/src/auth/presentation/app/adapter/auth_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authAdapterProvider().notifier).verifyToken();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authAdapterProvider(), (previous, next) async {
      if (next is TokenVerified) {
        if (next.isValid) {
          //TODO (Get-User-Data): Get the user's data from the user adaptor
        } else {
          await sl<CacheHelper>().resetSession();
          CoreUtils.postFrameCall(() {
            context.go('/');
          });
        }
      } else if (next is AuthError) {
        if (next.message.startsWith('401')) {
          await sl<CacheHelper>().resetSession();
          CoreUtils.postFrameCall(() {
            context.go('/');
          });
          return;
        }
      }
    });
    return const Scaffold(
      backgroundColor: AppColors.lightThemePrimaryColor,
      body: Center(child: EcomoraLogo()),
    );
  }
}
