import 'package:app/src/feature/album/routes.dart';
import 'package:app/src/feature/profile/routes.dart';
import 'package:flutter/material.dart';
import 'package:app/src/core/navigation/dashboard_container.dart';
import 'package:app/src/core/navigation/empty_route.dart';
import 'package:app/src/core/screens/landing_screen.dart';
import 'package:app/src/feature/food/routes.dart';
import 'package:auto_route/auto_route.dart';
import 'package:app/src/feature/auth/screens/login_screen.dart';
import 'package:app/src/feature/auth/screens/register_screen.dart';
import 'package:app/src/feature/auth/screens/welcome_screen.dart';
import 'package:app/src/feature/auth/screens/edit_profile_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Container,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(initial: true, path: "/", page: LandingRoute.page),
      AutoRoute(path: "/login", page: LoginRoute.page),
      AutoRoute(path: "/register", page: RegisterRoute.page),
      AutoRoute(path: "/welcome", page: WelcomeRoute.page),
      AutoRoute(path: "/edit-profile", page: EditProfileRoute.page),
      dashboardRouter,
    ];
  }
}

final dashboardRouter = AutoRoute(
  path: "/app",
  page: DashboardRoute.page,
  children: [
    RedirectRoute(path: "", redirectTo: "/food"),
    foodRoutes,
    albumRoutes,
    profileRoutes,
  ],
);
