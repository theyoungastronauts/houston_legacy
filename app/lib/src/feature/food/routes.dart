import 'package:app/src/core/components/base_component.dart';
import 'package:app/src/feature/food/screens/food_detail_screen.dart';
import 'package:app/src/feature/food/screens/food_edit_screen.dart';
import 'package:app/src/feature/food/screens/food_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

export './screens/food_list_screen.dart';
export './screens/food_detail_screen.dart';
export './screens/food_edit_screen.dart';

class FoodContainer extends BaseComponent {
  final Widget child;
  const FoodContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return child;
  }
}

final foodRoutes = ShellRoute(
  builder: (context, state, child) {
    return FoodContainer(
      child: child,
    );
  },
  routes: [
    GoRoute(
      path: "/food",
      builder: (context, state) => const FoodListScreen(),
    ),
    GoRoute(
      path: "/food/:uuid",
      builder: (context, state) => FoodDetailScreen(uuid: state.pathParameters['uuid']!),
    ),
    GoRoute(
      path: "/food/edit/:uuid",
      builder: (context, state) => FoodEditScreen(uuid: state.pathParameters['uuid']!),
    )
  ],
);
