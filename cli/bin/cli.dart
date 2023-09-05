#! /usr/bin/env dcli

import 'dart:convert';
import 'dart:io' as io;

import 'package:cli/scaffold_feature.dart';
import 'package:cli/utils.dart';
import 'package:dcli/dcli.dart';

Future<void> main(List<String> args) async {
  await scaffoldFeature("food");
  await scaffoldFeature("album");
  await scaffoldFeature("profile");

  print(white("Running generate function in flutter project..."));

  final args = "packages pub run build_runner build --delete-conflicting-outputs".split(" ");
  final process = await io.Process.start("flutter", args, workingDirectory: appDir());
  await process.stdout.transform(utf8.decoder).forEach((line) => print(yellow(line)));
}
