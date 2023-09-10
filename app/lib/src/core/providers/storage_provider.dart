// ignore_for_file: constant_identifier_names

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/env.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Storage {
  static const THEME_KEY = "THEME";
  static const LANGUAGE_KEY = "LANGUAGE";
  static const AUTH_TOKEN_KEY = "AUTH_TOKEN";

  bool isInitialized = false;

  Future<void> init();
  void remove(String key);

  String? getString(String key);
  void setString(String key, String value);

  bool? getBool(String key);
  void setBool(String key, bool value);

  int? getInt(String key);
  void setInt(String key, int value);

  Future<void> clear();
}

class StorageImplementation extends Storage {
  late final SharedPreferences _instance;

  StorageImplementation() {
    init();
  }

  @override
  Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
    isInitialized = true;
  }

  String _buildKey(String key) => "${Env.flavorName}_$key";

  @override
  void remove(String key) => _instance.remove(_buildKey(key));

  @override
  String? getString(String key) => _instance.getString(_buildKey(key));
  @override
  void setString(String key, String value) => _instance.setString(_buildKey(key), value);

  @override
  bool? getBool(String key) => _instance.getBool(_buildKey(key));
  @override
  void setBool(String key, bool value) => _instance.setBool(_buildKey(key), value);

  @override
  int? getInt(String key) => _instance.getInt(_buildKey(key));
  @override
  void setInt(String key, int value) => _instance.setInt(_buildKey(key), value);

  @override
  Future<void> clear() async {
    await _instance.clear();
  }
}

final storageProvider = Provider<Storage>((ref) => StorageImplementation());
