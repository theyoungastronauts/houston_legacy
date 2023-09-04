import 'package:app/src/feature/auth/components/register_form.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app/src/core/screens/base_screen.dart';

@RoutePage()
class RegisterScreen extends BaseScreen {
  const RegisterScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Sign Up"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: const Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: RegisterForm(),
          ),
        ),
      ),
    );
  }
}
