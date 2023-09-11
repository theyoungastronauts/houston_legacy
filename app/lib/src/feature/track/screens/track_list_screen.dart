import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../routes.dart';
import '../../../core/screens/base_screen.dart';
import '../providers/track_form_provider.dart';
import '../components/track_list.dart';

class TrackListScreen extends BaseScreen {
  const TrackListScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Track List"),
      actions: const [],
    );
  }

  @override
  FloatingActionButton? floatingActionButton(
      BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(trackFormProvider("").notifier).clear();

        if (context.mounted) {
          context.push("${TrackRoutes.namespace}/edit/new");
        }
      },
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const TrackList();
  }
}
