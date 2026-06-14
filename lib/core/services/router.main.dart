part of 'router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) {
        debugPrint("inside /");
        final cacheHelper = sl<CacheHelper>();

        final bool isFirstTime = cacheHelper.isFirstTime();

        final bool isLoggedIn =
            Cache.instance.sessionToken != null && Cache.instance.userId != null;

        debugPrint("isFirstTime: $isFirstTime");
        debugPrint("isLoggedIn: $isLoggedIn");

        if (isFirstTime) {
          return '/onboarding';
        }
        if (!isLoggedIn) {
          return LoginScreen.path;
        }
        return HomeScreen.path;
      },
      builder: (_, _) => const SplashScreen(),
    ),

    GoRoute(path: '/onboarding', builder: (_, _) => const OnBoardingScreen()),
    GoRoute(path: LoginScreen.path, builder: (_, _) => const LoginScreen()),
    ShellRoute(
      builder: (context, state, child) {
        return DashboardScreen(state: state, child: child);
      },
      routes: [GoRoute(path: HomeScreen.path, builder: (_, _) => const HomeScreen())],
    ),
  ],
);
