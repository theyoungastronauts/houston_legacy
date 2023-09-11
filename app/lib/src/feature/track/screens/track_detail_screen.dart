import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../routes.dart';
import '../../../core/screens/base_screen.dart';
import '../../../core/components/empty_placeholder.dart';
import '../providers/track_detail_provider.dart';
import '../components/track_details.dart';
import '../providers/track_form_provider.dart';

class TrackDetailScreen extends BaseScreen {
  final String uuid;
  const TrackDetailScreen({
    super.key,
    required this.uuid,
  });

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final track = ref.watch(trackDetailProvider(uuid));

    return track.when(
      loading: () => AppBar(
        title: const Text("Track"),
      ),
      data: (track) => AppBar(
        title: Text(track?.title ?? 'Error'),
        actions: track != null
            ? [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    ref
                        .read(trackFormProvider(track.uuid).notifier)
                        .load(track.uuid);

                    if (context.mounted) {
                      context
                          .push("${TrackRoutes.namespace}/edit/${track.uuid}");
                    }
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
    final model = ref.watch(trackDetailProvider(uuid));

    return model.when(
      data: (track) => track != null
          ? TrackDetails(track)
          : const EmptyPlaceholder(title: "Error"),
      error: (_, __) => const EmptyPlaceholder(title: "Error"),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
