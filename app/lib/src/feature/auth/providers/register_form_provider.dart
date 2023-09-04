import 'dart:async';
import 'package:app/src/core/providers/session_provider.dart';
import 'package:app/src/core/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterFormModel {
  final bool processing;
  final String email;
  final String password;

  const RegisterFormModel({
    this.processing = false,
    this.email = '',
    this.password = '',
  });

  RegisterFormModel copyWith({bool? processing, String? email, String? password}) {
    return RegisterFormModel(
      processing: processing ?? this.processing,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

class RegisterFormProvider extends StateNotifier<RegisterFormModel> {
  final Ref ref;

  RegisterFormProvider(this.ref, RegisterFormModel initialState) : super(initialState) {
    load(state);
    fieldListeners();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void load(RegisterFormModel model) {
    state = model;
    setFields();
  }

  void fieldListeners() {
    emailController.addListener(() {
      state = state.copyWith(email: emailController.text);
    });
    passwordController.addListener(() {
      state = state.copyWith(password: passwordController.text);
    });
  }

  void setFields() {
    emailController.text = state.email;
    passwordController.text = state.password;
  }

  void clearFields() {
    emailController.clear();
    passwordController.clear();
  }

  String? emailValidator(String? value) => formValidatorEmail(value);
  String? passwordValidator(String? value) => formValidatorPassword(value);

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    state = state.copyWith(processing: true);
    final success = await ref.read(sessionProvider.notifier).register(state.email, state.password);
    state = state.copyWith(processing: false);
    if (success) {
      clearFields();
    }
  }
}

final registerFormProvider = StateNotifierProvider<RegisterFormProvider, RegisterFormModel>((ref) {
  return RegisterFormProvider(ref, const RegisterFormModel());
});
