import 'package:annotations/annotations.dart';
import 'package:app/src/core/services/rest_service.dart';
import 'package:app/src/core/models/paginated_response.dart';
import 'package:app/src/core/utils/debugger.dart';
import '../models/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';

part '{{#snakeCase}}{{name}}{{/snakeCase}}_rest_service.g.dart';

@houstonRestService
class {{#pascalCase}}{{name}}{{/pascalCase}}RestService extends Houston{{#pascalCase}}{{name}}{{/pascalCase}}RestService {} 