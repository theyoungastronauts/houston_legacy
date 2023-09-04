import 'package:app/src/core/components/base_component.dart';
import 'package:app/src/core/components/buttons.dart';
import 'package:app/src/config/theme.dart';
import 'package:app/src/core/navigation/app_router.dart';
import 'package:app/src/feature/auth/components/auth_dropdown.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class DashboardContainer extends BaseComponent {
  const DashboardContainer({Key? key}) : super(key: key);

  static const List<PageRouteInfo> routes = [
    FoodRoute(),
    AlbumRoute(),
  ];

  void onPressed(TabsRouter tabsRouter, index) {
    if (index == tabsRouter.activeIndex) {
      tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex)!.popUntilRoot();
    } else {
      tabsRouter.setActiveIndex(index);
    }
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: routes,
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) {
            onPressed(tabsRouter, index);
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              label: "Food",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Albums",
              icon: Icon(Icons.article),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget bodyMd(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: routes,
      appBarBuilder: (_, tabsRouter) {
        return PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            height: 48,
            width: double.infinity,
            color: Colors.black38,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 32,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppButton(
                          label: "Food",
                          type: AppButtonType.Text,
                          variant: tabsRouter.activeIndex == 0 ? AppColorVariant.primary : AppColorVariant.light,
                          onPressed: () {
                            onPressed(tabsRouter, 0);
                          },
                        ),
                        AppButton(
                          label: "Albums",
                          type: AppButtonType.Text,
                          variant: tabsRouter.activeIndex == 1 ? AppColorVariant.primary : AppColorVariant.light,
                          onPressed: () {
                            onPressed(tabsRouter, 1);
                          },
                        ),
                      ],
                    ),
                    const AuthDropdown(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
