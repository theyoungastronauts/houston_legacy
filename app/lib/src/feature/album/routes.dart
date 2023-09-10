import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import './screens/album_list_screen.dart';
import './screens/album_detail_screen.dart';
import './screens/album_edit_screen.dart';

class AlbumRoutes {
  static const String namespace = "album";
  static final shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "Album Shell");

  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: namespace,
        builder: (context, state) => const AlbumListScreen(),
      ),
      GoRoute(
        path: "$namespace/:uuid",
        builder: (context, state) =>
            AlbumDetailScreen(uuid: state.pathParameters['uuid']!),
      ),
      GoRoute(
        path: "$namespace/edit/:uuid",
        builder: (context, state) =>
            AlbumEditScreen(uuid: state.pathParameters['uuid']!),
      ),
    ],
  );
}
