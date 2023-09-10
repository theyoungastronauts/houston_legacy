import 'package:app/src/config/theme.dart';
import 'package:app/src/core/components/base_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainDrawer extends BaseComponent {
  const MainDrawer({Key? key}) : super(key: key);
  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.drawerBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Houston",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const Divider(),
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.color_lens),
                label: const Text("Style Guide"),
              ),
              // const ThemeChooser(),
            ],
          ),
        ),
      ),
    );
  }
}
