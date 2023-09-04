// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

class FileVisitor extends SimpleElementVisitor<void> {
  String className = "";
  Map<String, dynamic> fields = {};

  String basePath = "";
  String modelName = "";
  String titleField = "";

  @override
  void visitConstructorElement(ConstructorElement element) {
    className = element.returnType.toString().replaceFirst("*", "");
  }

  @override
  void visitFieldElement(FieldElement element) {
    fields[element.name] = element.type.toString().replaceAll("*", "");
  }
}
