import 'package:app/src/core/components/buttons.dart';
import 'package:app/src/core/components/empty_placeholder.dart';
import 'package:app/src/core/providers/session_provider.dart';
import 'package:app/src/core/utils/dialogs.dart';
import 'package:app/src/core/utils/validation.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/src/core/screens/base_screen.dart';

@RoutePage()
class EditProfileScreen extends BaseScreen {
  const EditProfileScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Edit Profile"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    if (!ref.watch(sessionProvider).isAuthenticated) {
      return const EmptyPlaceholder(
        title: "Not Logged In",
      );
    }

    final user = ref.watch(sessionProvider).user!;
    final profile = ref.watch(sessionProvider).profile;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Card(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(profile?.bio ?? "Test"),
                  ListTile(
                    title: Text(user.email ?? '-'),
                    subtitle: const Text("Email Address"),
                    leading: const Icon(Icons.email),
                    trailing: AppButton(
                      label: "Change",
                      onPressed: () async {
                        final newEmail = await PromptModal.show(
                          title: "Change Email Address",
                          labelText: "Email",
                          validator: formValidatorEmail,
                          initialValue: user.email ?? "",
                        );

                        if (newEmail != null) {
                          final success = ref.read(sessionProvider.notifier).changeEmail(newEmail);
                        }
                      },
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
