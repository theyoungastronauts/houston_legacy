import 'package:cli/constants.dart';
import 'package:cli/models/blueprint_property.dart';
import 'package:cli/strings.dart';
import 'package:cli/utils.dart';
import 'package:dcli/dcli.dart';
import 'package:yaml/yaml.dart';
import 'package:collection/collection.dart';

const formElementTypes = ['char', 'text', 'url', 'int', 'double'];

class BluePrint {
  final String name;
  final List<BlueprintProperty> properties;
  late String namePlural;
  late String label;
  late String labelPlural;

  BluePrint({
    required this.name,
    required this.properties,
    String? namePlural,
    String? label,
    String? labelPlural,
  }) {
    this.namePlural = namePlural ?? "${name}s";
    this.label = label ?? titleCase(name);
    this.labelPlural = labelPlural ?? "${titleCase(name)}s";
  }

  factory BluePrint.fromYaml(YamlMap data) {
    final properties = data['properties'].map<BlueprintProperty>((p) => BlueprintProperty.fromYaml(p)).toList();

    return BluePrint(
      name: data['name'],
      properties: properties,
    );
  }

  List<String> get appModelImports {
    final List<String> importStrings = [];
    for (final p in properties) {
      if (!PRIMITIVE_TYPES.contains(p.type)) {
        if (p.type == "user") {
          importStrings.add("import 'package:app/src/core/utils/user_utils.dart';");
          importStrings.add("import 'package:supabase_flutter/supabase_flutter.dart';");
        } else {
          importStrings.add("import '../../${snakeCase(p.type)}/models/${snakeCase(p.type)}.dart';");
        }
      }
    }

    return importStrings;
  }

  List<String> get serviceModelImports {
    final List<String> importStrings = [];
    for (final p in properties) {
      if (!PRIMITIVE_TYPES.contains(p.type)) {
        if (p.type == "user") {
          importStrings.add("from django.contrib.auth import get_user_model");
        } else {
          importStrings.add("from ${snakeCase(p.module)}.models import ${pascalCase(p.type)}");
        }
      }

      if (p.type == "bitpack_image" || p.type == "bitpack_file") {
        importStrings.add("from django.core.validators import RegexValidator");
        importStrings.add("from django.conf import settings");
      }
    }

    return importStrings;
  }

  bool get shouldRegisterUser {
    return properties.firstWhereOrNull((p) => p.module == 'access' && p.type == 'user') != null;
  }

  List<String> get appEmptyFactoryParams {
    final List<String> items = [];

    for (final property in properties) {
      final value = property.appEmptyFactoryParam;
      if (value != null) {
        items.add('${camelCase(property.name)}: $value');
      }
    }
    return items;
  }

  List<String> get appFormControllers {
    final List<String> items = [];
    for (final property in properties) {
      if (formElementTypes.contains(property.type)) {
        items.add("final TextEditingController ${camelCase(property.name)}Controller = TextEditingController();");
      }
    }
    return items;
  }

  List<String> get appFormControllerListeners {
    final List<String> items = [];
    for (final property in properties) {
      if (formElementTypes.contains(property.type)) {
        String? parser;
        if (property.type == 'int') {
          parser = 'int.tryParse(';
        }
        if (property.type == 'double') {
          parser = 'double.tryParse(';
        }

        final value = """
${camelCase(property.name)}Controller.addListener(() {
      changesMade = true;
      state = state.copyWith(${camelCase(property.name)}: ${parser ?? ''}${camelCase(property.name)}Controller.text${parser != null ? ') ?? 0' : ''});
    });
""";

        items.add(value);
      }
    }
    return items;
  }

  List<String> get appFormSetters {
    final List<String> items = [];
    for (final property in properties) {
      if (formElementTypes.contains(property.type)) {
        final isString = ['char', 'text', 'url'].contains(property.type);
        items.add("${camelCase(property.name)}Controller.text = state.${camelCase(property.name)}${isString ? '' : '.toString()'};");
      }
    }
    return items;
  }

  List<String> get appFormValidators {
    final List<String> items = [];

    for (final property in properties) {
      if (formElementTypes.contains(property.type)) {
        if (!property.allowNull) {
          items.add('String? ${camelCase(property.name)}Validator(String? value) => formValidatorNotEmpty(value, "${titleCase(property.name)}");');
        }
      }
    }
    return items;
  }

  List<String> get appFormClearers {
    final List<String> items = [];
    for (final property in properties) {
      if (formElementTypes.contains(property.type)) {
        items.add("${camelCase(property.name)}Controller.text = '';");
      }
    }
    return items;
  }

