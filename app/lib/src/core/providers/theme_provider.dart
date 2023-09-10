import 'package:app/src/core/providers/storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends StateNotifier<ThemeMode> {
  final Ref ref;
  late final Storage _storage;

  ThemeProvider(this.ref, [ThemeMode themeMode = ThemeMode.system]) : super(themeMode) {
    _storage = ref.read(storageProvider);
    _init();
  }

  Future<void> _init() async {
    final savedTheme = _storage.getString(Storage.THEME_KEY);

    if (savedTheme == 'ThemeMode.light') {
      setLight();
    } else if (savedTheme == 'ThemeMode.dark') {
      setDark();
    }
  }

  void _set(ThemeMode themeMode) {
    state = themeMode;
    _storage.setString(Storage.THEME_KEY, themeMode.toString());
  }

  void setLight() {
    _set(ThemeMode.light);
  }

  void setDark() {
    _set(ThemeMode.dark);
  }

  void setSystem() {
    _set(ThemeMode.system);
  }
}

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeMode>((ref) => ThemeProvider(ref));
