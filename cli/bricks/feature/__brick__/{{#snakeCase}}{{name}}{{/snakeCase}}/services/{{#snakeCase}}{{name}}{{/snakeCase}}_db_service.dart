import 'package:annotations/annotations.dart';
import 'package:app/src/core/models/db_list_response.dart';
import 'package:app/src/core/services/db_service.dart';
import 'package:app/src/feature/{{#snakeCase}}{{name}}{{/snakeCase}}/models/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';
{{#appDbServiceImports}}{{{.}}}{{/appDbServiceImports}}
part '{{#snakeCase}}{{name}}{{/snakeCase}}_db_service.g.dart';

@houstonDbService
class {{#pascalCase}}{{name}}{{/pascalCase}}DbService extends Houston{{#pascalCase}}{{name}}{{/pascalCase}}DbService {
  {{#appHasJoins}}
  @override
  String get defaultSelect => "*,{{appJoins}}";
  {{/appHasJoins}}
}
