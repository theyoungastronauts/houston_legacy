import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import './screens/track_list_screen.dart';
import './screens/track_detail_screen.dart';
import './screens/track_edit_screen.dart';

class TrackRoutes {
  static const String namespace = "/track";
  static final shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "Track Shell");

  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: namespace,
        builder: (context, state) => const TrackListScreen(),
      ),
      GoRoute(
        path: "$namespace/:uuid",
        builder: (context, state) =>
            TrackDetailScreen(uuid: state.pathParameters['uuid']!),
      ),
      GoRoute(
        path: "$namespace/edit/:uuid",
        builder: (context, state) =>
            TrackEditScreen(uuid: state.pathParameters['uuid']!),
      ),
    ],
  );
}
