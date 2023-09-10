import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/base_component.dart';
import '../models/food.dart';

class FoodCard extends BaseComponent {
  final Food food;
  const FoodCard(this.food, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        context.push(Uri(path: "/food/${food.uuid}").toString());
      },
      child: Card(
        child: Padding(padding: const EdgeInsets.all(8.0), child: Text(food.name)),
      ),
    );
  }
}
