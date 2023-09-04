import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/food.dart';
import '../../../core/components/base_component.dart';

class FoodListTile extends BaseComponent {
  final Food food;
  const FoodListTile(this.food, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(food.name),
      subtitle: Text(food.uuid),
    );
  }
}
