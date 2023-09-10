import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/food.dart';
import '../../../core/components/base_component.dart';


class FoodDetails extends BaseComponent {
  final Food food;
  const FoodDetails(this.food, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(food.name),
      ],
    );
  }
}