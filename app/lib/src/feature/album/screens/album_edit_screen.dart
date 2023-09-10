import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/screens/base_screen.dart';
import '../components/album_form.dart';
import '../components/album_form_actions.dart';

class AlbumEditScreen extends BaseScreen {
  final String uuid;
  const AlbumEditScreen({super.key, required this.uuid});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Edit Album"),
      actions: const [],
    );
  }

  @override
  Widget? bottomNavigationBar(BuildContext context, WidgetRef ref) {
    return AlbumFormActions(uuid: uuid);
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return AlbumForm(uuid: uuid);
  }
}
