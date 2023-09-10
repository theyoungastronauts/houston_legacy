import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/screens/base_screen.dart';
import '../components/profile_form.dart';
import '../components/profile_form_actions.dart';

class ProfileEditScreen extends BaseScreen {
  final String uuid;
  const ProfileEditScreen({super.key, required this.uuid});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Edit Profile"),
      actions: const [],
    );
  }

  @override
  Widget? bottomNavigationBar(BuildContext context, WidgetRef ref) {
    return ProfileFormActions(uuid: uuid);
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return ProfileForm(uuid: uuid);
  }
}
