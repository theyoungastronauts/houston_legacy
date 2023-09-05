import 'package:annotations/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/dialogs.dart';
import '../../../core/utils/toast.dart';
import '../../../core/utils/validation.dart';

import '../../../core/providers/global_loading_provider.dart';
import '../models/{{#snakeCase}}{{name}}{{/snakeCase}}.dart';
import '../services/{{#snakeCase}}{{name}}{{/snakeCase}}_db_service.dart';
import '{{#snakeCase}}{{name}}{{/snakeCase}}_detail_provider.dart';
import '{{#snakeCase}}{{name}}{{/snakeCase}}_list_provider.dart';
{{#formProviderImportSession}}import '../../../core/providers/session_provider.dart';{{/formProviderImportSession}}

part '{{#snakeCase}}{{name}}{{/snakeCase}}_form_provider.g.dart';

@houstonFormProvider
class {{#pascalCase}}{{name}}{{/pascalCase}}FormProvider extends Houston{{#pascalCase}}{{name}}{{/pascalCase}}FormProvider {
  {{#pascalCase}}{{name}}{{/pascalCase}}FormProvider(ref, uuid, initialState): super(ref, uuid, initialState);

  {{#appFormControllers}}{{{.}}}
  {{/appFormControllers}}
  {{#appFormValidators}}{{{.}}}
  {{/appFormValidators}}
  @override
  void fieldListeners() {
    {{#appFormControllerListeners}}{{{.}}}
    {{/appFormControllerListeners}}
  }

  @override
  void setFields() {
    {{#appFormSetters}}{{{.}}}
    {{/appFormSetters}}
  }

  @override
  void clearFields() {
    {{#appFormClearers}}{{{.}}}
    {{/appFormClearers}}
  }

  {{#emptyFormOverride}}{{{.}}}{{/emptyFormOverride}}
  
}

final {{#camelCase}}{{name}}{{/camelCase}}FormProvider = StateNotifierProvider.family<{{#pascalCase}}{{name}}{{/pascalCase}}FormProvider, {{#pascalCase}}{{name}}{{/pascalCase}}, String>((ref, uuid) {
  return {{#pascalCase}}{{name}}{{/pascalCase}}FormProvider(ref, uuid, {{#pascalCase}}{{name}}{{/pascalCase}}.empty());
});