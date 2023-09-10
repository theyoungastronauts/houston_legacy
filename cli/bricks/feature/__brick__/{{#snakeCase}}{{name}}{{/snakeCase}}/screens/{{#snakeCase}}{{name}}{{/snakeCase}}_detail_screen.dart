import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../routes.dart';
import '../../../core/screens/base_screen.dart';
import '../../../core/components/empty_placeholder.dart';
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_detail_provider.dart';
import '../components/{{#snakeCase}}{{name}}{{/snakeCase}}_details.dart';
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_form_provider.dart';


class {{#pascalCase}}{{name}}{{/pascalCase}}DetailScreen extends BaseScreen {
  final String uuid;
  const {{#pascalCase}}{{name}}{{/pascalCase}}DetailScreen({
    super.key,
    required this.uuid,
  });

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final {{#camelCase}}{{name}}{{/camelCase}} = ref.watch({{#camelCase}}{{name}}{{/camelCase}}DetailProvider(uuid));

    return {{#camelCase}}{{name}}{{/camelCase}}.when(
      loading: () => AppBar(
        title: const Text("{{#titleCase}}{{name}}{{/titleCase}}"),
      ),
      data: ({{#camelCase}}{{name}}{{/camelCase}}) => AppBar(
        title: Text({{#camelCase}}{{name}}{{/camelCase}}?.{{#camelCase}}{{uiHeading1}}{{/camelCase}} ?? 'Error'),
         actions: {{#camelCase}}{{name}}{{/camelCase}} != null
            ? [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    ref.read({{#camelCase}}{{name}}{{/camelCase}}FormProvider({{#camelCase}}{{name}}{{/camelCase}}.uuid).notifier).load({{#camelCase}}{{name}}{{/camelCase}}.uuid);
                    {{=<% %>=}}
                    if(context.mounted) {
                      context.push("${<% #pascalCase %><% name %><% /pascalCase %>Routes.namespace}/edit/${<% #camelCase %><% name %><% /camelCase %>.uuid}");
                    }
                    <%={{ }}=%>
                  },
                )
              ]
            : [],
      ),
      error: (_, __) => AppBar(
        title: const Text("Error"),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final model = ref.watch({{#camelCase}}{{name}}{{/camelCase}}DetailProvider(uuid));

    return model.when(
      data: ({{#camelCase}}{{name}}{{/camelCase}}) => {{#camelCase}}{{name}}{{/camelCase}} != null ? {{#pascalCase}}{{name}}{{/pascalCase}}Details({{#camelCase}}{{name}}{{/camelCase}}) : const EmptyPlaceholder(title: "Error"),
      error: (_, __) => const EmptyPlaceholder(title: "Error"),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
