// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppSession {
  bool get ready => throw _privateConstructorUsedError;
  bool get redirecting => throw _privateConstructorUsedError;
  Session? get session => throw _privateConstructorUsedError;
  Profile? get profile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppSessionCopyWith<AppSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSessionCopyWith<$Res> {
  factory $AppSessionCopyWith(
          AppSession value, $Res Function(AppSession) then) =
      _$AppSessionCopyWithImpl<$Res, AppSession>;
  @useResult
  $Res call({bool ready, bool redirecting, Session? session, Profile? profile});

  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class _$AppSessionCopyWithImpl<$Res, $Val extends AppSession>
    implements $AppSessionCopyWith<$Res> {
  _$AppSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ready = null,
    Object? redirecting = null,
    Object? session = freezed,
    Object? profile = freezed,
  }) {
    return _then(_value.copyWith(
      ready: null == ready
          ? _value.ready
          : ready // ignore: cast_nullable_to_non_nullable
              as bool,
      redirecting: null == redirecting
          ? _value.redirecting
          : redirecting // ignore: cast_nullable_to_non_nullable
              as bool,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppSessionCopyWith<$Res>
    implements $AppSessionCopyWith<$Res> {
  factory _$$_AppSessionCopyWith(
          _$_AppSession value, $Res Function(_$_AppSession) then) =
      __$$_AppSessionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool ready, bool redirecting, Session? session, Profile? profile});

  @override
  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class __$$_AppSessionCopyWithImpl<$Res>
    extends _$AppSessionCopyWithImpl<$Res, _$_AppSession>
    implements _$$_AppSessionCopyWith<$Res> {
  __$$_AppSessionCopyWithImpl(
      _$_AppSession _value, $Res Function(_$_AppSession) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ready = null,
    Object? redirecting = null,
    Object? session = freezed,
    Object? profile = freezed,
  }) {
    return _then(_$_AppSession(
      ready: null == ready
          ? _value.ready
          : ready // ignore: cast_nullable_to_non_nullable
              as bool,
      redirecting: null == redirecting
          ? _value.redirecting
          : redirecting // ignore: cast_nullable_to_non_nullable
              as bool,
      session: freezed == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
    ));
  }
}

/// @nodoc

class _$_AppSession extends _AppSession {
  _$_AppSession(
      {this.ready = false,
      this.redirecting = false,
      this.session,
      this.profile})
      : super._();

  @override
  @JsonKey()
  final bool ready;
  @override
  @JsonKey()
  final bool redirecting;
  @override
  final Session? session;
  @override
  final Profile? profile;

  @override
  String toString() {
    return 'AppSession(ready: $ready, redirecting: $redirecting, session: $session, profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppSession &&
            (identical(other.ready, ready) || other.ready == ready) &&
            (identical(other.redirecting, redirecting) ||
                other.redirecting == redirecting) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, ready, redirecting, session, profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppSessionCopyWith<_$_AppSession> get copyWith =>
      __$$_AppSessionCopyWithImpl<_$_AppSession>(this, _$identity);
}

abstract class _AppSession extends AppSession {
  factory _AppSession(
      {final bool ready,
      final bool redirecting,
      final Session? session,
      final Profile? profile}) = _$_AppSession;
  _AppSession._() : super._();

  @override
  bool get ready;
  @override
  bool get redirecting;
  @override
  Session? get session;
  @override
  Profile? get profile;
  @override
  @JsonKey(ignore: true)
  _$$_AppSessionCopyWith<_$_AppSession> get copyWith =>
      throw _privateConstructorUsedError;
}
