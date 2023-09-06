import 'package:app/src/core/components/base_component.dart';
import 'package:app/src/core/components/buttons.dart';
import 'package:app/src/config/theme.dart';
import 'package:app/src/core/navigation/app_router.dart';
import 'package:app/src/feature/auth/components/auth_dropdown.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'houston_dashboard_container.dart';

@RoutePage()
class DashboardContainer extends HoustonDashboardContainer {
  const DashboardContainer({super.key});

  @override
  List<PageRouteInfo> get routes => [
        const FoodRoute(),
        //::HOUSTON_INSERT_ROUTE::
      ];

  @override
  List<BottomNavigationBarItem> tabs(BuildContext context, WidgetRef ref) {
    return const [
      BottomNavigationBarItem(
        label: "Food",
        icon: Icon(Icons.home),
      ),
      //::HOUSTON_INSERT_TAB::
    ];
  }

  @override
  List<Widget> topNav(BuildContext context, WidgetRef ref, TabsRouter tabsRouter) {
    return [
      AppButton(
        label: "Food",
        type: AppButtonType.Text,
        variant: tabsRouter.activeIndex == 0 ? AppColorVariant.primary : AppColorVariant.light,
        onPressed: () {
          onPressed(tabsRouter, 0);
        },
      ),
      //::HOUSTON_INSERT_NAV::
    ];
  }
}