  List<String> get appFormInputs {
    final List<String> items = [];
    for (final property in properties) {
      if (formElementTypes.contains(property.type)) {
        final value = property.type == 'text'
            ? """
TextFormField(
                controller: provider.${camelCase(property.name)}Controller,
                validator: provider.${camelCase(property.name)}Validator,
                decoration: const InputDecoration(label: Text("${titleCase(property.name)}")),
                minLines: 3,
                maxLines: 3,
              ),
"""
            : """
TextFormField(
                controller: provider.${camelCase(property.name)}Controller,
                validator: provider.${camelCase(property.name)}Validator,
                decoration: const InputDecoration(label: Text("${titleCase(property.name)}")),
              ),
""";
        items.add(value);
      }
    }
    return items;
  }

  String get appJoins {
    final List<String> joins = [];
    for (final property in properties) {
      if (!PRIMITIVE_TYPES.contains(property.type)) {
        joins.add("${property.type}(*)");
      }
    }

    return joins.join(",");
  }

  List<String> get toJsonFunctions {
    final List<String> functions = [];

    for (final property in properties) {
      if (!PRIMITIVE_TYPES.contains(property.type)) {
        functions.add("int ${property.type}ToJson(${pascalCase(property.type)} ${property.name}) => ${property.name}.id;");
      }
    }
    return functions;
  }

  bool get includesProfile {
    return properties.firstWhereOrNull((p) => p.type.toLowerCase() == "profile") != null;
  }

  String? get emptyFormOverride {
    if (includesProfile) {
      return """@override
      void handleEmpty(){
        final profile = ref.read(sessionProvider).profile;
        if(profile != null){
          state = ${pascalCase(name)}.empty().copyWith(profile: profile);
        }
      }""";
    }
    return null;
  }

  String get generatedSql {
    final List<String> sql = [];

    sql.add('CREATE TABLE IF NOT EXISTS "public"."$name" (');

    final List<String> sqlProperties = [];

    sqlProperties.add('"id" bigint NOT NULL');
    sqlProperties.add('"uuid" "uuid" DEFAULT "gen_random_uuid"() NOT NULL');

    for (final property in properties) {
      final type = property.type.toLowerCase();
      final name = snakeCase(property.name);

      if (type == "char") {
        sqlProperties.add('"$name" character varying NOT NULL');
      } else if (type == "text" || type == "string" || type == "url") {
        sqlProperties.add('"$name" "text" NOT NULL');
      } else if (type == "int" || type == "double") {
        sqlProperties.add('"$name" numeric NOT NULL');
      } else if (type == "datetime") {
        if (name == "created_at") {
          sqlProperties.add('"$name" timestamp with time zone DEFAULT "now"() NOT NULL');
        } else {
          sqlProperties.add('"$name" timestamp with time zone NOT NULL');
        }
      } else {
        sqlProperties.add('"$name" bigint NOT NULL');
      }
    }

    sql.add(sqlProperties.join(",\n"));

    sql.add(');');

    sql.add('ALTER TABLE "public"."$name" OWNER TO "postgres";');

    sql.add('ALTER TABLE "public"."$name" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (');
    sql.add('SEQUENCE NAME "public"."${name}_id_seq"');
    sql.add('START WITH 1');
    sql.add('INCREMENT BY 1');
    sql.add('NO MINVALUE');
    sql.add('NO MAXVALUE');
    sql.add('CACHE 1');
    sql.add(');');

    sql.add('ALTER TABLE ONLY "public"."$name" ADD CONSTRAINT "${name}_pkey" PRIMARY KEY ("id");');

    if (includesProfile) {
      sql.add(
          'ALTER TABLE ONLY "public"."$name" ADD CONSTRAINT "${name}_profile_fkey" FOREIGN KEY ("profile") REFERENCES "public"."profile"("id") ON DELETE CASCADE;');
    }

    return sql.join("\n");
  }

  Map<String, dynamic> serialize() {
    return {
      'project': appName(),
      'name': name,
      'namePlural': namePlural,
      'label': label,
      'labelPlural': labelPlural,
      'properties': properties.map<Map<String, dynamic>>((p) => p.serialize()).toList(),
      'appModelImports': appModelImports,
      'serviceModelImports': serviceModelImports.toSet().toList()..sort(),
      'shouldRegisterUser': shouldRegisterUser,
      'uiHeading1': properties.firstWhereOrNull((p) => p.uiHeading == 1)?.name ?? 'uuid',
      'uiHeading2': properties.firstWhereOrNull((p) => p.uiHeading == 2)?.name ?? 'uuid',
      'emptyFactoryParams': appEmptyFactoryParams,
      'appFormControllers': appFormControllers,
      'appFormControllerListeners': appFormControllerListeners,
      'appFormSetters': appFormSetters,
      'appFormValidators': appFormValidators,
      'appFormClearers': appFormClearers,
      'appFormInputs': appFormInputs,
      'appJoins': appJoins,
      'appHasJoins': appJoins.isNotEmpty,
      'appToJsonFunctions': toJsonFunctions,
      'emptyFormOverride': emptyFormOverride,
      'formProviderImportSession': includesProfile,
      'generatedSql': generatedSql
    };
  }
}
