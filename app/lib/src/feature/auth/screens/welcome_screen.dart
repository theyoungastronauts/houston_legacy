import 'package:app/src/core/components/buttons.dart';
import 'package:app/src/core/navigation/app_router.dart';
import 'package:app/src/core/navigation/dashboard_container.dart';
import 'package:app/src/core/screens/base_screen.dart';
import 'package:app/src/core/singletons/singletons.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@RoutePage()
class WelcomeScreen extends BaseScreen {
  const WelcomeScreen({super.key});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Text("Welcome"),
        AppButton(
          label: "Sign out",
          onPressed: () async {
            await singleton<SupabaseClient>().auth.signOut();
            AutoRouter.of(context).replace(const LandingRoute());
          },
        ),
      ],
    );
  }
}
