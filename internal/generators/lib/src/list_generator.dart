// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generators/src/utils/file_visitor.dart';
import 'package:generators/src/utils/render.dart';
import 'package:source_gen/source_gen.dart';

class ListGenerator extends GeneratorForAnnotation<ListGenAnnotation> {
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) async {
    final visitor = FileVisitor();
    element.visitChildren(visitor);

    final modelName = visitor.className.replaceAll("List", "");
    final className = "Houston$modelName";

    final source = File('../internal/generators/lib/src/templates/list.mustache').readAsStringSync();
    return source.render({'className': className, 'modelName': modelName});
  }
}
