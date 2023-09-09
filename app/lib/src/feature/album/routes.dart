import 'package:app/src/core/components/base_component.dart';
import 'package:flutter/material.dart';
import 'package:app/src/core/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export './screens/album_list_screen.dart';
export './screens/album_detail_screen.dart';
export './screens/album_edit_screen.dart';

@RoutePage()
class AlbumContainer extends BaseComponent {
  const AlbumContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const AutoRouter();
  }
}

AutoRoute get albumRoutes {
  return AutoRoute(
    path: "album",
    page: AlbumRoute.page,
    children: [
      AutoRoute(
        path: "",
        page: AlbumListRoute.page,
      ),
      AutoRoute(
        path: ":uuid",
        page: AlbumDetailRoute.page,
      ),
      AutoRoute(
        path: "create",
        page: AlbumEditRoute.page,
      ),
      AutoRoute(
        path: "edit/:uuid",
        page: AlbumEditRoute.page,
      ),
    ],
  );
}
