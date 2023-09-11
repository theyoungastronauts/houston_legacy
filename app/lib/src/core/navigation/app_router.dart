import 'package:app/src/feature/track/routes.dart';
import 'package:app/src/feature/album/routes.dart';
import 'package:app/src/core/app.dart';
import 'package:app/src/core/navigation/dashboard_container.dart';
import 'package:app/src/core/screens/landing_screen.dart';
import 'package:app/src/feature/auth/screens/settings_screen.dart';
import 'package:app/src/feature/auth/screens/login_screen.dart';
import 'package:app/src/feature/auth/screens/register_screen.dart';
import 'package:app/src/feature/food/routes.dart';
import 'package:go_router/go_router.dart';

const defaultAppRoute = '/food';

final appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const LandingScreen(),
    ),
    GoRoute(
      path: "/login",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "/register",
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: "/settings",
      builder: (context, state) => const SettingsScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return DashboardContainer(navigationShell: navigationShell);
      },
      branches: [
        FoodRoutes.branch,
        AlbumRoutes.branch,
        TrackRoutes.branch,
        //::HOUSTON_INSERT_ROUTE::
      ],
    )
  ],
);
