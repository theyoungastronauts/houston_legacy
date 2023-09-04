import 'package:flutter/material.dart';
import '../app.dart';

class Toast {
  static message(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  static error([String? message]) {
    // final context = rootNavigatorKey.currentContext!;

    final snackBar = SnackBar(
      content: Text(
        message ?? "A problem occurred",
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}
