part of './dashboard_container.dart';

@RoutePage()
class HoustonDashboardContainer extends BaseComponent {
  const HoustonDashboardContainer({super.key});

  List<PageRouteInfo> get routes => [];

  List<BottomNavigationBarItem> tabs(BuildContext context, WidgetRef ref) {
    return [];
  }

  List<Widget> topNav(BuildContext context, WidgetRef ref, TabsRouter tabsRouter) {
    return [];
  }

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
          items: tabs(context, ref),
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
                      children: topNav(context, ref, tabsRouter),
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
