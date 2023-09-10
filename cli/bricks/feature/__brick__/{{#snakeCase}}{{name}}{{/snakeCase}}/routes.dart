import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import './screens/{{#snakeCase}}{{name}}{{/snakeCase}}_list_screen.dart';
import './screens/{{#snakeCase}}{{name}}{{/snakeCase}}_detail_screen.dart';
import './screens/{{#snakeCase}}{{name}}{{/snakeCase}}_edit_screen.dart';


class {{#pascalCase}}{{name}}{{/pascalCase}}Routes {
  static const String namespace = "/{{#paramCase}}{{name}}{{/paramCase}}";
  static final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "{{#pascalCase}}{{name}}{{/pascalCase}} Shell");

   static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: namespace,
        builder: (context, state) => const {{#pascalCase}}{{name}}{{/pascalCase}}ListScreen(),
      ),
      GoRoute(
        path: "$namespace/:uuid",
        builder: (context, state) => {{#pascalCase}}{{name}}{{/pascalCase}}DetailScreen(uuid: state.pathParameters['uuid']!),
      ),
      GoRoute(
        path: "$namespace/edit/:uuid",
        builder: (context, state) => {{#pascalCase}}{{name}}{{/pascalCase}}EditScreen(uuid: state.pathParameters['uuid']!),
      ),
    ],
  );
}
