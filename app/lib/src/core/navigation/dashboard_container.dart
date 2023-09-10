import 'package:app/src/core/components/base_component.dart';
import 'package:app/src/feature/auth/components/auth_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardContainer extends BaseComponent {
  final Widget child;
  const DashboardContainer({super.key, required this.child});

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
                  children: [],
                ),
                AuthDropdown(),
              ],
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
