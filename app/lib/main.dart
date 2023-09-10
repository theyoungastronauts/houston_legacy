import 'package:app/src/config/env.dart';
import 'package:app/src/core/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.init();

  await Supabase.initialize(
    url: "https://${Env.supabaseProject}.supabase.co",
    anonKey: Env.supabaseAnonKey,
    authFlowType: AuthFlowType.pkce,
  );

  runApp(
    const RootRestorationScope(
      restorationId: "root",
      child: ProviderScope(
        child: App(),
      ),
    ),
  );
}
