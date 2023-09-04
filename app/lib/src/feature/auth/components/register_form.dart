import 'package:app/src/core/components/base_component.dart';
import 'package:app/src/core/components/buttons.dart';
import 'package:app/src/feature/auth/providers/register_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterForm extends BaseComponent {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(registerFormProvider.notifier);
    final model = ref.watch(registerFormProvider);
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
            child: Align(
              alignment: Alignment.centerRight,
              child: AppButton(
                label: "Submit",
                processing: model.processing,
                onPressed: provider.submit,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
