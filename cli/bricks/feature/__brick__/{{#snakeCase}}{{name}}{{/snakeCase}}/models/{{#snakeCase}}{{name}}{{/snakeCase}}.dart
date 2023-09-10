// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';
{{#appModelImports}}{{{.}}}
{{/appModelImports}}
part '{{#snakeCase}}{{name}}{{/snakeCase}}.freezed.dart';
part '{{#snakeCase}}{{name}}{{/snakeCase}}.g.dart';

{{#appToJsonFunctions}}{{{.}}}
{{/appToJsonFunctions}}

@freezed
class {{#pascalCase}}{{name}}{{/pascalCase}} with _${{#pascalCase}}{{name}}{{/pascalCase}} {
  const {{#pascalCase}}{{name}}{{/pascalCase}}._();

  factory {{#pascalCase}}{{name}}{{/pascalCase}}({
    @JsonKey(includeToJson: false) required int id,
    @JsonKey(includeToJson: false) required String uuid,
    {{#properties}}{{{appModelEntry}}}
    {{/properties}}
  }) = _{{#pascalCase}}{{name}}{{/pascalCase}};

  factory {{#pascalCase}}{{name}}{{/pascalCase}}.fromJson(Map<String, dynamic> json) => _${{#pascalCase}}{{name}}{{/pascalCase}}FromJson(json);
  
  factory {{#pascalCase}}{{name}}{{/pascalCase}}.empty() {
    return {{#pascalCase}}{{name}}{{/pascalCase}}(
      id: 0,
      uuid: '',
      {{#emptyFactoryParams}}{{{.}}},
      {{/emptyFactoryParams}}
    );
  }

  bool get exists {
    return id != 0;
  }

}