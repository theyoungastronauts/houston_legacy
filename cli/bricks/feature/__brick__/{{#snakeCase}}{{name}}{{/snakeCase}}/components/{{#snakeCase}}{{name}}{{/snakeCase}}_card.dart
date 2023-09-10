import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../routes.dart';
import '../../../core/components/base_component.dart';
import '../models/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';


class {{#pascalCase}}{{name}}{{/pascalCase}}Card extends BaseComponent {
  final {{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}};
  const {{#pascalCase}}{{name}}{{/pascalCase}}Card(this.{{#camelCase}}{{name}}{{/camelCase}}, { Key? key }) : super(key: key);

  @override
  
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        {{=<% %>=}}
        context.push("${<% #pascalCase %><% name %><% /pascalCase %>Routes.namespace}/${<% #camelCase %><% name %><% /camelCase %>.uuid}");
        <%={{ }}=%>
      },
      child: Card(
        child: Padding(padding: const EdgeInsets.all(8.0), child: Text({{#camelCase}}{{name}}{{/camelCase}}.{{#camelCase}}{{uiHeading1}}{{/camelCase}})),
      ),
    );
  }
}