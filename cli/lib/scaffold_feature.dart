import 'dart:convert';
import 'dart:io';

import 'package:cli/strings.dart';
import 'package:cli/utils.dart';
import 'package:cli/validators.dart';
import 'package:dcli/dcli.dart';
import 'package:mason/mason.dart' as mason;

// Future<void> newFeature() async {
//   String moduleName = ask(
//     "Module Name:",
//     required: true,
//     validator: FeatureNameValidator(),
//   );
//   moduleName = snakeCase(moduleName);

//   String name = ask(
//     "Feature Name:",
//     required: true,
//     validator: FeatureNameValidator(),
//   );
//   name = snakeCase(name);

//   final dir = blueprintsDir();
//   final path = "$dir/$name.yaml";

//   if (File(path).existsSync()) {
//     return print(red('Blueprint already exists.'));
//   }

//   File(path).createSync();

//   final contents = "name: $name\nmodule: $moduleName\nproperties:";

//   await setTextInFile(path: path, value: contents);
// }

Future<void> scaffoldFeature([String? name]) async {
  name ??= ask(
    "Feature Name:",
    required: true,
    validator: FeatureNameValidator(),
  );

  name = snakeCase(name);

  final dir = blueprintsDir();
  final path = "$dir/$name.yaml";
  print(path);

  if (!File(path).existsSync()) {
    return print(red('Feature $name not found.'));
  }
  final blueprint = parseBlueprint(path);

  // if (Directory(generatePath).existsSync()) {
  //   return print(red('Feature already generated in $generatePath.\nRemove this folder first if you want to regenerate.'));
  // }

  print(white("Generating App Feature"));

  final appParentDir = "${appModuleDirectory()}/src/feature";
  // if (!Directory(appParentDir).existsSync()) {
  //   Directory(appParentDir).createSync();
  // }

  final appGeneratedPath = "$appParentDir/$name";

  final appBrick = mason.Brick.path("${bricksDir()}/feature");

  final appGenerator = await mason.MasonGenerator.fromBrick(appBrick);
  final appTarget = mason.DirectoryGeneratorTarget(Directory(appParentDir));
  await appGenerator.generate(
    appTarget,
    vars: blueprint.serialize(),
  );

  final filePaths = [
    "$appGeneratedPath/components/${name}_card.dart",
    "$appGeneratedPath/components/${name}_form.dart",
    "$appGeneratedPath/components/${name}_list_tile.dart",
    "$appGeneratedPath/components/${name}_list.dart",
    "$appGeneratedPath/models/$name.dart",
    "$appGeneratedPath/providers/${name}_detail_provider.dart",
    "$appGeneratedPath/providers/${name}_form_provider.dart",
    "$appGeneratedPath/providers/${name}_list_provider.dart",
    "$appGeneratedPath/screens/${name}_list_screen.dart",
    "$appGeneratedPath/screens/${name}_detail_screen.dart",
    "$appGeneratedPath/services/${name}_rest_service.dart",
    "$appGeneratedPath/services/${name}_db_service.dart",
    "$appGeneratedPath/routes.dart",
  ];

  for (final filePath in filePaths) {
    print(filePath);
    await Process.start("dart", ["format", filePath]);
  }

  print(green("$name app generated in $appGeneratedPath"));
}
