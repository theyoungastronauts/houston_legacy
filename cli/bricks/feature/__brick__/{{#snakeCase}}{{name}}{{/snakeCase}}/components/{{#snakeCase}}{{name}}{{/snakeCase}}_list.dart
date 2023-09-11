import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/base_component.dart';
import '../../../core/components/infinite_list.dart';
import '../components/{{#snakeCase}}{{name}}{{/snakeCase}}_card.dart';
import '../models/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_list_provider.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}List extends BaseComponent {
  final Function({{#pascalCase}}{{name}}{{/pascalCase}})? onPressed;
  const {{#pascalCase}}{{name}}{{/pascalCase}}List({super.key, this.onPressed});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listProvider = ref.read({{#camelCase}}{{name}}{{/camelCase}}ListProvider.notifier);

    return InfiniteList<{{#pascalCase}}{{name}}{{/pascalCase}}>(
      pagingController: listProvider.pagingController,
      itemBuilder: (context, {{#camelCase}}{{name}}{{/camelCase}}, index) => {{#pascalCase}}{{name}}{{/pascalCase}}Card({{#camelCase}}{{name}}{{/camelCase}}, onPressed: onPressed),
      emptyText: "No {{#titleCase}}{{name}}{{/titleCase}}s",
      onRefresh: listProvider.refresh,
    );
  }
}