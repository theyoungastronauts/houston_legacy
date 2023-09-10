import 'package:app/src/core/components/base_component.dart';
import 'package:app/src/core/navigation/app_router.dart';
import 'package:app/src/core/providers/global_loading_provider.dart';
import 'package:app/src/core/providers/theme_provider.dart';
import 'package:app/src/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

GlobalKey<State<BottomNavigationBar>> bottomNavigationBar = GlobalKey<State<BottomNavigationBar>>();
GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class App extends BaseComponent {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Houston',
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      theme: AppTheme.light().themeData,
      darkTheme: AppTheme.dark().themeData,
      themeMode: ref.watch(themeProvider),
      routerConfig: appRouter,
      builder: (context, widget) {
        return Consumer(
          builder: (context, ref, _) {
            return Stack(
              children: [
                if (ref.watch(globalLoadingProvider))
                  Container(
                    color: Colors.black54,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                widget!,
              ],
            );
          },
        );
      },
    );
  }
}
