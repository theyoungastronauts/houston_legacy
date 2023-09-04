import 'package:app/src/core/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/screens/base_screen.dart';
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_form_provider.dart';
import '../components/{{#snakeCase}}{{name}}{{/snakeCase}}_list.dart';

@RoutePage()
class {{#pascalCase}}{{name}}{{/pascalCase}}ListScreen extends BaseScreen {
  const {{#pascalCase}}{{name}}{{/pascalCase}}ListScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("{{#titleCase}}{{name}}{{/titleCase}} List"),
      actions: const [],
    );
  }
  @override

  FloatingActionButton? floatingActionButton(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read({{#camelCase}}{{name}}{{/camelCase}}FormProvider("").notifier).clear();
        AutoRouter.of(context).push({{#pascalCase}}{{name}}{{/pascalCase}}EditRoute(uuid: ""));
      },
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const {{#pascalCase}}{{name}}{{/pascalCase}}List();
  }
}
