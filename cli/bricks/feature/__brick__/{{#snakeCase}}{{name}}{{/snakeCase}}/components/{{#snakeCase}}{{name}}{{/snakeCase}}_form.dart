import 'package:annotations/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/base_component.dart';
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_form_provider.dart';
import '../models/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';

part '{{#snakeCase}}{{name}}{{/snakeCase}}_form.g.dart';

@houstonForm
class {{#pascalCase}}{{name}}{{/pascalCase}}Form extends Houston{{#pascalCase}}{{name}}{{/pascalCase}}Form {
  const {{#pascalCase}}{{name}}{{/pascalCase}}Form({super.key, required super.uuid});

  @override
  List<Widget> fields(BuildContext context, WidgetRef ref, {{#pascalCase}}{{name}}{{/pascalCase}}FormProvider provider, {{#pascalCase}}{{name}}{{/pascalCase}} model) {
    return [
      {{#appFormInputs}}{{{.}}}
      {{/appFormInputs}}
    ];
  }
}