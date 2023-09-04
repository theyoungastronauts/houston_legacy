import 'package:app/src/core/components/base_component.dart';
import 'package:flutter/material.dart';
import 'package:app/src/core/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export './screens/food_list_screen.dart';
export './screens/food_detail_screen.dart';
export './screens/food_edit_screen.dart';

@RoutePage()
class FoodContainer extends BaseComponent {
  const FoodContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const AutoRouter();
  }
}

AutoRoute get foodRoutes {
  return AutoRoute(
    path: "food",
    page: FoodRoute.page,
    children: [
      AutoRoute(
        path: "",
        page: FoodListRoute.page,
      ),
      AutoRoute(
        path: ":uuid",
        page: FoodDetailRoute.page,
      ),
      AutoRoute(
        path: "create",
        page: FoodEditRoute.page,
      ),
      AutoRoute(
        path: "edit/:uuid",
        page: FoodEditRoute.page,
      ),
    ],
  );
}
