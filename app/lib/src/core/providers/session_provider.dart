import 'dart:async';

import 'package:app/src/config/env.dart';
import 'package:app/src/core/app.dart';
import 'package:app/src/core/models/app_session.dart';
import 'package:app/src/core/navigation/app_router.dart';
import 'package:app/src/core/singletons/singletons.dart';
import 'package:app/src/core/utils/toast.dart';
import 'package:app/src/core/utils/validation.dart';
import 'package:app/src/feature/auth/services/user_service.dart';
import 'package:app/src/feature/profile/services/profile_db_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SessionProvider extends StateNotifier<AppSession> {
  final Ref ref;
  late final StreamSubscription<AuthState> authStateSubscription;

  SessionProvider(this.ref, AppSession initialState) : super(initialState) {
    init();
  }

  init() {
    final session = singleton<SupabaseClient>().auth.currentSession;

    state = state.copyWith(ready: true, session: session);

    if (session != null) {
      final context = rootNavigatorKey.currentContext!;
      context.go(defaultAppRoute);
    }
    addAuthStateChangeListener();
  }

  void addAuthStateChangeListener() {
    authStateSubscription = singleton<SupabaseClient>().auth.onAuthStateChange.listen((data) async {
      if (data.event == AuthChangeEvent.signedIn) {
        if (state.redirecting) return;

        final session = data.session;

        if (session != null) {
          final profile = await ProfileDbService().retrieve(uuid: session.user.id);

          print("PROFILE: $profile");

          state = state.copyWith(redirecting: true, session: session, profile: profile);
          final context = rootNavigatorKey.currentContext!;
          context.go(defaultAppRoute);
          state = state.copyWith(redirecting: false);
        }
        return;
      }
      if (data.event == AuthChangeEvent.userUpdated) {
        singleton<SupabaseClient>().auth.refreshSession();
        return;
      }
      if (data.event == AuthChangeEvent.tokenRefreshed) {
        final session = data.session;
        if (session != null) {
          state = state.copyWith(session: session);
        }
        return;
      }
    });
  }

  Future<bool> loginWithOtp(String email) async {
    try {
      await singleton<SupabaseClient>().auth.signInWithOtp(
            email: email,
            emailRedirectTo: kIsWeb ? null : '${Env.deeplinkProtocol}://login-callback/',
            shouldCreateUser: false,
          );
      Toast.message("Check your email!");
      return true;
    } on AuthException catch (e) {
      Toast.error(e.message);
    } catch (e) {
      Toast.error();
    }

    return false;
  }

  Future<bool> loginWithPassword(String email, String password) async {
    try {
      final response = await singleton<SupabaseClient>().auth.signInWithPassword(
            email: email,
            password: password,
          );
      if (response.session != null) {
        final profile = await ProfileDbService().retrieve(uuid: response.session!.user.id);

        state = state.copyWith(session: response.session, profile: profile);
        return true;
      }
    } on AuthException catch (e) {
      Toast.error(e.message);
    } catch (e) {
      Toast.error();
    }

    return false;
  }

  Future<bool> register(String email, String password) async {
    try {
      await singleton<SupabaseClient>().auth.signUp(
            email: email,
            password: password,
            emailRedirectTo: kIsWeb ? null : '${Env.deeplinkProtocol}://login-callback/',
          );
      Toast.message("Check your email!");
      return true;
    } on AuthException catch (e) {
      Toast.error(e.message);
    } catch (e) {
      Toast.error();
    }

    return false;
  }

  Future<void> logout() async {
    await singleton<SupabaseClient>().auth.signOut();
    state = state.copyWith(session: null, profile: null);
    final context = rootNavigatorKey.currentContext!;
    context.replace('/');
  }

  Future<bool> changeEmail(String email) async {
    if (!isValidEmail(email)) {
      return false;
    }
    try {
      final user = await UserService().updateMe(
        email: email,
        emailRedirectTo: kIsWeb ? null : '${Env.deeplinkProtocol}://login-callback/',
      );
      print(user);
      if (user != null) {
        Toast.message("Check your email!");
        return true;
      }
    } on AuthException catch (e) {
      Toast.error(e.message);
    } catch (e) {
      Toast.error();
    }

    return false;
  }
}

final sessionProvider = StateNotifierProvider<SessionProvider, AppSession>(
  (ref) => SessionProvider(
    ref,
    AppSession(),
  ),
);
