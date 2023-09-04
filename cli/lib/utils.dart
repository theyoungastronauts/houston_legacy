import 'dart:io';
import 'package:cli/models/blueprint.dart';
import 'package:yaml/yaml.dart';
import 'package:dcli/dcli.dart';

const isCompiled = String.fromEnvironment('COMPILED') == 'true';

String appName() {
  final yaml = parseYaml("${appDir()}/pubspec.yaml");

  return yaml['name'];
}

String houstonRoot() {
  if (isCompiled) {
    return pwd;
  }

  return (Directory(pwd).parent).path;
}

String cliDir() {
  return Directory("${houstonRoot()}/cli").path;
}

String appDir() {
  return Directory("${houstonRoot()}/app").path;
}

String blueprintsDir() {
  return Directory("${cliDir()}/blueprints").path;
}

String bricksDir() {
  return Directory("${cliDir()}/bricks").path;
}

String appModuleDirectory() {
  return Directory("${appDir()}/lib").path;
}

YamlMap parseYaml(String path) {
  File file = File(path);
  String yamlString = file.readAsStringSync();
  final yaml = loadYaml(yamlString);
  return yaml;
}

BluePrint parseBlueprint(String path) {
  final yaml = parseYaml(path);
  print(yaml);
  return BluePrint.fromYaml(yaml);
}

Future<void> setTextInFile({
  required String path,
  required String value,
}) async {
  final f = File(path);
  await f.writeAsString(value);
}

Future<void> insertTextInFile({
  required String path,
  required String value,
  String spacer = "\n",
  bool preventDuplicates = true,
}) async {
  final f = File(path);
  final text = await f.readAsString();
  if (text.isEmpty) {
    spacer = "";
  }

  if (preventDuplicates && text.contains(value)) {
    return;
  }

  await f.writeAsString("$text$spacer$value");
}

Future<void> insertTextInFileAtToken({
  required String path,
  required String token,
  required String value,
  bool preventDuplicates = true,
}) async {
  final f = File(path);
  String text = await f.readAsString();

  if (preventDuplicates && text.contains(value)) {
    print(orange("text already exists in file"));
    return;
  }

  final newLine = '''$value
    $token''';

  text = text.replaceAll(token, newLine);
  await f.writeAsString(text);
}
