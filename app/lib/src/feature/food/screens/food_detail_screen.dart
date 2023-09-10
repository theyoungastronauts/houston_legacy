import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/screens/base_screen.dart';
import '../../../core/components/empty_placeholder.dart';
import '../providers/food_detail_provider.dart';
import '../components/food_details.dart';
import '../providers/food_form_provider.dart';

class FoodDetailScreen extends BaseScreen {
  final String uuid;
  const FoodDetailScreen({
    super.key,
    required this.uuid,
  });

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final food = ref.watch(foodDetailProvider(uuid));

    return food.when(
      loading: () => AppBar(
        title: const Text("Food"),
      ),
      data: (food) => AppBar(
        title: Text(food?.name ?? 'Error'),
        actions: food != null
            ? [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    ref.read(foodFormProvider(food.uuid).notifier).load(food.uuid);
                    context.push('/food/edit/${food.uuid}');
                  },
                )
              ]
            : [],
      ),
      error: (_, __) => AppBar(
        title: const Text("Error"),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final model = ref.watch(foodDetailProvider(uuid));

    return model.when(
      data: (food) => food != null ? FoodDetails(food) : const EmptyPlaceholder(title: "Error"),
      error: (_, __) => const EmptyPlaceholder(title: "Error"),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
