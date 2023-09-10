import 'package:app/src/core/components/base_component.dart';
import 'package:app/src/feature/profile/screens/profile_detail_screen.dart';
import 'package:app/src/feature/profile/screens/profile_edit_screen.dart';
import 'package:app/src/feature/profile/screens/profile_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

export './screens/profile_list_screen.dart';
export './screens/profile_detail_screen.dart';
export './screens/profile_edit_screen.dart';

class ProfileContainer extends BaseComponent {
  final Widget child;
  const ProfileContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return child;
  }
}

final profileRoutes = ShellRoute(
  builder: (context, state, child) {
    return ProfileContainer(
      child: child,
    );
  },
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const ProfileListScreen(),
    ),
    GoRoute(
      path: "/:uuid",
      builder: (context, state) => ProfileDetailScreen(uuid: state.pathParameters['uuid']!),
    ),
    GoRoute(
      path: "/edit/:uuid",
      builder: (context, state) => ProfileEditScreen(uuid: state.pathParameters['uuid']!),
    )
  ],
);
