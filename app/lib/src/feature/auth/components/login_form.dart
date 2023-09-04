import 'package:app/src/core/components/base_component.dart';
import 'package:app/src/core/components/buttons.dart';
import 'package:app/src/core/utils/dialogs.dart';
import 'package:app/src/core/utils/validation.dart';
import 'package:app/src/feature/auth/providers/login_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends BaseComponent {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(loginFormProvider.notifier);
    final model = ref.watch(loginFormProvider);
    return Form(
      key: provider.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: provider.emailController,
            validator: provider.emailValidator,
            autofocus: true,
            decoration: const InputDecoration(label: Text("Email")),
          ),
          TextFormField(
            controller: provider.passwordController,
            validator: provider.passwordValidator,
            obscureText: true,
            decoration: const InputDecoration(label: Text("Password")),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  label: "Send Magic Link",
                  type: AppButtonType.Text,
                  processing: model.processing,
                  onPressed: () async {
                    final email = await PromptModal.show(
                      title: "Send Magic Link",
                      labelText: "Email",
                      validator: formValidatorEmail,
                      initialValue: model.email,
                    );
                    if (email != null) {
                      provider.sendMagicLink(email);
                    }
                  },
                ),
                AppButton(
                  label: "Login",
                  processing: model.processing,
                  onPressed: provider.submit,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
