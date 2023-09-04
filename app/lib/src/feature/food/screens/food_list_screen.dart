import 'package:app/src/core/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/screens/base_screen.dart';
import '../providers/food_form_provider.dart';
import '../components/food_list.dart';

@RoutePage()
class FoodListScreen extends BaseScreen {
  const FoodListScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Food List"),
      actions: const [],
    );
  }

  @override
  FloatingActionButton? floatingActionButton(
      BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(foodFormProvider("").notifier).clear();
        AutoRouter.of(context).push(FoodEditRoute(uuid: ""));
      },
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const FoodList();
  }
}
