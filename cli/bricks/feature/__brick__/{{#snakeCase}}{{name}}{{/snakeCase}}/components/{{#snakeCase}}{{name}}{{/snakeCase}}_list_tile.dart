import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';
import '../../../core/components/base_component.dart';


class {{#pascalCase}}{{name}}{{/pascalCase}}ListTile extends BaseComponent {
  final {{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}};
  const {{#pascalCase}}{{name}}{{/pascalCase}}ListTile(this.{{#camelCase}}{{name}}{{/camelCase}}, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text({{#camelCase}}{{name}}{{/camelCase}}.{{#camelCase}}{{uiHeading1}}{{/camelCase}}),
      subtitle: Text({{#camelCase}}{{name}}{{/camelCase}}.{{#camelCase}}{{uiHeading2}}{{/camelCase}}),
    );
  }
}