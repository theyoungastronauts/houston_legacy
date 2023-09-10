import 'package:app/src/core/components/base_component.dart';
import 'package:app/src/feature/auth/components/auth_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DashboardContainer extends BaseComponent {
  final StatefulNavigationShell navigationShell;
  const DashboardContainer({super.key, required this.navigationShell});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Material(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Houston"),
                    TextButton(
                      onPressed: () {
                        navigationShell.goBranch(0, initialLocation: navigationShell.currentIndex == 0);
                      },
                      child: Text("Food"),
                    ),
                    TextButton(
                      onPressed: () {
                        navigationShell.goBranch(1, initialLocation: navigationShell.currentIndex == 0);
                      },
                      child: Text("Profile"),
                    ),
                  ],
                ),
                AuthDropdown(),
              ],
            ),
          ),
          Expanded(child: navigationShell),
        ],
      ),
    );
  }
}
