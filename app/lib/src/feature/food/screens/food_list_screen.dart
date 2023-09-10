import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/screens/base_screen.dart';
import '../providers/food_form_provider.dart';
import '../components/food_list.dart';

class FoodListScreen extends BaseScreen {
  const FoodListScreen({super.key}) : super(includeMainDrawer: true);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Food List"),
      actions: const [],
    );
  }

  @override
  FloatingActionButton? floatingActionButton(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(foodFormProvider("").notifier).clear();
        context.push('/food/edit/new');
      },
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const FoodList();
  }
}
