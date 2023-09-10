import 'package:app/src/config/theme.dart';
import 'package:app/src/core/components/buttons.dart';
import 'package:app/src/core/navigation/app_router.dart';
import 'package:app/src/core/providers/session_provider.dart';
import 'package:app/src/core/screens/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends ConsumerStatefulWidget {
  const LandingScreen({super.key});

  @override
  ConsumerState<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<LandingScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(sessionProvider.notifier);
  }

  @override
  Widget build(BuildContext context) {
    if (!ref.watch(sessionProvider).ready) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return const LandingScreenContent();
  }
}

class LandingScreenContent extends BaseScreen {
  const LandingScreenContent({super.key});

  @override
  Widget body(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Welcome to Houston!",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppButton(
                  label: "Login",
                  onPressed: () {
                    context.push('/login');
                  },
                ),
                const SizedBox(width: 8),
                AppButton(
                  label: "Sign Up",
                  onPressed: () {
                    context.push('/register');
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            AppButton(
              label: "Continue as Guest",
              type: AppButtonType.Text,
              variant: AppColorVariant.secondary,
              onPressed: () {
                context.push(defaultAppRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
