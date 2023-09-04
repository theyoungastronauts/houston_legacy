import 'package:app/src/feature/profile/models/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'app_session.freezed.dart';

@freezed
class AppSession with _$AppSession {
  const AppSession._();

  factory AppSession({
    @Default(false) bool ready,
    @Default(false) bool redirecting,
    Session? session,
    Profile? profile,
  }) = _AppSession;

  User? get user {
    return session?.user;
  }

  bool get isAuthenticated {
    return user != null;
  }
}
