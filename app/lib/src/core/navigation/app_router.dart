import 'package:app/src/core/app.dart';
import 'package:app/src/core/navigation/dashboard_container.dart';
import 'package:app/src/core/screens/landing_screen.dart';
import 'package:app/src/feature/auth/screens/edit_profile_screen.dart';
import 'package:app/src/feature/auth/screens/login_screen.dart';
import 'package:app/src/feature/auth/screens/register_screen.dart';
import 'package:app/src/feature/food/routes.dart';
import 'package:go_router/go_router.dart';

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
      path: "/edit-profile",
      builder: (context, state) => const EditProfileScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => DashboardContainer(child: child),
      routes: [
        foodRoutes,
        //::HOUSTON_INSERT_ROUTE::
      ],
    )
  ],
);
