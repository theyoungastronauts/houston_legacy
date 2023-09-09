import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/navigation/app_router.dart';
import '../../../core/screens/base_screen.dart';
import '../../../core/components/empty_placeholder.dart';
import '../providers/album_detail_provider.dart';
import '../components/album_details.dart';
import '../providers/album_form_provider.dart';

@RoutePage()
class AlbumDetailScreen extends BaseScreen {
  final String uuid;
  const AlbumDetailScreen({
    super.key,
    @PathParam('uuid') required this.uuid,
  });

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final album = ref.watch(albumDetailProvider(uuid));

    return album.when(
      loading: () => AppBar(
        title: const Text("Album"),
      ),
      data: (album) => AppBar(
        title: Text(album?.title ?? 'Error'),
        actions: album != null
            ? [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    ref
                        .read(albumFormProvider(album.uuid).notifier)
                        .load(album.uuid);
                    AutoRouter.of(context)
                        .push(AlbumEditRoute(uuid: album.uuid));
                  },
                )
              ]
            : [],
      ),
      error: (_, __) => AppBar(
        title: const Text("Error"),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final model = ref.watch(albumDetailProvider(uuid));

    return model.when(
      data: (album) => album != null
          ? AlbumDetails(album)
          : const EmptyPlaceholder(title: "Error"),
      error: (_, __) => const EmptyPlaceholder(title: "Error"),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
