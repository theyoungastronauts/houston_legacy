import 'package:app/src/core/components/buttons.dart';
import 'package:app/src/core/components/empty_placeholder.dart';
import 'package:app/src/core/providers/session_provider.dart';
import 'package:app/src/core/utils/dialogs.dart';
import 'package:app/src/core/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/src/core/screens/base_screen.dart';

class SettingsScreen extends BaseScreen {
  const SettingsScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Settings"),
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

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (profile != null)
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.format_align_left),
                      title: const Text("Bio"),
                      subtitle: Text(profile.bio.isNotEmpty ? profile.bio : "-"),
                      trailing: AppButton(
                        label: "Change",
                        onPressed: () async {
                          final newBio = await PromptModal.show(
                            title: "Update Bio",
                            labelText: "Bio",
                            initialValue: profile.bio,
                            multiline: true,
                          );

                          if (newBio != null) {
                            ref.read(sessionProvider.notifier).updateBio(newBio);
                          }
                        },
                      ),
                    ),
                  ),
                Card(
                  child: ListTile(
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
                          ref.read(sessionProvider.notifier).changeEmail(newEmail);
                        }
                      },
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
