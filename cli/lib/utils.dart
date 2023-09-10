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

bool _textExists(String fileContents, String lookup) {
  fileContents = fileContents.replaceAll("\n", "").replaceAll(" ", "");
  lookup = lookup.replaceAll("\n", "").replaceAll(" ", "");
  return fileContents.contains(lookup);
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
  String? duplicateLookup,
  bool prepend = false,
}) async {
  final f = File(path);
  final text = await f.readAsString();
  if (text.isEmpty) {
    spacer = "";
  }

  if (preventDuplicates && _textExists(text, duplicateLookup ?? value)) {
    return;
  }

  if (prepend) {
    await f.writeAsString("$value$spacer$text");
  } else {
    await f.writeAsString("$text$spacer$value");
  }
}

Future<void> insertTextInFileAtToken({
  required String path,
  required String token,
  required String value,
  bool preventDuplicates = true,
  String? duplicateLookup,
}) async {
  final f = File(path);
  String text = await f.readAsString();

  if (preventDuplicates && _textExists(text, duplicateLookup ?? value)) {
    print(orange("text already exists in file"));
    return;
  }

  final newLine = '''$value
    $token''';

  text = text.replaceAll(token, newLine);
  await f.writeAsString(text);
}

Future<int> countSpecificStringInFile({required String path, required String search}) async {
  final f = File(path);
  String text = await f.readAsString();

  return _countOccurrences(text, search);
}

int _countOccurrences(String text, String search) {
  int count = 0;
  int index = 0;

  while (true) {
    index = text.indexOf(search, index);
    if (index == -1) {
      break;
    }
    count++;
    index += search.length;
  }

  return count;
}
