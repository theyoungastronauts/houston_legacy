import 'package:app/src/core/components/base_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForeignKeySelector<T> extends BaseComponent {
  final List<T> options;
  final int Function(T) valueBuilder;
  final String Function(T) labelBuilder;
  final Function(int?) onChanged;

  const ForeignKeySelector({
    super.key,
    required this.options,
    required this.valueBuilder,
    required this.labelBuilder,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opts = options
        .map((o) => DropdownMenuItem(
              value: valueBuilder(o),
              child: Text(labelBuilder(o)),
            ))
        .toList();

    return DropdownButton<int>(items: opts, onChanged: onChanged);
  }
}
