import 'package:cli/constants.dart';
import 'package:cli/models/kwarg.dart';
import 'package:cli/strings.dart';
import 'package:dcli/dcli.dart';
import 'package:yaml/yaml.dart';

class BlueprintProperty {
  final String name;
  final String type;
  final int? maxLength;
  final dynamic defaultValue;
  final bool allowBlank;
  final bool allowNull;
  final String module;
  final int? uiHeading;
  final bool isImage;

  const BlueprintProperty({
    required this.name,
    required this.type,
    required this.allowBlank,
    required this.allowNull,
    required this.module,
    required this.isImage,
    this.maxLength,
    this.defaultValue,
    this.uiHeading,
  });

  factory BlueprintProperty.fromYaml(YamlMap data) {
    String? type = data['type'];

    // validate type
    if (type == null) {
      throw Exception(red("type required"));
    }

    String module = 'root';

    if (type.contains('.')) {
      final parts = type.split('.');
      module = parts.first;
      type = type.split('.').last;
    }

    // if (!PROPERTY_TYPES.contains(data['type'])) {
    //   throw Exception(red("Invalid Property Type `$type`"));
    // }

    return BlueprintProperty(
      name: data['name'],
      type: type.toString().toLowerCase(),
      maxLength: data['max_length'],
      allowBlank: data['blank'] ?? false,
      allowNull: data['null'] ?? false,
      defaultValue: data['default'],
      module: module,
      uiHeading: data['ui_heading'],
      isImage: data['image'] ?? false,
    );
  }

  List<Map<String, dynamic>> get _appAnnotations {
    final List<Map<String, dynamic>> values = [];
    if (snakeCase(name) != camelCase(name)) {
      values.add({'name': snakeCase(name)});
    }

    if (defaultValue != null) {
      values.add({"defaultValue": defaultValue});
    }

    if (!PRIMITIVE_TYPES.contains(type)) {
      // values.add({"fromJson": "${type}FromJson"});
      values.add({"toJson": "${type}ToJson"});
    }

    if (name == "created_at") {
      values.add({"includeToJson": false});
    }

    return values;
  }

  String _appAnnotationValueToString(Map<String, dynamic> kv) {
    final v = kv[kv.keys.first];
    if (v.toString().contains("ToJson")) {
      return '${kv.keys.first}: $v';
    }

    if (v.runtimeType == String) {
      return '${kv.keys.first}: "$v"';
    }
    return '${kv.keys.first}: $v';
  }

  String get _appAnnotation {
    final values = _appAnnotations;

    if (_appAnnotations.isNotEmpty) {
      return '@JsonKey(${values.map((item) => _appAnnotationValueToString(item)).toList().join(", ")}) ';
    }

    return '';
  }

  String get _appVariableType {
    switch (type) {
      case "char":
      case "text":
      case "url":
        return 'String';
      case "bool":
        return 'bool';
      case "int":
        return 'int';
      case "double":
        return 'double';
      case "datetime":
        return "DateTime";
      default:
        return pascalCase(type);
    }
  }

  String? get appEmptyFactoryParam {
    if (!allowNull) {
      final defaultValueString = defaultValue.toString();

      switch (type) {
        case "char":
        case "text":
        case "url":
        case "string":
          if (defaultValue != null) {
            return '"$defaultValueString"';
          } else {
            return '""';
          }
        case "bool":
          if (defaultValue != null) {
            return defaultValueString;
          } else {
            return 'false';
          }

        case "int":
        case "double":
          if (defaultValue != null) {
            return defaultValueString;
          } else {
            return '0';
          }
        case "datetime":
          return "DateTime.now()";
        case 'user':
          return 'emptyUser()';
        default:
          return '${pascalCase(type)}.empty()';
      }
    }
    return null;
  }

  String get appModelEntry {
    final value =
        "$_appAnnotation${allowNull == true && defaultValue == null ? '' : 'required '}$_appVariableType${allowNull ? '?' : ''} ${camelCase(name)},";
    return value;
  }

  String get _serviceVariableType {
    switch (type) {
      case "char":
        return 'models.CharField';
      case "text":
        return 'models.TextField';
      case "url":
      case "bitpack_image":
      case "bitpack_file":
        return 'models.URLField';
      case "boolean":
        return 'models.BooleanField';
      case "int":
        return 'models.IntegerField';
      case "double":
        return 'models.DecimalField';
      default:
        return "models.ForeignKey";
    }
  }

  String get serviceModelEntry {
    List<String> args = [];
    List<Kwarg> kwargs = [];

    if (PRIMITIVE_TYPES.contains(type)) {
      args.add('_("${titleCase(name)}")');
    } else {
      args.add('"${snakeCase(module)}.${pascalCase(type)}"');
      kwargs.add(Kwarg('verbose_name', '_("${titleCase(name)}")'));
      kwargs.add(Kwarg('on_delete', 'models.CASCADE'));
    }

    if (type == "double" || type == "decimal") {
      kwargs.add(Kwarg('decimal_places', 2));
      kwargs.add(Kwarg('max_digits', 12));
    }

    if (type == 'char') {
      kwargs.add(Kwarg('max_length', maxLength ?? 255));
    }

    if (defaultValue != null) {
      final defaultValueString = defaultValue.toString();
      String? value;

      if (defaultValueString == "true") {
        value = "True";
      } else if (defaultValueString == "false") {
        value = "False";
      } else if (int.tryParse(defaultValueString) != null || double.tryParse(defaultValueString) != null) {
        value = defaultValueString;
      } else {
        value = '"$defaultValueString"';
      }

      kwargs.add(Kwarg('default', value));
    }

    final kwargsString = kwargs.map((p) => "${p.key}=${p.value},").toList().join(' ');
    String params = args.join(", ");

    params = '$params, $kwargsString';

    if (PRIMITIVE_TYPES.contains(type)) {
      return '''${snakeCase(name)} = $_serviceVariableType($params)''';
    }

    return '''${snakeCase(name)} = models.ForeignKey($params)''';
  }

  Map<String, dynamic> serialize() {
    return {
      'name': name,
      'type': type,
      'maxLength': maxLength,
      'default': defaultValue,
      'allowBlank': allowBlank,
      'allowNull': allowNull,
      'appModelEntry': appModelEntry,
      'serviceModelEntry': serviceModelEntry,
    };
  }
}
