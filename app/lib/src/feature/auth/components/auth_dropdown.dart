import 'package:app/src/config/theme.dart';
import 'package:app/src/core/components/base_component.dart';
import 'package:app/src/core/navigation/app_router.dart';
import 'package:app/src/core/providers/session_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthDropdown extends BaseComponent {
  const AuthDropdown({
    super.key,
  });

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final user = ref.watch(sessionProvider).user;
    if (user != null) {
      return SizedBox(
        height: 32,
        child: PopupMenuButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  user.email ?? "Me",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          itemBuilder: (context) {
            return <PopupMenuEntry>[
              PopupMenuItem(
                child: const Text(
                  "Edit Profile",
                ),
                onTap: () {
                  AutoRouter.of(context).push(const EditProfileRoute());
                },
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                child: Text(
                  "Logout",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.danger,
                  ),
                ),
                onTap: () {
                  ref.read(sessionProvider.notifier).logout();
                },
              ),
            ];
          },
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
