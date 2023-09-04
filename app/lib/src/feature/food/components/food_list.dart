import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/base_component.dart';
import '../../../core/components/infinite_list.dart';
import '../components/food_card.dart';
import '../models/food.dart';
import '../providers/food_list_provider.dart';

class FoodList extends BaseComponent {
  const FoodList({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listProvider = ref.read(foodListProvider.notifier);

    return InfiniteList<Food>(
      pagingController: listProvider.pagingController,
      itemBuilder: (context, food, index) => FoodCard(food),
      emptyText: "No Foods",
      onRefresh: listProvider.refresh,
    );
  }
}
