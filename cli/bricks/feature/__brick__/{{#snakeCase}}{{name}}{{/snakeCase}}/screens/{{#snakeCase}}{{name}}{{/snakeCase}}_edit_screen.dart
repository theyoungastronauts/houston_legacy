import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/screens/base_screen.dart';
import '../components/{{#snakeCase}}{{name}}{{/snakeCase}}_form.dart';
import '../components/{{#snakeCase}}{{name}}{{/snakeCase}}_form_actions.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}EditScreen extends BaseScreen {
  final String uuid;
  const {{#pascalCase}}{{name}}{{/pascalCase}}EditScreen({super.key, required this.uuid});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Edit {{#pascalCase}}{{name}}{{/pascalCase}}"),
      actions: const [],
    );
  }

  @override
  Widget? bottomNavigationBar(BuildContext context, WidgetRef ref) {
    return {{#pascalCase}}{{name}}{{/pascalCase}}FormActions(uuid: uuid);
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return {{#pascalCase}}{{name}}{{/pascalCase}}Form(uuid: uuid);
  }
}
