import 'package:app/src/core/components/base_component.dart';
import 'package:app/src/core/navigation/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DashboardContainer extends BaseComponent {
  final StatefulNavigationShell navigationShell;
  const DashboardContainer({super.key, required this.navigationShell});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
          child: navigationShell,
        ),
        NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) {
            navigationShell.goBranch(index,
                initialLocation: index == navigationShell.currentIndex);
          },
          destinations: const [
            NavigationDestination(
              label: "Food",
              icon: Icon(Icons.food_bank),
            ),
            NavigationDestination(
              label: "Album",
              icon: Icon(Icons.star),
            ),
            NavigationDestination(
              label: "Track",
              icon: Icon(Icons.star),
            ),
            //::HOUSTON_INSERT_TAB::
          ],
        ),
      ],
    );
  }

  @override
  Widget bodyMd(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: const MainDrawer(),
      body: Row(
        children: [
          Column(
            children: [
              Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                );
              }),
              Expanded(
                child: NavigationRail(
                  selectedIndex: navigationShell.currentIndex,
                  labelType: NavigationRailLabelType.all,
                  destinations: const [
                    NavigationRailDestination(
                      label: Text("Food"),
                      icon: Icon(Icons.food_bank),
                    ),
                    NavigationRailDestination(
                      label: Text("Album"),
                      icon: Icon(Icons.star),
                    ),
                    NavigationRailDestination(
                      label: Text("Track"),
                      icon: Icon(Icons.star),
                    ),
                    //::HOUSTON_INSERT_NAV::
                  ],
                  onDestinationSelected: (index) {
                    navigationShell.goBranch(index,
                        initialLocation: index == navigationShell.currentIndex);
                  },
                ),
              ),
            ],
          ),
          const VerticalDivider(),
          Expanded(child: navigationShell)
        ],
      ),
    );
  }
}
