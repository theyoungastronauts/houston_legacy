import 'dart:async';
import 'package:app/src/core/providers/session_provider.dart';
import 'package:app/src/core/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginFormModel {
  final bool processing;
  final String email;
  final String password;

  const LoginFormModel({
    this.processing = false,
    this.email = '',
    this.password = '',
  });

  LoginFormModel copyWith({bool? processing, String? email, String? password}) {
    return LoginFormModel(
      processing: processing ?? this.processing,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

class LoginFormProvider extends StateNotifier<LoginFormModel> {
  final Ref ref;

  LoginFormProvider(this.ref, LoginFormModel initialState) : super(initialState) {
    load(state);
    fieldListeners();
  }

  void load(LoginFormModel model) {
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

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? emailValidator(String? value) => formValidatorEmail(value);
  String? passwordValidator(String? value) => formValidatorPassword(value);

  Future<bool?> submit() async {
    if (!formKey.currentState!.validate()) {
      return null;
    }

    state = state.copyWith(processing: true);
    final success = await ref.read(sessionProvider.notifier).loginWithPassword(state.email, state.password);
    state = state.copyWith(processing: false);

    if (success) {
      clearFields();
    }

    return success;
  }

  Future<void> sendMagicLink(String email) async {
    state = state.copyWith(processing: true);
    await ref.read(sessionProvider.notifier).loginWithOtp(state.email);
    state = state.copyWith(processing: false);
  }
}

final loginFormProvider = StateNotifierProvider<LoginFormProvider, LoginFormModel>((ref) {
  return LoginFormProvider(ref, const LoginFormModel());
});
