import 'package:app/src/core/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/screens/base_screen.dart';
import '../providers/profile_form_provider.dart';
import '../components/profile_list.dart';

@RoutePage()
class ProfileListScreen extends BaseScreen {
  const ProfileListScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Profile List"),
      actions: const [],
    );
  }

  @override
  FloatingActionButton? floatingActionButton(
      BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(profileFormProvider("").notifier).clear();
        AutoRouter.of(context).push(ProfileEditRoute(uuid: ""));
      },
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const ProfileList();
  }
}
