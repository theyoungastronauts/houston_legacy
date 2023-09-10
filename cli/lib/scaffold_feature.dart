// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:cli/strings.dart';
import 'package:cli/utils.dart';
import 'package:cli/validators.dart';
import 'package:dcli/dcli.dart';
import 'package:mason/mason.dart' as mason;

const ROUTER_ROUTE_INSERT_TOKEN = "//::HOUSTON_INSERT_ROUTE::";
const DASHBOARD_ROUTE_INSERT_TOKEN = "//::HOUSTON_INSERT_ROUTE::";
const DASHBOARD_TAB_INSERT_TOKEN = "//::HOUSTON_INSERT_TAB::";
const DASHBOARD_NAV_INSERT_TOKEN = "//::HOUSTON_INSERT_NAV::";

Future<void> newFeature() async {
  String name = ask(
    "Feature Name:",
    required: true,
    validator: FeatureNameValidator(),
  );
  name = snakeCase(name);

  final dir = blueprintsDir();
  final path = "$dir/$name.yaml";

  if (File(path).existsSync()) {
    return print(red('Blueprint already exists at $path. Make your edits then run `scaffold`.'));
  }

  File(path).createSync();

  final contents = "name: $name\nproperties:";

  await setTextInFile(path: path, value: contents);

  print(white("New file generated at $path. Make your edits then run `scaffold`."));
}

Future<void> scaffoldFeature({
  String? name,
  bool runPostGenerator = true,
  bool updateRoutes = true,
  bool updateNavigation = true,
}) async {
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
    return print(red('Feature $name not found. Try creating it first'));
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

  final routerPath = "${appModuleDirectory()}/src/core/navigation/app_router.dart";

  if (updateRoutes) {
    await insertTextInFile(
      path: routerPath,
      value: "import 'package:app/src/feature/${snakeCase(name)}/routes.dart';",
      prepend: true,
    );

    await insertTextInFileAtToken(
      path: routerPath,
      token: ROUTER_ROUTE_INSERT_TOKEN,
      value: "${pascalCase(name)}Routes.branch,",
    );
  }

  final dashboardPath = "${appModuleDirectory()}/src/core/navigation/dashboard_container.dart";
  if (updateNavigation) {
    // final currentRouteCount = await countSpecificStringInFile(path: dashboardPath, search: "Route(),");

    // await insertTextInFileAtToken(
    //   path: dashboardPath,
    //   token: DASHBOARD_ROUTE_INSERT_TOKEN,
    //   value: "const ${pascalCase(name)}Route(),",
    // );

    await insertTextInFileAtToken(
      path: dashboardPath,
      token: DASHBOARD_TAB_INSERT_TOKEN,
      value: 'NavigationDestination(label: "${pascalCase(name)}", icon: Icon(Icons.star),),',
      duplicateLookup: 'NavigationDestination(label: "${pascalCase(name)}"',
    );

    await insertTextInFileAtToken(
      path: dashboardPath,
      token: DASHBOARD_NAV_INSERT_TOKEN,
      value: 'NavigationRailDestination(label: Text("${pascalCase(name)}"), icon: Icon(Icons.star),),',
      duplicateLookup: 'NavigationRailDestination(label: Text("${pascalCase(name)}")',
    );
  }

  print("Formatting files");
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
    routerPath,
    dashboardPath,
  ];

  for (final filePath in filePaths) {
    print(filePath);
    await Process.start("dart", ["format", filePath]);
  }

  print(green("$name app generated in $appGeneratedPath"));

  if (runPostGenerator) {
    print(white("Running generate function in flutter project..."));

    // final args = "packages pub run build_runner build --delete-conflicting-outputs --build-filter=$appGeneratedPath".split(" ");
    final args = "packages pub run build_runner build --delete-conflicting-outputs".split(" ");
    final process = await Process.start("flutter", args, workingDirectory: appDir());
    await process.stdout.transform(utf8.decoder).forEach((line) => print(yellow(line)));
  }
}
