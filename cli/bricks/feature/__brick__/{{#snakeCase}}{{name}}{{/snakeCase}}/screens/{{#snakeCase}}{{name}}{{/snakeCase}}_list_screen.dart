import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../routes.dart';
import '../../../core/screens/base_screen.dart';
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_form_provider.dart';
import '../components/{{#snakeCase}}{{name}}{{/snakeCase}}_list.dart';

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
        {{=<% %>=}}
        if(context.mounted) {
          context.push("${<% #pascalCase %><% name %><% /pascalCase %>Routes.namespace}/edit/new");
        }
        <%={{ }}=%>
      },
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const {{#pascalCase}}{{name}}{{/pascalCase}}List();
  }
}
