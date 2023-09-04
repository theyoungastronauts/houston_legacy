import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalLoadingProvider extends StateNotifier<bool> {
  GlobalLoadingProvider([loading = false]) : super(loading);

  _setLoading([bool value = true]) {
    state = value;
  }

  start() {
    _setLoading(true);
  }

  complete() {
    _setLoading(false);
  }
}

final globalLoadingProvider = StateNotifierProvider<GlobalLoadingProvider, bool>((ref) => GlobalLoadingProvider());
