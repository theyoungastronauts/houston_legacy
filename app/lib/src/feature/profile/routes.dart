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

class ProfileRoutes {
  static const String namespace = "/profile";
  static final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "Profile Shell");

  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: namespace,
        builder: (context, state) => const ProfileListScreen(),
      ),
      GoRoute(
        path: "$namespace/:uuid",
        builder: (context, state) => ProfileDetailScreen(uuid: state.pathParameters['uuid']!),
      ),
      GoRoute(
        path: "$namespace/edit/:uuid",
        builder: (context, state) => ProfileEditScreen(uuid: state.pathParameters['uuid']!),
      )
    ],
  );
}
