import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'storage.dart';

final singleton = GetIt.instance;

Future<void> initSingletons() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  singleton.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  singleton.registerLazySingleton<Storage>(
    () => StorageImplementation(),
  );

  singleton.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
}
