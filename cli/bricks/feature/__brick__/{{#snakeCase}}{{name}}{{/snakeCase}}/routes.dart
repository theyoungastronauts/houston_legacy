import 'package:app/src/core/components/base_component.dart';
import 'package:flutter/material.dart';
import 'package:app/src/core/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export './screens/{{#snakeCase}}{{name}}{{/snakeCase}}_list_screen.dart';
export './screens/{{#snakeCase}}{{name}}{{/snakeCase}}_detail_screen.dart';
export './screens/{{#snakeCase}}{{name}}{{/snakeCase}}_edit_screen.dart';


@RoutePage()
class {{#pascalCase}}{{name}}{{/pascalCase}}Container extends BaseComponent {
  const {{#pascalCase}}{{name}}{{/pascalCase}}Container({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const AutoRouter();
  }
}

AutoRoute get {{#camelCase}}{{name}}{{/camelCase}}Routes {
  return AutoRoute(
    path: "{{#paramCase}}{{name}}{{/paramCase}}",
    page: {{#pascalCase}}{{name}}{{/pascalCase}}Route.page,
    children: [
      AutoRoute(
        path: "",
        page: {{#pascalCase}}{{name}}{{/pascalCase}}ListRoute.page,
      ),
      AutoRoute(
        path: ":uuid",
        page: {{#pascalCase}}{{name}}{{/pascalCase}}DetailRoute.page,
      ),
      AutoRoute(
        path: "create",
        page: {{#pascalCase}}{{name}}{{/pascalCase}}EditRoute.page,
      ),
      AutoRoute(
        path: "edit/:uuid",
        page: {{#pascalCase}}{{name}}{{/pascalCase}}EditRoute.page,
      ),
    ],
  );
}
