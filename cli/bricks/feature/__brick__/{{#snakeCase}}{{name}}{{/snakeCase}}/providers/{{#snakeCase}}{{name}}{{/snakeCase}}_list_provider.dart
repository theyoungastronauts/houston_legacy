import 'package:annotations/annotations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../models/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';
import '../services/{{#snakeCase}}{{name}}{{/snakeCase}}_db_service.dart';

part '{{#snakeCase}}{{name}}{{/snakeCase}}_list_provider.g.dart';

@houstonListProvider
class {{#pascalCase}}{{name}}{{/pascalCase}}ListProvider extends Houston{{#pascalCase}}{{name}}{{/pascalCase}}ListProvider {}

final {{#camelCase}}{{name}}{{/camelCase}}ListProvider = StateNotifierProvider<{{#pascalCase}}{{name}}{{/pascalCase}}ListProvider, List<{{#pascalCase}}{{name}}{{/pascalCase}}>>(
  (ref) => {{#pascalCase}}{{name}}{{/pascalCase}}ListProvider(),
);
