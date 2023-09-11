import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/screens/base_screen.dart';
import '../components/track_form.dart';
import '../components/track_form_actions.dart';

class TrackEditScreen extends BaseScreen {
  final String uuid;
  const TrackEditScreen({super.key, required this.uuid});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Edit Track"),
      actions: const [],
    );
  }

  @override
  Widget? bottomNavigationBar(BuildContext context, WidgetRef ref) {
    return TrackFormActions(uuid: uuid);
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return TrackForm(uuid: uuid);
  }
}
