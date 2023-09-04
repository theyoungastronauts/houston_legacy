import 'package:app/src/core/components/base_component.dart';
import 'package:flutter/material.dart';
import 'package:app/src/core/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export './screens/profile_list_screen.dart';
export './screens/profile_detail_screen.dart';
export './screens/profile_edit_screen.dart';

@RoutePage()
class ProfileContainer extends BaseComponent {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const AutoRouter();
  }
}

AutoRoute get profileRoutes {
  return AutoRoute(
    path: "profile",
    page: ProfileRoute.page,
    children: [
      AutoRoute(
        path: "",
        page: ProfileListRoute.page,
      ),
      AutoRoute(
        path: ":uuid",
        page: ProfileDetailRoute.page,
      ),
      AutoRoute(
        path: "create",
        page: ProfileEditRoute.page,
      ),
      AutoRoute(
        path: "edit/:uuid",
        page: ProfileEditRoute.page,
      ),
    ],
  );
}
