import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/screens/base_screen.dart';
import '../../../core/components/empty_placeholder.dart';
import '../providers/profile_detail_provider.dart';
import '../components/profile_details.dart';
import '../providers/profile_form_provider.dart';

class ProfileDetailScreen extends BaseScreen {
  final String uuid;
  const ProfileDetailScreen({
    super.key,
    required this.uuid,
  });

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileDetailProvider(uuid));

    return profile.when(
      loading: () => AppBar(
        title: const Text("Profile"),
      ),
      data: (profile) => AppBar(
        title: Text(profile?.uuid ?? 'Error'),
        actions: profile != null
            ? [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    ref.read(profileFormProvider(profile.uuid).notifier).load(profile.uuid);
                    context.push('/profile/edit/${profile.uuid}');
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
    final model = ref.watch(profileDetailProvider(uuid));

    return model.when(
      data: (profile) => profile != null ? ProfileDetails(profile) : const EmptyPlaceholder(title: "Error"),
      error: (_, __) => const EmptyPlaceholder(title: "Error"),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
